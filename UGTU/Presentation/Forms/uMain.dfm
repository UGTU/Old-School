object frmMain: TfrmMain
  Left = 221
  Top = 140
  Caption = #1048#1057' '#1059#1043#1058#1059
  ClientHeight = 596
  ClientWidth = 931
  Color = clBtnFace
  Constraints.MinHeight = 548
  Constraints.MinWidth = 492
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    931
    596)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 377
    Top = 81
    Height = 496
    ExplicitTop = 70
    ExplicitHeight = 511
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 577
    Width = 931
    Height = 19
    Panels = <
      item
        Width = 450
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object MainMenuBar: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 931
    Height = 27
    UseSystemFont = False
    ActionManager = ActionManager1
    Caption = 'MainMenuBar'
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = clWhite
    EdgeBorders = [ebBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Spacing = 0
    OnPopup = MainMenuBarPopup
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 27
    Width = 931
    Height = 54
    ActionManager = ActionManager1
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = clWhite
    Constraints.MinHeight = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 1
  end
  object Panel1: TPanel
    Left = 380
    Top = 81
    Width = 551
    Height = 496
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinHeight = 400
    Constraints.MinWidth = 543
    ParentBackground = False
    TabOrder = 3
    object Panel7: TPanel
      Left = 401
      Top = 0
      Width = 25
      Height = 19
      BevelOuter = bvNone
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 551
      Height = 496
      Align = alClient
      BevelOuter = bvNone
      Constraints.MinHeight = 400
      Constraints.MinWidth = 543
      ParentBackground = False
      TabOrder = 1
      object Panel5: TPanel
        Left = 401
        Top = 0
        Width = 25
        Height = 19
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
  object StudSearchPanel: TPanel
    Left = 477
    Top = 25
    Width = 450
    Height = 25
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 4
    object cmbSearch: TDBComboBoxEh
      Left = 121
      Top = 4
      Width = 118
      Height = 19
      DynProps = <>
      EditButtons = <>
      Flat = True
      Items.Strings = (
        #1087#1086' '#1085#1086#1084#1077#1088#1091' '#1079#1072#1095#1077#1090#1082#1080
        #1087#1086' '#1060#1048#1054
        #1087#1086' '#1090#1077#1083#1077#1092#1086#1085#1091)
      TabOrder = 0
      Visible = True
      OnChange = cmbSearchChange
    end
    object dbcbeSearch: TDBLookupComboboxEh
      Left = 243
      Top = 4
      Width = 205
      Height = 19
      DataField = ''
      EditButtons = <>
      Flat = True
      KeyField = 'Ik_zach'
      ListField = 'Nn_zach'
      ListSource = dm.dsStudSearch
      TabOrder = 1
      Visible = True
      OnCloseUp = dbcbeSearchCloseUp
      OnKeyPress = dbcbeSearchKeyPress
    end
    object StaticText1: TStaticText
      Left = 33
      Top = 7
      Width = 87
      Height = 17
      Caption = #1055#1086#1080#1089#1082' '#1089#1090#1091#1076#1077#1085#1090#1072':'
      TabOrder = 2
    end
  end
  object TeacherSearchPanel: TPanel
    Left = 465
    Top = 26
    Width = 466
    Height = 25
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
    object cmbTeachSearch: TDBComboBoxEh
      Left = 134
      Top = 3
      Width = 118
      Height = 19
      DynProps = <>
      EditButtons = <>
      Flat = True
      Items.Strings = (
        #1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091' '
        #1087#1086' '#1060#1048#1054)
      KeyItems.Strings = (
        '1'
        '2')
      TabOrder = 0
      Visible = True
      OnChange = cmbTeachSearchChange
    end
    object dbcbeTeachSearch: TDBLookupComboboxEh
      Left = 255
      Top = 3
      Width = 205
      Height = 19
      DataField = ''
      EditButtons = <>
      Flat = True
      KeyField = 'itab_n'
      ListField = 'itab_n'
      ListSource = dm.dsTeachSearch
      TabOrder = 1
      Visible = True
      OnCloseUp = dbcbeTeachSearchCloseUp
      OnKeyPress = dbcbeSearchKeyPress
    end
    object StaticText2: TStaticText
      Left = 14
      Top = 5
      Width = 119
      Height = 17
      Caption = #1055#1086#1080#1089#1082' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103':'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 4
    Height = 496
    Align = alLeft
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 6
    OnClick = Panel2Click
    OnMouseEnter = Panel2MouseEnter
    OnMouseLeave = Panel2MouseLeave
    OnResize = Panel2Resize
    object Image1: TImage
      Left = -1
      Top = 216
      Width = 8
      Height = 8
      Picture.Data = {
        055449636F6E0000010001000509000001001800DC0000001600000028000000
        05000000120000000100180000000000B4000000000000000000000000000000
        00000000A8A8A800000000000000000000000000A8A8A8A8A8A8000000000000
        00000000A8A8A8A8A8A8A8A8A800000000000000A8A8A8A8A8A8A8A8A8A8A8A8
        00000000A8A8A8A8A8A8A8A8A8A8A8A8A8A8A800A8A8A8A8A8A8A8A8A8A8A8A8
        00000000A8A8A8A8A8A8A8A8A800000000000000A8A8A8A8A8A8000000000000
        00000000A8A8A800000000000000000000000000780000003800000018000000
        080000000000000008000000180000003800000078000000}
      Visible = False
    end
    object Image2: TImage
      Left = 0
      Top = 216
      Width = 6
      Height = 9
      Picture.Data = {
        055449636F6E0000010001000509000001001800DC0000001600000028000000
        05000000120000000100180000000000B4000000000000000000000000000000
        00000000000000000000000000000000A8A8A800000000000000000000A8A8A8
        A8A8A800000000000000A8A8A8A8A8A8A8A8A800000000A8A8A8A8A8A8A8A8A8
        A8A8A800A8A8A8A8A8A8A8A8A8A8A8A8A8A8A800000000A8A8A8A8A8A8A8A8A8
        A8A8A800000000000000A8A8A8A8A8A8A8A8A800000000000000000000A8A8A8
        A8A8A800000000000000000000000000A8A8A800F0000000E0000000C0000000
        800000000000000080000000C0000000E0000000F0000000}
    end
  end
  object Panel3: TPanel
    Left = 4
    Top = 81
    Width = 373
    Height = 496
    Align = alLeft
    Color = clSilver
    Constraints.MaxWidth = 400
    DockSite = True
    ParentBackground = False
    TabOrder = 7
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 371
      Height = 494
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Button1: TButton
        Left = 5
        Top = 440
        Width = 75
        Height = 25
        Caption = #1054#1090#1082#1072#1079#1072#1090#1100
        TabOrder = 0
        Visible = False
        OnClick = Button1Click
      end
      object pnlTree: TPanel
        Left = 1
        Top = 1
        Width = 369
        Height = 52
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlTree'
        TabOrder = 1
        object DBDekTreeView_TEST1: TDBDekTreeView_TEST
          Left = 0
          Top = 0
          Width = 369
          Height = 52
          Align = alClient
          BorderStyle = bsNone
          ChangeDelay = 200
          Constraints.MaxWidth = 400
          Constraints.MinWidth = 150
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Images = TreeIcons
          Indent = 19
          MultiSelectStyle = []
          ParentFont = False
          PopupMenu = ppmTree
          ReadOnly = True
          RightClickSelect = True
          RowSelect = True
          TabOrder = 0
          OnChange = DBDekTreeView_TEST1Change
          OnClick = DBDekTreeView_TEST1Click
          OnCollapsing = DBDekTreeView_TEST1Collapsing
          OnDblClick = DBDekTreeView_TEST1DblClick
          OnExpanding = DBDekTreeView_TEST1Expanding
          OnMouseDown = DBDekTreeView_TEST1MouseDown
        end
      end
      object pnlImage: TPanel
        Left = 1
        Top = 53
        Width = 369
        Height = 440
        Align = alBottom
        BevelEdges = []
        BevelOuter = bvNone
        Caption = 'pnlImage'
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        Visible = False
        object imgChristmas: TImage
          Left = 0
          Top = 0
          Width = 369
          Height = 440
          Align = alClient
          Center = True
          ExplicitWidth = 370
        end
      end
    end
  end
  object Panel13: TPanel
    Left = 1296
    Top = 0
    Width = 25
    Height = 23
    BevelOuter = bvNone
    TabOrder = 8
  end
  object ScheduleBookmarksPanel: TPanel
    Left = 776
    Top = 25
    Width = 153
    Height = 26
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 9
    Visible = False
    object ActionToolBar2: TActionToolBar
      Left = 0
      Top = 0
      Width = 150
      Height = 26
      ActionManager = ActionManager1
      Align = alLeft
      Caption = 'ActionToolBar2'
      ColorMap.HighlightColor = clWhite
      ColorMap.BtnSelectedColor = clBtnFace
      ColorMap.UnusedColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Spacing = 0
    end
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 247
    Top = 82
    object miFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object N36: TMenuItem
        Action = actFileExit
      end
    end
    object miStudent: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object N1: TMenuItem
        Action = actOtchisl
      end
      object N2: TMenuItem
        Action = actPerevod
      end
      object N3: TMenuItem
        Action = actVosst
      end
      object ffd1: TMenuItem
        Caption = 'ffd'
      end
    end
    object miGroup: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object N10: TMenuItem
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
        Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
        ImageIndex = 7
      end
    end
    object miSpec: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object N6: TMenuItem
        Action = actAddGroup
      end
      object N26: TMenuItem
        Caption = #1059#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085
        object N27: TMenuItem
          Action = actUchPlanAdd
        end
        object N28: TMenuItem
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085'...'
          Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085'...'
          ImageIndex = 16
        end
        object N29: TMenuItem
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085
          ImageIndex = 18
        end
        object N30: TMenuItem
          Caption = '-'
        end
        object N31: TMenuItem
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091'...'
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' ...'
          ImageIndex = 21
        end
        object N32: TMenuItem
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091'...'
          Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091'...'
          ImageIndex = 20
        end
        object N33: TMenuItem
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091'...'
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091'...'
          ImageIndex = 22
        end
        object N34: TMenuItem
          Caption = '-'
        end
        object N35: TMenuItem
          Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1089#1077#1084#1077#1089#1090#1088#1086#1074'...'
          Hint = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1089#1077#1084#1077#1089#1090#1088#1086#1074'...'
          ImageIndex = 17
        end
      end
    end
    object miFac: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object N7: TMenuItem
        Action = actAddSpec
      end
    end
    object miUni: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object N5: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1082#1091#1083#1100#1090#1077#1090
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1082#1091#1083#1100#1090#1077#1090
        ImageIndex = 2
      end
    end
    object miHlp: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      ImageIndex = 13
      object miHelp: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
      end
      object miAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      end
    end
  end
  object alMainActions: TActionList
    Images = ImageList1
    OnExecute = alMainActionsExecute
    OnUpdate = alMainActionsUpdate
    Left = 279
    Top = 118
    object actFamChg: TAction
      Category = 'catStudActs'
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1092#1072#1084#1080#1083#1080#1102'...'
      Hint = #1057#1084#1077#1085#1080#1090#1100' '#1092#1072#1084#1080#1083#1080#1102
      ImageIndex = 26
      OnExecute = actFamChgExecute
    end
    object actKatChange: TAction
      Category = 'catStudActs'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102' '#1086#1073#1091#1095#1077#1085#1080#1103
      ImageIndex = 58
      OnExecute = actKatChangeExecute
    end
    object actGazpromStatement: TAction
      Category = 'catAbitActs'
      Caption = #1042#1099#1076#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1082#1072#1088#1090#1086#1095#1082#1091
      Hint = #1042#1099#1076#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 60
      OnExecute = actGazpromStatementExecute
    end
    object actPasspChg: TAction
      Category = 'catStudActs'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 30
      OnExecute = actPasspChgExecute
    end
    object actPerevod: TAction
      Category = 'catStudActs'
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1089#1090#1091#1076#1077#1085#1090#1072'...'
      Hint = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1089#1090#1091#1076#1077#1085#1090#1072
      ImageIndex = 32
      OnExecute = actPerevodExecute
    end
    object actCollapseExpand: TAction
      Category = 'catDefaultNode'
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100
      OnExecute = actCollapseExpandExecute
    end
    object actAkadem: TAction
      Category = 'catStudActs'
      Caption = #1040#1082#1072#1076#1077#1084#1080#1095#1077#1089#1082#1080#1081' '#1086#1090#1087#1091#1089#1082'...'
      Hint = #1040#1082#1072#1076#1077#1084#1080#1095#1077#1089#1082#1080#1081' '#1086#1090#1087#1091#1089#1082
      ImageIndex = 29
      OnExecute = actAkademExecute
    end
    object actOtchisl: TAction
      Category = 'catStudActs'
      Caption = #1054#1090#1095#1080#1089#1083#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1072'...'
      Hint = #1054#1090#1095#1080#1089#1083#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1072
      ImageIndex = 25
      OnExecute = actOtchislExecute
    end
    object actAcademRestore: TAction
      Category = 'catStudActs'
      Caption = #1055#1088#1086#1076#1086#1083#1078#1077#1085#1080#1077' '#1091#1095#1077#1073#1099
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1072' '#1080#1079' '#1072#1082#1076#1077#1084#1080#1095#1077#1089#1082#1086#1075#1086' '#1086#1090#1087#1091#1089#1082#1072
      ImageIndex = 55
      OnExecute = actAcademRestoreExecute
    end
    object actVosst: TAction
      Category = 'catStudActs'
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1072'...'
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1072
      ImageIndex = 31
      OnExecute = actVosstExecute
    end
    object actExtendSession: TAction
      Category = 'catStudActs'
      Caption = #1055#1088#1086#1076#1083#1080#1090#1100' '#1089#1077#1089#1089#1080#1102'...'
      Hint = #1055#1088#1086#1076#1083#1080#1090#1100' '#1089#1077#1089#1089#1080#1102
      ImageIndex = 62
      OnExecute = actExtendSessionExecute
    end
    object actStudSep1: TAction
      Tag = 1
      Category = 'catStudActs'
      Caption = '-'
      Enabled = False
    end
    object actUspReports: TAction
      Category = 'catStudActs'
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1086#1090#1095#1105#1090#1099' '#1087#1086' '#1091#1089#1087#1077#1074#1072#1077#1084#1086#1089#1090#1080'...'
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1086#1090#1095#1105#1090#1099' '#1087#1086' '#1091#1089#1087#1077#1074#1072#1077#1084#1086#1089#1090#1080
      ImageIndex = 28
    end
    object actVypiska: TAction
      Category = 'catStudActs'
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1087#1080#1089#1082#1091'...'
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1087#1080#1089#1082#1091
      ImageIndex = 7
      OnExecute = actVypiskaExecute
    end
    object actNapr: TAction
      Category = 'catStudActs'
      Caption = #1042#1099#1076#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077'...'
      Hint = #1042#1099#1076#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 27
      OnExecute = actNaprExecute
    end
    object actRefreshDSinFrame: TAction
      Category = 'catDefaultNode'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = actRefreshDSinFrameExecute
    end
    object actTreeRefreshAction: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = actTreeRefreshActionExecute
    end
    object actAddGroup: TAction
      Category = 'catSpecAct'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091'...'
      ImageIndex = 35
      OnExecute = actAddGroupExecute
    end
    object actAddSpec: TAction
      Category = 'catFacAct'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      ImageIndex = 2
    end
    object actNaprClose: TAction
      Category = 'catStudActs'
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077'...'
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 41
      OnExecute = actNaprCloseExecute
    end
    object actStudSep2: TAction
      Tag = 1
      Category = 'catStudActs'
      Caption = '-'
    end
    object actDeleteStudent: TAction
      Category = 'catStudActs'
      Caption = #1059#1076#1072#1083#1080#1090#1100'...'
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 36
      OnExecute = actDeleteStudentExecute
    end
    object actFileExit: TAction
      Category = 'catFileAct'
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076
      ImageIndex = 36
      OnExecute = actFileExitExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actAbout: TAction
      Category = 'catHelpAct'
      Caption = #1054' '#1055#1088#1086#1075#1088#1072#1084#1084#1077'...'
      Hint = #1054' '#1055#1088#1086#1075#1088#1072#1084#1084#1077
      ImageIndex = 13
      OnExecute = actAboutExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actHelpContent: TAction
      Category = 'catHelpAct'
      Caption = #1057#1087#1088#1072#1074#1082#1072': '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
      Hint = #1057#1087#1088#1072#1074#1082#1072': '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
      OnExecute = actHelpContentExecute
    end
    object actAddStudentFormShow: TAction
      Category = 'catGroupAct'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1072'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1072
      ImageIndex = 2
      OnExecute = actAddStudentFormShowExecute
    end
    object actCollapseAll: TAction
      Category = 'catDefaultNode'
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1105
      OnExecute = actCollapseAllExecute
    end
    object actEditGroup: TAction
      Category = 'catGroupAct'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091'...'
      ImageIndex = 34
      OnExecute = actEditGroupExecute
      OnUpdate = actEditGroupUpdate
    end
    object actDelGroup: TAction
      Category = 'catGroupAct'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091'...'
      ImageIndex = 33
      OnExecute = actDelGroupExecute
      OnUpdate = actDelGroupUpdate
    end
    object actAddPrikaz: TAction
      Category = 'catPrikaz'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1082#1072#1079'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1082#1072#1079'...'
      ImageIndex = 44
      OnExecute = actAddPrikazExecute
    end
    object actEditPrikaz: TAction
      Category = 'catPrikaz'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1080#1082#1072#1079'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1080#1082#1072#1079'...'
      ImageIndex = 43
      OnExecute = actEditPrikazExecute
      OnUpdate = actEditPrikazUpdate
    end
    object actDelPrikaz: TAction
      Category = 'catPrikaz'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1082#1072#1079
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1082#1072#1079
      ImageIndex = 42
      OnExecute = actDelPrikazExecute
      OnUpdate = actDelPrikazUpdate
    end
    object actAddPrep: TAction
      Category = 'catNagruzkaDep'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103'...'
      ImageIndex = 45
      OnExecute = actAddPrepExecute
    end
    object actAddPotok: TAction
      Category = 'catNagruzkaDep'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1086#1090#1086#1082'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1086#1090#1086#1082'...'
      ImageIndex = 50
      OnExecute = actAddPotokExecute
    end
    object actEditPrep: TAction
      Category = 'catNagruzkaPrepAll'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077'...'
      ImageIndex = 47
      Visible = False
      OnExecute = actEditPrepExecute
    end
    object actDelPrep: TAction
      Category = 'catNagruzkaPrepAll'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
      ImageIndex = 46
      Visible = False
      OnExecute = actDelPrepExecute
    end
    object actAddNorm: TAction
      Category = 'catNagruzkaFac'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080'...'
      ImageIndex = 49
      OnExecute = actAddNormExecute
      OnUpdate = actAddNormUpdate
    end
    object actAddSpclz: TAction
      Category = 'catSpecAct'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1102'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1102'...'
      ImageIndex = 54
      Visible = False
      OnExecute = actAddSpclzExecute
    end
    object actUchPlanAdd: TAction
      Category = 'catSpecAct'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085'...'
      ImageIndex = 7
      Visible = False
      OnExecute = actAddUchPlanExecute
      OnUpdate = actAddUchPlanUpdate
    end
    object actLevelUp: TAction
      Category = 'catGroupAct'
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1082#1091#1088#1089
      ImageIndex = 68
      OnExecute = actLevelUpExecute
    end
    object actAddDepPlan: TAction
      Category = 'catNagruzkaDep'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1085' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080'...'
      ImageIndex = 51
      OnExecute = actAddDepPlanExecute
    end
    object actAddPlanPrepNagruzka: TAction
      Category = 'catNagruzkaPrep'
      Caption = #1047#1072#1082#1088#1077#1087#1080#1090#1100' '#1085#1072#1075#1088#1091#1079#1082#1091' '#1079#1072' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084'...'
      ImageIndex = 52
      OnExecute = actAddPlanPrepNagruzkaExecute
    end
    object actAddFactPrepNagruzka: TAction
      Category = 'catNagruzkaPrep'
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1091#1102' '#1085#1072#1075#1088#1091#1079#1082#1091'...'
      ImageIndex = 53
      OnExecute = actAddFactPrepNagruzkaExecute
    end
    object actAddAbit: TAction
      Category = 'catAbitSpec'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
      ImageIndex = 59
      OnExecute = actAddAbitExecute
    end
    object actPostupDlgShow: TAction
      Category = 'catAbitActs'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
      ImageIndex = 43
      OnExecute = actPostupDlgShowExecute
    end
    object actLogOff: TAction
      Category = 'catFileAct'
      Caption = #1057#1084#1077#1085#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103'...'
      ImageIndex = 30
      Visible = False
    end
    object actFind: TAction
      Caption = #1053#1072#1081#1090#1080' '#1089#1090#1091#1076#1077#1085#1090#1072
      OnExecute = actFindExecute
    end
    object actCheckNewVer: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
      Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1085#1072#1083#1080#1095#1080#1077' '#1085#1086#1074#1086#1081' '#1074#1077#1088#1089#1080#1080
      OnExecute = actCheckNewVerExecute
    end
    object actListToExcel: TAction
      Category = 'catAbitActs'
      Caption = #1042#1099#1076#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
      Hint = #1042#1099#1076#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077' '
      ImageIndex = 56
      OnExecute = actListToExcelExecute
    end
    object actPrintMag: TAction
      Category = 'catAbitSpec'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1078#1091#1088#1085#1072#1083#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1078#1091#1088#1085#1072#1083#1072' '#1074' Excel'
      ImageIndex = 56
      OnExecute = actPrintMagExecute
    end
    object actDocsRetrieve: TAction
      Category = 'catAbitActs'
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      Hint = #1042#1077#1088#1085#1091#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 57
      OnExecute = actDocsRetrieveExecute
    end
    object actPrintEgeOtch: TAction
      Category = 'catAbitYear'
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1089#1076#1072#1102#1097#1080#1084' '#1045#1043#1069
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Ex'#1089'el '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1089#1076#1072#1102#1097#1080#1084' '#1045#1043#1069
      ImageIndex = 56
      OnExecute = actPrintEgeOtchExecute
    end
    object actPrintAllZhurnal: TAction
      Category = 'catAbitYear'
      Caption = #1042#1099#1076#1072#1090#1100' '#1078#1091#1088#1085#1072#1083#1099' '#1087#1086' '#1074#1089#1077#1084' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1103#1084
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel '#1078#1091#1088#1085#1072#1083#1086#1074' '#1087#1086' '#1074#1089#1077#1084' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1103#1084
      ImageIndex = 48
      OnExecute = actPrintAllZhurnalExecute
    end
    object ActGroupMgr: TAction
      Category = 'catSpecAct'
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088' '#1075#1088#1091#1087#1087
      Hint = #1052#1077#1085#1077#1076#1078#1077#1088' '#1075#1088#1091#1087#1087
      ImageIndex = 32
      OnExecute = ActGroupMgrExecute
    end
    object actAbitMove: TAction
      Category = 'catAbitActs'
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
      Hint = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
      ImageIndex = 58
      OnExecute = actAbitMoveExecute
    end
    object actStatToExcel: TAction
      Category = 'catRecruit'
      Caption = #1055#1077#1095#1072#1090#1100' '#1080#1090#1086#1075#1086#1074
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel '#1080#1090#1086#1075#1086#1074#1086#1075#1086' '#1086#1090#1095#1077#1090#1072
      ImageIndex = 56
      OnExecute = actStatToExcelExecute
    end
    object actPrintResults: TAction
      Category = 'catRecruit'
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1091' '#1074' Excel '
      ImageIndex = 56
      OnExecute = actPrintResultsExecute
    end
    object actJoinGroup: TAction
      Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100' '#1074' '#1075#1088#1091#1087#1087#1091'...'
      Enabled = False
      Hint = #1047#1072#1095#1080#1089#1083#1080#1090#1100' '#1074' '#1075#1088#1091#1087#1087#1091'...'
      ImageIndex = 2
      OnExecute = actJoinGroupExecute
      OnUpdate = actJoinGroupUpdate
    end
    object actGroupChange: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091'...'
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 20
      OnExecute = actGroupChangeExecute
      OnUpdate = actGroupChangeUpdate
    end
    object actCurrentReturn: TAction
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1074' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1089#1087#1080#1089#1086#1082
      Hint = #1042#1077#1088#1085#1091#1090#1100' '#1074' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 32
      OnExecute = actCurrentReturnExecute
    end
    object actLichnKartStud: TAction
      Category = 'catStudActs'
      Caption = #1051#1080#1095#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1089#1090#1091#1076#1077#1085#1090#1072
      Hint = #1051#1080#1095#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1089#1090#1091#1076#1077#1085#1090#1072
      ImageIndex = 56
      OnExecute = actLichnKartStudExecute
    end
    object actQMShow: TAction
      Category = 'catFileAct'
      Caption = #1052#1072#1089#1090#1077#1088' '#1079#1072#1087#1088#1086#1089#1086#1074
      ShortCut = 16465
      OnExecute = actQMShowExecute
    end
    object actStartMaster: TAction
      Category = 'catNagruzkaDep'
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1084#1072#1089#1090#1077#1088' "'#1059#1095#1077#1090' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080'"'
      Visible = False
      OnExecute = actStartMasterExecute
    end
    object actStartUOMaster: TAction
      Category = 'catNagruzka'
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1084#1072#1089#1090#1077#1088' "'#1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1091#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080'"'
      Visible = False
      OnExecute = actStartUOMasterExecute
    end
    object actFindTeach: TAction
      Caption = 'actFindTeach'
      OnExecute = actFindTeachExecute
    end
    object actPrintItogiPostupl: TAction
      Category = 'catAbitYear'
      Caption = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' '#1080#1090#1086#1075#1086#1074' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      Enabled = False
      ImageIndex = 5
      OnExecute = actPrintItogiPostuplExecute
    end
    object actPrintItogiPostForSpec: TAction
      Category = 'catAbitSpec'
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1080#1090#1086#1075#1080' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1080#1090#1086#1075#1080' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      ImageIndex = 56
      OnExecute = actPrintItogiPostForSpecExecute
      OnUpdate = actPrintItogiPostForSpecUpdate
    end
    object actPrintAbitDopSpec: TAction
      Category = 'catAbitYear'
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074' '#1085#1072' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074' '#1085#1072' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
      ImageIndex = 38
      OnExecute = actPrintAbitDopSpecExecute
      OnUpdate = actPrintAbitDopSpecUpdate
    end
    object actAbitReturn: TAction
      Category = 'catAbitActs'
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 67
      OnExecute = actAbitReturnExecute
    end
    object actViewUchPlan: TAction
      Category = 'catGroupAct'
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1091#1095#1077#1073#1085#1086#1084#1091' '#1087#1083#1072#1085#1091
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1091#1095#1077#1073#1085#1086#1084#1091' '#1087#1083#1072#1085#1091
      ImageIndex = 51
      OnExecute = actViewUchPlanExecute
    end
    object actMakeBookmark: TAction
      Category = 'catScheduleBookmarks'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091
      OnExecute = actMakeBookmarkExecute
      OnUpdate = actMakeBookmarkUpdate
    end
    object actManageBookmarks: TAction
      Category = 'catScheduleBookmarks'
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1082#1083#1072#1076#1082#1072#1084#1080
      OnUpdate = actFilleMenuUpdate
    end
    object actAppTweaksShow: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = actAppTweaksShowExecute
    end
    object actAddZayav: TAction
      Category = 'catHOST'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
      OnExecute = actAddZayavExecute
    end
  end
  object ImageList1: TImageList
    Left = 311
    Top = 82
    Bitmap = {
      494C01014A006800840010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003001000001002000000000000030
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFAFAFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063493500634935006349350000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDC3C1FF137259FFBBC0BFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0A99B0000CCFF00634935000000000000000000AE93
      8400A68D7C009F857400997E6B00000000000000000000000000000000000000
      0000000000000000000086755FFF345228FF14A37DFF7DB5A7FFA3B1ADFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0A99B00C0A99B00C0A99B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFEFF5D8476FF906510FFD6D6D6FF9B7844FF325737FF8DB5ABFF8AA3
      9EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FCFF2F7B66FF926912FFB67518FFBB8515FFA39A90FFD5D5D5FFA87A38FF7C86
      6FFF6F988FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006349
      3500634935006349350000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6F6F6FF1478
      60FF497039FFBA7D1BFFEAB41CFFEBB91DFFECBD1EFFB98415FFA69E95FFD3D3
      D2FFB47D2EFF687364FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0A9
      9B00FFFFFF00634935000000000000000000AD948400A78D7C00A08574000000
      00000000000000000000000000000000000000000000EAEAEAFF087F64FF1AB1
      8BFFAC7212FFDF9D19FFE7AC1BFFE9B21CFFEBB71DFFECBC1EFFEDC01EFFB682
      16FFA9A29AFFD0CFCDFFBC7D26FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0A9
      9B00C0A99B00C0A99B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D3D5D4FF08886BFF1FB492FF8E58
      0FFFBB7518FFE39E19FFE5A41AFFE7AA1BFFE8B01CFFEAB51DFFEBBA1DFFEDBE
      1EFFEEC21FFFB37F16FFADA7A0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000099273FF1FB08EFF4B7C46FFB472
      20FFE09016FFE19617FFE39B18FFE4A119FFE6A81AFFE8AD1BFFE9B31CFFEBB8
      1DFFECBD1EFFEDC01FFFEEC31FFFBE9B61FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006349
      3500634935006349350000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001BB78FFF1ACF96FFA96413FFDB83
      14FFDE8915FFDF8E16FFE09317FFE29918FFE49F19FFE5A51AFFE7AB1BFFE9B1
      1CFFEAB61DFFECBB1EFFECBE1FFFF5F4F3FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0A9
      9B0000CCFF00634935000000000000000000AE938400A68D7C009F857400997E
      6B00957A6700957A67000000000000000000FDFDFDFF8F550FFFC17317FFDB7F
      14FFDC8314FFDD8715FFDE8C16FFE09117FFE19718FFE39D19FFE5A31AFFE7A9
      1BFFE8AE1BFFEAB41DFFF2F0EEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0A9
      9B00C0A99B00C0A99B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCA58CFFB47428FFDB7F14FFDB7F
      14FFDB7F14FFDB8114FFDC8515FFDE8A15FFDF8F16FFE19417FFE29A18FFE4A0
      19FFE6A61AFFEEEBE6FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C29B6FFFDA7E14FFDB7F14FFDB7F
      14FFDB7F14FFDB7F14FFDB8014FFDC8415FFDD8815FFDF8D16FFE09217FFE298
      18FFEBE5DDFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006349350063493500634935000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EBE8E5FFD8984EFFDB7F
      14FFDB7F14FFDB7F14FFDB7F14FFDB7F14FFDC8214FFDD8615FFDE8B16FFE8DF
      D3FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0A99B00FFFFFF00634935000000
      000000000000AE938400A68D7C009F857400997E6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEC5A8FFDC841DFFDB7F14FFDB7F14FFDB7F14FFDB8114FFE3D6C7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0A99B00C0A99B00C0A99B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EEEDEBFFD69B56FFDB7F14FFDFCDB8FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700EFEFEF00EFEF
      EF00F7F3F700F7F7F700FFFBFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD9284008C756300846D
      5A00846952007B6552007B5D4A00735942006B5542006B5139006B4D39006349
      3100634931000000000000000000000000000000000000000000000000000000
      0000000000000000000000280000004100000861080008610800218E2100188E
      180010791000086108000030000000000000000000000086A50000869C000086
      9C0000869C0000869C0000869C0000869C0000829C000079940000799400007D
      9400F7F3F700FFFFFF0000000000000000000000000000000000000000000000
      00009C8E84006349310063493100634931006349310063493100634931006349
      31006349310063493100000000000000000000000000B5968400FFEFEF00EFE3
      DE00E7DFD600E7D7D600DED3CE00DECBC600D6C7BD00D6C3BD00CEBEB500CEB6
      AD00634931000000000000000000000000000000000000000000000000000000
      00000000000000610000219E210052C75200399E39002186210063C7630063CF
      630039BE390031B63100107910000000000000000000008EAD00FFFFFF00DEFB
      FF00DEFBFF00DEFBFF00DEFBFF00DEFBFF009CEFFF0052E7FF006BEBFF00008E
      AD00FFFFFF000000000000000000000000000000000000000000000000000000
      00009C8A7B00FFFBFF00DEC3AD00D6BEAD00CEB6A500CEB2A500C6AA9C00BDA6
      9400B5A2940063493100000000000000000000000000B59A8C00FFF3EF00FFF3
      EF00E7CFC600B5552100A54D21009C492100E7CBBD00F7E7DE00F7E3DE00CEBA
      B5006B4D39000000000000000000000000000000000000000000000000000000
      000000000000188E18005AC75A0063CF630039963900DEEFCE00429E39006BCF
      6B0063CF630039B63900086908000000000000000000089AB500E7FBFF00C6F3
      FF00BDF3FF00BDF3FF00BDF3FF00B5F3FF00B5F3FF00B5F3FF008CEFFF00008E
      AD00000000000000000000000000000000000000000000000000000000000000
      00009C8A7B00FFFFFF00FFFBF700F7F3EF00F7EBE700EFDFD600E7D7CE00E7CF
      BD00BDA6940063493100000000000000000000000000B59E8C00FFF7F700EFD3
      C600C65D2900EFCFC600FFEFE700E7CBBD0094492100E7CBBD00F7E7DE00D6C3
      B5006B5139000000000000000000000000000000000000000000000000000000
      0000000000002186210063CF630084DF8400639E5A00000000008CBE8C005AB6
      5A0063CF630042AE420000490000000000000000000010A6BD00E7FBFF00C6F3
      FF00C6F3FF00BDF3FF00DEDFE700DEDFDE00F7F3F700C6C3BD0042D3EF00008E
      AD00000000000000000000000000000000000000000000000000000000000000
      00009C8E8400FFFFFF00FFFFFF00FFF7F700F7EFEF00F7E7DE00EFDFD600E7D7
      C600C6AA9C00634931000000000000000000EF824A00B5927B00EFD7CE00D669
      3100EFD3CE00FFF3EF00FFEFEF00FFEFEF00E7CFC60094492100FFEBE700B5A6
      C6001820CE001018C60000000000000000000000000000000000000000000000
      0000000000000061000042A642009CE79C0084AE6B00BDCFCE009CBEC6003986
      420042A642000059000000000000000000000000000021B6CE00EFFBFF00CEF3
      FF00C6F3FF00C6F3FF00CECBCE007B7D8C00AD9E8400AD7918009C711800ADA2
      9400000000000000000000000000000000000000000000000000000000000000
      0000A5928400FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7DE00EFDB
      D600CEB2A50063493100000000000000000000000000EF824A00E7713900EFD7
      CE00FFF7F7005A5DDE00CECBE700FFF3EF00FFEFEF00FFEFE700CEC3DE00212C
      CE00634D5A00000000001018C600000000000000000000000000000000000000
      000000000000000000000061000021792900006984001079C6001079C6000871
      AD00004939000000000000000000000000000000000021B6CE00EFFBFF00CEF3
      FF00CEF3FF00CEF3FF00C6F3FF00C6BA9C00E7A63100F7AE3900B57500009C75
      4200000000000000000000000000000000000000000000000000000000000000
      0000A5968C00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFF7F700F7EFE700EFE3
      DE00CEB6A50063493100000000000000000000000000C6A69C00FFFBFF00FFFB
      F700FFFBF700D6CFEF005259DE00CECBE700FFF3EF00CEC7E7003134CE00B5AE
      CE007B5D4A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000598400298EEF00319EFF00319EFF00319E
      FF001079C6000010180000000000000000000000000029BAD600F7FFFF00D6F3
      FF00D6F3FF00CEF3FF00CEF3FF00EFD3AD00FFCF8400F7C37300BD7900009C61
      00007361290084794A00C6C7BD00000000000000000000000000000000000000
      0000AD9A8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00F7F3EF00F7EB
      E700D6BEAD0063493100000000000000000000000000C6AA9C00FFFFFF00FFFB
      FF00FFFBFF00FFFBF700D6CFEF005255DE00424DD6003945D600CEC7E700E7D7
      D6007B6552000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001879C60039A6FF0042A6FF0042A6FF0039A6
      FF00319EFF000049730000000000000000000000000029BAD600F7FFFF00DEF3
      FF00D6F3FF00D6F3FF00D6F3FF00E7CFAD00E7AA3900E79E2900CE860000C682
      0000C68A1800CE86000084754200000000000000000000000000000000000000
      0000B59E9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700F7F3
      EF00DEC3AD0063493100000000000000000000000000C6AEA500FFFFFF00FFFF
      FF00FFFBFF00FFFBFF00FFFBF700FFF7F700FFF7F700FFF7F700FFF3EF00E7DF
      DE00846952000000000000000000000000000000000000000000E79A7300AD59
      3100000000000000000000000000218ECE0042AEFF004AB6FF004AB6FF004AAE
      FF0042AEFF001879BD0000000000000000000000000029BED600FFFFFF00DEF3
      F700DEF3F700DEF3FF00D6F3FF00FFFBF700DECBA500D6BA8C00DECBAD00BD92
      4200E7A22900CE860000948A6300000000000000000073C7E70084DBEF0084E7
      FF0039BEE7009CDBDE0094E3F70084D3EF00FFFFFF00FFFFFF00FFFFFF00C6AE
      9C00C6AA9C0063493100000000000000000000000000CEB2AD00FFFFFF00FFFF
      FF006B696B006B696B006B696B006B696B006B696B006B696B006B696B006B69
      6B006B696B006B696B006B696B00000000000000000000000000E79A7300AD59
      3100000000000000000000000000218ECE0052B6FF0052BEFF0052BEFF0052B6
      FF004AB6FF00218ECE0000000000000000000000000031C3DE00FFFFFF00DEF3
      F700DEF3F700DEF3F700DEF3F700DEF3FF00FFFFFF007BEBFF0063E7FF00ADA2
      9400A58221008C793900EFEBE70000000000000000009CE3F70031B6DE007BEB
      FF005AC7E70094F3FF0029B6DE00A5EBFF00FFFFFF00FFFFFF00AD9A8C006349
      31006349310063493100000000000000000000000000CEB6AD00FFFFFF006B69
      6B00E7E3E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E3E7006B696B000000000000000000FFAA7B00DE79
      4A000000000000000000000000002186BD00319ED6002996C60039A6DE004AB6
      FF0042AEF7002186B50000000000000000000000000031C3DE00FFFFFF00E7F3
      F700E7F3F700DEF3F700DEF3F700DEF3F70010A6BD0010A6BD0010A6BD00B5B2
      B500000000000000000000000000000000000000000094EBFF0094F3FF00BDFB
      FF00ADEBF700C6FBFF0094F3FF009CF3FF00FFFFFF00FFFFFF00AD9E8C00D6C7
      BD0063493100D6CBC600000000000000000000000000CEBAB500FFFFFF006B69
      6B00FFFFFF0042D7420042D74200FFFFFF0042D7420042D74200FFFFFF0042D7
      420042D74200FFFFFF00FFFFFF006B696B00DED3CE00E79A7300FFB28C00F78E
      5A009C4D2900CECBC6000000000000619400318EBD0052A6D60073B6DE005AA6
      C600398EB50008699C0000000000000000000000000031C7DE00FFFFFF00E7F3
      F700E7F3F700E7F3F700E7F3F700DEF3F70010A6BD00D6FBFF00008EAD00BDD3
      D600000000000000000000000000000000000000000021AADE0052BEE700ADEB
      F700F7FFFF00B5EBF70052BEE70031BAE700FFFFFF00FFFFFF00B5A294006349
      3100D6CFC60000000000000000000000000000000000D6C3B500FFFFFF006B69
      6B00FFFFFF0039D7310039D73100FFFFFF0039D7310039D73100FFFFFF0039D7
      310039D73100FFFFFF00FFFFFF006B696B0000000000DED3CE00FFC3A500E786
      5A00CECBC6000000000000000000006194002186B50084C7E70094CFEF008CC7
      E700298EBD0000496B0000000000000000000000000031C7DE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0018A6C600008EAD009CEFFF00E7F7
      FF00000000000000000000000000000000000000000094EBFF0094F3FF00C6FB
      FF00ADE7F700C6FBFF0094F3FF008CD7E700B5A69400B5A69400B5A29400D6CF
      C6000000000000000000000000000000000000000000D6C7BD00FFFFFF006B69
      6B00FFFFFF0052DB4A0052DB4A00FFFFFF0052DB4A0052DB4A00FFFFFF0052DB
      4A0052DB4A00FFFFFF00FFFFFF006B696B000000000000000000DED3C600CECB
      C60000000000000000000000000000000000006194001871A5004296BD001871
      A50000517B000000000000000000000000000000000039CFE70042D3EF0042D3
      EF0042D3EF0042D3EF0042D3EF0039CBE700008EAD00C6F7FF00FFFFFF000000
      0000000000000000000000000000000000000000000094E3F70031BAE7008CF3
      FF005AC3E70094F3FF0029B6DE008CDFF7000000000000000000000000000000
      00000000000000000000000000000000000000000000DECBC600D6C7BD006B69
      6B00D6D7D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E3E7006B696B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063C3E70084DBEF0094EB
      FF0021AEDE008CEBFF008CDFF70084CFE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B696B006B696B006B696B006B696B006B696B006B696B006B696B006B69
      6B006B696B006B696B006B696B00000000000000000000000000000000000000
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
      000000000000000000000000000000000000B5A294007B614A0073594200634D
      3900634931006349310063493100634931006349310063493100634931006349
      31006349310063493100634931006349310000000000D6697300FF9E9C00EF86
      8400E786840073594A00423831008C796B00EFE7DE00F7E7E7008C797300A541
      3100A54139009C3831007B383900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009492FF000000AD0000000000000000000000
      000000000000000000000000000000000000B5A29400EFDBD600EFDBD600EFCF
      BD00EFCFBD00DEBAA500DEBAA500DEBAA500DEBAA500DEBAA50000820000DEB6
      9C00DEB69C00E7AE9400E7AE94006349310000000000D6717300FF9EA500F796
      9400EF86840073594A000000000042383100EFDFCE00EFDFD60084716300AD49
      4200AD494200A54139007B383900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009492FF0000008C000000AD0000000000000000000000
      000000000000000000000000000000000000BDA69400FFF3EF00ADBAD6000859
      CE001855AD0000419400294D9400ADA6A500FFE3D6000082000000FF00000082
      0000F7D7C600F7D7C600DEB69C006349310000000000D6797B00FFAEAD00FF9E
      A500F796940073594A0073594A0073594A0073594A00736152007B695A00BD51
      5200B5494A00AD49420084414200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009492FF0000008C000000DE000000AD0000000000000000000000
      000000000000000000000000000000000000BDAA9C00EFEFF7001855C60063A2
      F7004286DE000049A5001065D600004194000082000000FF000000FF000000FF
      000000820000BD968400DEB69C006349310000000000DE868400FFB6B500FFAE
      AD00FFA6A500F78E8C00EF868400E7868400DE797B00D6717300D6696B00C659
      5A00BD515200B5514A008C414200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009492FF0000008C000000DE000000DE0000008C0000008C0000008C000000
      8C005251FF00000000000000000000000000BDAA9C00EFEFF700296DD60063A2
      F7001855AD00296DD6000851B5000082000000FF000000FF00000082000000FF
      000000FF000000820000DEBAA5006349310000000000DE8E8C00FFBEBD00FFB6
      B500CE616300C6595200BD594A00BD513900B5493100AD412900A5411800A538
      1000C6595A00BD5152008C414200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009492
      FF0000008C000000DE004241FF000000DE004241FF005251FF004241FF005251
      FF005251FF00000000000000000000000000C6B2A500FFFBF700DEDFDE00294D
      94009C9A9400848A9C000082000000FF000000FF000000820000BD9684000082
      000000FF000000FF0000008200006349310000000000E7969400FFBEBD00CE61
      6300FFFFFF00FFFFFF00FFFFF700F7EFEF00F7E7DE00EFDFD600E7D7C600E7CF
      BD00A5381000C6595A0094494A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      DE000000DE000000DE004241FF004241FF004241FF004241FF005251FF005251
      FF005251FF00000000000000000000000000C6B6A500FFFFFF00636563002928
      2900B5B6B5007B797B00636563000082000000820000FFF3EF00FFEFE700FFEB
      E7000082000000FF000000FF00000082000000000000E7969C00FFBEBD00D669
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7EFEF00F7E7DE00EFDFD600E7D7
      C600A5411800CE6163009C494A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009492
      FF000000DE000000DE004241FF005251FF005251FF005251FF005251FF005251
      FF005251FF00000000000000000000000000CEB6AD00FFFBFF004A494A004A49
      4A00E7E7E700C6C7C6007B797300DEDFDE00FFF7F700F7C7A500F7B28C00F7AE
      8400FFA67B000082000000FF000000FF000000000000EF9E9C00FFBEBD00DE71
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7EFEF00F7E7DE00EFDF
      D600AD412900D67173009C495200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009492FF000000DE005251FF005251FF000000DE000000DE000000DE005251
      FF005251FF00000000000000000000000000CEBAAD00FFFFFF006B696B007375
      730094969C0094969C007B797300E7DFDE00FFFFFF00FFFBF700FFFBF700FFFB
      F700FFF7EF00FFF7EF000082000000FF000000000000EFA6A500FFBEBD00E786
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7EFEF00F7E7
      DE00B5493100DE797B00A5515200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009492FF000000DE005251FF000000DE0000000000000000000000
      000000000000000000000000000000000000D6BEB50000000000E7E3E7007375
      73008482840073757300C6C7C600FFFBFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFFBF700CECBC6000082000000000000F7AEAD00FFBEBD00EF8E
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7EF
      EF00BD51390063303100AD515200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009492FF000000DE000000DE0000000000000000000000
      000000000000000000000000000000000000D6C3B50000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFBFF00FFFBFF00FFFFFF007B614A0000000000F7B6B500FFBEBD00FF96
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700BD594A00B5595A00B5595A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009492FF004241FF0000000000000000000000
      000000000000000000000000000000000000D6C3B500D6C3B500D6BEB500CEBA
      AD00CEBAAD00CEB6AD00C6B6A500C6B2A500C6AEA500BDAA9C00BDA69400BDA6
      9400B5A29400B5A29400B5A29400B5A2940000000000F7B6B500F7B6B500F7B6
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
      00000000000000000000000000000000000000000000DE714A00CE714A00CE71
      4A00C6694200C6694200BD693900BD693900B5613900B5613900AD613900AD59
      3100AD593100A5592900A5592900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008451420084514200845142008451
      420084514200845142007B51390073493900734939006B4131006B4131006B41
      31006B4131006B4131006B413100A5592900E7E7EF0031388C0029307B007B86
      B5007371AD00313884007B79AD00000000000000000000000000000000000000
      0000848684000000000000000000000000000000000000000000AD9684007359
      4A0073594A0073594A0073594A0073594A0073594A0073594A0073594A007359
      4A0073594A0073594A0073594A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5695200FFFFFF00FFFFF700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7EF00FFEFEF00F7EFE700F7EFE700F7E7
      E700F7E7E700F7E7DE00F7E7DE00A559290000000000ADA6C60039388C00ADAE
      D60000000000EFF7F7007379B50000000000000000000000000000000000E7E7
      E70000000000DEDFDE0000000000000000000000000000000000AD968400DECF
      C600DECFC600DECFC600DECFC600DECFC600DECFC600DECFC600DECFC600DECF
      C600DECFC600DECFC60073594A000000000000000000B5B6B5006B696B009C9E
      9C0000000000000000000000000000000000000000000000000000000000E7E7
      E700A5A6A500949694000000000000000000AD715A00FFFFFF009C614A00AD51
      29009C51290084513100FFFFF7008C5131007B4921006B3810009C8E7300FFEF
      EF00F7EFEF00F7EFE700F7E7E700B561390000000000000000008469A5003941
      9400EFEFF70000000000DEDFEF00000000000000000000000000000000001010
      1000000000000808080000000000000000000000000000000000AD968400FFEF
      E700F7E7DE00F7E7DE00F7DFD60000965A00F7DFCE00F7D7CE00F7D7C600F7D7
      C600F7CFBD00DECFC60073594A00000000009479EF002900DE003928A5006361
      6300CECFCE000000000000000000000000000000000000000000D6D7D6006351
      B5002900DE00A5A6A5000000000000000000AD715A00FFFFFF00A5695200CE71
      4A00CE714A008C492100D6BEAD009C593900AD5129009C49210052381000E7D7
      CE00FFEFEF00F7EFE700F7E7E700BD6939000000000000000000DED7E7004A41
      94006B71AD000000000000000000000000000000000000000000E7E7E7000000
      00000000000000000000E7E7E700000000000000000000000000AD968400FFEF
      E700FFEFE700F7E7DE0000965A00008E5A008CDFB5008CDFB500EFD7C600F7D7
      C600F7D7C600DECFC60073594A0000000000BDAEF7002900DE003108DE005249
      6B007B797B00DEDFDE00000000000000000000000000CEC7D6004228C6002900
      DE007B69CE00000000000000000000000000B5796300FFFFFF00A5695200CE79
      5200CE714A00AD6139008C5131009C614A00B5593100AD5121006B3810009C8E
      7300FFEFEF00F7EFEF00F7EFE700BD69390000000000EFEFF700000000009C96
      C60021287B00B5BED600000000000000000000000000000000007B797B00B5B6
      B50000000000BDBEBD0073717300000000000000000000000000AD9E8C00FFEF
      EF00FFEFE70000965A0000965A0000965A0000965A0000965A0000965A00B5DF
      BD00F7D7C600DECFC60073594A0000000000000000008471EF002900DE003918
      D6005A595A0094969400E7E7E70000000000CEC7D6003918CE002900DE00A59E
      C60000000000000000000000000000000000B579630000000000AD715A00D68E
      6300CE866300D6795A00AD613900A5695200BD613900C6613100AD5129006B38
      10009C8E7300FFEFEF00F7EFEF00C6694200000000008479B50000000000F7F7
      F7005A599C0042498C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B59E8C00FFF7
      EF00FFF7EF00FFEFE70000965A0000965A00D6EFDE00F7E7D600D6EFD6000096
      5A00F7D7CE00DECFC60073594A000000000000000000000000007B61EF002900
      DE005238C6006361630094969400B5B6C6003918CE002900DE00A59EC6000000
      000000000000000000000000000000000000B5796300FFFFFF00B5796300D68E
      7300B5715A00DE9E8400CE866300AD715A00C6694200C6694200CE714A009C51
      290052381000FFF7EF00FFEFEF00CE714A00000000009C8EB5009486B500AD9E
      BD009486B5006B69A500ADAED600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B59E8C00FFF7
      F700FFF7EF0073DFB500FFEFE70000965A00FFE7DE0000965A00F7E7D60073D7
      AD00F7DFCE00DECFC60073594A00000000000000000000000000000000007B61
      EF002900DE005230C60052515A003110C6002900D600A59EC600000000000000
      000000000000000000000000000000000000BD86730000000000C6866B00DE96
      7B009C614A00AD715A00DE9E8400CE866300CE7152008C5942009C614A00CE71
      4A009C512900E7D7CE00FFF7EF00CE7952000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDA69400FFFF
      F700FFF7F70000965A00ADEFD600FFEFEF00D6F7E70000965A0000965A00F7E7
      DE00F7DFD600DECFC60073594A00000000000000000000000000000000000000
      00007B59EF002900DE002900D6002900D6006B618C00DEDFDE00000000000000
      000000000000000000000000000000000000BD86730000000000D68E7300DEA6
      8C009C614A00EFDFD600D6BEAD00DE9E8400D6866300A5695200FFF7F7009C61
      4A00CE86630052412100FFF7F700D6865A00C68E6B0094593900D6BEB500FFFF
      F700945942008C4931009C695A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDA69400FFFF
      FF00FFFFF700D6F7E70000965A0000965A0000965A0000965A00009663000096
      5A00F7E7DE00DECFC60073594A00000000000000000000000000000000000000
      0000CEC7D6002908DE002900DE004228C6007371730094969400D6D7D6000000
      000000000000000000000000000000000000BD86730000000000D68E7300E7AE
      9400A5695200E7D7CE00FFF7F700E7AE9400D68E6300AD715A00FFFFFF00B5A6
      9400B5715A007B492100EFDFD600D6865A00FFFFFF00BD714A00FFF7EF000000
      0000E7CFC6008C493100EFE7DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDAE9C00FFFF
      FF00FFFFFF00FFFFF700D6F7E700ADEFD6008CE7C60000965A0000965A00FFEF
      E700F7E7DE00DECFC60073594A0000000000000000000000000000000000CEC7
      D6003918CE002900DE007359CE003108E7005A38D6007B798C0084868400C6C7
      C60000000000000000000000000000000000BD967B0000000000DE9E8400E7AE
      9400BD867300B5796300F7EFE700CE967300D6967300B5796300FFFFFF00DEBE
      AD00AD715A00B5613900DEC7BD00DE86630000000000C68E6B00BD795A00BD9E
      8C0094593900AD796B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6AE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7F70000965A00FFEFEF00FFEF
      E700DECFC600DECFC60073594A00000000000000000000000000CEC7D6003918
      CE002900DE008C86BD0000000000000000004218E7004A28DE007B719C007B79
      7B00B5B6B500000000000000000000000000BD967B00DE9E8400DE9E8400D696
      7300D6967300D68E7300D68E7300E7D7CE00CE795A00C6715200FFFFFF00C669
      4A00C6715200C6694A00BD613900DE86630000000000EFDFCE00BD714A00F7E7
      E7008C513100DECFC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6B6A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7EF00FFF7
      EF0073594A0073594A0073594A000000000000000000BDBEC6003910CE002900
      DE007361B500000000000000000000000000000000005A41E7003108DE007B69
      B5008C8E8C00DEDFDE000000000000000000BD967B0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E78E63000000000000000000C6865A00BD79
      5A00946142000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB6A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F7009479
      6B00F7DFCE00D6BEAD0073594A0000000000C6BEEF003910CE002900DE005A41
      B5000000000000000000000000000000000000000000000000009479EF002900
      DE00CECFE700000000000000000000000000BD967B00BD967B00BD967B00BD96
      7B00BD867300BD867300BD867300B5796300B5796300B5796300AD715A00AD71
      5A00AD715A00AD715A00A5695200E78E63000000000000000000D6A68400B569
      4200CEB6A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB6AD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF7009479
      6B00D6BEAD00AD96840000000000000000004218E7002900DE004228C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7CFB500F7CFB500F7CF
      B500F7BEAD00F7BEAD00F7B6A500EFB69C00E7AE9400EFA68C00EFA68C00E79E
      8400EF967300E78E6300E78E6300000000000000000000000000FFF7EF00C671
      4A00F7F7EF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB6AD00CEB6
      A500C6B6A500C6B6A500C6AE9C00BDAE9C00BDA69400BDA69400B59E8C00B59E
      8C00B59E8C000000000000000000000000003110E7004A28E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000490000004900000000
      0000000000000000000000510000005100000051000000510000005100000051
      0000005100000051000000510000002000000000000000000000000000000000
      0000000000000000000000000000000000000028FF000820DE000020FF000000
      00000000000000000000000000000018EF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086000000860000007900000079
      0000008600000086000000860000008600000086000000860000008600000086
      00000086000000790000008E0000003800000000000000000000000000000000
      00000000000000000000000000002141FF000020FF000820F7004251D6000000
      000000000000000000000018DE000010AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000086000000380000B5A694007B614A00735942006349
      3900634931006349310063493100634931001841FF001030FF000020FF001038
      FF00634931000020FF000010C6000018EF00B5A694007B614A00735942006349
      3900634931006349310063493100634931006349310063493100634931006349
      310000000000000000000000000000000000B5A694007B614A00735942006349
      3900634931006349310063493100634931006349310063493100634931006349
      31006349310063493100634931006349310000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000086000000380000B5A69400EFDFD600EFDFD600EFCF
      BD00EFCFBD00DEBEA500DEBEA500DEBEA5003961FF002951FF001841FF001838
      FF001038FF000020F7003951F70063493100B5A69400EFDFD600EFDFD600EFCF
      BD00EFCFBD00DEBEA500DEBEA500DEBEA500DEBEA500DEB69C00E7AE94006349
      310000000000000000000000000000000000B5A69400EFDFD600EFDFD600EFCF
      BD00EFCFBD00DEBEA500DEBEA500DEBEA500DEBEA500DEBEA500DEBEA500DEB6
      9C00DEB69C00E7AE9400E7AE94006349310000860000F7EFF70031A63100299E
      2900299629002996290029962900299629002996290021962100299629000086
      000000860000D6E7D6000079000000380000BDA69400FFF7EF00ADBED6000859
      CE001851AD000041940029499400ADA6A500FFE7D6004A69FF003959FF002951
      FF001841FF002949FF001838FF0063493100BDA69400FFF7EF00ADBED6000859
      CE001851AD000041940029499400ADA6A500FFE7D600F7D7C600DEB69C006349
      310000000000000000000000000000000000BDA69400FFF7EF00ADBED6000859
      CE001851AD000041940029499400ADA6A500FFE7D600F7DFCE00F7D7C600F7D7
      C600F7D7C600F7D7C600DEB69C006349310000860000F7EFF700008600000086
      0000008E0000008E0000008E0000008E00000086000094BE9400008600000086
      00009CA69C00F7EFF7000079000000380000BDAE9C00EFEFF7001851C60063A6
      F7004286DE000049A5001061D60000419400FFEFDE00DEBEA5004A69FF004269
      FF003959FF003151FF00DEB69C0063493100BDAE9C00EFEFF7001851C60063A6
      F7004286DE000049A5001061D60000419400FFEFDE00BD968400DEB69C006349
      310000000000CECFC6000000000000000000BDAE9C00EFEFF7001851C60063A6
      F7004286DE000049A5001061D60000419400FFEFDE00DEBEA500BD968400BD96
      8400BD968400BD968400DEB69C006349310000860000F7EFF700FFF7FF000086
      0000008E0000008E0000008E000000860000A5C7A50000860000008E0000088E
      0800F7EFF700F7EFF7000079000000380000BDAE9C00EFEFF7002969D60063A6
      F7001851AD002969D6000851B5001851AD00FFEFE7005271FF005271FF005271
      FF005271FF004261FF003961FF0063493100BDAE9C00EFEFF7002969D60063A6
      F7001851AD002969D6000851B5001851AD00FFEFE700F7DFC600DEBEA5006349
      3100000000009C492900CECFC60000000000BDAE9C00EFEFF7002969D60063A6
      F7001851AD002969D6000851B5001851AD00FFEFE700FFE7D600FFDFCE00F7DF
      CE00F7DFC600F7D7C600DEBEA5006349310000860000F7EFF700F7EFF700FFFF
      FF00088E08000086000000860000B5CFB5000086000000860000008600000086
      000042A64200F7EFF7000079000000380000C6B6A500FFFFF700DEDFDE002949
      94009C9E9400848E9C0029499400D6D7DE005271FF005271FF005271FF005271
      FF005271FF005271FF005271FF004A69FF00C6B6A500FFFFF700DEDFDE002949
      94009C9E9400848E9C0029499400D6D7DE00FFF7EF00BD968400AD593100AD59
      3100CE714200F78E5A00E7865A00CECFC600C6B6A500FFFFF700DEDFDE002949
      94009C9E9400848E9C0029499400D6D7DE00FFF7EF00EFD7CE00BD968400BD96
      8400BD968400BD968400DEBEA5006349310000860000F7EFF700F7EFF700F7EF
      F700F7EFF70000860000B5CFB50000860000008600007BAE7B00F7EFF700F7EF
      F700F7EFF700F7EFF7000079000000380000C6B6A500FFFFFF00636163002928
      2900B5B6B5007B797B00636163005271FF005271FF005271FF005271FF00FFEF
      E700FFEFDE00FFE7D6005271FF005271FF00C6B6A500FFFFFF00636163002928
      2900B5B6B5007B797B0063616300FFFFFF00FFFFF700FFEFDE00C6694200CE71
      4200DE794A00FF9E6B00FFB68C00E7966B00C6B6A500FFFFFF00636163002928
      2900B5B6B5007B797B0063616300FFFFFF00FFFFF700FFF7EF00FFEFE700FFEF
      E700FFEFDE00FFE7D600D6BEB5006349310000860000F7EFF700F7EFF700EFEF
      EF009CC79C00B5C7B50000860000008E0000008E000000860000BDBEBD00F7EF
      F700F7EFF700F7EFF7000079000000380000CEB6AD00FFFFFF004A494A004A49
      4A00E7E7E700C6C7C6007B7973005271FF005271FF005271FF00F7B68C00F7AE
      8400FFA67B00F79E7300D6C7B50063493100CEB6AD00FFFFFF004A494A004A49
      4A00E7E7E700C6C7C6007B797300DEDFDE00FFF7F700FFA67B00E79E7300E79E
      7300EFA67B00FFB68C00FFC7A500DED7C600CEB6AD00FFFFFF004A494A004A49
      4A00E7E7E700C6C7C6007B797300DEDFDE00FFF7F700F7C7A500F7B68C00F7AE
      8400FFA67B00F79E7300D6C7B5006349310000860000F7EFF700F7EFF700ADCF
      AD00B5CFB50000860000008600000086000000860000008E000000860000A5A6
      A500F7EFF700F7EFF7000079000000380000CEBEAD00FFFFFF006B696B007371
      730094969C0094969C007B797300E7DFDE00FFFFFF00FFFFF700FFFFF700FFFF
      F700FFF7EF00FFF7EF00CECFC60063493900CEBEAD00FFFFFF006B696B007371
      730094969C0094969C007B797300E7DFDE00FFFFFF00FFF7EF00CECFC6006349
      390000000000E79E7300DED7CE0000000000CEBEAD00FFFFFF006B696B007371
      730094969C0094969C007B797300E7DFDE00FFFFFF00FFFFF700FFFFF700FFFF
      F700FFF7EF00FFF7EF00CECFC6006349390000860000F7EFF700B5CFB500BDCF
      BD0000860000008600005AAE5A00F7EFF700299E290000860000008E00000086
      0000D6CFD600F7EFF7000079000000380000D6BEB500FFFFFF00E7E7E7007371
      73008486840073717300C6C7C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700CECFC60073594200D6BEB500FFFFFF00E7E7E7007371
      73008486840073717300C6C7C600FFFFFF00FFFFFF00FFFFF700CECFC6007359
      420000000000DED7CE000000000000000000D6BEB500FFFFFF00E7E7E7007371
      73008486840073717300C6C7C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700CECFC6007359420000860000F7EFF7004AAE4A0052AE
      520052B6520073BE7300F7EFF700F7EFF700FFF7FF0063B6630052AE52003996
      390039A63900F7EFF7000079000000380000D6C7B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007B614A00D6C7B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B61
      4A0000000000000000000000000000000000D6C7B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007B614A0000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000086000000380000D6C7B500D6C7B500D6BEB500CEBE
      AD00CEBEAD00CEB6AD00C6B6A500C6B6A500C6AEA500BDAE9C00BDA69400BDA6
      9400B5A69400B5A69400B5A69400B5A69400D6C7B500D6C7B500D6BEB500CEBE
      AD00CEBEAD00CEB6AD00C6B6A500C6B6A500C6AEA500B5A69400B5A69400B5A6
      940000000000000000000000000000000000D6C7B500D6C7B500D6BEB500CEBE
      AD00CEBEAD00CEB6AD00C6B6A500C6B6A500C6AEA500BDAE9C00BDA69400BDA6
      9400B5A69400B5A69400B5A69400B5A6940000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000860000003800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086000000860000008600000086
      000000860000008600000086000000860000008600000086000000860000008E
      0000008E000000860000008600004AAE4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9E9400525152004A494A004A49
      4A004A494A005A5952000000000052514A004A49420052515200949694000000
      00004A4942004A4942004A494A005A595A000000000000000000000000000000
      0000000000000000000000515200005152000051520000515200005152000051
      5200005152000051520000515200000000000000000000000000000000000000
      0000000000000000000094968C0094968C0094968C0094968C0094968C009496
      8C0094968C0094968C0094968C00000000000000000000000000000000000000
      0000000000000000000094968C0094968C0094968C0094968C0094968C009496
      8C0094968C0094968C0094968C0000000000949E8C00FFFFFF00FFFFFF00FFFF
      F700FFFFFF005A59520084867B00FFFFFF00FFFFF700BDBEB500424139008486
      7B00F7EFDE00EFE7D600FFF7EF00949684000000000000000000000000000000
      0000000000000051520000CFCE0000CFCE0000FFFF0000FFFF0000FFFF0000FF
      FF00009E9C00009E9C00009E9C00007173000000000000000000000000000000
      0000000000000000000094968C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70094968C00000000000000000000000000000000000000
      0000000000000000000094968C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70094968C000000000094968C00FFFFFF00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B000000000000000000000000000000
      00000051520000CFCE0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000CFCE00007173000000000000000000000000000000
      0000000000000000000094968C00FFFFFF00B5B6AD00B5B6AD00FFFFFF00B5B6
      AD00B5B6AD00FFFFFF0094968C00000000000000000000000000000000000000
      0000000000000000000094968C00FFFFFF00B5B6AD00B5B6AD00FFFFFF00B5B6
      AD00B5B6AD00FFFFFF0094968C000000000094968400FFFFFF00EFDFD600D6BE
      AD00C6B6A500C6B6A500CEBEAD00E7DFD600F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B000000000000000000000000000000
      00000051520000CFCE0000FFFF0000FFFF0073FFFF0000C7C60000C7C60073FF
      FF0000FFFF0000FFFF0000CFCE00007173000000000000000000000000000000
      0000000000000000000094968C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094968C00000000000000000000000000000000000000
      0000000000000000000094968C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094968C000000000094968C00FFFFFF00C6AE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D6BEB500F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B000000000000000000000000000000
      00000051520000CFCE0000FFFF0073FFFF0000C7C600FFFFFF000000000000C7
      C60000FFFF0000FFFF0000CFCE00007173000000000000000000000000000000
      0000000000000000000094968C00FFFFFF00B5B6AD00B5B6AD00FFFFFF00B5B6
      AD00B5B6AD00FFFFFF0094968C00000000000000000000000000000000000000
      0000000000000000000094968C00FFFFFF00B5B6AD00B5B6AD00FFFFFF00B5B6
      AD00B5B6AD00FFFFFF0094968C000000000094968C00FFF7F700C6AE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC7BD00F7EFE700C6B6A500C6B6A500C6B6
      A500C6B6A500C6B6A500F7EFE7008C8E7B000000000000000000000000000000
      00000051520000CFCE0000CFCE0000FFFF0000C7C600FFFFFF00000000000000
      000000C7C60000CFCE0000515200000000000000000000000000000000000000
      0000000000000000000094968C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094968C00000000000000000000000000000000000000
      0000000000000000000094968C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094968C000000000094968C00FFF7F700CEBEA500FFFF
      FF00D6F7FF00FFFFFF00FFFFFF00DEC7BD00F7EFE700D6C7B500D6C7BD00D6C7
      BD00D6C7BD00D6C7B500F7EFE7008C8E7B000000000000000000000000000000
      0000000000000051520000CFCE0000CFCE00006984001079C6001079C6000871
      AD00004939000051520000000000000000000000000000000000000000000000
      000000000000000000002169BD002169BD002169BD002169BD002169BD002169
      BD002169BD002169BD002169BD00000000000000000000000000000000000000
      0000000000000000000073966B0073966B0073966B0073966B0073966B007396
      6B0073966B0073966B0073966B000000000094968C00FFFFF700CEC7B500EFFF
      FF0052AEEF00EFFFFF00FFFFFF00D6C7BD00F7EFE700D6C7B500D6C7B500D6C7
      B500D6C7B500D6C7B500FFF7EF008C8E7B000000000000000000000000000000
      000000000000000000000051520000598400298EEF00319EFF00319EFF00319E
      FF001079C6000051520000000000000000000000000000000000000000000000
      000000000000000000002169BD001086F700218EF700319EF70042AEF7004AB6
      F7005ABEFF005ABEFF002169BD00000000000000000000000000000000000000
      0000000000000000000073966B0063D7290063D7290063D7290063D7290063D7
      290063D7290063D7290073966B000000000094968C008CC7EF007BBEEF008CC7
      D6003196D6008CC7D60073B6DE0084B6DE00F7EFE700C6B6A500C6B6A500C6B6
      A500C6B6A500C6B6A500FFF7EF008C8E7B0000000000000000007BAE73006396
      5A00528E4A0039863100000000001879C60039A6FF0042A6FF0042A6FF0039A6
      FF00319EFF000049730000000000000000000000000000000000737173007371
      730073717300000000002169BD002169BD002169BD002169BD002169BD002169
      BD002169BD002169BD002169BD00000000000000000000000000737173007371
      7300737173000000000073966B0073966B0073966B0073966B0073966B007396
      6B0073966B0073966B0073966B00000000009496840094CFF70018B6FF00299E
      DE0021D7F700299EDE0018B6FF008CBEE700FFFFFF00FFFFF700FFF7F700F7F7
      F700F7F7EF00F7EFE700FFFFF70094968C000000000052964A00FFF7FF00E7E7
      E700EFE7EF00F7E7F70039863100218ECE0042AEFF004AB6FF004AB6FF004AAE
      FF0042AEFF001879BD000000000000000000000000000000000073717300ADAE
      AD00737173000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073717300ADAE
      AD00737173000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008CA6AD009CD7EF00299EDE008CE7
      F700ADF7FF008CE7F700299EDE009CD7EF00A5C7C600B5B6AD00ADAEA500ADAE
      A500ADAEA500ADAEA500BDBEB5009C9E9400428E390000000000000000000071
      0000DEEFDE00F7F7F700EFE7EF00218ECE0052B6FF0052BEFF0052BEFF0052B6
      FF004AB6FF00218ECE000000000000000000737173007371730073717300ADAE
      AD00737173007371730073717300000000000000000000000000000000000000
      000000000000000000000000000000000000737173007371730073717300ADAE
      AD00737173007371730073717300000000000000000000000000000000000000
      0000000000000000000000000000000000004AA6DE00398ECE0021D7EF009CF7
      FF00EFFFFF009CF7FF0021D7EF00318ECE00429EE70000000000000000000000
      000000000000000000000000000000000000CEE7C600FFFFFF00000000000079
      000000790000DEEFDE00E7E7EF005A9E5200319ED6002996C60039A6DE004AB6
      FF0042AEF7002186B500000000000000000073717300ADAEAD00ADAEAD00ADAE
      AD00ADAEAD00ADAEAD0073717300000000000000000000000000000000000000
      00000000000000000000000000000000000073717300ADAEAD00ADAEAD00ADAE
      AD00ADAEAD00ADAEAD0073717300000000000000000000000000000000000000
      000000000000000000000000000000000000F7FFFF00BDE7F700319EDE007BDF
      F7008CF7FF007BDFF70039A6DE0094CFF700C6E7FF0000000000000000000000
      000000000000000000000000000000000000E7EFE700FFFFFF00000000000079
      000008790800EFF7EF00EFEFEF005A9E5200318EBD0052A6D60073B6DE005AA6
      C600398EB50008699C000000000000000000737173007371730073717300ADAE
      AD00737173007371730073717300000000000000000000000000000000000000
      000000000000000000000000000000000000737173007371730073717300ADAE
      AD00737173007371730073717300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084BEEF0021B6FF00399E
      DE0021CFEF00399EDE0021BEFF007BB6F7000000000000000000000000000000
      000000000000000000000000000000000000428E390000000000000000000871
      0800FFFFFF00FFFFFF00FFF7FF00398631002186B50084C7E70094CFEF008CC7
      E700298EBD0000496B000000000000000000000000000000000073717300ADAE
      AD00737173000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073717300ADAE
      AD00737173000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009CCFEF0094C7F700BDDF
      F7003996D600BDDFF70094C7F7009CCFEF000000000000000000000000000000
      000000000000000000000000000000000000000000003986310000000000FFFF
      FF00000000000000000052964A0000000000006194001871A5004296BD001871
      A50000517B000000000000000000000000000000000000000000737173007371
      7300737173000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737173007371
      7300737173000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000EFF7
      FF005AAEEF00EFF7FF000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000639E5A006BA6
      6300529652008CBE8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000738694006B86940052697B0039596B002949520018304200082031000820
      2900082029001020290008101800000000007B797B007B797B007B797B007B79
      7B007B797B007B797B007B797B007B797B007B797B007B797B007B797B007B79
      7B007B797B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B797B007B797B007B79
      7B007B797B007B797B007B797B007B797B007B797B007B797B007B797B007B79
      7B007B797B007B797B0000000000000000000000000000000000000000000000
      00007B8E94009CEFFF0073CFEF006BC7E7005AB6D6004AAEC6004296BD00318E
      AD0021799C0018799C00182831000000000084868400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7FF00F7FF
      FF00848684000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7EFEF00B5AEA500AD9E8C00A5967B00A58E
      7300A5967B00AD9E8C00B5A69C00DEDFD6000000000084868400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FFFF008486840000000000000000000000000000000000000000000000
      00007B969C00ADF7FF0094E7FF0084DFFF0073D7FF0063CFFF0052BEF70039B6
      F70029AEF7001886AD00213842000000000094969400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00949694000000000000000000000000000000000000000000F7F7F700E7E7
      E700E7E7E700E7E7E700EFEFEF00A5967B00B5967300F7D7BD00EFBE9400F7C7
      9400EFC79400DEB68C00BD9E7B00BDA68C000000000094969400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009496940000000000000000000000000000000000000000000000
      000084969C00B5F7FF009CEFFF008CE7FF007BDFFF006BD7FF005AC7F7004ABE
      F70039B6F700188EBD0031495A00000000009C9E9C00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C9E9C00000000000000000000000000DEDFDE0084968C00528E6B004A8E
      6B00428E6B005A8E730042795A00AD967300CEAE8400F7DFC600EFC79C00F7C7
      9C00F7CFA500E7C79C00CEA67B00B59E8C00000000009C9E9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9E9C000000000000000000B5A6940063493100634931006349
      31008C9EA500BDF7FF00ADEFFF009CEFFF008CE7FF007BDFFF006BD7FF005AC7
      F7004ABEF7001896C60039596B0000000000ADAEAD00F7F7F700F7F7F700BDAE
      AD00B5A6A500F7F7F700F7F7FF00AD9E9C009C9694009C969400FFFFFF00FFFF
      FF009CA6A500000000000000000000000000BDBEBD006BC79C0063C794005ABE
      8C0052B68400A5C7AD005AA67B00ADA67300E7B69400F7DFCE00FFDFBD00FFCF
      9C00FFD7AD00EFCFAD00CEA68400AD967B0000000000ADAEAD00F7F7F700F7F7
      F700BDAEAD00B5A6A500F7F7F700F7F7FF00AD9E9C009C9694009C969400FFFF
      FF00FFFFFF009CA6A5000000000000000000B5A69400F7F7EF00EFE7DE00EFDF
      D6008C9EAD00C6F7FF00B5EFFF00ADEFFF009CEFFF008CE7FF0073DFFF006BD7
      FF005ACFF700189ECE004A69840000000000ADAEAD00F7F7F700F7F7F700B5A6
      A500BDAEAD00F7F7FF00F7F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDBEBD00000000000000000000000000DEDFDE0073CFA5006BC7940063BE
      94006BC79400D6E7C60063B694008CAE7300FFD7A500DECFBD00D6CFC600E7BE
      9C00FFCFA500EFC79C00DEAE7B00C6B6A50000000000ADAEAD00F7F7F700F7F7
      F700B5A6A500BDAEAD00F7F7FF00F7F7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBEBD000000000000000000B5A69400FFF7F700F7F7EF00F7EF
      EF008CA6AD00C6F7FF00BDF7FF00BDF7FF00ADF7FF00A5EFFF0094E7FF0084DF
      FF0073D7FF0052C7FF005A798C0000000000B5B6B500F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00BDB68400AD9E7B00ADA6
      9400B5AEA500EFEFEF000000000000000000EFEFEF007BCFA50073CFA5006BC7
      940084C7AD00B5CFBD0063AE84004AAE7300ADA684007B798C0008417B004261
      8400CEAE8400DEB68C00C6B6A500F7F7F70000000000B5B6B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBEBD000000000000000000BDA69400FFFFFF00FFF7F700F7F7
      EF008CA6AD008CA6AD008CA6AD008C9EAD008C9EAD008CA6AD00849EA500849E
      A5008496A5008496A5007386940000000000B5B6B500F7F7F700F7F7F7007349
      52008C696B00FFFFFF00FFFFFF00AD9E9C00AD9E8C00C6BEA500EFE7D600E7DF
      CE00CEC7B500A59E8C00E7DFDE000000000000000000C6EFD60073CFA50063BE
      94006396B5005286A50039795A0063A68400738E94003159840021497B001849
      7B006B717B00E7D7C60000000000FFFFFF0000000000B5B6B500F7F7F700F7F7
      F700734952008C696B00FFFFFF00FFFFFF00AD9E9C00AD9E9C00AD9E9C00FFFF
      FF00FFFFFF00BDBEBD000000000000000000C6AE9C00FFFFFF00FFFFFF00FFF7
      F7008CA6AD00B5E7EF00B5EFFF0094E7F7008CA6AD008CA6AD00000000000000
      000000000000000000000000000000000000B5B6B500F7F7F700F7F7FF008C69
      6B0084596300FFFFFF00FFFFFF00A5968400BDB69400EFE7CE00F7EFD600FFF7
      E700EFEFDE00D6CFC600AD9E8C00EFEFEF000000000000000000D6EFE70063B6
      94004A79AD005A86AD0094AEAD00E7EFE7005A86AD0042699C00396194002951
      8400DEDFDE0000000000000000000000000000000000B5B6B500F7F7F700F7F7
      FF008C696B0084596300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBEBD000000000000000000C6B6A500FFFFFF00FFFFFF00FFFF
      FF00E7E7E7008CA6AD008CA6AD008CA6AD006B61520000000000000000000000
      00006B5142004A3831005238310000000000BDBEBD00F7F7FF00F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00BDAE8400B5AE9400E7E7CE00E7E7CE00D6CFBD009C8E
      7300EFEFDE00E7DFCE00CEC7BD00CEC7BD0000000000000000009CB6C6003169
      840073A6CE0084AEDE005A79A500A5B6C6006B96C6006396C600634931006349
      31006349310063493100634931000000000000000000BDBEBD00F7F7FF00F7FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBEBD000000000000000000CEBEAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7EF00DED7D600D6C7BD006349310000000000000000000000
      00007B5942005A4131004A38290000000000BDBEBD00F7FFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ADA68C00DED7C600F7EFDE00CEBEAD00948E73008471
      5A009486730094867300D6C7BD00ADA6940000000000FFFFFF005A96A5005A8E
      AD00A5CFFF0094C7F7006B96BD00BDCFDE008CB6DE00BDA69400F7E7DE00F7DF
      D600F7D7CE00EFD7BD00EFCFBD006349310000000000BDBEBD00F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBEBD000000000000000000D6BEAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B5A6940063493100634931006349310000000000000000000000
      00006B593100523831000000000000000000BDBEBD00FFFFFF00FFFFFF00BDAE
      AD00BDAEAD00BDAEAD00B5A69400E7D7CE00FFFFEF00F7EFDE00D6C7BD009486
      7300DED7C600D6CFBD00D6C7B500ADA6940000000000FFFFFF00639EB5008CBE
      DE00CEF7FF00ADD7FF008CAED60000000000A5D7FF00BDA69400F7EFE700F7E7
      DE0063493100EFD7C600EFD7BD006349310000000000BDBEBD00FFFFFF00FFFF
      FF00BDAEAD00BDAEAD00BDAEAD00BDAEAD00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700DEDFE700BDBEBD000000000000000000DEC7B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDA69400D6C7BD00634931006349310000000000000000006B49
      31006B493100523829000000000000000000BDBEBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CEC7BD00CEC7AD00EFEFDE00FFFFF700D6CFC6009486
      7300FFF7E700F7EFDE00C6BEAD00C6BEB50000000000FFFFFF008CBECE006BA6
      C600BDE7F700ADD7FF0084A6CE00000000008CA6BD00BDA69400FFF7EF006349
      31006349310063493100F7D7CE006349310000000000BDBEBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBEBD00BDBE
      BD00BDBEBD00BDBEBD000000000000000000DEC7B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6B6A500634931006349310000000000000000009C694A009C61
      4A008C614A00734939000000000000000000BDBEBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00ADA69400CEC7B500EFEFE700D6C7BD009486
      7300EFEFE700CEC7AD00AD9E8C00EFEFEF000000000000000000DEF7F70073BE
      D6005AA6B5005A96B5004271940000000000CECFC600C6AE9C00FFF7F700FFF7
      F70063493100F7E7DE00F7DFD6006349310000000000BDBEBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7C600F7F7
      F700BDBEBD00F7F7F7000000000000000000DEC7B500DEC7B500D6BEAD00D6BE
      AD00CEBEAD00CEB6A500B59E8C00000000000000000000000000000000000000
      000000000000000000000000000000000000C6C7C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEDFD600AD9E8C00CEC7B500CEC7BD009C8E
      7B00C6BEA500ADA68C00DEDFD600FFFFFF000000000000000000FFFFFF00DEFF
      FF00A5E7F70084CFDE007BBECE00BDDFE70000000000C6AE9C00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7E7DE006349310000000000C6C7C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECFCE00BDBE
      BD00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C7C600C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C600EFEFEF00CEC7BD00B5A69400AD9E
      8C00CEC7BD00EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6AE9C00C6AE
      9C00BDA69C00BDA69400BDA694000000000000000000C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600BDBEBD00FFFF
      FF0000000000000000000000000000000000000000009C968C007B6963007361
      5A0073615A00D6CFC60063493100634931006349310063493100634931006349
      310063493100D6CFC60000000000000000000000000000000000000000000000
      0000F7F7F700EFEFEF00DEDFDE00DEDFDE00D6D7D600D6D7D600D6D7D600DEDF
      DE00EFEFEF000000000000000000000000000000000000000000000000000000
      0000F7F7F700EFEFEF00DEDFDE00DEDFDE00D6D7D600D6D7D600D6D7D600DEDF
      DE00EFEFEF00000000000000000000000000000000000000000000000000FFFF
      FF00F7F7F700EFEFEF00DEDFDE00DEDFDE00D6D7D600D6D7D600D6D7D600DEDF
      DE00EFEFEF00000000000000000000000000AD796B00DEAE9C00D6AE9C00D6A6
      9C00D6A69400BDA69400F7E7DE00DEC7B500DEBEAD00DEBEAD00D6BEA500D6BE
      A500D6B6A5006349310000000000000000000000000000000000FFFFFF00E7E7
      E700C6C7C600A5A6A5008C8E8C008486840073717300737173007B797B008C8E
      8C00B5B6B500EFEFEF0000000000000000000000000000000000FFFFFF00E7E7
      E700C6C7C600A5A6A5008C8E8C008486840073717300737173007B797B008C8E
      8C00B5B6B500EFEFEF0000000000000000000000000000000000FFFFFF00E7E7
      E700C6C7C600A5A6A5008C8E8C008486840073717300737173007B797B008C8E
      8C00B5B6B500EFEFEF000000000000000000B5867300FFE7CE00FFE7CE00FFDF
      C600FFDFC600BDA69400FFEFE700F7E7DE00F7DFD60063493100F7D7CE00EFD7
      C600D6BEA5006349310000000000000000000000000000000000E7E7E7009C96
      8C006B5139006B4121006B4121008C5121008C51180084491000734118005A41
      29008C8E8C00DEDFDE0000000000000000000000000000000000E7E7E7009C96
      8C006B5139006B4121006B4121008C5121008C51180084491000734118005A41
      29008C8E8C00DEDFDE0000000000000000000000000000000000E7E7E7009C96
      8C006B5139006B4121006B4121008C5121008C51180084491000734118005A41
      29008C8E8C00DEDFDE000000000000000000BD8E7300FFE7CE00FFE7CE00FFE7
      CE00FFDFC600BDA69400FFF7EF00F7EFE700F7E7DE0063493100F7DFCE00F7D7
      CE00D6BEA50063493100000000000000000000000000000000009C7963009C59
      2100C68E52009C69390084492100C6966300CE966300BD793900B57131008449
      180084868400DEDFDE00000000000000000000000000000000009C7963009C59
      2100C68E52009C69390084492100C6966300CE966300BD793900B57131008449
      180084868400DEDFDE00000000000000000000000000000000009C7963009C59
      2100C68E52009C69390084492100C6966300CE966300BD793900B57131008449
      180084868400DEDFDE000000000000000000C68E7B00FFE7D600FFE7D600FFE7
      CE00FFE7CE00BDA69400FFF7F700634931006349310063493100634931006349
      3100DEBEAD0063493100000000000000000000000000000000008C511800C696
      5A00CE96630094613900EFCFCE009C693900CE9E6B00CE966300B57139007341
      1800ADAEAD00EFEFEF00000000000000000000000000000000008C511800C696
      5A00CE96630094613900EFCFCE009C693900CE9E6B00CE966300B57139007341
      1800ADAEAD00EFEFEF00000000000000000000000000000000008C511800C696
      5A00CE96630094613900EFCFCE009C693900CE9E6B00CE966300B57139007341
      1800ADAEAD00EFEFEF000000000000000000CE967B00FFEFDE00FFE7D600FFE7
      D600FFE7CE00BDAE9C00FFF7F700FFF7EF00FFEFE70063493100F7E7DE00F7DF
      D600DEBEAD00634931000000000000000000000000000000000094613900CE96
      6300DEAE84009C795A00FFFFFF00BDA68C00B58E5A00CE966300AD7142007B61
      4A00D6D7D600FFFFFF000000000000000000000000000000000094613900CE96
      6300DEAE84009C795A00FFFFFF00BDA68C00B58E5A00CE966300AD7142007B61
      4A00D6D7D600FFFFFF000000000000000000000000000000000094613900CE96
      6300DEAE84009C795A00FFFFFF00BDA68C00B58E5A00CE966300AD7142007B61
      4A00D6D7D600FFFFFF000000000000000000CE9E8400FFEFDE00FFEFDE00FFE7
      D600FFE7D600C6AE9C00FFFFFF00FFF7F700FFF7EF0063493100F7EFE700F7E7
      DE00DEC7AD006349310000000000000000000000000000000000AD967B00A571
      4200E7BE9C00AD796B00BDCFCE009CBEC60084693900A571420073492900C6C7
      C600F7F7F7000000000000000000000000000000000000000000AD967B00A571
      4200E7BE9C00AD796B00BDCFCE009CBEC60084693900A571420073492900C6C7
      C600F7F7F7000000000000000000000000000000000000000000AD967B00A571
      4200E7BE9C00AD796B00BDCFCE009CBEC60084693900A571420073492900C6C7
      C600F7F7F700000000000000000000000000D6A68400FFEFE700FFEFDE00FFEF
      DE00FFEFD600C6AE9C00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7EF00FFEF
      E700F7E7DE00634931000000000000000000000000000000000000000000C6AE
      9C0094714200006984001079C6001079C6000871AD005A4118006B696B00BDBE
      BD00F7F7F700000000000000000000000000000000000000000000000000C6AE
      9C0094714200006984001079C6001079C6000871AD005A4118006B696B00BDBE
      BD00F7F7F700000000000000000000000000000000000000000000000000C6AE
      9C0094714200006984001079C6001079C6000871AD005A4118006B696B00BDBE
      BD00F7F7F700000000000000000000000000DEAE8400FFF7E700FFEFE700FFEF
      DE00FFEFDE00EFEFE700C6AE9C00C6AE9C00BDAE9C00BDA69C00BDA69400BDA6
      9400BDA69400D6CFC60000000000000000000000000000000000000000000000
      00006B9EBD00298EEF00319EFF00319EFF00319EFF001079C6004A515A009C9E
      9C00E7E7E7000000000000000000000000000000000000000000000000000000
      00006B9EBD00298EEF00319EFF00319EFF00319EFF001079C6004A515A009C9E
      9C00E7E7E7000000000000000000000000000000000000000000000000000000
      00006B9EBD00298EEF00319EFF00319EFF00319EFF001079C6004A515A009C9E
      9C00E7E7E700000000000000000000000000DEAE8400FFF7EF00FFF7E700FFEF
      E700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7CE00FFE7CE00F7CF
      BD0073615A00BDB6B50000000000000000000000000000000000000000000000
      00002186C60039A6FF0042A6FF0042A6FF0039A6FF00319EFF00634931006349
      3100634931006349310063493100000000000000000000000000000000000000
      00002186C60039A6FF0042A6FF0042A6FF0039A6FF00319EFF00634939006349
      3100634931006349310063493100000000000000000000000000000000000000
      00002186C60039A6FF0042A6FF0042A6FF0039A6FF0073717300525152000000
      0000D6D7D600000000000000000000000000DEAE8400FFF7EF00FFF7EF00FFF7
      E700FFEFE700FFEFE700FFEFDE00FFEFDE00FFEFD600FFE7D600FFE7D600F7CF
      BD007B615A00C6BEB50000000000000000000000000000000000000000000000
      0000218ECE0042AEFF004AB6FF004AB6FF004AAEFF00B5A69400F7E7DE00F7DF
      D600F7D7CE00EFD7BD00EFCFBD006B4139000000000000000000000000000000
      0000218ECE0042AEFF004AB6FF004AB6FF004AAEFF00BDA69400F7E7DE00F7DF
      D600F7D7CE00EFD7BD00EFCFBD00634931000000000000000000000000000000
      0000218ECE0042AEFF004AB6FF004AB6FF004AAEFF00A59E9C00FFFFFF005296
      AD0008101000000000000000000000000000DEAE8400FFFFF700FFF7EF00FFF7
      EF00FFF7EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600F7CF
      BD008C797300CEC7C60000000000000000000000000000000000000000000000
      0000218ECE0052B6FF0052BEFF0052BEFF0052B6FF00BDA69400F7EFE700F7E7
      DE0063493100EFD7C600EFD7BD00634931000000000000000000000000000000
      0000218ECE0052B6FF0052BEFF0052BEFF0052B6FF00BDA69400F7EFE700F7E7
      DE00F7E7DE00EFD7C600EFD7BD00634931000000000000000000000000000000
      0000218ECE0052B6FF0052BEFF0052BEFF0052B6FF00A59E9C008CB6C60073CF
      E7004A9EB500081010000000000000000000DEAE8400FFFFF700FFFFF700FFF7
      F700FFF7EF00FFF7EF00FFF7E700FFEFE700FFD7CE00FFD7CE00F7B6AD00B58E
      7B00AD9E9400DEDFD60000000000000000000000000000000000000000000000
      00002186BD00319ED6002996C60039A6DE004AB6FF00BDA69400FFF7EF006349
      31006349310063493100F7D7CE00634931000000000000000000000000000000
      00002186BD00319ED6002996C60039A6DE004AB6FF00BDA69400FFF7EF006349
      31006349310063493100F7D7CE00634931000000000000000000000000000000
      00002186BD00319ED6002996C60039A6DE004AB6FF0042AEF7004A9EB5008CE7
      EF0063BED6004A9EB5001010180000000000DEAE8400FFFFFF00FFFFF700FFFF
      F700FFF7F700FFF7EF00FFF7EF00FFF7E700F7A64200F7A64200E79642009486
      7B00CEC7C600F7EFEF0000000000000000000000000000000000000000000000
      0000398EAD00318EBD0052A6D60073B6DE005AA6C600C6AE9C00FFF7F700FFF7
      F70063493100F7E7DE00F7DFD600634931000000000000000000000000000000
      0000398EAD00318EBD0052A6D60073B6DE005AA6C600C6AE9C00FFF7F700FFF7
      F700F7E7DE00F7E7DE00F7DFD600634931000000000000000000000000000000
      0000398EAD00318EBD0052A6D60073B6DE005AA6C600398EB5002169A50052A6
      B5008CE7EF006BC7DE007B86840031309400DEAE8400FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700FFF7EF00FFF7EF00DEAE8400EFB673008C716300BDAE
      AD00E7E7DE00FFFFF70000000000000000000000000000000000000000000000
      0000BDD7E7002186B50084C7E70094CFEF008CC7E700C6AE9C00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7E7DE00634931000000000000000000000000000000
      0000BDD7E7002186B50084C7E70094CFEF008CC7E700C6AE9C00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7E7DE00634931000000000000000000000000000000
      0000BDD7E7002186B50084C7E70094CFEF008CC7E700298EBD006396A500E7D7
      E7007BB6BD00CEBEAD007386D6005A69AD00DEAE8400DEAE8400DEAE8400DEAE
      8400DEAE8400DEAE8400DEAE8C00D6A68400DEAE8400FFF7EF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADCFDE005296BD004296BD00428EB5008CB6C600C6AE9C00C6AE
      9C00BDA69C00BDA69400BDA69400000000000000000000000000000000000000
      000000000000ADCFDE005296BD004296BD00428EB50094A6C600C6A6A500C6AE
      9C00BDA69C00BDA69400BDA69400000000000000000000000000000000000000
      000000000000ADCFDE005296BD004296BD00428EB5008CAEC600EFEFEF00FFFF
      FF00000000005A69AD00849EEF005A71D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C968C007B6963007361
      5A0073615A00D6CFC60063493100634931006349310063493100634931006349
      310063493100D6CFC6000000000000000000000000009C968C007B6963007361
      5A0073615A0073615A0073615A0073615A0073615A0073615A0073615A007B69
      63009C968C00000000000000000000000000B5A6940063493100634931006349
      3100634931006349310063493100634931006349310063493100634931000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD796B00DEAE9C00D6AE9C00D6A6
      9C00D6A69400BDA69400F7E7DE00F7DFCE00F7D7CE00EFD7C600EFD7BD00EFCF
      BD00EFCFB500634931000000000000000000AD796B00DEAE9C00D6AE9C00D6A6
      9C00D6A69400CEA69C00CE9E9400C69E9400C69E9400C6969400B5968C00BD8E
      8C007B696300C6BEBD000000000000000000B5A69400FFFFFF00B5A69400B5A6
      9400B5A69400B5A69400B5A69400B5A69400B5A69400B5A69400634931000000
      000000000000000000000000000000000000F7F7EF00E7DFDE0094796B008C71
      630084715A00E7DFDE007B6152007B614A0073594A00E7DFDE006B5142006B51
      390063493900E7DFDE000000000000000000B5867300FFE7CE00FFE7CE00FFDF
      C600FFDFC600BDA69400FFEFE700F7E7DE00F7DFD600F7DFCE00F7D7CE00EFD7
      C600EFCFBD00634931000000000000000000B5867300FFE7CE00FFE7CE00FFDF
      C600FFDFC600FFDFBD00FFDFBD00FFD7BD00FFD7B500FFD7B500FFD7AD00EFBE
      A50073615A00C6BEB5000000000000000000B5A69400FFFFFF00FFFFFF00FFFF
      FF00F7EFE700EFE7DE00E7DFD600E7D7C600E7CFC600B5A69400634931000000
      000000000000000000000000000000000000E7DFDE00AD9E8C00EFE7DE00F7E7
      E700EFDFD60084695A00B59E8C00DEBEAD00DEB6A50073594200AD8E7300D6A6
      9400CE9E840063493900E7DFDE0000000000BD8E7300FFE7CE00FFE7CE00FFE7
      CE00FFDFC600BDA69400FFF7EF00F7EFE700F7E7DE00F7DFD600F7DFCE00F7D7
      CE00EFD7BD00634931000000000000000000BD8E7300FFE7CE00FFE7CE00FFE7
      CE00FFDFC6000000000084868400ADB6B500FFD7B500FFD7B500FFD7AD00EFBE
      A50073615A00BDB6B5000000000000000000B5A69400FFFFFF00D6CFCE00BDB6
      AD00BDB6AD00BDB6AD00B5AEAD00BDB6B500C6BEBD00BDA69400634931000000
      000000000000000000000000000000000000B5A69400FFFFF700FFF7F700F7F7
      EF00F7EFE700F7E7DE007B6152007B614A0073594A00735942006B5142006B51
      390063493900634939006349310000000000C68E7B00FFE7D600FFE7D600FFE7
      CE00FFE7CE00BDA69400FFF7F700634931006349310063493100634931006349
      3100EFD7C600634931000000000000000000C68E7B00FFE7D600FFE7D600FFE7
      CE00FFE7CE008486840073716B005251520000000000FFD7B500FFD7AD00EFBE
      A50073615A00BDB6B5000000000000000000B5A69400FFFFFF00C6BEB500BDB6
      AD00BDB6AD00BDB6AD00BDB6AD00B5AEAD00B5AEAD00BDAE9C0073594A000000
      0000BDC7CE0021303900B5BEC60000000000B5A69400FFFFFF00FFFFF700FFF7
      F700F7EFEF00F7EFE700F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBEA500DEB6A5006349310000000000CE967B00FFEFDE00FFE7D600FFE7
      D600FFE7CE00BDAE9C00FFF7F700FFF7EF00FFEFE700F7EFE700F7E7DE00F7DF
      D600F7D7CE00634931000000000000000000CE967B00FFEFDE00FFE7D600FFE7
      D600FFE7CE00FFE7CE00A59E9C00FFFFFF005296AD0008101000FFD7B500EFBE
      A50073615A00BDB6B5000000000000000000BDA69400FFFFFF00CEC7BD00BDB6
      AD00BDB6AD00BDB6AD00BDB6AD00BDB6AD00B5AEA500C6B6A50084695A00BDC7
      CE00314963003971BD0029496300BDC7CE00B5A69400FFFFFF00B5796300B579
      6300EFDFD600B5796300F7EFE700F7E7DE00EFDFD600EFDFD600EFD7CE00E7CF
      C600E7C7BD00D6B6A5006349310000000000CE9E8400FFEFDE00FFEFDE00FFE7
      D600FFE7D600C6AE9C00FFFFFF00FFF7F700FFF7EF00FFEFE700F7EFE700F7E7
      DE00F7DFCE00634931000000000000000000CE9E8400FFEFDE00FFEFDE00FFE7
      D600FFE7CE00FFE7CE00A59E9C008CB6C60073CFE7004A9EB50008101000EFBE
      A50073615A00BDB6B5000000000000000000BDAE9C00FFFFFF00D6CFC600CEC7
      BD00C6BEB500C6BEB500BDB6AD00BDB6AD00B5AEA500BDAEA50073696B003149
      6B003179D600429EE70052B6EF004A617300BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700F7F7EF00F7EFE700F7E7DE00EFDFDE00EFDFD600EFD7
      CE00E7CFC600DEBEAD006349310000000000D6A68400FFEFE700FFEFDE00FFEF
      DE00FFEFD600C6AE9C00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7EF00FFEF
      E700F7E7DE00634931000000000000000000D6A68400FFEFE700FFEFDE00FFEF
      DE00FFE7D600FFE7D600FFE7CE004A9EB5008CE7EF0063BED6004A9EB5000810
      100073615A00BDB6B5000000000000000000C6AE9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D6CFC600949E94006B696B0063615A0052515A004271
      940042A6E70063C7FF00738EA500D6DFDE00BDA69C00FFFFFF00948E8C00EFDF
      D600948E8400EFDFD600948E8400948E8400F7EFE700F7E7DE0000860000EFDF
      D600EFD7CE00E7C7BD006349310000000000DEAE8400FFF7E700FFEFE700FFEF
      DE00FFEFDE00EFEFE700C6AE9C00C6AE9C00BDAE9C00BDA69C00BDA69400BDA6
      9400BDA69400D6CFC6000000000000000000DEAE8400FFF7E700FFEFE700FFEF
      DE00FFEFDE00FFEFDE00FFE7D600FFE7CE0052A6B5008CE7EF006BC7DE007B86
      840031309400BDB6B5000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7E7E70094968C00B5AE9C00D6C7B500CEAE9C007B716B005259
      52005A96AD00739EB500BDC7C60000000000C6AE9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7F700F7F7EF00F7EFE70000860000EFDF
      D600EFDFD600E7D7C6006349310000000000DEAE8400FFF7EF00FFF7E700FFEF
      E700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7CE00FFE7CE00F7CF
      BD0073615A00BDB6B5000000000000000000DEAE8400FFF7EF00FFF7E700FFEF
      E700FFEFDE00FFEFDE00FFEFD600FFE7D600FFE7CE007BB6BD00CEBEAD007386
      D6005A69AD00313094000000000000000000CEB6A500FFFFFF00BDA69400BDA6
      9400CEB6AD00B5B6AD00BDBEB500FFEFE700FFE7DE00F7DFC600F7CFB5007B71
      6B009C9E9C00BDC7C6000000000000000000C6AEA500FFFFFF00B5866300B586
      6300948E8C00C6B6A500948E8400948E8400FFF7F70000860000F7EFE7000086
      0000EFDFDE00EFDFD6006349310000000000DEAE8400FFF7EF00FFF7EF00FFF7
      E700FFEFE700FFEFE700FFEFDE00FFEFDE00FFEFD600FFE7D600FFE7D600F7CF
      BD007B615A00C6BEB5000000000000000000DEAE8400FFF7EF00FFF7EF00FFF7
      E700FFEFDE00FFEFDE00FFEFDE00FFEFD600FFE7D600FFE7CE005A69AD00849E
      EF005A71D6005A69AD000000000000000000D6BEAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C968C00EFEFE700FFF7F700FFEFEF00FFE7DE00F7DFCE00CEAE
      9C006B696B00000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF70000860000F7F7EF000086
      0000F7E7DE00EFE7DE006349310000000000DEAE8400FFFFF700FFF7EF00FFF7
      EF00FFF7EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600F7CF
      BD008C797300CEC7C6000000000000000000DEAE8400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFEFDE00FFEFD600FFE7D600FFE7D600FFE7D6005A69
      AD005A69AD005A69AD000000000000000000D6BEAD00FFFFFF00BDA69400BDA6
      9400C6AE9C00A59E9400EFEFE700FFFFFF00FFF7F700FFF7EF00FFE7DE00DEC7
      B50073716B00000000000000000000000000CEB6A500FFFFFF00FFFFFF0063A6
      630063A6630063A66300C6B6AD0063A663000086000063A66300FFF7F700F7F7
      EF0000860000EFE7DE006349310000000000DEAE8400FFFFF700FFFFF700FFF7
      F700FFF7EF00FFF7EF00FFF7E700FFEFE700FFD7CE00FFD7CE00F7B6AD00B58E
      7B00AD9E9400DEDFD6000000000000000000DEAE8400FFFFF700FFFFF700FFF7
      F700FFF7E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFE7D600F7CF
      BD008C797300CEC7C6000000000000000000DEC7B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C7BD00C6BEBD00FFFFFF00FFFFFF00FFF7F700FFEFE700AD9E
      9400ADAEA500000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000860000FFFFFF00FFFFF700FFF7
      F70000860000F7EFE7006349310000000000DEAE8400FFFFFF00FFFFF700FFFF
      F700FFF7F700FFF7EF00FFF7EF00FFF7E700F7A64200F7A64200E79642009486
      7B00CEC7C600F7EFEF000000000000000000DEAE8400FFFFFF00FFFFF700FFFF
      F700FFF7F700FFF7EF00FFF7EF00FFF7E700F7A64200F7A64200E79642009486
      7B00CEC7C600F7EFEF000000000000000000DEC7B500DEC7B500DEC7B500DECF
      BD00E7CFC600E7D7CE00ADAEA500C6C7BD00EFEFE700EFEFE700B5AEA5009496
      8C00F7F7F700000000000000000000000000CEB6A500CEB6A500CEB6A500CEB6
      A500CEB6A500C6B6A500C6B6A500C6AE9C00C6AE9C00BDAE9C00BDAE9C00BDA6
      9400BDA6940000860000B5A6940000000000DEAE8400FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700FFF7EF00FFF7EF00DEAE8400EFB673008C716300BDAE
      AD00E7E7DE00FFFFF7000000000000000000DEAE8400FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700FFF7EF00FFF7EF00DEAE8400EFB673008C716300BDAE
      AD00E7E7DE00FFFFF70000000000000000000000000000000000000000000000
      00000000000000000000F7FFFF00C6C7C600A59E94009C9E9400B5B6B500E7E7
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008600000000000000000000DEAE8400DEAE8400DEAE8400DEAE
      8400DEAE8400DEAE8400DEAE8C00D6A68400DEAE8400FFF7EF00000000000000
      000000000000000000000000000000000000DEAE8400DEAE8400DEAE8400DEAE
      8400DEAE8400DEAE8400DEAE8C00D6A68400DEAE8400FFF7EF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00CECF
      CE00CECFCE00F7F7F70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B6AD00BDBEBD00BDBEBD00BDBE
      BD00BDBEBD00BDBEBD00BDBEBD00BDBEBD00BDBEBD00BDBEBD00BDBEBD00BDBE
      BD00BDBEBD00BDBEBD00BDBEBD00ADAEAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0073615A007371
      73009C86A5007B797B00F7F7F700000000000000000000000000000000000000
      000000000000000000000000000000000000BDBEBD00FFFFFF00FFFFF700FFFF
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7E700FFF7E700FFF7E700BDBEBD0000000000CEC7C6004A494A002120
      210039383100B5B6B500FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848684008486
      8400848684008486840084868400848684008486840084868400848684008486
      84008486840000000000000000000000000000000000FFFFFF006B595A0052BE
      FF003971CE00A58EA5007B717300F7F7F7000000000000000000000000000000
      000000000000000000000000000000000000BDBEBD00FFFFFF008486E7007379
      DE006369D6005A59D6004A51CE00F7EFE700F7EFE700F7EFE700F7EFDE00EFE7
      DE00E7DFD600BD493100FFF7E700BDBEBD00BDBEBD0063616300E7CFBD00FFCF
      B500D6AE9C0039383900C6C7C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848684000000
      94000000940000009C0000009C000000A50000009C000000940000008C000000
      8C0084868400000000000000000000000000FFFFFF00E7E7E700BDBEBD005A59
      630052C7FF003971CE00A58EA5007B717300F7F7F70000000000000000000000
      000000000000000000000000000000000000BDBEBD00FFFFFF00FFF7F700F7F7
      F700F7F7EF00F7F7EF00F7EFEF00F7EFEF00F7EFE700F7EFE700F7EFE700D6CF
      C600C6513900CE615200FFEFDE00BDB6B50084797B00D6CFCE00FFF7EF00FFE7
      D600FFD7BD00C6A69400292829005A715A005269520042594A00425142003941
      3900313831002930290021282100182018000000000000000000848684000808
      9C009C9ED6006B69D6000000AD000000AD000000AD004A49BD00B5B6E7002120
      A50084868400000000000000000000000000AD380800CE411800E7513100F761
      4A0084515A0052C7FF003971CE00AD8EAD009C9E9C00DEDFDE00B5B6B500BDB6
      B500DEDFDE00FFFFFF000000000000000000BDBEBD00FFFFFF00F7A67B00EF9E
      7300F7A67B00EF9E7300E7966B00DE8E6B00D68E6300F7EFEF00F7EFE700D679
      6300CE615200CE615200CE615200CE614A009C9E9C00FFFFF700FFFFF7002120
      210021202100F7C7AD002120210063A66300529652004A864A0042794A004271
      4200396939003161390031613900182018000000000000000000848684002928
      A500DEDFD600FFFFFF006361D6000000B5004241C600E7E7EF00FFFFF7005A59
      B50084868400000000000000000000000000C6411000EF594200FF695A00FF79
      6300DE69420084797B0052C7FF006B86AD007B594A00A5716B00D6B69400E7CF
      B500A5867B0084797B00F7F7F70000000000BDBEBD00FFFFFF00FFFFFF00FFFF
      F700FFF7F700FFF7F700FFF7F700FFF7EF00F7F7EF00F7F7EF00F7EFEF00F7EF
      E700D6796B00CE615200FFF7EF00BDBEBD009C969400F7F7F700FFFFFF003938
      3900FFF7EF00C6BEAD005A5152006BAE6B0063AE6B0063A663005A965A00528E
      5A004A864A004A794A0039613900212821000000000000000000848684000000
      C6004A49A500E7E7DE00FFFFFF009C9EE700EFEFF700FFFFF7007371BD000000
      B50084868400000000000000000000000000AD411000FF695200FF866300FF96
      7300E7A67300FFD7A500B5594A009C797300EFB69400FFFFCE00FFFFD600FFFF
      DE00FFFFEF00E7CFC60073717300FFFFFF00BDC7BD00FFFFFF00637994006379
      9400637994006379940063799400637994006379940063799400F7F7EF00F7F7
      EF00F7E7DE00D6867300FFF7EF00BDBEBD00F7F7F70094969400F7F7F700F7EF
      EF00DED7D6005A595A007BAE840073B6730073B673006BB6730063AE6B00639E
      63005A965A004A86520039693900293029000000000000000000848684000000
      D6000000CE005251B500F7F7EF0000000000FFFFFF007371CE000000BD000000
      C60084868400000000000000000000000000DEDFDE00CE492100FF8E7300BD49
      1800FFC79400FFCF9400BD512900CE9E8C00FFFFCE00FFF7BD00FFFFDE00FFFF
      EF00FFFFFF00FFFFF700AD797300DEDFDE00C6C7BD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7F700FFF7F700FFF7EF00F7F7
      EF00F7F7EF00F7EFEF00FFF7EF00BDC7BD0000000000EFEFEF00949694008C8E
      8C007B797B00739E730094CF9C007BBE84007BBE7B0073BE7B006BB673006BAE
      6B0063A66300528E5A0042714200313831000000000000000000848684000808
      DE000000D6003938CE00EFEFEF0000000000FFFFFF005A59DE000000CE000000
      CE0084868400000000000000000000000000FFFFFF00B5B6B5005A2000000008
      6B000820840000086B0084381800F7D7B500FFE7AD00FFEFBD00FFFFD600FFFF
      EF00FFFFEF00FFFFDE00EFD7B500ADAEAD00C6C7BD00FFFFFF00CE868400C686
      8400C6797B00CE868400C6867B00C6797B00C6797300C6797300BD797300BD71
      6B00F7F7EF00F7F7EF00FFFFF700C6C7BD000000000000000000000000005A59
      5A00FFFFFF0073AE7B009CD7A50084C78C007BC784007BBE840073BE7B0073B6
      73006BAE6B005A9E630042794200394139000000000000000000848684000808
      F7004241DE00E7E7EF00FFFFF700BDBED600EFEFEF00FFFFFF006361E7000000
      D600848684000000000000000000000000004241420008080800000000001038
      A5001041AD001041A50021205A00F7DFBD00FFDFAD00FFEFB500FFFFCE00FFFF
      D600FFFFDE00FFFFD600EFD7AD00A5A6A500C6C7BD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      F700FFF7F700FFF7F700FFFFF700C6C7BD000000000000000000000000008C96
      8C007B797B006B9E7300A5D7AD008CCF940084CF8C0084C784007BC7840073BE
      7B0073B6730063A66B004A864A00425142000000000000000000848684003938
      EF00DEDFE700FFFFEF007371C6000000D6005251B500E7E7D600FFFFFF006361
      E70084868400000000000000000000000000101010001818180010388C001859
      BD001859C6001859C6001849A500DEB69C00FFFFEF00FFEFCE00FFE7B500FFEF
      BD00FFF7BD00FFFFCE00C6968400D6D7D600C6C7BD00FFFFFF005AAE73005AAE
      73005AAE73005AAE73005AAE73005AAE73005AAE73005AAE73005AAE73005AAE
      6B005AAE6B00FFF7F700FFFFFF00C6C7BD000000000000000000000000001820
      1800FFFFFF0073A67B00ADDFB500639663005A9663005A9E6300639E6B0063A6
      6B006BA66B006BAE73004A8E520042594A000000000000000000848684005251
      EF00B5B6C6007371CE000000EF000000EF000000EF005251B500ADAEB5004A49
      E70084868400000000000000000000000000212021002928290018519C002171
      DE002979E7002971DE002169D60063494A00FFF7EF00FFFFFF00FFE7BD00FFDF
      A500FFF7C600FFD7AD005A515200FFFFFF00C6C7C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C7C6000000000000000000000000008C96
      8C00848684007BAE8400B5DFBD005A8E5A007BB684008CBE8C0094C79C00A5CF
      A500A5D7AD0063A66B00529652004A6152000000000000000000848684005251
      FF006B69EF005251FF003938FF002120FF002928FF003938FF004241EF003130
      FF0084868400000000000000000000000000292829003938390000101800319E
      FF00319EFF00319EFF00298EF7006B7994007B615A00D6AE9C00F7E7B500FFDF
      B500EFBEA50063595A00EFEFEF0000000000B5B6B500C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7
      BD00C6C7BD00C6C7BD00C6C7BD00B5B6B5000000000000000000000000002120
      2100FFFFFF007BB68C00BDE7BD005A865A0073AE73007BAE7B0084BE8C008CC7
      94009CCF9C0063A66B005A9E5A00526952000000000000000000848684008486
      8400848684008486840084868400848684008486840084868400848684008486
      840084868400000000000000000000000000080808004A494A00525152001818
      1800082063001851D6001851A500CECFCE00F7F7F700D6D7D600B5B6B500B5B6
      B500DEDFDE00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A6
      A5008486840084BE9400BDE7C6005A8E630052865A005A865A005A8E5A005A96
      6300639E6300639E63005AA663005A695A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C7C600424142006B696B008C8E
      8C00BDBEBD006B696B0008080800F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002120
      2100FFFFFF008CC79C00C6E7C600C6E7C600BDE7C600B5DFBD00ADDFB500A5D7
      A5008CC794007BBE84007BBE84005A695A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00BDBEBD00181818007B79
      7B005A595A0008080800DEDFDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F7008C8E8C008CC79C008CBE940084BE940084BE8C0084B68C007BB684007BB6
      84007BAE7B0073AE730073A6730073A66B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C2808007B2810008428
      1800842818006320080039100000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C2808007B2810008428
      1800842818006320080039100000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C2808007B2810008428
      1800842818006320080039100000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5380800DE513100FF615200FF71
      5A00F7695200D6694200FF615200CE4929002930000010511000217921002986
      290021792100106910000030000000000000B5380800DE513100FF615200FF71
      5A00F7695200D6694200FF615200CE4929002930000010511000217921002986
      290021792100106910000030000000000000B5380800DE513100FF615200FF71
      5A00F7695200D6694200FF615200CE4929002930000010511000217921002986
      2900217921001069100000300000000000000000000000000000000000000000
      000000000000000000000000000000280000004100000861080008610800218E
      2100188E1800107910000861080000300000B5380800FF615200FF796300FF8E
      6B00DE865200F7CF9C00EF715200FF6952009486390052AE4A0063AE5A0063CF
      630052C7520039B639001079100000000000B5380800FF615200FF796300FF8E
      6B00DE865200F7CF9C00EF715200FF6952009486390052AE4A0063AE5A0063CF
      630052C7520039B639001079100000000000B5380800FF615200FF796300FF8E
      6B00DE865200F7CF9C00EF715200FF6952009486390052AE4A0063AE5A0063CF
      630052C7520039B6390010791000000000000000000000000000000000000000
      0000000000000000000000610000219E210052C75200399E39002186210063C7
      630063CF630039BE390031B6310010791000A5300000E7593900FF8E6B00E779
      5200FFC79400FFD7A500E7715200FF715A00949E520084C78400EFF7E70052AE
      520073D7730052C752001871180000000000A5300000E7593900FF8E6B00E779
      5200FFC79400FFD7A500E7715200FF715A00949E520084C78400EFF7E70052AE
      520073D7730052C752001871180000000000A5300000E7593900FF8E6B00E779
      5200FFC79400FFD7A500E7715200FF715A00949E520084C78400EFF7E70052AE
      520073D7730052C7520018711800000000000000000000000000000000000000
      00000000000000000000188E18005AC75A0063CF630039963900DEEFCE00429E
      39006BCF6B0063CF630039B63900086908000000000052180000A54942004220
      5A0042307B0063497300BD5939009479310084DF8400A5C79400FFF7EF00BDCF
      AD0063C7630042A6420000280000000000000000000052180000A54942004220
      5A0042307B0063497300BD5939009479310084DF8400A5C79400FFF7EF00BDCF
      AD0063C7630042A6420000280000000000000000000052180000A54942004220
      5A0042307B0063497300BD5939009479310084DF8400A5C79400FFF7EF00BDCF
      AD0063C7630042A6420000280000000000000000000000000000000000000000
      000000000000000000002186210063CF630084DF8400639E5A00FFFFFF008CBE
      8C005AB65A0063CF630042AE4200004900000000000000000000000008000828
      73001038A5001030940000085A000020000042964200428E8C001071BD002179
      BD0018715A000018000000000000000000000000000000000000000008000828
      73001038A5001030940000085A000020000042964200428E8C001071BD002179
      BD0018715A000018000000000000000000000000000000000000000008000828
      73001038A5001030940000085A000020000042964200428E8C001071BD002179
      BD0018715A000018000000000000000000000000000000000000CECFC6000000
      000000000000000000000061000042A642009CE79C0084AE6B00BDCFCE009CBE
      C6003986420042A642000059000000000000080808001818180010286B001849
      B5001851BD001849B500083094000008210000385A002996F700319EFF00319E
      FF002996EF00002842000000000000000000000000001818180010286B001849
      B5001851BD001849B500083094000008210000385A002996F700319EFF00319E
      FF002996EF00002842000000000000000000080808001818180010286B001849
      B5001851BD001849B500083094000008210000385A002996F700319EFF00319E
      FF002996EF0000284200000000000000000000000000CECFC6009C4929000000
      00000000000000000000000000000061000021792900006984001079C6001079
      C6000871AD000049390000000000000000001010100029282900184184002171
      DE002171DE002171DE001859BD00000829001871B50039A6FF0042A6FF0042A6
      FF0039A6FF001879BD0000000000000000001010100029282900184184002171
      DE002171DE002171DE001859BD00000829001871B50039A6FF0042A6FF0042A6
      FF0039A6FF001879BD0000000000000000001010100029282900184184002171
      DE002171DE002171DE001859BD00000829001871B50039A6FF0042A6FF0042A6
      FF0039A6FF001879BD000000000000000000CECFC600E7865A00F78E5A00DE79
      4A00CE714200AD593100AD5931000000000000598400298EEF00319EFF00319E
      FF00319EFF001079C6000010180000000000212021003130310021416B003196
      F700319EFF003196FF002171D600001031002986C6004AB6FF004AB6FF004AB6
      FF004AAEFF003196E7000008100000000000212021003130310021416B003196
      F700319EFF003196FF002171D600001031000000000084868400ADB6B5004AB6
      FF004AAEFF003196E7000008100000000000212021003130310021416B003196
      F700319EFF003196FF002171D600001031002986C6004AB6FF004AB6FF004AB6
      FF004AAEFF003196E7000008100000000000E7966B00FFB68C00FF9E6B00EF86
      5200DE794A00CE714200C6694200000000001879C60039A6FF0042A6FF0042A6
      FF0039A6FF00319EFF000049730000000000101010004A494A00424142003141
      6300184194002161C60010417B00001831003196CE004AB6FF00634931006349
      310063493100634931006349310000000000101010004A494A00424142003141
      6300184194002161C60010417B00001831008486840073716B00525152000000
      000052B6FF0042A6EF000020390000000000101010004A494A00424142003141
      6300184194002161C60010417B00001831003196CE004AB6FF00634931006349
      310063493100634931006349310000000000DED7C600FFC7A500FFB68C00FFAE
      7B00EFA67B00E79E7300E79E730000000000218ECE0042AEFF004AB6FF004AB6
      FF004AAEFF0042AEFF001879BD000000000000000000292829006B696B008C8E
      8C00A5A6A5004A494A00101821000000000008699C00BDA69400F7E7DE00F7DF
      D600F7D7CE00EFD7BD00EFCFBD006349310000000000292829006B696B008C8E
      8C00A5A6A5004A494A00101821000000000000619400A59E9C00FFFFFF005296
      AD00081010001871A500000000000000000000000000292829006B696B008C8E
      8C00A5A6A5004A494A00101821000000000008699C00BDA69400F7E7DE00F7DF
      D600F7D7CE00EFD7BD00EFCFBD006349310000000000DED7CE00E79E73000000
      000000000000000000000000000000000000218ECE0052B6FF0052BEFF0052BE
      FF0052B6FF004AB6FF00218ECE00000000000000000000000000292829005A59
      5A004A494A0021202100000000000000000000619400BDA69400F7EFE700F7E7
      DE00F7E7DE00EFD7C600EFD7BD00634931000000000000000000292829005A59
      5A004A494A0021202100000000000000000000619400A59E9C008CB6C60073CF
      E7004A9EB5000810100000000000000000000000000000000000292829005A59
      5A004A494A0021202100000000000000000000619400BDA69400F7EFE700F7E7
      DE0063493100EFD7C600EFD7BD00634931000000000000000000DED7CE000000
      0000000000000000000000000000000000002186BD00319ED6002996C60039A6
      DE004AB6FF0042AEF7002186B500000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA69400FFF7EF006349
      31006349310063493100F7D7CE00634931000000000000000000000000000000
      00000000000000000000000000000000000000000000006194004A9EB5008CE7
      EF0063BED6004A9EB50008101000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA69400FFF7EF006349
      31006349310063493100F7D7CE00634931000000000000000000000000000000
      00000000000000000000000000000000000000619400318EBD0052A6D60073B6
      DE005AA6C600398EB50008699C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AE9C00FFF7F700FFF7
      F700F7E7DE00F7E7DE00F7DFD600634931000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000052A6
      B5008CE7EF006BC7DE007B868400313094000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AE9C00FFF7F700FFF7
      F70063493100F7E7DE00F7DFD600634931000000000000000000000000000000
      000000000000000000000000000000000000006194002186B50084C7E70094CF
      EF008CC7E700298EBD0000496B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AE9C00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7E7DE00634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007BB6BD00CEBEAD007386D6005A69AD000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AE9C00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7E7DE00634931000000000000000000000000000000
      00000000000000000000000000000000000000000000006194001871A5004296
      BD001871A50000517B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6AE9C00C6AE
      9C00BDA69C00BDA69400BDA69400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A69AD00849EEF005A71D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6AE9C00C6AE
      9C00BDA69C00BDA69400BDA69400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000947173008C595A00845152007B494A007341
      4200734142006B38390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000280000004100000861080008610800218E
      2100188E18001079100008610800003000000000000000000000000000000000
      0000000000000000000000000000946163009C515200A5514A009C4142009438
      3100943031007B41420000000000000000000000000000000000000000000000
      000000000000000000000000000000280000004100000861080008610800218E
      2100188E18001079100008610800003000005279940052799400527994004A71
      8C004A718C004A698C0042698400426984004261840042617B0039617B003959
      7B0039597B003959730000000000000000000000000000000000000000000000
      0000000000000000000000610000219E210052C75200399E39002186210063C7
      630063CF630039BE390031B63100107910000000000000000000000000000028
      0000004100000861080008610800A5797B00D6867B00C6716B00BD615A00AD51
      4A009C38310084494A0000000000000000000000000000000000000000000000
      0000000000000000000000610000219E210052C75200399E39002186210063C7
      630063CF630039BE390031B63100107910005A869C00B5EFF70094D7DE0094CF
      DE008CCFDE008CCFDE0084CFDE007BC7DE007BC7D60073C7D60073C7D6006BBE
      D60063BED60039597B0000000000000000000000000000000000000000000000
      00000000000000000000188E18005AC75A0063CF630039963900DEEFCE00429E
      39006BCF6B0063CF630039B6390008690800000000000000000000610000219E
      210052C75200399E390021862100B5868400DE8E8C00D6867B00C6716B00BD61
      5A00A54942008C49520000000000000000000000000000000000000000000000
      00000000000000000000188E18005AC75A0063CF630039963900DEEFCE00429E
      39006BCF6B0063CF630039B6390008690800638EA500BDF7FF00B5EFF700B5EF
      F700ADEFF700A5EFF7009CE7F7009CE7F70094E7EF008CDFEF0084DFEF0084DF
      EF006BC7D6004261840000000000000000000000000000000000000000000000
      000000000000000000002186210063CF630084DF8400639E5A00FFFFFF008CBE
      8C005AB65A0063CF630042AE4200004900000000000000000000188E18005AC7
      5A0063CF630039963900DEEFCE00BD868400EF9E9C00DE8E8C00D6867B00C671
      6B00AD5152008C51520000000000000000000000000000000000000000000000
      000000000000000000002186210063CF630084DF8400639E5A00FFFFFF008CBE
      8C005AB65A0063CF630042AE4200004900006B96AD00C6F7FF00BDF7FF00BDF7
      FF00B5EFF700ADEFF70000000000848684008CAEB50094E7F70094E7EF008CDF
      EF0073C7D6004A69840000000000000000000000000000000000000000000000
      000000000000000000000061000042A642009CE79C0084AE6B00BDCFCE009CBE
      C6003986420042A64200005900000000000000000000000000002186210063CF
      630084DF8400639E5A00FFFFFF00CE969400F7AEAD00E79E9C00DE8E8C00D686
      7B00BD61630094595A0000000000000000000000000000000000000000000000
      000000000000000000000061000042A642009CE79C0084AE6B00BDCFCE009CBE
      C6003986420042A6420000590000000000006B9EB500CEFFFF00C6F7FF00C6F7
      FF00BDF7FF00BDF7F7008486840073716B0052515200000000008CCFDE0094E7
      EF0084C7DE004A718C0000000000000000000000000000000000000000000000
      00000000000000000000000000000061000021792900006984001079C6001079
      C6000871AD0000493900000000000000000000000000000000000061000042A6
      42009CE79C0084AE6B00BDCFCE00D69E9C00FFB6B500F7AEAD00E79E9C00DE8E
      8C00C6716B009C61630000000000000000000000000000000000000000000000
      00000000000000000000000000000061000021792900006984001079C6001079
      C6000871AD0000493900000000000000000073A6BD00D6FFFF00CEFFFF00CEFF
      FF00C6F7FF00C6F7FF00B5CFCE00A59E9C00FFFFFF005296AD00081010008CD7
      DE008CCFDE00527994000000000000000000000000000000000000000000D6BE
      B500DECFC60000000000000000000000000000598400298EEF00319EFF00319E
      FF00319EFF001079C60000101800000000000000000000000000000000000061
      000021792900006984001079C600CE969400DEAEAD00D6A6A500D6A6A500CE9E
      9C00C6969400EFEFEF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000598400298EEF00319EFF00319E
      FF00319EFF001079C60000101800000000007BAEBD00D6FFFF00D6FFFF00D6FF
      FF00CEFFFF00CEFFFF00C6F7FF00A59E9C008CB6C60073CFE7004A9EB5000810
      100073AEBD005A869C0000000000000000000000000094512900CEBEB500D6D7
      D600CEC7C6009C694A0000000000000000001879C60039A6FF0042A6FF0042A6
      FF0039A6FF00319EFF0000497300000000000000000000000000000000000000
      000000598400298EEF00319EFF00319EFF00319EFF001079C600001018000000
      00000000000000000000000000000000000000000000000000007BAE73006396
      5A00528E4A000000000000000000000000001879C60039A6FF0042A6FF0042A6
      FF0039A6FF00319EFF0000497300000000007BB6C600D6FFFF00D6FFFF00D6FF
      FF00D6FFFF00CEFFFF00CEFFFF00B5E7E7004A9EB5008CE7EF0063BED6004A9E
      B50008101000528694000000000000000000BD967B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7E7E700A58E7B0000000000218ECE0042AEFF004AB6FF004AB6
      FF004AAEFF0042AEFF001879BD00000000000000000000000000000000000000
      00001879C60039A6FF0042A6FF0042A6FF0039A6FF00319EFF00004973000000
      0000000000000000000000000000000000000000000052964A00FFF7FF00E7E7
      E700EFE7EF00F7E7F7003986310000000000218ECE0042AEFF004AB6FF004AB6
      FF004AAEFF0042AEFF001879BD00000000007BB6C600D6FFFF00D6FFFF00D6FF
      FF00D6FFFF00D6FFFF00D6FFFF00CEFFFF00B5E7E70052A6B5008CE7EF006BC7
      DE004A9EB50008101000D6DFE70000000000DEC7B500FFFFFF00AD795A00FFF7
      F7005A000000FFFFFF00DEE7E700AD795A00218ECE0052B6FF0052BEFF0052BE
      FF0052B6FF004AB6FF00218ECE00000000000000000000000000000000000000
      0000218ECE0042AEFF004AB6FF004AB6FF004AAEFF0042AEFF001879BD000000
      000000000000000000000000000000000000428E3900FFFFFF00FFFFFF000071
      0000DEEFDE00F7F7F700EFE7EF0000000000218ECE0052B6FF0052BEFF0052BE
      FF0052B6FF004AB6FF00218ECE00000000007BB6C6007BB6C6007BB6C6007BB6
      C6007BB6C6007BAEC6007BAEBD007BAEBD007BAEBD0073A6B5007BB6BD008CE7
      EF006BC7DE007B86840031309400BDC7DE00F7EFE700FFFFFF00BD8E6B00FFFF
      FF00A5380800FFFFFF00EFFFFF009C6142002186BD00319ED6002996C60039A6
      DE004AB6FF0042AEF7002186B500000000000000000000000000000000000000
      0000218ECE0052B6FF0052BEFF0052BEFF0052B6FF004AB6FF00218ECE000000
      000000000000000000000000000000000000CEE7C600FFFFFF00FFFFFF000079
      000000790000DEEFDE00E7E7EF005A9E52002186BD00319ED6002996C60039A6
      DE004AB6FF0042AEF7002186B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEE7EF007BB6
      BD00CEBEAD007386D6005A69AD0031309400DEC7AD00FFFFFF00C6967B00FFFF
      FF0094381000FFFFFF00EFF7FF00CEAE9C0000619400318EBD0052A6D60073B6
      DE005AA6C600398EB50008699C00000000000000000000000000000000000000
      00002186BD00319ED6002996C60039A6DE004AB6FF0042AEF7002186B5000000
      000000000000000000000000000000000000E7EFE700FFFFFF00FFFFFF000079
      000008790800EFF7EF00EFEFEF005A9E520000619400318EBD0052A6D60073B6
      DE005AA6C600398EB50008699C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEE7
      EF005A69AD00849EEF005A71D6005A69AD00DEAE9400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009459390000000000006194002186B50084C7E70094CF
      EF008CC7E700298EBD0000496B00000000000000000000000000000000000000
      000000619400318EBD0052A6D60073B6DE005AA6C600398EB50008699C000000
      000000000000000000000000000000000000428E3900FFFFFF00FFFFFF000871
      0800FFFFFF00FFFFFF00FFF7FF0000000000006194002186B50084C7E70094CF
      EF008CC7E700298EBD0000496B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6DFEF005A69AD005A69AD00E7E7F70000000000D6A68C00F7E7D600FFFF
      F700F7EFE700C69E8C00000000000000000000000000006194001871A5004296
      BD001871A50000517B0000000000000000000000000000000000000000000000
      0000006194002186B50084C7E70094CFEF008CC7E700298EBD0000496B000000
      00000000000000000000000000000000000000000000E7F7E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0052964A000000000000000000006194001871A5004296
      BD001871A50000517B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006194001871A5004296BD001871A50000517B00000000000000
      0000000000000000000000000000000000000000000000000000639E5A006BA6
      6300529652008CBE8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100010101000101010001010100010101000101010001010
      1000101010001010100084868400000000000000000000000000000000000000
      000000000000000000000000000000280000004100000861080008610800218E
      2100188E18001079100008610800003000000000000000000000000000000000
      0000000000001010100010101000101010001010100010101000101010001010
      1000101010001010100084868400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000028
      00000041000010101000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084868400000000000000000000000000000000000000
      0000000000000000000000610000219E210052C75200399E39002186210063C7
      630063CF630039BE390031B63100107910000000000000000000000000000028
      00000041000010101000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008486840000000000F7F7EF00E7DFDE0094796B008C71
      630084715A00E7DFDE007B6152007B614A0073594A00E7DFDE006B5142006B51
      390063493900E7DFDE000000000000000000000000000000000000610000219E
      210052C7520010101000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084868400000000000000000000000000000000000000
      00000000000000000000188E18005AC75A0063CF630039963900DEEFCE00429E
      39006BCF6B0063CF630039B6390008690800000000000000000000610000219E
      210052C7520010101000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008486840000000000E7DFDE00AD9E8C00EFE7DE00F7E7
      E700EFDFD60084695A00B59E8C00DEBEAD00DEB6A50073594200AD8E7300D6A6
      9400CE9E840063493900E7DFDE00000000000000000000000000188E18005AC7
      5A0063CF63001010100084868400848684008486840084868400848684008486
      8400848684008486840084868400000000000000000000000000000000000000
      000000000000000000002186210063CF630084DF8400639E5A00FFFFFF008CBE
      8C005AB65A0063CF630042AE4200004900000000000000000000188E18005AC7
      5A0063CF63001010100084868400848684008486840084868400848684008486
      840084868400848684008486840000000000B5A69400FFFFF700FFF7F700F7F7
      EF00F7EFE700F7E7DE007B6152007B614A0073594A00735942006B5142006B51
      39006349390063493900634931000000000000000000000000002186210063CF
      630084DF8400639E5A00FFFFFF008CBE8C005AB65A0063CF630042AE42000049
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000061000042A642009CE79C0084AE6B00BDCFCE009CBE
      C6003986420042A64200005900000000000000000000000000002186210063CF
      630084DF8400639E5A00FFFFFF008CBE8C005AB65A0063CF630042AE42000049
      000000000000000000000000000000000000B5A69400FFFFFF00FFFFF700FFF7
      F700F7EFEF00F7EFE700F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBEA500DEB6A500634931000000000000000000000000000061000042A6
      42009CE79C0084AE6B00BDCFCE009CBEC6003986420042A64200005900000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000061000021792900006984001079C6001079
      C6000871AD0000493900000000000000000000000000000000000061000042A6
      42009CE79C0084AE6B00BDCFCE009CBEC6003986420042A64200005900000000
      000000000000000000000000000000000000B5A69400FFFFFF00B5796300B579
      6300EFDFD600B5796300F7EFE700F7E7DE00EFDFD600EFDFD600EFD7CE00E7CF
      C600E7C7BD00D6B6A50063493100000000000000000000000000000000000061
      000021792900006984001079C6001079C6000871AD0000493900000000000000
      0000000000000000000000000000000000000000000000000000ADAECE008486
      B5007371AD0000000000000000000000000000598400298EEF00319EFF00319E
      FF00319EFF001079C60000101800000000000000000000000000000000000061
      000021792900006984001079C6001079C6000871AD0000493900000000000000
      000000000000000000000000000000000000BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700F7F7EF00F7EFE700F7E7DE00EFDFDE00EFDFD600EFD7
      CE00E7CFC600DEBEAD0063493100000000000000000000000000000000000000
      000000598400298EEF00319EFF00319EFF00319EFF001079C600001018000000
      0000000000000000000000000000000000000000000042388400FFFFF700F7F7
      EF00EFEFE700BDBEC600BDBED600000000001879C60039A6FF0042A6FF0042A6
      FF0039A6FF00319EFF0000497300000000000000000000000000000000000000
      000000598400298EEF00319EFF00319EFF00319EFF001079C600001018000000
      000000000000000000000000000000000000BDA69C00FFFFFF00948E8C00EFDF
      D600948E8400EFDFD600948E8400948E8400F7EFE700F7E7DE00EFDFDE00EFDF
      D600EFD7CE00E7C7BD0063493100000000000000000000000000000000000000
      00001879C60039A6FF0042A6FF0042A6FF0039A6FF00319EFF00004973000000
      0000000000000000000000000000000000007371AD00FFFFFF00E7E7F700EFE7
      FF00E7E7F700E7E7E700A5A6BD0000000000218ECE0042AEFF004AB6FF004AB6
      FF004AAEFF0042AEFF001879BD00000000000000000000000000000000000000
      00001879C60039A6FF0042A6FF0042A6FF0039A6FF00319EFF00004973000000
      000000000000000000000000000000000000C6AE9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7F700F7F7EF00F7EFE700F7E7DE00EFDF
      D600EFDFD600E7D7C60063493100000000000000000000000000000000000000
      0000218ECE0042AEFF004AB6FF004AB6FF004AAEFF0042AEFF001879BD000000
      0000000000000000000000000000000000009C9ECE00FFFFFF003938BD006B61
      DE005251D600F7F7FF00EFEFE7008486B500218ECE0052B6FF0052BEFF0052BE
      FF0052B6FF004AB6FF00218ECE00000000000000000000000000000000000000
      0000218ECE0042AEFF004AB6FF004AB6FF004AAEFF0042AEFF001879BD000000
      000000000000000000000000000000000000C6AEA500FFFFFF00B5866300B586
      6300948E8C00C6B6A500948E8400948E8400FFF7F700F7EFEF00F7EFE700F7E7
      DE00EFDFDE00EFDFD60063493100000000000000000000000000000000000000
      0000218ECE0052B6FF0052BEFF0052BEFF0052B6FF004AB6FF00218ECE000000
      0000000000000000000000000000000000008C8EBD00FFFFFF005249C6007B79
      E7006B61DE00F7F7FF00F7F7EF007B79AD002186BD00319ED6002996C60039A6
      DE004AB6FF0042AEF7002186B500000000000000000000000000000000000000
      0000218ECE0052B6FF0052BEFF0052BEFF0052B6FF004AB6FF00218ECE000000
      000000000000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700F7F7EF00F7EF
      E700F7E7DE00EFE7DE0063493100000000000000000000000000000000000000
      00002186BD00319ED6002996C60039A6DE004AB6FF0042AEF7002186B5000000
      0000000000000000000000000000000000008C86C600FFFFFF002120AD004A49
      C6003930B500F7F7FF00F7F7EF000000000000619400318EBD0052A6D60073B6
      DE005AA6C600398EB50008699C00000000000000000000000000000000000000
      00002186BD00319ED6002996C60039A6DE004AB6FF0042AEF7002186B5000000
      000000000000000000000000000000000000CEB6A500FFFFFF00FFFFFF0063A6
      630063A6630063A66300C6B6AD0063A6630063A6630063A66300FFF7F700F7F7
      EF00F7EFE700EFE7DE0063493100000000000000000000000000000000000000
      000000619400318EBD0052A6D60073B6DE005AA6C600398EB50008699C000000
      00000000000000000000000000000000000000000000BDBEDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0042388C0000000000006194002186B50084C7E70094CF
      EF008CC7E700298EBD0000496B00000000000000000000000000000000000000
      000000619400318EBD0052A6D60073B6DE005AA6C600398EB50008699C000000
      000000000000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      F700F7F7EF00F7EFE70063493100000000000000000000000000000000000000
      0000006194002186B50084C7E70094CFEF008CC7E700298EBD0000496B000000
      00000000000000000000000000000000000000000000000000007B79BD007B79
      B5008479BD00B5B6D600000000000000000000000000006194001871A5004296
      BD001871A50000517B0000000000000000000000000000000000000000000000
      0000006194002186B50084C7E70094CFEF008CC7E700298EBD0000496B000000
      000000000000000000000000000000000000CEB6A500CEB6A500CEB6A500CEB6
      A500CEB6A500C6B6A500C6B6A500C6AE9C00C6AE9C00BDAE9C00BDAE9C00BDA6
      9400BDA69400BDA69400B5A69400000000000000000000000000000000000000
      000000000000006194001871A5004296BD001871A50000517B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006194001871A5004296BD001871A50000517B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5A694006341310063493100634931006349
      31006349310063493100634931006B4939000000000000000000000000000000
      0000000000000000000000000000B5A694006341310063493100634931006349
      31006349310063493100634931006B4939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDAE9C00FFFFFF00EFEFEF00EFE7E700EFDF
      D600E7D7CE00E7D7C600D6C7B5006B5139000000000000000000000000000000
      0000000000000000000000000000BDAE9C00FFFFFF00EFEFEF00EFE7E700EFDF
      D600E7D7CE00E7D7C600D6C7B5006B513900C6797B00B5595A00A5595A008C49
      4A007B38390063696B0052697B0042596B005A51420000000000000000000000
      000029304200000000000000000000000000B5A6940063413100634931006349
      3100634931006349310063493100634931006349310063493100634931006B49
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6B6A500FFFFFF00DECFC600DECFBD00FFFF
      F700D6BEAD00D6BEAD00DED7C6006B5139000000000000000000000000000000
      0000000000000000000000000000C6B6A500FFFFFF00DECFC600DECFBD00FFFF
      F700D6BEAD00D6BEAD00DED7C6006B513900CE696B00C6797B00BD7173009C49
      4A008C494A007BAEBD005A9EB5005A868C005A868C0042596B00000000002930
      42005A9EB50042596B000000000000000000BDAE9C00FFFFFF00E7E7E700E7E7
      DE00E7DFD600E7D7CE00E7CFC600E7CFBD00E7C7B500E7C7AD00C6AE9C006B49
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00E7D7CE006B5139000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00E7D7CE006B513900CE717300AD61630094595A009C49
      4A008C494A007BAEBD0073869400736152007B3839005A514A004251630039BE
      EF0094CFDE006B8E9C000000000000000000C6B6A500FFFFFF00DEC7BD00D6C7
      B500D6BEAD00FFEFE700CEB6A500CEAE9C00CEAE9C00F7DFCE00C6AE9C006B49
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00DECFC600DECFC600FFFF
      FF00DEC7BD00DEC7BD00E7DFD6006B5139000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00DECFC600DECFC600FFFF
      FF00DEC7BD00DEC7BD00E7DFD6006B513900BD717300C6797B00BD717300A559
      5A008C494A007386940094796B00D6BE9C00D6BE9C00A5696B005A514A0094CF
      DE00ADF7FF00000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF0073716B005251520000000000D6C7B500CEB6A5006B49
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700F7EFDE006B5139000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700F7EFDE006B513900D6797B00E7969400DE868400AD59
      5A00A5696B00BDAE9400EFE7BD00EFE7BD00EFE7BD00E7D7A500D6BE9C005A51
      4A0000000000000000000000000000000000CEB6A500FFFFFF00DECFC600DECF
      BD00DEC7BD00FFFFF700A59E9C00FFFFFF005296AD0008101000BDB6AD007B61
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFAE8C00EFAE8C00EFAE8C00EFA67B00E78E
      6300E7865200E7794200E7713900CE6131000000000000000000000000000000
      0000000000000000000000000000EFAE8C00EFAE8C00EFAE8C00EFA67B00E78E
      6300E7865200E7794200E7713900CE613100DE8E8C00E79E9C00DE8E8C00BD69
      6B00BD717300DECFB500F7E7CE00F7EFEF00F7E7CE00E7D7AD00E7D7A5005A51
      420000000000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A59E9C008CB6C60073CFE7004A9EB500081010007B71
      6300E7D7CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFAE8C00FFC7A500FFBE9C00FFBE9C00FFB6
      8C00FFAE8400FFA67B00F7966B00D66939000000000000000000000000000000
      0000000000000000000000000000EFAE8C00FFC7A500FFBE9C00FFBE9C00FFB6
      8C00FFAE8400FFA67B00F7966B00D6693900E79E9C00F7AEAD00EFA6A500C679
      7B00CE868400E7D7CE00FFFFE700FFFFF700FFFFF700EFE7BD00E7D7AD005A51
      420000000000000000000000000000000000CEB6A500FFFFFF00DECFC600DECF
      C600DECFC600FFFFFF00C6BEB5004A9EB5008CE7EF0063BED6004A9EB5000810
      100029617300000000000000000000000000000000000000000010718C001059
      6B0010495A001041520000000000EFAE8C00EFAE8C00EFAE8C00EFAE8C00EF9E
      7300E7966B00E78E6300E7714200E77139000000000000000000000000000000
      0000000000000000000000000000EFAE8C00EFAE8C00EFAE8C00EFAE8C00EF9E
      7300E7966B00E78E6300E7714200E7713900EFA6A500F7B6B500EFA6AD00CE86
      8400C6797B00B5AE9C00F7EFEF00FFFFF700F7EFEF00EFE7BD00E7D7AD006361
      630000000000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700D6CFCE0052A6B5008CE7EF0063BED6004A9E
      B500081010002961730000000000000000000000000000000000218E9C004AD7
      EF0021BED6000820290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E79E9C00DE8E8C00CE868400CE86
      8400CE696B0094A6A5008C867300E7D7CE00F7E7CE00B5A67B00847163005269
      7B0000000000000000000000000000000000EFAE8C00EFAE8C00EFAE8C00EFA6
      7B00EF9E7300E78E6300E7865A00E7966300CEAE940063A6B5008CE7EF0063BE
      D6004A9EB500081010002951630000000000109EC600189EB5001896AD0063E7
      F70039D7EF00085163000830390008384A000000000000000000000000000000
      000000000000000000000000000000000000109EC600189EB500189EB500189E
      B500189EB500085163000830390008384A000000000000000000000000000000
      000000000000000000000000000000000000E7969400FFBEBD00F7B6B500CE86
      8400BD717300ADF7FF009CB6BD00847163006B615A00738E8C00639EAD004A61
      730000000000000000000000000000000000EFAE8C00FFC7A500FFBE9C00FFBE
      9C00FFB69400FFB68C00FFAE8400FFA67B00F7A68400D6B69C0073AEBD008CE7
      EF006BC7DE007B868400313094002938840039AED600A5F7FF008CEFFF0084F7
      FF0063EFFF0042DFF70031BED600104152000000000000000000000000000000
      00000000000000000000000000000000000039AED600A5F7FF008CEFFF0084F7
      FF0063EFFF0042DFF70031BED600104152000000000000000000000000000000
      000000000000000000000000000000000000E79E9C00C6797B00BD717300C679
      7B00C6797B006B8E9C005A7184007396A5008CC7D60063AECE0052AEC6004A59
      6B0000000000000000000000000000000000EFAE8C00EFAE8C00EFAE8C00EFAE
      8C00EFA68400EF9E7300E7966B00E78E6300E7865200E78E5A00CE9E7B007BB6
      BD00CEBEAD007386D6005A69AD00313094005AB6D600D6FFFF00CEFFFF00ADF7
      FF007BF7FF005AE7F70042D7EF0018697B000000000000000000000000000000
      0000000000000000000000000000000000005AB6D600D6FFFF00CEFFFF00ADF7
      FF007BF7FF005AE7F70042D7EF0018697B000000000000000000000000000000
      000000000000000000000000000000000000CE868400DECFB500F7EFEF00CE96
      9400BD7173005A718400E7E7DE00F7EFEF0094B6BD008CC7D6005AC7E7004A61
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFAE8C007B9E
      AD005A69AD00738EDE005A71D6005A69AD0052BEDE006BC7DE0042C7CE00C6FF
      FF0084EFFF0029A6B5001086940010718C000000000000000000000000000000
      00000000000000000000000000000000000052BEDE006BC7DE0042C7CE0042C7
      CE0042C7CE0029A6B5001086940010718C000000000000000000000000000000
      00000000000000000000000000000000000000000000D6A69C00AD616300E7E7
      DE00F7EFEF00C6797B009CB6BD00E7E7DE00FFFFF7009C9684005A868C005269
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B79C6005A69AD005A69AD006379BD00000000000000000063BEDE00CEFF
      FF00ADF7FF0029AEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE969400DECF
      AD00E7D7CE00E7D7CE00C6797B0052697B00E7E7DE00F7EFEF00ADA694005269
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063BEE7005ABE
      DE0039AED60021A6CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6B6B500B5797B008C51520084494A00844142009C595A00B58E8C00D6B6
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9E94005251
      52004A494A00313029005A5952000000000052514A004A494200525152009496
      940000000000292821004A494A005A595A00BDA6940063493100634931006349
      3100634931006349310063493100634931006349310063493100634931006349
      3100000000000000000000000000000000000000000000000000E7D7D600B571
      7300A5616300AD616300BD696B00C6717300C6716B00AD615A0094494A007B41
      42008C515200D6C7C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949E8C00FFFF
      FF00FFFFFF00FFFFFF005A59520084867B00FFFFFF00FFFFF700BDBEB5004241
      390084867B00EFE7D600FFF7EF0094968400BDA69400FFFFEF00FFF7E700F7EF
      DE00F7DFCE00EFD7BD00EFCFB500E7BEA500E7B69C00DEAE9400DEA68C006349
      31000000000000000000000000000000000000000000EFD7D600B5717300B571
      7300CE8E8C00CEB6AD00E7CFC600C6717300DEAEA500E7C7B500C6A69400B571
      6B008C494A0084414A00D6C7C6000000000000000000B5B6B5006B696B009C9E
      9C0000000000000000000000000000000000000000000000000000000000E7E7
      E700A5A6A500949694000000000000000000000000000000000094968C00FFFF
      FF00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B00BDA69C00FFFFF700BDA69C00B5A6
      9C00F7EFDE00B59E9400B59E8C00B59E8C00B59E8C00B59E8C00DEAE94006349
      31000000000000000000000000000000000000000000C6868400C6797B00CEA6
      9C00E7D7CE00F7E7D600F7DFD600F7DFCE00F7D7CE00F7D7C600F7CFC600DEBE
      AD00BD867B008C494A008C515200000000009479EF002900DE003928A5006361
      6300CECFCE000000000000000000000000000000000000000000D6D7D6006351
      B5002900DE00A5A6A5000000000000000000000000000000000094968400FFFF
      FF00EFDFD600C6B6A500C6B6A500CEBEAD00E7DFD600F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B00BDAE9C00FFFFF700FFFFF700FFFF
      EF00FFF7E700F7EFDE00F7DFCE00EFD7C600EFCFB500E7BEA500E7B69C006349
      310000000000000000000000000000000000EFCFCE00BD797B00D69E9C00E7DF
      D600F7E7DE00F7E7DE00F7E7D600F7DFD600F7DFCE00F7D7CE00F7D7C600F7CF
      BD00DEBEAD00B5716B007B414200C6A6A500BDAEF7002900DE003108DE005249
      6B007B797B00DEDFDE00000000000000000000000000CEC7D6004228C6002900
      DE007B69CE00000000000000000000000000000000000000000094968C00FFFF
      FF00C6AE9C00FFFFFF00FFFFFF00FFFFFF00D6BEB500F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B00C6AE9C00FFFFF700B5A69C00B5A6
      9C00FFFFEF00B59E9400B59E8C00B59E8C00B59E8C00B59E8C00E7BEA5006349
      310000000000000000000000000000000000DE9E9C00CE8E8C00D6C7BD00FFEF
      E700FFEFE700F7E7DE00F7E7DE00F7E7D600F7DFD600F7DFCE00F7D7CE00F7D7
      C600F7D7BD00CEA6940094494A009C696B00000000008471EF002900DE003918
      D6005A595A0094969400E7E7E70000000000CEC7D6003918CE002900DE00A59E
      C600000000000000000000000000000000009C9E9400525152007B867300FFF7
      F700AD9E8400FFFFFF00FFFFFF00FFFFFF00DEC7BD00F7EFE700C6B6A500C6B6
      A500C6B6A500C6B6A500F7EFE7008C8E7B00C6AE9C00FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFEF00FFF7E700F7EFDE00F7DFCE00EFD7C600EFCFB5006349
      310000000000000000000000000000000000CE868400DE9E9C00F7EFE700FFF7
      EF00FFEFE700FFEFE700F7E7DE00F7E7DE00F7E7D600F7DFD600F7DFCE00F7D7
      C600F7D7C600E7C7B500AD595A007B41420000000000000000007B61EF002900
      DE005238C6006361630094969400B5B6C6003918CE002900DE00A59EC6000000
      000000000000000000000000000000000000949E8C00FFFFFF00848E7B00FFFF
      F700C6B6A500FFFFFF00FFFFFF00FFFFFF00D6C7BD00F7EFE700D6C7B500D6C7
      B500D6C7B500D6C7B500FFF7EF0084867300C6B6A500FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFEF00C6C7C60042597300F7DFCE00EFD7C6006349
      310000000000000000000000000039714200CE8E8C00EFA6A500FFFFFF00FFFF
      F700FFF7EF00FFEFE700FFEFE700FFE7DE00DEB6B500DEB6AD00DEB6AD00DEBE
      B500F7D7CE00F7D7C600BD696B007B4142000000000000000000000000007B61
      EF002900DE005230C60052515A003110C6002900D600A59EC600000000000000
      00000000000000000000000000000000000094968C00FFFFFF0094968400FFFF
      FF00EFDFD600C6B6A500C6B6A500C6AE9400EFDFD600F7EFE700C6B6A500C6B6
      A500C6B6A500C6B6A500FFF7EF008C8E7B00C6B6A500FFFFFF00E7EFEF005A71
      8400DEE7E700FFFFF700C6CFCE004A61730029AED60021304200ADA69C006349
      310000000000000000003971420042864A00D68E8C00F7AEAD00C6717300FFFF
      FF00FFF7EF00FFF7EF00FFEFE7007B4142007B4142007B4142007B414200F7DF
      D600F7DFCE00C6717300C6716B0084494A000000000000000000000000000000
      00007B59EF002900DE002900D6002900D6006B618C00DEDFDE00000000000000
      00000000000000000000000000000000000094968400FFFFFF008C8E8400FFFF
      FF00EFDFD600EFDFD600EFDFD600EFDFD600EFDFD600FFFFFF00FFFFF700FFF7
      F700F7F7F700F7EFE700FFFFF70094968C00CEB6A500FFFFFF008CA6AD0084D7
      E7004A617300ADBEBD004A61730063C7DE004A616B0029B6EF00102031001028
      39001028310010202900397142004AA66300DE969400EFA6A500FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7EF007B414200DEC7C600F7E7DE00F7E7DE00F7DF
      D600F7DFD600E7CFBD00B56963008C5152000000000000000000000000000000
      0000CEC7D6002908DE002900DE004228C6007371730094969400D6D7D6000000
      00000000000000000000000000000000000094968C00FFFFFF008C8E8400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094968C0094968C009496
      8C0094968C0094968C0094968C009C9E9400CEB6A500FFFFFF00E7EFEF008CA6
      AD0084E7F7004A6173007BCFE7004A616B0063D7F7004259730031B6DE00189E
      CE00188EB50018516B004A865A004AAE6300E7AEAD00E79E9C00E7D7D600FFFF
      FF00FFFFFF00FFF7F700FFF7EF007B414200DEC7BD00FFEFE700F7E7DE00F7E7
      DE00F7DFD600CEAEA500A5616300BD868400000000000000000000000000CEC7
      D6003918CE002900DE007359CE003108E7005A38D6007B798C0084868400C6C7
      C6000000000000000000000000000000000094968C00FFF7F700DEDFD6009496
      8C0094968C0094968C0094968C0094968C0094968C00DEDFD600C6B6A500C6B6
      A500F7EFE7008C8E7B000000000000000000CEB6A500CEB6A500CEB6A500BDB6
      A5008CA6AD0084E7F7004A61730084E7F7003959730063D7F70052CFEF0039BE
      EF0021B6E70018A6D60063966B0052B66B00F7D7D600DE969400E7B6B500F7F7
      F700FFFFFF00FFFFFF00FFFFF7007B414200DEC7BD00F7EFE700FFEFE700F7E7
      DE00E7D7CE00C68E84009C595A00DEBEBD000000000000000000CEC7D6003918
      CE002900DE008C86BD0000000000000000004218E7004A28DE007B719C007B79
      7B00B5B6B500000000000000000000000000848E7B00FFFFF700CEB6A500FFFF
      FF00FFFFFF00FFFFFF00D6C7BD00F7EFE700D6C7B500D6C7B500D6C7B500D6C7
      B500FFF7EF008486730000000000000000000000000000000000000000000000
      00008CA6AD008CA6AD0084E7F7004259730084E7F70073DFF70063D7F70052CF
      EF0039BEEF0029B6EF0073A684005AC77B0000000000E7A6A500E79E9C00DEBE
      BD00F7F7F700FFFFFF00FFFFFF007B414200DEC7C600FFF7EF00FFEFE700EFDF
      D600CE9E9C00B5696B00AD7173000000000000000000BDBEC6003910CE002900
      DE007361B500000000000000000000000000000000005A41E7003108DE007B69
      B5008C8E8C00DEDFDE00000000000000000094968C00FFFFFF00EFDFD600C6B6
      A500C6B6A500C6AE9C00EFDFD600F7EFE700C6B6A500C6B6A500C6B6A500C6B6
      A500FFF7EF008C8E7B0000000000000000000000000000000000000000000000
      0000000000008CA6AD008CA6AD0084E7F70084E7F70084E7F70073DFF70063D7
      F7005AB6CE007B8E9400ADC7A50094D79C0000000000FFE7E700E79E9C00E79E
      9C00E7B6B500DECFCE00F7EFEF00C6717300FFFFFF00F7EFEF00DECFCE00D6A6
      A500BD717300AD717300E7CFCE0000000000C6BEEF003910CE002900DE005A41
      B5000000000000000000000000000000000000000000000000009479EF002900
      DE00CECFE70000000000000000000000000094968400FFFFFF00EFDFD600EFDF
      D600EFDFD600EFDFD600EFDFD600FFFFFF00FFFFF700FFF7F700F7F7F700F7EF
      E700FFFFF70094968C0000000000000000000000000000000000000000000000
      000000000000000000008CA6AD008CA6AD008CA6AD008C9EA5008496A5007B96
      9C007B8E94007B8E94009CBE9C00ADC7A5000000000000000000FFE7E700E7A6
      A500DE969400E79E9C00E7A6A500EFA6A500EFA6A500DE969400CE868400BD71
      7300BD868400EFD7D60000000000000000004218E7002900DE004228C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094968C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDBEB500B5B6AD00ADAEA500ADAEA500A5AE
      9C00BDBEB5009C9E940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7CFCE00EFB6B500DE969400D68E8C00CE868400CE868400DE9EA500E7BE
      BD00000000000000000000000000000000003110E7004A28E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDFD600C6C7BD00BDC7B500BDC7
      B500BDC7B500BDC7B500BDBEB500DEDFD6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7DFD600D6BEAD00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDA68C009C715A008C59420094614200A5795A00AD8E73000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6797B00B5595A00A5595A008C49
      4A007B38390063696B0052697B0042596B005A51420000000000000000000000
      0000293042000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFE7DE00BD794200AD714200FFF7F7000000
      000000000000000000000000000000000000000000000000000000000000A579
      6B008C594200B59E8C00CEC7C600DEDFDE00DEDFDE00D6CFC600B59E8C008C61
      4200BD9E8C000000000000000000000000000000000000000000000000000000
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000CE696B00C6797B00BD7173009C49
      4A008C494A007BAEBD005A9EB5005A868C005A868C0042596B00000000002930
      42005A9EB50042596B0000000000000000000000000000000000000000000000
      00000000000000000000EFEFE700C6966B00FFC78C00AD714200000000000000
      0000000000000000000000000000000000000000000000000000AD866B00AD8E
      7B00E7EFEF00EFF7F700EFF7F700EFF7F700EFEFF700E7E7EF00E7E7E700D6D7
      D6009C796300BD9E8C0000000000000000000000000000000000000000000000
      84000000840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000CE717300AD61630094595A009C49
      4A008C494A007BAEBD0073869400736152007B3839005A514A004251630039BE
      EF0094CFDE006B8E9C000000000000000000000000000000000000000000EFDF
      DE00B5967B00A56942009C592900CE9E7300F7D7AD009C613100AD867300F7EF
      EF000000000000000000000000000000000000000000C6A69400B5968400FFFF
      FF00F7FFFF00F7F7F700FFFFFF00FFFFFF00FFFFFF00EFE7DE00DECFC600DEDF
      DE00CEC7C60094695A00CEB6AD00000000000000000000000000000000000000
      8400000084000000840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000BD717300C6797B00BD717300A559
      5A008C494A007386940094796B00D6BE9C00D6BE9C00A5696B005A514A0094CF
      DE00ADF7FF0000000000000000000000000000000000FFFFFF00CEB69C00AD69
      3100C6966B00D6AE8400E7C7A500FFE7C600FFEFC600DEB69400BD966300A569
      3100D6BEAD0000000000000000000000000000000000B5866B00F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7DFD600B5613100E7E7
      DE00DEDFDE00CEC7C60094694A00000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000D6797B00E7969400DE868400AD59
      5A00A5696B00BDAE9400EFE7BD00EFE7BD00EFE7BD00E7D7A500D6BE9C005A51
      4A0000000000000000000000000000000000FFFFFF00D6B69C00BD966300E7CF
      B500FFE7C600FFF7D600E7B68C00CE714200EFAE8400FFEFC600FFDFBD00DEC7
      A500BD865200CEAE9C00FFFFFF0000000000BD968400CEAE9C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700AD491000D6B6
      9C00E7E7E700E7E7E700A5867300BD9E84000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000DE8E8C00E79E9C00DE8E8C00BD69
      6B00BD717300DECFB500F7E7CE00F7EFEF00F7E7CE00E7D7AD00E7D7A5005A51
      420000000000000000000000000000000000E7D7CE00D6A67B00E7DFCE00FFEF
      D600FFEFCE00FFFFDE00AD7152003900000084301000FFEFCE00FFE7C600FFE7
      C600E7D7B500BD865200CEB6AD0000000000A5695200EFDFD600FFFFFF00FFFF
      FF00FFFFFF00EFDFCE00D6AE8C00FFFFFF00FFFFFF00FFF7EF00AD491000CE8E
      6300EFEFEF00E7E7E700BDB6AD009C715A000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000E79E9C00F7AEAD00EFA6A500C679
      7B00CE868400E7D7CE00FFFFE700FFFFF700FFFFF700EFE7BD00E7D7AD005A51
      420000000000000000000000000000000000D6A68400E7CFBD00FFF7DE00FFEF
      D600FFE7CE00FFEFD600F7DFBD00B58E7300E7C7A500FFEFCE00FFE7C600FFE7
      C600FFE7CE00E7CFAD00AD714200F7EFEF00B58E6B00FFFFFF00FFFFFF00FFFF
      FF00E7C7B500BD591000BD714A00FFFFFF00FFFFFF00D6967300BD591000D6AE
      8C00F7F7F700E7EFEF00CEC7C6009C6952000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000EFA6A500F7B6B500EFA6AD00CE86
      8400C6797B00B5AE9C00F7EFEF00FFFFF700F7EFEF00EFE7BD00E7D7AD006361
      630000000000000000000000000000000000DEAE8C00EFE7D600FFF7E700FFEF
      D600FFEFD600FFF7DE00FFF7D600E79E7300FFEFD600FFFFE700FFE7CE00FFE7
      CE00FFEFD600F7E7CE00BD8E5A00DECFBD00BD8E7300FFFFFF00FFFFFF00D6A6
      8C00C6691800DE862100C6692900C6865A00C6713900D6711800BD611000F7EF
      E700F7F7F700EFEFEF00CEC7C6009C715A000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000E79E9C00DE8E8C00CE868400CE86
      8400CE696B0094A6A5008C867300E7D7CE00F7E7CE00B5A67B00847163005269
      7B0000000000000000000000000000000000E7BEA500F7F7E700FFF7E700FFEF
      DE00FFEFDE00FFFFEF00FFFFFF00AD613900C6714A00FFFFE700FFF7E700FFE7
      CE00FFEFD600FFEFDE00D6A68400DEC7B500C69E8400FFFFFF00D69E7B00D671
      2100EF962900E78E2900E78E2900E78E2900E78E2900CE712100D6AE8C00FFFF
      FF00F7F7F700EFEFEF00BDAE9C00A57963000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000E7969400FFBEBD00F7B6B500CE86
      8400BD717300ADF7FF009CB6BD00847163006B615A00738E8C00639EAD004A61
      730000000000000000000000000000000000E7BEAD00F7F7EF00FFFFEF00FFF7
      E700FFF7EF00FFFFE700FFFFFF00DECFBD0084180000BD694200FFEFDE00FFF7
      DE00FFEFDE00FFF7E700D6A68400DEC7B500CEAE9400F7E7DE00EFD7BD00C669
      2900EF963100F79E3100E78E2900D6792100C6692900DEB69C00FFFFFF00FFFF
      FF00EFF7F700EFF7F700AD867300BDA694000000000000000000000000000000
      8400000084000000840000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000E79E9C00C6797B00BD717300C679
      7B00C6797B006B8E9C005A7184007396A5008CC7D60063AECE0052AEC6004A59
      6B0000000000000000000000000000000000EFC7B500F7F7EF00FFFFFF00FFFF
      EF00FFFFF700BD866B00AD513100FFF7E7009449310063000000E7C7AD00FFFF
      F700FFFFEF00FFFFEF00C68E6300EFE7DE0000000000D6B69C00FFFFFF00F7E7
      DE00C6794200E78E3100C6713100E7CFB500F7EFE700FFFFFF00FFFFFF00FFFF
      FF00F7FFFF00DED7D60094614200000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000CE868400DECFB500F7EFEF00CE96
      9400BD7173005A718400E7E7DE00F7EFEF0094B6BD008CC7D6005AC7E7004A61
      730000000000000000000000000000000000F7DFD600EFDFD600FFFFFF00FFFF
      FF00FFFFFF009C6152006B000000DEB69C006308000052000000EFDFCE00FFFF
      FF00FFFFFF00F7D7BD00BD967B00FFFFFF0000000000DEB69C00F7E7CE00FFFF
      FF00FFF7F700C6794A00C6794A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F70094694A0000000000000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000D6A69C00AD616300E7E7
      DE00F7EFEF00C6797B009CB6BD00E7E7DE00FFFFF7009C9684005A868C005269
      7B0000000000000000000000000000000000FFFFF700EFC7B500F7E7E700FFFF
      FF00FFFFFF00F7EFEF00C6967B00AD6942008C514200D6BEB500FFFFFF00FFFF
      FF00FFEFE700BD8E6300F7F7EF00000000000000000000000000DEB69400F7E7
      D600FFFFFF00F7E7D600E7BE9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7EF
      E700AD866B00CEAEA50000000000000000000000000000000000000000000000
      8400FFFF0000000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000CE969400DECF
      AD00E7D7CE00E7D7CE00C6797B0052697B00E7E7DE00F7EFEF00ADA694005269
      7B000000000000000000000000000000000000000000FFF7EF00EFCFBD00EFDF
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7D7
      B500D6A68C00F7F7EF000000000000000000000000000000000000000000E7BE
      9C00EFC7A500FFE7D600FFF7EF00FFF7EF00FFF7EF00F7E7DE00D6B6A500BD9E
      8400000000000000000000000000000000000000000000000000000000000000
      8400FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00F7E7
      DE00EFC7B500E7BE9C00E7C7A500E7C7AD00EFCFB500EFBEA500DEB69400E7D7
      CE00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000DEB69C00E7B69400E7B69400DEA68400CEA68C00DEC7B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF0000000000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000FFFF00FFFFFF0000FFFF000000000000FF
      FF00FFFFFF0000FFFF0000000000FFFF00000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000000094595A009459
      5200FFFFFF00CE96940094515200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094492100CEBEB5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000000094494A00B561
      6300733839009451520073383900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C4921009C492900CEBE
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000009C51520084414200C6696B00BD61
      5A00BD615A00DE716B00C6616300A5696B006B30310000000000000000000000
      0000000000000000000000000000000000000000000000000000CE865A009441
      21009C4921009C4921009C4921009C492100A5492100AD512900BD693900A551
      2900CEBEB5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000DE868400C6717300DE8684008C51
      5200C6A6A500C68E8C00C6616300B5515200B551520000000000000000000000
      0000000000000000000000000000000000000000000000000000D68E6300FFAE
      8400F7965A00F7965A00F7965A00F78E5A00EF8E5200DE794A00D6714A00C669
      4200A5513100D6C7B5000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF0000000000FFFFFF0000FF
      FF000000000000FFFF00FFFFFF000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000FFFFFF00D6868400E78E8C007341
      4200DED7D600DEC7C600CE696B00B5515200FFF7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000DE966B00FFBE
      9400FFA67B00FFA67B00FFA67B00FF9E6B00FF965A00F78E5A00E7865200DE79
      4A00C6694200AD5929000000000000000000FFFF000000000000FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF00000000000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000FF00000000000000000000000000
      000000000000000000000000000000000000DE968C00E7A6A500F7AEAD00AD69
      6B008451520094616300C6696B00B55152006B30310094595A00945952000000
      0000CE9694009451520000000000000000000000000000000000E79E7300FFC7
      A500FFC7A500FFBE9C00FFBE9C00FFB69400FFAE8400FFAE7B00FF9E6B00E786
      5200AD592900000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      FF000000FF000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000EFBEBD00DE969400F7BEBD00EFAE
      AD00DE8E8400D6797300C6696B00C6717300BD71730094494A00B56163007338
      3900945152007338390000000000000000000000000000000000EF9E7300E796
      7300E7967300E7967300DE8E6B00DE8E6B00D6865A00DE966B00F79E6B00AD59
      290000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000FF000000FF000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7A6AD00DE9E
      9C00D6867B00CE797B00BD6973009C51520084414200C6696B00BD615A00BD61
      5A00DE716B00C6616300A5696B006B3031000000000000000000000000000000
      00000000000000000000000000000000000000000000E79E7300C6714A000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF00000000000000
      00000000FF000000FF00000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000DE9E9C00E7AE
      AD00FFFFFF00CE797B00BD717300DE868400C6717300DE8684008C515200C6A6
      A500C68E8C00C6616300B5515200B55152000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9E7300000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF00000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00D6868400E78E8C0073414200DED7
      D600DEC7C600CE696B00B5515200FFF7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000FF000000FF000000
      FF000000FF0000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DE968C00E7A6A500F7AEAD00AD696B008451
      520094616300C6696B00B55152006B3031000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFBEBD00DE969400F7BEBD00EFAEAD00DE8E
      8400D6797300C6696B00C6717300BD7173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7A6AD00DE9E9C00D686
      7B00CE797B00BD69730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE9E9C00E7AEAD00FFFF
      FF00CE797B00BD71730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B797B007B797B007B79
      7B007B797B007B797B007B797B007B797B007B797B007B797B007B797B007B79
      7B007B797B007B797B000000000000000000000000000000000000000000BDA6
      94009459420063413100A58E8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000007B797B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084868400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FFFF00848684000000000000000000000000000000000000000000CE86
      6300AD6139008C51310063413100BDBEBD00BD9E9400634131005A383100AD96
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000FFFF00000000000000
      00000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF0000000000000000000094969400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00949694000000000000000000000000000000000000000000DE86
      5200C6B6AD00BD9E8C0084493100C6C7C600C6866300AD613900633829002920
      210000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF000000000000000000009C9E9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9E9C000000000000000000000000000000000000000000E786
      5200C6B6AD00BDAEAD008C513100BDBEB500D6795200C6B6AD00AD9684006B41
      290000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000FFFF007B797B007B79
      7B000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF00000000000000000000ADAEAD00F7F7F700F7F7
      F700BDAEAD00B5A6A500F7F7F700F7F7FF00AD9E9C009C9694009C969400FFFF
      FF00FFFFFF009CA6A5000000000000000000000000000000000000000000DE9E
      7300E7865200B56142008C5139009C715A00CE714A00C6BEB500BD9E94008C51
      310000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000007B797B007B797B0000FFFF000000
      00000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF00000000000000000000ADAEAD00F7F7F700F7F7
      F700B5A6A500BDAEAD00F7F7FF00F7F7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBEBD000000000000000000000000000000000000000000CEB6
      AD00EF8E5A00DE8652009C59420094614200BD714A00D6794A00BD694200AD86
      730000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000000000FFFF000000
      00000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF00000000000000000000B5B6B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBEBD0000000000000000000000000000000000000000000000
      0000CEB6AD00DE9E7300DE865200C68E7300CE794A00D6795200C6967300BDA6
      9C0000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FFFF007B79
      7B007B797B0000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF00000000000000000000B5B6B500F7F7F700F7F7
      F700734952008C696B00FFFFFF00FFFFFF00AD9E9C00AD9E9C00AD9E9C00FFFF
      FF00FFFFFF00BDBEBD0000000000000000000000000000000000000000000000
      000000000000000000008C7163007361520084615200AD9E9C00000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000007B797B007B797B0000FF
      FF000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF00000000000000000000B5B6B500F7F7F700F7F7
      FF008C696B0084596300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBEBD0000000000000000000000000000000000000000000000
      000000000000BDB6B5008C8673007B6963006B59520073716B00000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF000000000000000000000000000000000000FF
      FF000086840000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000000000000000000000000000BDBEBD00F7F7FF00F7FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBEBD0000000000000000000000000000000000000000000000
      000000000000BDB6AD00A5968C00ADA69C008C86730063595200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF000086840000000000000000000000000000000000000000000000FF000000
      00000000000000000000FFFF00000000000000000000BDBEBD00F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBEBD0000000000000000000000000000000000000000000000
      000000000000BDB6AD00A5968C00CEC7C600CEC7C6006B595200ADAEAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000007B797B000000
      00000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000000000000000000000000000BDBEBD00FFFFFF00FFFF
      FF00BDAEAD00BDAEAD00BDAEAD00BDAEAD00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700DEDFE700BDBEBD0000000000000000000000000000000000000000000000
      000000000000AD9E9400B5AEA500C6C7C600EFE7E7007B696300ADAEAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000BDBEBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBEBD00BDBE
      BD00BDBEBD00BDBEBD0000000000000000000000000000000000000000000000
      0000BDBEB500A5968C00BDBEBD0000000000DEDFDE00BDB6AD00A5A69C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBEBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7C600F7F7
      F700BDBEBD00F7F7F70000000000000000000000000000000000000000000000
      0000BDBEB500B5AE9C000000000000000000CECFCE00E7DFDE00A59694000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000C6C7C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECFCE00BDBE
      BD00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600BDBEBD00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00DEDFD600B5A69C00D6CFC600E7DFDE00F7F7EF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00DED7D6009C3000009C380000632810005A41310073615200A59E8C00D6CF
      C600E7DFDE00F7F7F700FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000280000004100000861080008610800218E
      2100188E18001079100008610800003000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00DEDF
      D6009C380000D6690000A5411000E7C7BD00B56139009C300000842000006328
      10005A4131008C797300F7F7F700000000000000000000000000000000000000
      0000000000000000000000610000219E210052C75200399E39002186210063C7
      630063CF630039BE390031B63100107910000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052515200424142002120210000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7DE00A538
      0000DE710000D6690000BD715200EFDFD600E7CFC600E7C7B500DEB6A500D6A6
      8C00AD59290063413900DEDFD600FFFFFF000000000000000000000000000000
      00000000000000000000188E18005AC75A0063CF630039963900DEEFCE00429E
      39006BCF6B0063CF630039B63900086908000000000000000000D6CFC6006349
      3100634931006349310063493100634931006349310063493100634931006349
      3100D6CFC6000000000000000000000000000000000000000000000000000000
      00000000000000000000636163006B696B004241420000000000000000000000
      00000000000000000000000000000000000000000000000000009C411800EF86
      0000E7790000DE710000BD795200F7E7DE00EFD7CE00E7C7BD00DEB6A500DEB6
      9C00D6A69400C69E9400D6CFCE00FFFFFF000000000000000000000000000000
      000000000000000000002186210063CF630084DF8400639E5A00FFFFFF008CBE
      8C005AB65A0063CF630042AE4200004900000000000000000000BDA69400F7E7
      DE00F7DFD600F7DFCE00F7D7CE00EFD7C600EFD7BD00EFCFBD00EFCFBD00EFCF
      B500634931000000000000000000000000000000000000000000000000000000
      000000000000000000005A595A00948E8C006361630029282900000000000000
      0000000000000000000000000000000000000000000000000000C6610000EF8E
      0000E7860000E7790000BD795A00F7E7E700EFDFD600A5968400D6BEAD00CE96
      7B00D6AE9C00CEA69C00D6CFCE00FFFFFF000000000000000000000000000000
      000000000000000000000061000042A642009CE79C0084AE6B00BDCFCE009CBE
      C6003986420042A6420000590000000000000000000000000000BDA69400F7EF
      E700F7E7DE00F7DFD600F7DFCE00F7D7CE00EFD7C600EFD7BD00EFCFBD00EFCF
      BD00634931000000000000000000000000000000000000000000000000000000
      000000000000000000005A595A00ADAEAD008486840042414200000000000000
      0000000000000000000000000000000000000000000000000000CE610000F78E
      0000EF860000E779000063413100F7EFEF00F7E7DE00EFD7CE00DEC7BD002986
      B500DEB6A500CEA69C00D6CFCE00FFFFFF000000000000000000000000000000
      00000000000000000000000000000061000021792900006984001079C6001079
      C6000871AD000049390000000000000000000000000000000000BDA69400FFEF
      E700F7EFE700F7E7DE00F7DFD600F7DFCE00F7D7CE00EFD7C600EFD7BD00EFCF
      BD00634931000000000000000000000000000000000000000000000000000000
      000000000000E7E7E7005A595A00BDBEBD009C9E9C0042414200D6D7D6000000
      0000000000000000000000000000000000000000000000000000CE610000FF96
      0000F78E0000EF86000018080800FFF7F700F7EFE700EFDFD600EFD7C600E7C7
      B500DEBEAD00CEAEA500D6CFCE00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000598400298EEF00319EFF00319E
      FF00319EFF001079C60000101800000000000000000000000000BDA69400FFF7
      EF00FFEFE700F7EFE700F7E7DE00F7DFD600F7DFCE00F7D7CE00EFD7C600EFD7
      BD00634931000000000000000000000000000000000000000000000000000000
      0000DEDFDE00525152009C9E9C00D6D7D600ADAEAD007371730018181800D6D7
      D600000000000000000000000000000000000000000000000000CE610000FF96
      0000F7960000EF8E0000F7CFA500DEAE8400BD866300E7BEA500E7CFC600E7CF
      BD00DEC7B500CEAEA500DEDFD600FFFFFF000000000063493100634931006349
      3100634931006349310000000000000000001879C60039A6FF0042A6FF0042A6
      FF0039A6FF00319EFF0000497300000000000000000000000000BDA69400FFF7
      F700FFF7EF006349310063493100634931006349310063493100F7D7CE00EFD7
      C60063493100000000000000000000000000000000000000000000000000DEDF
      DE006B696B00BDBEBD00E7E7E700DEDFDE00BDBEBD00949694005A595A001818
      1800D6D7D6000000000000000000000000000000000000000000CE690800FF9E
      0000FF960000FFE7D600FFFFFF00FFE7D600F7D7B500FFDFBD00A5695200AD51
      18009438000063514200EFEFEF0000000000BDA69400F7E7DE00F7DFD600F7D7
      CE00EFD7BD00EFCFBD006349310000000000218ECE0042AEFF004AB6FF004AB6
      FF004AAEFF0042AEFF001879BD00000000000000000000000000BDAE9C00FFF7
      F700FFF7F700FFF7EF00FFEFE700F7EFE700F7E7DE00F7DFD600F7DFCE00F7D7
      CE00634931000000000000000000000000000000000000000000DEDFDE006B71
      6B00C6C7C600EFEFEF00FFFFFF00EFEFEF00D6D7D600BDBEBD009C9E9C005A59
      5A0018181800D6D7D60000000000000000000000000000000000CE691000FFA6
      1000FF9E0000FF960000F7E7D600FFF7EF00FFE7CE00C6967B00D6AE9400D6AE
      9400CE9E840063514A00F7F7EF0000000000BDA69400F7EFE700F7E7DE006349
      3100EFD7C600EFD7BD006349310000000000218ECE0052B6FF0052BEFF0052BE
      FF0052B6FF004AB6FF00218ECE00000000000000000000000000C6AE9C00FFFF
      FF00FFF7F700FFF7F700FFF7EF00FFEFE700F7EFE700F7E7DE00F7DFD600F7DF
      CE006349310000000000000000000000000000000000E7E7E70084868400D6D7
      D600EFEFEF00FFFFFF00FFFFFF00FFFFFF00E7E7E700D6D7D600BDBEBD009496
      94005251520018181800D6D7D600000000000000000000000000CE711800FFAE
      2100FF9E0800FF960000F7EFE700EFC7AD00CE9E8400CE9E8400D6A68C00D6AE
      9C00D6A68C0063514A00F7F7EF0000000000BDA69400FFF7EF00634931006349
      310063493100F7D7CE0063493100000000002186BD00319ED6002996C60039A6
      DE004AB6FF0042AEF7002186B500000000000000000000000000C6AE9C00FFFF
      FF00FFFFFF00FFF7F700FFF7F700FFF7EF00FFEFE700F7EFE700F7E7DE00F7DF
      D60063493100000000000000000000000000000000007B797B00D6D7CE00EFEF
      EF00FFFFFF00FFFFFF00F7F7F700EFEFEF00E7E7E700D6D7CE00BDBEBD009C9E
      9C00636163005251520018181800000000000000000000000000CE712100FFAE
      3100FFA61800FF9E0000F7EFEF00F7E7DE00B5B6C600848EAD003171B500DEB6
      A500D6AE940063514A00F7F7EF0000000000C6AE9C00FFF7F700FFF7F7006349
      3100F7E7DE00F7DFD600634931000000000000619400318EBD0052A6D60073B6
      DE005AA6C600398EB50008699C00000000000000000000000000C6AE9C00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7EF00FFEFE700F7EFE700F7E7
      DE006349310000000000000000000000000000000000BDB6B500C6C7C600D6D7
      D600CECFCE00C6C7C600BDBEBD00B5AEAD00A5A6A500A59E9C009C9E9C008C8E
      8C007B797B00636163004A494A00000000000000000000000000CE792900FFB6
      4A00FFAE2900FFA61000FFF7F700F7EFE700EFDFD600EFD7CE00E7C7BD00DEBE
      AD00DEB69C0063514A00F7F7EF0000000000C6AE9C00FFFFFF00FFF7F700FFF7
      EF00F7EFE700F7E7DE006349310000000000006194002186B50084C7E70094CF
      EF008CC7E700298EBD0000496B00000000000000000000000000EFEFE700C6AE
      9C00C6AE9C00C6AE9C00BDAE9C00BDA69C00BDA69400BDA69400BDA69400BDA6
      9400D6CFC6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE793100FFBE
      5A00FFB64200FFAE2100FFC77B00FFC77300F7D7AD00EFCFAD00EFC7A500E7C7
      B500DEB6A5007B695A00F7F7F7000000000000000000C6AE9C00C6AE9C00BDA6
      9C00BDA69400BDA69400000000000000000000000000006194001871A5004296
      BD001871A50000517B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5613100CE96
      7B00C68E7300C68E6B00C6866300C6866300BD715200B5593900AD512900B559
      4200AD695200E7D7CE00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300100000100010000000000800900000000000000000000
      000000000000000000000000FFFFFF00FFFFFF7F00000000FC7FFE3F00000000
      FC61FC1F00000000FC7FF00F00000000FFFFE00700000000E3FFC00300000000
      E31F800100000000E3FF000100000000FFFF000000000000E3FF000000000000
      E303000100000000E3FF000300000000FFFF0007000000001FFF800F00000000
      187FF01F000000001FFFFC3F00000000FFFFFF81FFFF8007FC018003F0038007
      F8018007F0038007F801800FF0038007F841800FF0030003F803800FF0038005
      FC07800FF0038007FE038001F0038007FE038001F0038007CE03800180038001
      CE03800180038000CE03800F800380000203800F800780008603800F800F8000
      CF07801F80FF8000FFFFFFFF80FFF001FFFFFFFFFFFFFFFF8001FFFFFFFFFFFF
      8001FFFFFFFF00008001FFFFFE7F00008001FFFFFC7F00008001FFFFF87F0000
      8001FFFFF00700008001F83FE00700008001F83FE00700008001FFFFE0070000
      8001FFFFF00700008001FFFFF87F40808001FFFFFC7F7FC08001FFFFFE7F0000
      8001FFFFFFFFFFFFFFFFFFFFFFFFFFFF8001FFFFFFFFFFFF000001F7C001FFFF
      000089E3C0018FE30000C5E3C00107C30000C7C1C00103870000A3C1C001810F
      4000A3F7C001C01F000081F7C001E03F4000FFF7C001F03F400001F7C001F01F
      400011F7C001E00F400083F7C001C307000083F7C00187837F80C7F7C0010FC7
      0000C7F7C0031FFF8001C7F7C0073FFF9C00FF1EFFFFFFFF0000FE1CFFFFFFFF
      00000000000F000000000000000F000000000000000F000000000000000B0000
      0000000000090000000000000000000000000000000000000000000000000000
      000000000009000000000000000B000000000000000F000000000000000F0000
      0000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0210FC01FC01FC010000F800
      FC01FC010000F000FC01FC010000F000FC01FC010000F020FC01FC010000F031
      FC01FC010000F803FC01FC010000FC03FC01FC010000C203C401C40100008003
      C7FFC7FF0000600301FF01FF007F200301FF01FF007F200301FF01FF80FF6003
      C7FFC7FF80FFAD07C7FFC7FF637FC3FFF0010007FFFF8003F0010007FE008003
      F0010007C0008003F00100070000800300010007000080030001000700008003
      00010003000080030001000180028003003F0000C007800300710000C0018003
      00710000800080030073000081008003006300008100800300C30000C1008003
      01FF0000C0808007FFFF0003FFC1800F8003F007F007E0070003C003C003C003
      0003C003C003C0030003C003C003C0030003C003C003C0030003C003C003C003
      0003C007C007C0070003E007E007E0070003F007F007F0070003F001F001F007
      0003F000F000F0070003F000F000F0030003F000F000F0010003F000F000F000
      0003F000F000F000003FF801F801F808FFFFFFFF80038007001FFFFF00030003
      001F000300030003001F000100030003001F0001000300030011000100030003
      0000000100030003000000010003000300000001000300030001000100030003
      0003000100030003000700010003000300070001000300030007000100030003
      0007000100030003FC0FFFFB003F003FFFFFC3FF0000FFFFFFFF81FF000081FF
      C00780FF000001FFC003007F00000000C003000300000000C003000100000000
      C003000000000000C103000000008000C10300000000E000C00300000000E000
      C00300000000E000C00300000000E000C00300010000E000C0030003FFFFE000
      E00300FFFFFFE000FFFF01FFFFFFE000FFFF81FF81FF81FFFFFF000100010001
      FE00000100010001FC00000100010001FC00800180018001FC00800380038003
      DC010003800300039E0300030003000301010001000100010101000100010001
      01018100810381009F01C300C303C300DF01FF80FF81FF80FF01FF80FFE0FF80
      FF01FF80FFF0FF80FF83FFC1FFF8FFC1FFFFFFFFFE03FFFFFFFFFE00FE03FE00
      0003FC00E003FC000003FC00C003FC000003FC00C003FC000003FC01C003FC01
      0003FE03C003FE030003E701E003FF0100038301F01FC70100030101F01F8101
      00010001F01F010100000001F01F0001FFC00001F01F0001FFE00101F01F0101
      FFF08383F01F8183FFFFFFFFF83FC3FFFFFFFFFFFFFFFFFFF801FE00F801FFFF
      E001FC00E0010003C001FC00C0010001C001FC00C0010001C00FFC01C00F0001
      C01FFE03C01F0001E03FC701E03F0001F01F8101F01F0001F01F0101F01F0001
      F01F0001F01F0001F01F0001F01F0001F01F0101F01F0001F01F8101F01F0001
      F01FC383F01F0001F83FFFFFF83FFFFFFFFFFE00FE00FFFFFFFFFE00FE000077
      000FFE00FE000023000FFE00FE000003000FFE00FE000007000FFE00FE00000F
      000FFE00FE00000F0007FE00FE00000F0007C200FE00000F0003C3FFFFFF000F
      000100FF00FF000F000000FF00FF000F000000FF00FF000FFFC000FF00FF800F
      FFF0C3FFFFFFC00FFFFFC3FFFFFFFFFFFFFFF00FFFFFC108000FC003FFFFC000
      000F80018FE3C000000F800107C3C000000F00000387C000000F0000810F0000
      000F0000C01F0000000E0000E03F0000000C0000F03F000000000000F01F0000
      00000000E00F000300000000C3070003F000800187830003F80080010FC70003
      FC00C0031FFF0003FFFFF00F3FFF00FFFFFFFF1FF81FC0070077FE1FE007C007
      0023FC3FC003C0070003E00F8001C007000780078001C007000F00010000C007
      000F00010000C007000F00000000C007000F00000000C007000F00000000C007
      000F00000000C007000F00008001C007000F00008003C007800F0001C003C007
      C00F8003E00FC007FFFFC007F81FC007FFFFF000FFFFFFFFFFFFF000FFC8FFFF
      FFFFF000FFB8C1FFFF9FF000CFBFC1FFFF8FF000CFBC007FC007E000FFBC007F
      C0030000DFBF007FC0030000CF7C0013C0070000E6FC0003C00F0000F37FC000
      FF9F000033BCC000FFBF000033BCFE00FFFF000087BFFE00FFFF2001FFB8FE00
      FFFFF003FFC8FF83FFFFF007FFFFFF83FFFFFC00FFFF8003E1FFFC0018088003
      E00F200018088003E00F000018088003E00F000008088003E00F000008088003
      E00F000088088003F00F000080088003FC3F000080088003F83F0000C0088003
      F83FE000C0088003F81FF800C0088003F81FF000F80F8003F11FE001FF8F8003
      F31FC403FF8F8007FFFFEC07FF8F800FFFFFF007FFFFFFFFFFFFE001FE00FFFF
      FFFFC001FC00FFFFFC3FC000FC00C007FC3FC000FC00C007FC3FC000FC01C007
      FC3FC000FE03C007F81FC000FF01C007F00FC0008301C007E007C0010101C007
      C003C0010101C0078001C0010101C0078001C0010101C0078001C0010101C007
      FFFFC0018383FFFFFFFFC001FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object TreeIcons: TImageList
    Left = 278
    Top = 82
    Bitmap = {
      494C010131004900840010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFEFEF00E7E7E700DEDEDE00DEDEDE00DEDEDE00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEDE
      DE009C9C9C00526B520029632900215A2100105A1000105A1000215A2100395A
      39007B7B7B00EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009CB59C001084
      100042BD420052C652003184290052C6520052C6520042BD420039B5390021AD
      210008630800D6D6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000029A529004AC6
      4A005AC65A0052BD5200FFFFE7002184210063CE63005AC65A004ABD4A0031B5
      310008730800DEDEDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031AD310052C6
      520073D6730018841800FFFFF700EFF7E7006BCE6B006BD66B005AC65A0039BD
      3900527B52000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001884180063CE
      63007BD67B00428C390000000000FFFFF70084AD73007BD67B0063CE63000873
      0800E7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFF7EF00298C
      29008CDE8C0084A56300739CAD00006BA500528CA500317B1800086B0800EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6E7D600006BA500218CDE00218CDE00218CDE00107BBD00525A5A00DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A94B500319CFF00319CFF00399CFF00319CFF00319CFF001073BD008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000107BBD0039A5FF0042A5FF0042ADFF0042A5FF0039A5FF0039A5FF00395A
      6B00E7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      0000319CE70042ADFF004AB5FF004AB5FF004AB5FF0042ADFF0042ADFF000863
      9400CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000039A5EF0052BDFF0052BDFF0052BDFF0052BDFF004AB5FF004AB5FF001884
      C600BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003194D6004AB5F7002994CE0042ADF70052B5FF0052B5FF004AB5FF00086B
      9C00CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001873A5002184B500429CD60073B5DE0063ADCE00318CB500318CB5001063
      8C00EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000318CBD0073B5DE0084C6E7009CCEEF005AADD6002184B500B5B5
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEEFF700217BAD00BDDEEF0084BDE700187BAD00C6CED6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00F7F7F700EFEF
      EF00DEDEDE00DEDEDE00D6D6D600D6D6D60000000000A5ADDE005A5AC6003939
      BD004A4AB5008484BD00000000000000000000000000FFFFFF00F7F7F700EFEF
      EF00DEDEDE00DEDEDE00D6D6D600D6D6D60000000000A5ADDE005A5AC6003939
      BD004A4AB5008484BD00000000000000000000000000000000004ABD4A004ABD
      4A004ABD4A004ABD4A004ABD4A004ABD4A004ABD4A004ABD4A004ABD4A004ABD
      4A004ABD4A004ABD4A004ABD4A00000000000000000000000000000000000000
      00000000000000000000EFEFEF00E7E7E700DEDEDE00DEDEDE00DEDEDE00EFEF
      EF0000000000000000000000000000000000FFFFFF00E7E7E700C6C6C600A5A5
      A5008C8C8C00848484007373730000000000949CEF00525AE7006B73F7008484
      F7005A5AEF003131D6006B6BB50000000000FFFFFF00E7E7E700C6C6C600A5A5
      A5008C8C8C00848484007373730000000000949CEF00525AE7006B73F7008484
      F7005A5AEF003131D6006B6BB50000000000000000004ABD4A006BD66B006BD6
      6B006BD66B006BD66B006BD66B006BD66B006BD66B006BD66B006BD66B006BD6
      6B006BD66B006BD66B006BD66B004ABD4A00000000000000000000000000DEDE
      DE009C9C9C0063636300525252004A4A4A004A4A4A004A4A4A004A4A4A005252
      52007B7B7B00EFEFEF000000000000000000E7E7E7009C948C006B5239006B42
      21006B4221008C5221008C5218009CA5F700525ADE00ADADF700000000000000
      00007B84DE003139E7002931DE005A6BBD00E7E7E7009C948C006B5239006B42
      21006B4221008C5221008C5218009CA5F700525ADE00ADADF700000000000000
      00007B84DE003139E7002931DE005A6BBD00000000004ABD4A006BD66B0029A5
      29004AC64A005AC65A0052BD5200FFFFE7002184210063CE63005AC65A004ABD
      4A0031B53100087308006BD66B004ABD4A000000000000000000ADADAD007373
      7300A5A5A500ADADAD0073737300ADADAD00ADADAD00A5A5A5009C9C9C009494
      940052525200D6D6D60000000000000000009C7B63009C5A2100C68C52009C6B
      3900844A2100C6946300CE946300636BE7007373C6000000000000000000949C
      E7003952DE00637BEF003952EF002139B5009C7B63009C5A2100C68C52009C6B
      3900844A2100C6946300CE946300636BE7007373C6000000000000000000949C
      E7003952DE00637BEF003952EF002139B500000000004ABD4A006BD66B0031AD
      310052C6520073D6730018841800FFFFF700EFF7E7006BCE6B006BD66B005AC6
      5A0039BD3900527B52006BD66B004ABD4A0000000000000000008C8C8C00ADAD
      AD00ADADAD00A5A5A500FFFFFF0073737300B5B5B500B5B5B500A5A5A5009C9C
      9C0063636300DEDEDE0000000000000000008C521800C6945A00CE9463009463
      3900EFCECE009C6B3900CE9C6B00525ADE008484B50000000000ADB5F700525A
      E7007B8CE700000000005A73EF002931BD008C521800C6945A00CE9463009463
      3900EFCECE009C6B3900CE9C6B00525ADE008484B50000000000ADB5F700525A
      E7007B8CE700000000005A73EF002931BD00000000004ABD4A006BD66B001884
      180063CE63007BD67B00428C390000000000FFFFF70084AD73007BD67B0063CE
      630008730800E7E7E7006BD66B004ABD4A00000000000000000094949400ADAD
      AD00C6C6C6007373730000000000F7F7F700BDBDBD00BDBDBD00B5B5B500A5A5
      A5006B6B6B0000000000000000000000000094633900CE946300DEAD84009C7B
      5A00FFFFFF00BDA58C00B58C5A005A63DE006363B5009CA5DE00636BEF008C94
      EF0000000000000000006373EF003942B50094633900CE946300DEAD84009C7B
      5A00FFFFFF00BDA58C00B58C5A005A63DE006363B5009CA5DE00636BEF008C94
      EF0000000000000000006373EF003942B500000000004ABD4A006BD66B00EFF7
      EF00298C29008CDE8C0084A56300739CAD00006BA500528CA500317B1800086B
      0800EFEFEF00000000006BD66B004ABD4A00000000000000000073737300B5B5
      B500C6C6C6007B7B7B000000000000000000A5A5A500C6C6C600B5B5B5006363
      6300E7E7E700000000000000000000000000AD947B00A5734200E7BD9C00AD7B
      6B00BDCECE009CBDC600846B39008C94EF00525ADE00525AD6008C94DE000000
      000000000000A5A5EF004A52DE006373BD00AD947B00A5734200E7BD9C00AD7B
      6B00BDCECE009CBDC600846B39008C94EF00525ADE00525AD6008C94DE000000
      000000000000A5A5EF004A52DE006373BD00000000004ABD4A006BD66B000000
      000000000000D6E7D600006BA500218CDE00218CDE00218CDE00107BBD00525A
      5A00DEDEDE00000000006BD66B004ABD4A000000000000000000F7F7F7007B7B
      7B00CECECE00949494009C9C9C00737373008C8C8C006B6B6B005A5A5A00EFEF
      EF000000000000000000000000000000000000000000C6AD9C0094734200006B
      8400107BC600107BC6000873AD000873AD00848CEF004A5ADE006363B5008484
      B5007373CE00525AE700737BD6000000000000000000C6AD9C0094734200006B
      8400107BC600107BC6000873AD000873AD00848CEF004A5ADE006363B5008484
      B5007373CE00525AE700737BD60000000000000000004ABD4A006BD66B000000
      0000000000005A94B500319CFF00319CFF00399CFF00319CFF00319CFF001073
      BD0084848400000000006BD66B004ABD4A000000000000000000000000000000
      0000E7E7E700737373009C9C9C009C9C9C00A5A5A500848484005A5A5A00DEDE
      DE000000000000000000000000000000000000000000000000006B9CBD00298C
      EF00319CFF00319CFF00319CFF00319CFF000873AD008C94EF005A63DE00525A
      DE00636BE700949CEF00000000000000000000000000000000006B9CBD00298C
      EF00319CFF00319CFF00319CFF00319CFF000873AD008C94EF005A63DE00525A
      DE00636BE700949CEF000000000000000000000000004ABD4A006BD66B000000
      000000000000107BBD0039A5FF0042A5FF0042ADFF0042A5FF0039A5FF0039A5
      FF00395A6B00E7E7E7006BD66B004ABD4A000000000000000000000000000000
      00009C9C9C00B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500848484008484
      84000000000000000000000000000000000000000000000000002184C60039A5
      FF0042A5FF0042A5FF0039A5FF00319CFF00185A7B007B7B7B00D6D6D6000000
      00000000000000000000000000000000000000000000000000002184C60039A5
      FF0042A5FF0042A5FF0039A5FF00319CFF00185A7B007B7B7B00D6D6D6000000
      000000000000000000000000000000000000000000004ABD4A006BD66B000000
      000000000000319CE70042ADFF004AB5FF004AB5FF004AB5FF0042ADFF0042AD
      FF0008639400CECECE006BD66B004ABD4A000000000000000000000000000000
      00008C8C8C00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD005A5A
      5A00E7E7E7000000000000000000000000000000000000000000218CCE0042AD
      FF004AB5FF004AB5FF004AADFF0042ADFF00187BBD0073737300D6D6D6000000
      0000000000000000000000000000000000000000000000000000218CCE0042AD
      FF004AB5FF004AB5FF004AADFF0042ADFF00187BBD0073737300D6D6D6000000
      000000000000000000000000000000000000000000004ABD4A006BD66B000000
      00000000000039A5EF0052BDFF0052BDFF0052BDFF0052BDFF004AB5FF004AB5
      FF001884C600BDBDBD006BD66B004ABD4A000000000000000000000000000000
      0000ADADAD00BDBDBD00C6C6C600C6C6C600C6C6C600BDBDBD00BDBDBD006B6B
      6B00CECECE000000000000000000000000000000000000000000218CCE0052B5
      FF0052BDFF0052BDFF0052B5FF004AB5FF00218CCE0073737300D6D6D6000000
      0000000000000000000000000000000000000000000000000000218CCE0052B5
      FF0052BDFF0052BDFF0052B5FF004AB5FF00218CCE0073737300D6D6D6000000
      000000000000000000000000000000000000000000004ABD4A006BD66B000000
      0000000000003194D6004AB5F7002994CE0042ADF70052B5FF0052B5FF004AB5
      FF00086B9C00CECECE006BD66B004ABD4A000000000000000000000000000000
      0000B5B5B500CECECE00CECECE00CECECE00CECECE00C6C6C600C6C6C6009494
      9400BDBDBD0000000000000000000000000000000000000000002184BD00319C
      D6002994C60039A5DE004AB5FF0042ADF7002184B50084848400DEDEDE000000
      00000000000000000000000000000000000000000000000000002184BD00319C
      D6002994C60039A5DE004AB5FF0042ADF7002184B50084848400DEDEDE000000
      000000000000000000000000000000000000000000004ABD4A006BD66B000000
      0000000000001873A5002184B500429CD60073B5DE0063ADCE00318CB500318C
      B50010638C00EFEFEF006BD66B004ABD4A000000000000000000000000000000
      0000A5A5A500C6C6C600A5A5A500BDBDBD00C6C6C600C6C6C600C6C6C6007373
      7300CECECE000000000000000000000000000000000000000000398CAD00318C
      BD0052A5D60073B5DE005AA5C600398CB50010739C00ADADAD00EFEFEF000000
      0000000000000000000000000000000000000000000000000000398CAD00318C
      BD0052A5D60073B5DE005AA5C600398CB50010739C00ADADAD00EFEFEF000000
      000000000000000000000000000000000000000000004ABD4A006BD66B000000
      00000000000000000000318CBD0073B5DE0084C6E7009CCEEF005AADD6002184
      B500B5B5BD00000000006BD66B004ABD4A000000000000000000000000000000
      00007B7B7B008C8C8C00A5A5A500BDBDBD00B5B5B50094949400949494006B6B
      6B00EFEFEF000000000000000000000000000000000000000000BDD6E7002184
      B50084C6E70094CEEF008CC6E700298CBD006394A500E7E7E700FFFFFF000000
      0000000000000000000000000000000000000000000000000000BDD6E7002184
      B50084C6E70094CEEF008CC6E700298CBD006394A500E7E7E700FFFFFF000000
      000000000000000000000000000000000000000000004ABD4A006BD66B006BD6
      6B006BD66B006BD66B006BD66B006BD66B006BD66B006BD66B006BD66B006BD6
      6B006BD66B006BD66B006BD66B004ABD4A000000000000000000000000000000
      00000000000094949400BDBDBD00CECECE00D6D6D600B5B5B5008C8C8C00B5B5
      B50000000000000000000000000000000000000000000000000000000000ADCE
      DE005294BD004294BD00428CB5008CADC600EFEFEF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000ADCE
      DE005294BD004294BD00428CB5008CADC600EFEFEF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000000000004ABD4A004ABD
      4A004ABD4A004ABD4A004ABD4A004ABD4A004ABD4A004ABD4A004ABD4A004ABD
      4A004ABD4A004ABD4A004ABD4A00000000000000000000000000000000000000
      000000000000EFEFEF0084848400E7E7E700C6C6C60084848400CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00EFEFEF00CECE
      C600ADB5A50094AD840094AD7B0094A57300A5AD9C00F7F7F700000000000000
      00000000000000000000000000000000000000000000FFFFFF00EFEFEF00CECE
      C600ADB5A50094AD840094AD7B0094A57300A5AD9C00F7F7F700000000000000
      000000000000000000000000000000000000C67B7B00B55A5A00A55A5A008C4A
      4A007B393900636B6B00526B7B00425A6B005A52420000000000000000000000
      000029314200000000000000000000000000C67B7B00B55A5A00A55A5A008C4A
      4A007B393900636B6B00526B7B00425A6B005A52420000000000000000000000
      00002931420000000000000000000000000000000000B5BDAD008CAD6B0094AD
      7300A5BD840094BD6B009CBD7B009CBD6B007B945A00B5BDB500000000000000
      00000000000000000000000000000000000000000000B5BDAD008CAD6B0094AD
      7300A5BD840094BD6B009CBD7B009CBD6B007B945A00B5BDB500000000000000
      000000000000000000000000000000000000CE6B6B00C67B7B00BD7373009C4A
      4A008C4A4A007BADBD005A9CB5005A848C005A848C00425A6B00000000002931
      42005A9CB500425A6B000000000000000000CE6B6B00C67B7B00BD7373009C4A
      4A008C4A4A007BADBD005A9CB5005A848C005A848C00425A6B00000000002931
      42005A9CB500425A6B000000000000000000000000009CBD7B008CB56B00ADBD
      8C00C6CEA50094AD6B00A5C68C00A5C67B005A7B5A00427B9C005294BD005294
      BD005294BD00CEEFFF000000000000000000000000009CBD7B008CB56B00ADBD
      8C00C6CEA50094AD6B00A5C68C00A5C67B005A7B5A00427B9C005294BD005294
      BD005294BD00CEEFFF000000000000000000CE737300AD636300945A5A009C4A
      4A008C4A4A007BADBD0073849400736352007B3939005A524A004252630039BD
      EF0094CEDE006B8C9C000000000000000000CE737300AD636300945A5A009C4A
      4A008C4A4A007BADBD0073849400736352007B3939005A524A004252630039BD
      EF0094CEDE006B8C9C00000000000000000000000000BDCEA50094B57300A5AD
      9400ADB5B5008CA57300A5BD7B0094BD730052848C0063BDEF00529CCE006BCE
      FF006BC6EF0063ADDE00000000000000000000000000BDCEA50094B57300A5AD
      9400ADB5B5008CA57300A5BD7B0094BD730052848C0063BDEF00529CCE006BCE
      FF006BC6EF0063ADDE000000000000000000BD737300C67B7B00BD737300A55A
      5A008C4A4A0073849400947B6B00D6BD9C00D6BD9C00A56B6B005A524A0094CE
      DE00ADF7FF00000000000000000000000000BD737300C67B7B00BD737300A55A
      5A008C4A4A0073849400947B6B00D6BD9C00D6BD9C00A56B6B005A524A0094CE
      DE00ADF7FF0000000000000000000000000000000000EFF7E70094BD9C007B9C
      8C00396394005A7B7B008CAD73006B9C94005AB5DE0063BDEF004A9CC6006BCE
      FF00CEA542005AA5CE00000000000000000000000000EFF7E70094BD9C007B9C
      8C00396394005A7B7B008CAD73006B9C94005AB5DE0063BDEF004A9CC6006BCE
      FF00CEA542005AA5CE000000000000000000D67B7B00E7949400DE848400AD5A
      5A00A56B6B00BDAD9400EFE7BD00EFE7BD00EFE7BD00E7D6A500D6BD9C005A52
      4A0000000000000000000000000000000000D67B7B00E7949400DE848400AD5A
      5A00A56B6B00BDAD9400EFE7BD00EFE7BD00EFE7BD00E7D6A500D6BD9C005A52
      4A0000000000000000000000000000000000000000000000000063B5DE00528C
      9C00316394003152730063949C0063BDEF0063BDEF0063BDEF004A9CC6006BCE
      FF00E7B55A005AA5CE000000000000000000000000000000000063B5DE00528C
      9C00316394003152730063949C0063BDEF0063BDEF0063BDEF004A9CC6006BCE
      FF00E7B55A005AA5CE000000000000000000DE8C8C00E79C9C00DE8C8C00BD6B
      6B00BD737300DECEB500F7E7CE00F7EFEF00F7E7CE00E7D6AD00E7D6A5005A52
      420000000000000000000000000000000000DE8C8C00E79C9C00DE8C8C00BD6B
      6B00BD737300DECEB500F7E7CE00F7EFEF00F7E7CE00E7D6AD00E7D6A5005A52
      42000000000000000000000000000000000000000000FFFFFF0063ADD6006394
      BD005A8CB500395A7B005284940063C6EF0063BDEF0063BDEF004A9CC6006BCE
      FF00FFFFFF005AA5CE00000000000000000000000000FFFFFF0063ADD6006394
      BD005A8CB500395A7B005284940063C6EF0063BDEF0063BDEF004A9CC6006BCE
      FF00FFFFFF005AA5CE000000000000000000E79C9C00F7ADAD00EFA5A500C67B
      7B00CE848400E7D6CE00FFFFE700FFFFF700FFFFF700EFE7BD00E7D6AD005A52
      420000000000000000000000000000000000E79C9C00F7ADAD00EFA5A500C67B
      7B00CE848400E7D6CE00FFFFE700FFFFF700FFFFF700EFE7BD00E7D6AD005A52
      42000000000000000000000000000000000000000000FFFFFF0084B5DE00A5C6
      DE0084ADCE005284A500395A6B0063B5DE0063BDEF004A84D6003142B5002939
      BD004A4AB500395AA500DEDEE700FFFFFF0000000000FFFFFF0084B5DE00A5C6
      DE0084ADCE005284A500395A6B0063B5DE0063BDEF004A84D6003142B5002939
      BD004A4AB500395AA500DEDEE700FFFFFF00EFA5A500F7B5B500EFA5AD00CE84
      8400C67B7B00B5AD9C00F7EFEF00FFFFF700F7EFEF00EFE7BD00E7D6AD006363
      630000000000000000000000000000000000EFA5A500F7B5B500EFA5AD00CE84
      8400C67B7B00B5AD9C00F7EFEF00FFFFF700F7EFEF00EFE7BD00E7D6AD006363
      63000000000000000000000000000000000000000000FFFFFF008CC6E700CEE7
      F7009CBDE7005A8CB50039526300528CB5004A7BE7003952E700395AE7004A73
      F7005A5AEF002931D6006B6BB500D6D6E70000000000FFFFFF008CC6E700CEE7
      F7009CBDE7005A8CB50039526300528CB5004A7BE7003952E700395AE7004A73
      F7005A5AEF002931D6006B6BB500D6D6E700E79C9C00DE8C8C00CE848400CE84
      8400CE6B6B0094A5A5008C847300E7D6CE00F7E7CE00B5A57B0084736300526B
      7B0000000000000000000000000000000000E79C9C00DE8C8C00CE848400CE84
      8400CE6B6B0094A5A5008C847300E7D6CE00F7E7CE00B5A57B0084736300526B
      7B000000000000000000000000000000000000000000FFFFFF006B9CB5008CA5
      B5006B84940052637300424A4A004A73D6004252DE00528CEF005AADDE0063BD
      F7004273DE002939E7002931DE005A6BBD0000000000FFFFFF006B9CB5008CA5
      B5006B84940052637300424A4A004A73D6004252DE00528CEF005AADDE0063BD
      F7004273DE002939E7002931DE005A6BBD00E7949400FFBDBD00F7B5B500CE84
      8400BD737300ADF7FF009CB5BD00847363006B635A00738C8C00639CAD004A63
      730000000000000000000000000000000000E7949400FFBDBD00F7B5B500CE84
      8400BD737300ADF7FF009CB5BD00847363006B635A00738C8C00639CAD004A63
      73000000000000000000000000000000000000000000FFFFFF006B94AD00636B
      6B00636363005A636B006394AD004A63E700426BC6006BC6F7006BC6F700427B
      DE003952DE005273E7003952EF002139B50000000000FFFFFF006B94AD00636B
      6B00636363005A636B006394AD004A63E700426BC6006BC6F7006BC6F700427B
      DE003952DE005273E7003952EF002139B500E79C9C00C67B7B00BD737300C67B
      7B00C67B7B006B8C9C005A7384007394A5008CC6D60063ADCE0052ADC6004A5A
      6B0000000000000000000000000000000000E79C9C00C67B7B00BD737300C67B
      7B00C67B7B006B8C9C005A7384007394A5008CC6D60063ADCE0052ADC6004A5A
      6B000000000000000000000000000000000000000000000000006BC6EF007BDE
      FF007BDEFF007BDEFF0073DEFF00425ADE004A73B5006BC6F7005A94EF004252
      E7004A73D600DEE7F7005A73EF002931BD0000000000000000006BC6EF007BDE
      FF007BDEFF007BDEFF0073DEFF00425ADE004A73B5006BC6F7005A94EF004252
      E7004A73D600DEE7F7005A73EF002931BD00CE848400DECEB500F7EFEF00CE94
      9400BD7373005A738400E7E7DE00F7EFEF0094B5BD008CC6D6005AC6E7004A63
      730000000000000000000000000000000000CE848400DECEB500F7EFEF00CE94
      9400BD7373005A738400E7E7DE00F7EFEF0094B5BD008CC6D6005AC6E7004A63
      73000000000000000000000000000000000000000000000000006BC6F70084E7
      FF0084E7FF007BDEFF007BDEFF004A63E700425AB500528CDE004A63EF00527B
      E700529CD600FFFFFF006373EF003942B50000000000000000006BC6F70084E7
      FF0084E7FF007BDEFF007BDEFF004A63E700425AB500528CDE004A63EF00527B
      E700529CD600FFFFFF006373EF003942B50000000000D6A59C00AD636300E7E7
      DE00F7EFEF00C67B7B009CB5BD00E7E7DE00FFFFF7009C9484005A848C00526B
      7B000000000000000000000000000000000000000000D6A59C00AD636300E7E7
      DE00F7EFEF00C67B7B009CB5BD00E7E7DE00FFFFF7009C9484005A848C00526B
      7B000000000000000000000000000000000000000000000000006BCEF70084E7
      FF0084E7FF0084E7FF0084DEFF005A8CEF004A5ADE004A5AD6005284DE0073CE
      FF0063B5E700A5A5EF004A52DE006373BD0000000000000000006BCEF70084E7
      FF0084E7FF0084E7FF0084DEFF005A8CEF004A5ADE004A5AD6005284DE0073CE
      FF0063B5E700A5A5EF004A52DE006373BD000000000000000000CE949400DECE
      AD00E7D6CE00E7D6CE00C67B7B00526B7B00E7E7DE00F7EFEF00ADA59400526B
      7B00000000000000000000000000000000000000000000000000CE949400DECE
      AD00E7D6CE00E7D6CE00C67B7B00526B7B00E7E7DE00F7EFEF00ADA59400526B
      7B000000000000000000000000000000000000000000000000006BCEF7006BCE
      F7006BCEF7006BCEF7006BC6F70063ADEF00527BEF004A5ADE00425AB500426B
      AD006373C600525AE700737BD600DEE7EF0000000000000000006BCEF7006BCE
      F7006BCEF7006BCEF7006BC6F70063ADEF00527BEF004A5ADE00425AB500426B
      AD006373C600525AE700737BD600DEE7EF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00D6DEFF008C94EF005A63DE00525A
      DE00636BE700949CEF00DEDEF700FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00D6DEFF008C94EF005A63DE00525A
      DE00636BE700949CEF00DEDEF700FFFFFF000000000000000000000000000000
      0000D6B5B500B57B7B008C525200844A4A00844242009C5A5A00B58C8C00D6B5
      B50000000000000000000000000000000000000000000000000000000000FFFF
      FF00E7E7E700E7E7E700FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00E7E7E700E7E7E700FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7C6C600CE949400B5636B00000000000000
      0000000000000000000000000000000000000000000000000000E7D6D600B573
      7300A5636300AD636300BD6B6B00C6737300C6736B00AD635A00944A4A007B42
      42008C525200D6C6C600000000000000000000000000E7E7E700EFEFEF009C9C
      9C003131310052525200CECECE00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7E700EFEFEF009C9C
      9C003131310052525200CECECE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6948C00D6BDB500E7E7DE00CE9C9C00B5636B000000
      00000000000000000000000000000000000000000000EFD6D600B5737300B573
      7300CE8C8C00CEB5AD00E7CEC600C6737300DEADA500E7C6B500C6A59400B573
      6B008C4A4A0084424A00D6C6C60000000000FFFFFF00186B9400425A6B007B7B
      7B005A6BAD00AD84840052525200CECECE00FFFFFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF00186B9400425A6B007B7B
      7B005A6BAD00AD84840052525200CECECE00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7C6C600BD7B7B00D6BDB500EFF7EF00EFFFEF00EFFFEF00C68C8C00B563
      6B000000000000000000000000000000000000000000C6848400C67B7B00CEA5
      9C00E7D6CE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6C600F7CEC600DEBD
      AD00BD847B008C4A4A008C52520000000000B5CEDE009CDEEF004AC6EF003963
      840042ADFF005A6BB500AD8484004A4A4A008C8C8C00BDBDBD00DEDEDE00F7F7
      F70000000000000000000000000000000000B5CEDE009CDEEF004AC6EF003963
      840042ADFF005A6BB500AD8484004A4A4A008C8C8C00BDBDBD00DEDEDE00F7F7
      F70000000000000000000000000000000000000000000000000000000000C68C
      8C00C6949400E7E7DE00E7EFE700C69C9400BD737300C6C6C600EFFFEF00C68C
      8C00B5636B00000000000000000000000000EFCECE00BD7B7B00D69C9C00E7DE
      D600F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6C600F7CE
      BD00DEBDAD00B5736B007B424200C6A5A500B5CEDE000084B50084E7FF0073DE
      FF003963840042ADFF005A6BB500AD8484000084B5000073A500215A73007373
      7300CECECE00F7F7F7000000000000000000B5CEDE000084B50084E7FF0073DE
      FF003963840042ADFF005A6BB500AD8484000084B5000073A500215A73007373
      7300CECECE00F7F7F700000000000000000000000000DEBDBD00BD7B7B00D6C6
      BD00EFFFEF00D6C6C600C6848400C67B7B00C6737300BD6B6B00C6CECE00EFFF
      EF00C68C8400B5636B000000000000000000DE9C9C00CE8C8C00D6C6BD00FFEF
      E700FFEFE700F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6
      C600F7D6BD00CEA59400944A4A009C6B6B0084ADC6004AA5D600D6F7FF0084E7
      FF0084E7FF003963840042ADFF005A6BB500393942004A3939007B5A5A007B63
      6300393939007B7B7B00E7E7E7000000000084ADC6004AA5D600D6F7FF0084E7
      FF0084E7FF003963840042ADFF005A6BB500393942004A3939007B5A5A007B63
      6300393939007B7B7B00E7E7E70000000000B5948C00BD949400E7F7E700E7EF
      E700BD948C00C6848400CE848400CE7B7B00C67B7B00C67B7B00BD6B6B00C6CE
      CE00EFFFEF00C6848400B5636B0000000000CE848400DE9C9C00F7EFE700FFF7
      EF00FFEFE700FFEFE700F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6
      C600F7D6C600E7C6B500AD5A5A007B42420073A5BD0073CEF700ADDEEF008CF7
      FF008CF7FF008CF7FF003963840094949400CE9C8C00FFF7C600FFFFD600FFFF
      DE00F7EFD6004A4242007B7B7B00FFFFFF0073A5BD0073CEF700ADDEEF008CF7
      FF008CF7FF008CF7FF003963840094949400CE9C8C00FFF7C600FFFFD600FFFF
      DE00F7EFD6004A4242007B7B7B00FFFFFF00BD737300E7EFDE00CEBDBD00BD7B
      7B00C67B7B00C6848400CE848400C6848400C67B8400C67B7B00C67B7B00BD6B
      6B00C6CECE00EFFFEF00C6848400B5636B00CE8C8C00EFA5A500FFFFFF00FFFF
      F700FFF7EF00FFEFE700FFEFE700FFE7DE00DEB5B500DEB5AD00DEB5AD00DEBD
      B500F7D6CE00F7D6C600BD6B6B007B424200639CBD0073D6FF002194C60094FF
      FF0094FFFF0094FFFF0094FFFF00A57B7B00FFF7C600FFF7C600FFFFDE00FFFF
      F700FFFFFF00EFE7C60042424200DEDEDE00639CBD0073D6FF002194C60094FF
      FF0094FFFF0094FFFF0094FFFF00A57B7B00FFF7C600FFF7C600FFFFDE00FFFF
      F700FFFFFF00EFE7C60042424200DEDEDE00C6847B00D6ADAD00C6848400CE94
      8C00CE8C8C00CE8C8C00CE848C00CE848400CE848400CE848400C67B8400C67B
      7B00BD6B6B00C6CECE00EFFFEF00C68C8C00D68C8C00F7ADAD00C6737300FFFF
      FF00FFF7EF00FFF7EF00FFEFE7007B4242007B4242007B4242007B424200F7DE
      D600F7DECE00C6737300C6736B00844A4A003194B5007BD6FF00396B8C00EFFF
      FF00ADFFFF00ADFFFF009CE7E700EFC6A500FFE7AD00FFF7C600FFFFDE00FFFF
      F700FFFFEF00FFFFD6004A424200D6D6D6003194B5007BD6FF00396B8C00EFFF
      FF00ADFFFF00ADFFFF009CE7E700EFC6A500FFE7AD00FFF7C600FFFFDE00FFFF
      F700FFFFEF00FFFFD6004A424200D6D6D600D6A59C00D6ADAD00CE8C8C00DEA5
      9C00DE9C9C00D6949400D6949400D68C9400D68C8C00CE8C8C00CE8C8C00CE84
      8400BD737300BD6B6B00C6CECE00DEE7DE00DE949400EFA5A500FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7EF007B424200DEC6C600F7E7DE00F7E7DE00F7DE
      D600F7DED600E7CEBD00B56B63008C525200318CB5008CE7FF00B5948C006394
      9C000084B50042ADCE006BA5BD00F7D6AD00FFDEA500FFEFBD00FFFFCE00FFFF
      DE00FFFFDE00FFFFD6004A424200D6D6D600318CB5008CE7FF00B5948C006394
      9C000084B50042ADCE006BA5BD00F7D6AD00FFDEA500FFEFBD00FFFFCE00FFFF
      DE00FFFFDE00FFFFD6004A424200D6D6D60000000000D6A59C00EFD6D600D69C
      9400E7ADAD00E7ADAD00DEA5A500DE9CA500DE9C9C00D69C9400D6949400CE8C
      8C00CE848400BD737300BD6B6B00C6B5AD00E7ADAD00E79C9C00E7D6D600FFFF
      FF00FFFFFF00FFF7F700FFF7EF007B424200DEC6BD00FFEFE700F7E7DE00F7E7
      DE00F7DED600CEADA500A5636300BD8484000084B5008CF7FF00B59C9400FFE7
      C600FFD6AD00FFCE9C00EFCEA500CE9C9400FFFFEF00FFEFD600FFEFBD00FFEF
      BD00FFEFBD00FFE7B50042424200F7F7F7000084B5008CF7FF00B59C9400FFE7
      C600FFD6AD00FFCE9C00EFCEA500CE9C9400FFFFEF00FFEFD600FFEFBD00FFEF
      BD00FFEFBD00FFE7B50042424200F7F7F7000000000000000000D6A59C00EFCE
      CE00D69C9400E7B5AD00EFB5B500E7B5B500E7ADAD00DEA5A500DE9C9C00D694
      9400CE8C8C00CE848400BD737300BD6B6B00F7D6D600DE949400E7B5B500F7F7
      F700FFFFFF00FFFFFF00FFFFF7007B424200DEC6BD00F7EFE700FFEFE700F7E7
      DE00E7D6CE00C68C84009C5A5A00DEBDBD000084B5009CFFFF00C6A59400FFE7
      CE00FFE7C600FFDEBD00FFDEB500635A5200F7E7D600FFFFF700FFEFBD00FFF7
      BD00FFE7BD0084636300CECECE00000000000084B5009CFFFF00C6A59400FFE7
      CE00FFE7C600FFDEBD00FFDEB500635A5200F7E7D600FFFFF700FFEFBD00FFF7
      BD00FFE7BD0084636300CECECE0000000000000000000000000000000000D6A5
      9C00EFCECE00D69C9400E7B5B500F7BDBD00EFB5B500EFB5B500E7ADAD00E7AD
      AD00DEA5A500D69C9C00CE8C8C00CE94940000000000E7A5A500E79C9C00DEBD
      BD00F7F7F700FFFFFF00FFFFFF007B424200DEC6C600FFF7EF00FFEFE700EFDE
      D600CE9C9C00B56B6B00AD737300000000007BADCE00EFFFFF00C6AD9C00FFFF
      FF00FFFFFF00FFFFF700FFF7EF00FFEFD60073635A00946B6B00D6AD9400D6AD
      9C005A4A4A00DEDEDE00FFFFFF00000000007BADCE00EFFFFF00C6AD9C00FFFF
      FF00FFFFFF00FFFFF700FFF7EF00FFEFD60073635A00946B6B00D6AD9400D6AD
      9C005A4A4A00DEDEDE00FFFFFF00000000000000000000000000000000000000
      0000D6A59C00EFCECE00D69C9400EFB5B500F7C6C600F7C6C600F7C6C600EFBD
      BD00E7ADAD00D6A5A500DEB5B5000000000000000000FFE7E700E79C9C00E79C
      9C00E7B5B500DECECE00F7EFEF00C6737300FFFFFF00F7EFEF00DECECE00D6A5
      A500BD737300AD737300E7CECE0000000000000000000084BD00CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFF700DEAD7B00DE8442006B84940084B5C600FFFF
      FF0000000000000000000000000000000000000000000084BD00CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFF700DEAD7B00DE8442006B84940084B5C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000D6A59C00EFCECE00D69C9400EFC6C600E7BDBD00E7BDBD00D6AD
      AD00DEB5B5000000000000000000000000000000000000000000FFE7E700E7A5
      A500DE949400E79C9C00E7A5A500EFA5A500EFA5A500DE949400CE848400BD73
      7300BD848400EFD6D60000000000000000000000000000000000D6BDA500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFCE94006B6B6300EFEFEF00000000000000
      0000000000000000000000000000000000000000000000000000D6BDA500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFCE94006B6B6300EFEFEF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6A59C00EFD6D600DEA59C00D6ADAD00DEB5B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7CECE00EFB5B500DE949400D68C8C00CE848400CE848400DE9CA500E7BD
      BD00000000000000000000000000000000000000000000000000ADADAD008484
      840084847B0084736B009C8473008C736B00E7E7E70000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD008484
      840084847B0084736B009C8473008C736B00E7E7E70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEADAD00DEB5B50000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00EFEFEF00CECE
      C600ADB5A50094AD840094AD7B0094A57300A5AD9C00F7F7F700000000000000
      00000000000000000000000000000000000000000000FFFFFF00F7F7F700EFEF
      EF00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600DEDEDE00EFEFEF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00F7F7F700EFEF
      EF00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600DEDEDE00EFEFEF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000D6B5B500B57B7B008C525200844A4A00844242009C5A5A00B58C8C00D6B5
      B5000000000000000000000000000000000000000000B5BDAD008CAD6B0094AD
      7300A5BD840094BD6B009CBD7B009CBD6B007B945A00B5BDB500000000000000
      000000000000000000000000000000000000FFFFFF00E7E7E700C6C6C600A5A5
      A5008C8C8C008484840073737300737373007B7B7B008C8C8C00B5B5B500EFEF
      EF0000000000000000000000000000000000FFFFFF00E7E7E700C6C6C600A5A5
      A5008C8C8C008484840073737300737373007B7B7B008C8C8C00B5B5B500EFEF
      EF00000000000000000000000000000000000000000000000000E7D6D600B573
      7300A5636300AD636300BD6B6B00C6737300C6736B00AD635A00944A4A007B42
      42008C525200D6C6C6000000000000000000000000009CBD7B008CB56B00ADBD
      8C00C6CEA50094AD6B00A5C68C00A5C67B005A7B5A00427B9C005294BD005294
      BD005294BD00CEEFFF000000000000000000E7E7E7009C948C006B5239006B42
      21006B4221008C5221008C521800844A1000734218005A4229008C8C8C00DEDE
      DE0000000000000000000000000000000000E7E7E7009C948C006B5239006B42
      21006B4221008C5221008C521800844A1000734218005A4229008C8C8C00DEDE
      DE000000000000000000000000000000000000000000EFD6D600B5737300B573
      7300CE8C8C00CEB5AD00E7CEC600C6737300DEADA500E7C6B500C6A59400B573
      6B008C4A4A0084424A00D6C6C6000000000000000000BDCEA50094B57300A5AD
      9400ADB5B5008CA57300A5BD7B0094BD730052848C0063BDEF00529CCE006BCE
      FF006BC6EF0063ADDE0000000000000000009C7B63009C5A2100C68C52009C6B
      3900844A2100C6946300CE946300BD7B3900B5733100844A180084848400DEDE
      DE00000000000000000000000000000000009C7B63009C5A2100C68C52009C6B
      3900844A2100C6946300CE946300BD7B3900B5733100844A180084848400DEDE
      DE000000000000000000000000000000000000000000C6848400C67B7B00CEA5
      9C00E7D6CE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6C600F7CEC600DEBD
      AD00BD847B008C4A4A008C5252000000000000000000EFF7E70094BD9C007B9C
      8C00396394005A7B7B008CAD73006B9C94005AB5DE0063BDEF004A9CC6006BCE
      FF00CEA542005AA5CE0000000000000000008C521800C6945A00CE9463009463
      3900EFCECE009C6B3900CE9C6B00CE946300B573390073421800ADADAD00EFEF
      EF00000000000000000000000000000000008C521800C6945A00CE9463009463
      3900EFCECE009C6B3900CE9C6B00CE946300B573390073421800ADADAD00EFEF
      EF0000000000000000000000000000000000EFCECE00BD7B7B00D69C9C00E7DE
      D600F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6C600F7CE
      BD00DEBDAD00B5736B007B424200C6A5A500000000000000000063B5DE00528C
      9C00316394003152730063949C0063BDEF0063BDEF0063BDEF004A9CC6006BCE
      FF00E7B55A005AA5CE00000000000000000094633900CE946300DEAD84009C7B
      5A00FFFFFF00BDA58C00B58C5A00CE946300AD7342007B634A00D6D6D600FFFF
      FF000000000000000000000000000000000094633900CE946300DEAD84009C7B
      5A00FFFFFF00BDA58C00B58C5A00CE946300AD7342007B634A00D6D6D600FFFF
      FF0000000000000000000000000000000000DE9C9C00CE8C8C00D6C6BD00FFEF
      E700FFEFE700F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6
      C600F7D6BD00CEA59400944A4A009C6B6B0000000000FFFFFF0063ADD6006394
      BD005A8CB500395A7B005284940063C6EF0063BDEF0063BDEF004A9CC6006BCE
      FF00FFFFFF005AA5CE000000000000000000AD947B00A5734200E7BD9C00AD7B
      6B00BDCECE009CBDC600846B3900A5734200734A2900C6C6C600F7F7F7000000
      000000000000000000000000000000000000AD947B00A5734200E7BD9C00AD7B
      6B00BDCECE009CBDC600846B3900A5734200734A2900C6C6C600F7F7F7000000
      000000000000000000000000000000000000CE848400DE9C9C00F7EFE700FFF7
      EF00FFEFE700FFEFE700F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6
      C600F7D6C600E7C6B500AD5A5A007B42420000000000FFFFFF0084B5DE00A5C6
      DE0084ADCE005284A500395A6B0063B5DE0063C6EF0063C6EF004A9CC6006BCE
      FF00FFFFFF005AA5CE00000000000000000000000000C6AD9C0094734200006B
      8400107BC600107BC6000873AD005A4218006B6B6B00BDBDBD00F7F7F7000000
      00000000000000000000000000000000000000000000C6AD9C0094734200006B
      8400107BC600107BC6000873AD005A4218006B6B6B00BDBDBD00F7F7F7000000
      000000000000000000000000000000000000CE8C8C00EFA5A500FFFFFF00FFFF
      F700FFF7EF00FFEFE700FFEFE700FFE7DE00DEB5B500DEB5AD00DEB5AD00DEBD
      B500F7D6CE00F7D6C600BD6B6B007B42420000000000FFFFFF008CC6E700CEE7
      F7009CBDE7005A8CB500395263005A94B5006BC6EF006BC6EF0052A5CE006BCE
      FF00FFFFFF005AA5CE00000000000000000000000000000000006B9CBD00298C
      EF00319CFF00319CFF00319CFF00107BC6004A525A009C9C9C00E7E7E7000000
      00000000000000000000000000000000000000000000000000006B9CBD00298C
      EF00319CFF00319CFF00319CFF00107BC6004A525A009C9C9C00E7E7E7000000
      000000000000000000000000000000000000D68C8C00F7ADAD00C6737300FFFF
      FF00FFF7EF00FFF7EF00FFEFE7007B4242007B4242007B4242007B424200F7DE
      D600F7DECE00C6737300C6736B00844A4A0000000000FFFFFF006B9CB5008CA5
      B5006B84940052637300424A4A0063A5C6006BCEF7006BC6F7005AADDE006BCE
      FF006BCEFF0063ADDE00000000000000000000000000000000002184C60039A5
      FF0042A5FF0042A5FF0039A5FF00319CFF00185A7B007B7B7B00D6D6D6000000
      00000000000000000000000000000000000000000000000000002184C60039A5
      FF0042A5FF0042A5FF0039A5FF00319CFF00185A7B007B7B7B00D6D6D6000000
      000000000000000000000000000000000000DE949400EFA5A500FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7EF007B424200DEC6C600F7E7DE00F7E7DE00F7DE
      D600F7DED600E7CEBD00B56B63008C52520000000000FFFFFF006B94AD00636B
      6B00636363005A636B006394AD006BCEF7006BCEF7006BCEF7006BC6F70052B5
      E7005AA5CE00BDEFFF0000000000000000000000000000000000218CCE0042AD
      FF004AB5FF004AB5FF004AADFF0042ADFF00187BBD0073737300D6D6D6000000
      0000000000000000000000000000000000000000000000000000218CCE0042AD
      FF004AB5FF004AB5FF004AADFF0042ADFF00187BBD0073737300D6D6D6000000
      000000000000000000000000000000000000E7ADAD00E79C9C00E7D6D600FFFF
      FF00FFFFFF00FFF7F700FFF7EF007B424200DEC6BD00FFEFE700F7E7DE00F7E7
      DE00F7DED600CEADA500A5636300BD84840000000000000000006BC6EF007BDE
      FF007BDEFF007BDEFF0073DEFF0073D6FF0073D6FF0073CEF7006BCEF7006BCE
      F7005AADCE000000000000000000000000000000000000000000218CCE0052B5
      FF0052BDFF0052BDFF0052B5FF004AB5FF00218CCE0073737300D6D6D6000000
      0000000000000000000000000000000000000000000000000000218CCE0052B5
      FF0052BDFF0052BDFF0052B5FF004AB5FF00218CCE0073737300D6D6D6000000
      000000000000000000000000000000000000F7D6D600DE949400E7B5B500F7F7
      F700FFFFFF00FFFFFF00FFFFF7007B424200DEC6BD00F7EFE700FFEFE700F7E7
      DE00E7D6CE00C68C84009C5A5A00DEBDBD0000000000000000006BC6F70084E7
      FF0084E7FF007BDEFF007BDEFF0073DEFF0073D6FF0073D6FF0073CEF7006BCE
      F7005AADD60000000000000000000000000000000000000000002184BD00319C
      D6002994C60039A5DE004AB5FF0042ADF7002184B50084848400DEDEDE000000
      00000000000000000000000000000000000000000000000000002184BD00319C
      D6002994C60039A5DE004AB5FF0042ADF7002184B50084848400DEDEDE000000
      00000000000000000000000000000000000000000000E7A5A500E79C9C00DEBD
      BD00F7F7F700FFFFFF00FFFFFF007B424200DEC6C600FFF7EF00FFEFE700EFDE
      D600CE9C9C00B56B6B00AD7373000000000000000000000000006BCEF70084E7
      FF0084E7FF0084E7FF007BDEFF007BDEFF0073DEFF0073D6FF0073D6FF0073CE
      F7005AADDE000000000000000000000000000000000000000000398CAD00318C
      BD0052A5D60073B5DE005AA5C600398CB50010739C00ADADAD00EFEFEF000000
      0000000000000000000000000000000000000000000000000000398CAD00318C
      BD0052A5D60073B5DE005AA5C600398CB50010739C00ADADAD00EFEFEF000000
      00000000000000000000000000000000000000000000FFE7E700E79C9C00E79C
      9C00E7B5B500DECECE00F7EFEF00C6737300FFFFFF00F7EFEF00DECECE00D6A5
      A500BD737300AD737300E7CECE000000000000000000000000006BCEF70084E7
      FF0084E7FF0084E7FF0084DEFF007BDEFF007BDEFF007BDEFF007BDEFF007BDE
      FF0063BDEF000000000000000000000000000000000000000000BDD6E7002184
      B50084C6E70094CEEF008CC6E700298CBD006394A500E7E7E700FFFFFF000000
      0000000000000000000000000000000000000000000000000000BDD6E7002184
      B50084C6E70094CEEF008CC6E700298CBD006394A500E7E7E700FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFE7E700E7A5
      A500DE949400E79C9C00E7A5A500EFA5A500EFA5A500DE949400CE848400BD73
      7300BD848400EFD6D600000000000000000000000000000000006BCEF7006BCE
      F7006BCEF7006BCEF7006BC6F7006BC6F7006BC6EF0063C6EF0063C6EF0063BD
      EF00D6E7F700000000000000000000000000000000000000000000000000ADCE
      DE005294BD004294BD00428CB5008CADC600EFEFEF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000ADCE
      DE005294BD004294BD00428CB5008CADC600EFEFEF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7CECE00EFB5B500DE949400D68C8C00CE848400CE848400DE9CA500E7BD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000D6B5B500B57B7B008C525200844A4A00844242009C5A5A00B58C8C00D6B5
      B500000000000000000000000000000000000000000000000000000000000000
      0000D6B5B500B57B7B008C525200844A4A00844242009C5A5A00B58C8C00D6B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000DEDEDE008484840063636300E7E7E70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDD6BD006B9C6B005A8C5A004A844A004A844A004A844A006394630094B5
      9400EFF7EF000000000000000000000000000000000000000000E7D6D600B573
      7300A5636300AD636300BD6B6B00C6737300C6736B00AD635A00944A4A007B42
      42008C525200D6C6C60000000000000000000000000000000000E7D6D600B573
      7300A5636300AD636300BD6B6B00C6737300C6736B00AD635A00944A4A007B42
      42008C525200D6C6C60000000000000000000000000000000000000000000000
      000000000000B5B5B500E7E7E700C6C6C600B5B5B50000000000000000000000
      0000DEDEDE00B5B5B500DEDEDE00000000000000000000000000EFF7EF005A94
      5A0063946300BDCEBD00D6D6D600EFE7E700EFE7EF00D6D6D600BDC6BD007B9C
      7B004A844A00B5CEB500000000000000000000000000EFD6D600B5737300B573
      7300CE8C8C00CEB5AD00E7CEC600C6737300DEADA500E7C6B500C6A59400B573
      6B008C4A4A0084424A00D6C6C6000000000000000000EFD6D600B5737300B573
      7300CE8C8C00CEB5AD00E7CEC600C6737300DEADA500E7C6B500C6A59400B573
      6B008C4A4A0084424A00D6C6C600000000000000000000000000000000000000
      000000000000A5A5A500C6C6C600CECECE00C6C6C6000000000000000000FFFF
      FF0073B5D60063CEE70073737300FFFFFF0000000000EFF7EF005A945A0094B5
      9400F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7DEE700E7DE
      E700B5BDB50042844200C6D6C6000000000000000000C6848400C67B7B00CEA5
      9C00E7D6CE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6C600F7CEC600DEBD
      AD00BD847B008C4A4A008C5252000000000000000000C6848400C67B7B00CEA5
      9C00E7D6CE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6C600F7CEC600DEBD
      AD00BD847B008C4A4A008C525200000000000000000000000000000000000000
      0000000000009C9C9C00ADADAD00ADADAD00D6D6D600000000000000000094B5
      C600B5DEEF0052BDFF007B7B7B00FFFFFF0000000000639C63008CAD8C00F7F7
      F700F7F7F700F7F7F700FFFFFF0084BD84008CC68C00FFFFFF00EFEFEF00DEDE
      DE00DEDEDE00A5B5A50042844200F7F7F700EFCECE00BD7B7B00D69C9C00E7DE
      D600F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6C600F7CE
      BD00DEBDAD00B5736B007B424200C6A5A500EFCECE00BD7B7B00D69C9C00E7DE
      D600F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6C600F7CE
      BD00DEBDAD00B5736B007B424200C6A5A5000000000000000000000000000000
      0000FFFFFF00D6D6D6009494940084848400DEDEDE0000000000FFFFFF00529C
      C60042B5F7007BDEF700C6C6C60000000000DEEFDE00397B3900E7EFE700FFFF
      FF00FFFFFF00FFFFFF00E7F7E70008840800007300009CCE9C00FFFFFF00EFEF
      EF00DEDEDE00E7DEE700638C63008CB58C00DE9C9C00CE8C8C00D6C6BD00FFEF
      E700FFEFE700F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6
      C600F7D6BD00CEA59400944A4A009C6B6B00DE9C9C00CE8C8C00D6C6BD00FFEF
      E700FFEFE700F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6CE00F7D6
      C600F7D6BD00CEA59400944A4A009C6B6B000000000000000000000000000000
      0000E7E7E700848484008C8C8C006B6B6B00E7E7E700FFFFFF0094BDD6007BD6
      FF00319CE70031739400F7F7F7000000000084AD840073A57300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDDEBD0010841000007B0000A5D6A500FFFF
      FF00EFEFEF00E7DEE700ADBDB5004A844A00CE848400DE9C9C00F7EFE700FFF7
      EF00FFEFE700FFEFE700F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6
      C600F7D6C600E7C6B500AD5A5A007B424200CE848400DE9C9C00F7EFE700FFF7
      EF00FFEFE700FFEFE700F7E7DE00F7E7DE00F7E7D600F7DED600F7DECE00F7D6
      C600F7D6C600E7C6B500AD5A5A007B42420000000000FFFFFF00D6D6D600B5B5
      B500A5A5A500ADADAD008C8C8400525A5A00BDBDBD00CED6DE003184BD006BCE
      F70063CEF700BDBDBD000000000000000000528C5200C6D6C600FFFFFF00F7FF
      F700DEEFDE00DEEFDE00DEEFDE00E7F7E7009CCE9C00087B080000840000A5D6
      A500FFFFFF00E7E7E700CED6CE005A8C5A00CE8C8C00EFA5A500FFFFFF00FFFF
      F700FFF7EF00FFEFE700FFEFE700FFE7DE00DEB5B500DEB5AD00DEB5AD00DEBD
      B500F7D6CE00F7D6C600BD6B6B007B424200CE8C8C00EFA5A500FFFFFF00FFFF
      F700FFF7EF00FFEFE700FFEFE700FFE7DE00DEB5B500DEB5AD00DEB5AD00DEBD
      B500F7D6CE00F7D6C600BD6B6B007B42420000000000D6D6D600BDBDBD00ADAD
      AD0073737300B5B5AD004AB5F70052BDFF00315A73004AA5CE0042ADFF001884
      C600317BAD00F7F7F70000000000000000004A8C4A00F7FFF700FFFFFF00CEE7
      CE0010841000108C1000108C1000108C1000188C180008840800007B0000007B
      00009CCE9C00F7EFF700EFE7EF006B946B00D68C8C00F7ADAD00C6737300FFFF
      FF00FFF7EF00FFF7EF00FFEFE7007B4242007B4242007B4242007B424200F7DE
      D600F7DECE00C6737300C6736B00844A4A00D68C8C00F7ADAD00C6737300FFFF
      FF00FFF7EF00FFF7EF00FFEFE7007B4242007B4242007B4242007B424200F7DE
      D600F7DECE00C6737300C6736B00844A4A0000000000ADADAD00BDBDBD00CECE
      CE00FFFFFF008CB5D6007BDEFF004AB5FF009CFFFF006BD6FF003194F7004AB5
      F700ADADAD0000000000000000000000000052945200FFFFFF00FFFFFF00D6E7
      D60039943900319C3100319C3100319C3100399C390008840800007B00000884
      0800B5DEB500F7F7F700EFEFEF006B9C6B00DE949400EFA5A500FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7EF007B424200DEC6C600F7E7DE00F7E7DE00F7DE
      D600F7DED600E7CEBD00B56B63008C525200DE949400EFA5A500FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7EF007B424200DEC6C600F7E7DE00F7E7DE00F7DE
      D600F7DED600E7CEBD00B56B63008C52520000000000BDBDBD00B5B5B500B5B5
      B500E7DEDE0063CEFF0042ADFF004AB5FF009CFFFF0073DEFF00107BBD002984
      BD00D6D6D600FFFFFF00000000000000000073AD7300FFFFFF00FFFFFF00FFFF
      FF00F7FFF700FFFFFF00FFFFFF00FFFFFF0094CE9400007B0000188C1800C6E7
      C600FFFFFF00EFEFEF00E7E7E70052845200E7ADAD00E79C9C00E7D6D600FFFF
      FF00FFFFFF00FFF7F700FFF7EF007B424200DEC6BD00FFEFE700F7E7DE00F7E7
      DE00F7DED600CEADA500A5636300BD848400E7ADAD00E79C9C00E7D6D600FFFF
      FF00FFFFFF00FFF7F700FFF7EF007B424200DEC6BD00FFEFE700F7E7DE00F7E7
      DE00F7DED600CEADA500A5636300BD84840000000000CECECE00BDBDBD009494
      9400A5C6E70094FFFF002994FF00427BA50031738C00A5EFFF00319CFF0042A5
      EF0063636B00EFEFEF0000000000000000008CBD8C00DEFFDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A5D6A500007B000008840800C6E7C600FFFF
      FF00F7F7F700EFEFEF00CED6CE004A844A00F7D6D600DE949400E7B5B500F7F7
      F700FFFFFF00FFFFFF00FFFFF7007B424200DEC6BD00F7EFE700FFEFE700F7E7
      DE00E7D6CE00C68C84009C5A5A00DEBDBD00F7D6D600DE949400E7B5B500F7F7
      F700FFFFFF00FFFFFF00FFFFF7007B424200DEC6BD00F7EFE700FFEFE700F7E7
      DE00E7D6CE00C68C84009C5A5A00DEBDBD00FFFFFF00E7E7E700C6C6C6009C9C
      94007BCEFF00EFFFFF002994FF004A94CE00BD9C9C00425A6B00A5D6FF005ABD
      FF00527B9C00FFFFFF000000000000000000DEEFDE009CCE9C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFF7EF00188C1800007B0000B5DEB500FFFFFF00FFFF
      FF00F7F7F700F7F7F7005A8C5A00D6E7D60000000000E7A5A500E79C9C00DEBD
      BD00F7F7F700FFFFFF00FFFFFF007B424200DEC6C600FFF7EF00FFEFE700EFDE
      D600CE9C9C00B56B6B00AD7373000000000000000000E7A5A500E79C9C00DEBD
      BD00F7F7F700FFFFFF00FFFFFF007B424200DEC6C600FFF7EF00FFEFE700EFDE
      D600CE9C9C00B56B6B00AD7373000000000000000000A5A5A500EFEFEF00FFFF
      FF00DED6D60073BDFF00F7FFFF006BC6FF008CEFF700D69C9C00218CEF004AB5
      FF00C6C6C600000000000000000000000000000000008CC68C00DEF7DE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDDEBD00ADD6AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B5CEB500639C6300FFFFFF0000000000FFE7E700E79C9C00E79C
      9C00E7B5B500DECECE00F7EFEF00C6737300FFFFFF00F7EFEF00DECECE00D6A5
      A500BD737300AD737300E7CECE000000000000000000FFE7E700E79C9C00E79C
      9C00E7B5B500DECECE00F7EFEF00C6737300FFFFFF00F7EFEF00DECECE00D6A5
      A500BD737300AD737300E7CECE000000000000000000EFC69C0052525200ADAD
      AD0094949400C6BDBD00A5C6E700BDFFFF008CBDBD00C694940039A5FF003984
      C600EFEFEF0000000000000000000000000000000000EFF7EF0084BD8400E7F7
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDD6BD0094B59400FFFFFF00000000000000000000000000FFE7E700E7A5
      A500DE949400E79C9C00E7A5A500EFA5A500EFA5A500DE949400CE848400BD73
      7300BD848400EFD6D60000000000000000000000000000000000FFE7E700E7A5
      A500DE949400E79C9C00E7A5A500EFA5A500EFA5A500DE949400CE848400BD73
      7300BD848400EFD6D6000000000000000000000000009C9C9C00EFCEAD005A5A
      5A00636363006B6B6B00636363006B6B6B00CEADAD0094D6CE0042A5FF009CA5
      AD00FFFFFF000000000000000000000000000000000000000000E7F7E70094C6
      9400A5D6A500EFFFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEE7CE0084B5
      84008CB58C00F7F7F70000000000000000000000000000000000000000000000
      0000F7CECE00EFB5B500DE949400D68C8C00CE848400CE848400DE9CA500E7BD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000F7CECE00EFB5B500DE949400D68C8C00CE848400CE848400DE9CA500E7BD
      BD00000000000000000000000000000000000000000000000000CED6D6009C94
      9400C6C6BD00CECECE00ADA5A5008C8C8C00EFEFEF00C6E7FF00D6E7F700FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00CEE7CE009CCE9C009CCE9C0084BD840073AD730073AD730094C69400E7EF
      E700FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADBDCE006B94
      AD00638CA5005A8CA5005A849C005A849C00527B9400527B94004A738C004A6B
      8C00426B84004263840063849C00000000000000000000000000ADBDCE006B94
      AD00638CA5005A8CA5005A849C005A849C00527B9400527B94004A738C004A6B
      8C00426B84004263840063849C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5B5C600426B8400C6AD
      AD00E7C6AD00DEBDAD00DEBDA500D6B5A500CEB59C00CEAD9C00C6AD9C00BDA5
      9400C6A59400A594940063849C000000000000000000A5B5C600426B8400C6AD
      AD00E7C6AD00DEBDAD00DEBDA500D6B5A500CEB59C00CEAD9C00C6AD9C00BDA5
      9400C6A59400A594940063849C00000000000000000000000000000000000000
      0000B5A594007B634A00634A3900634A3100634A3100634A3100634A3100634A
      3100634A3100634A3100634A3100634A31000000000000000000000000000029
      0000004200000863080008630800218C2100188C1800107B1000086308000031
      000000000000000000000000000000000000000000004A738C00426B8C004A73
      8C005273940063849C00849CB500ADBDCE00D6DEE700FFFFFF00FFFFFF00FFFF
      FF00F7EFE700A5948C0063849C0000000000000000004A738C00426B8C004A73
      8C005273940063849C00849CB500ADBDCE00D6DEE700FFFFFF00FFFFFF00FFFF
      FF00F7EFE700A5948C0063849C00000000000000000000000000000000007B63
      4A00BDA59400FFF7EF00085ACE001852AD0000429400ADA5A500FFE7D600F7D6
      C600F7D6C600F7D6C600DEB59C00634A31000000000000000000006300000000
      000000420000000000000000000000000000000000000000000000000000107B
      1000000000000000000000000000000000000000000042637B004A738C00219C
      CE0008A5DE001094CE00188CBD00107BB500106B9C002984AD00638CA500BDD6
      DE00FFF7EF00A594940063849C00000000000000000042637B004A738C00219C
      CE0008A5DE001094CE00188CBD00107BB500106B9C002984AD00638CA500BDD6
      DE00FFF7EF00A594940063849C0000000000000000000000000000000000EFDE
      D600BDAD9C00EFEFF70063A5F7004284DE00004AA50000429400FFEFDE00BD94
      8400BD948400BD948400DEB59C00634A31000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000086B
      0800000000000000000000000000000000000000000042637B004A73940018AD
      DE0000ADEF0000ADEF0000ADEF0000ADEF0000A5E700009CDE000873A500849C
      B500FFFFF700AD9C9400638CA500000000000000000042637B004A73940018AD
      DE0000ADEF0000ADEF0000ADEF0000ADEF0000A5E700009CDE000873A500849C
      B500FFFFF700AD9C9400638CA5000000000000000000B5A594007B634A00FFF7
      EF00BDAD9C00EFEFF70063A5F7001852AD00296BD6001852AD00FFEFE700FFDE
      CE00F7DECE00F7DEC600DEBDA500634A31000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042AD4200004A
      000000000000000000000000000000000000000000004A6B8400527B940029AD
      DE0010B5EF0008ADEF0000A5EF0000A5E70000A5E70000A5EF00007BB500849C
      B500FFFFF700ADA59C006B8CA50000000000000000004A6B8400527B940029AD
      DE0010B5EF0008ADEF0000A5EF0000A5E70000A5E70000A5EF00007BB500849C
      B500FFFFF700ADA59C006B8CA500000000007B634A00BDA59400FFF7EF00EFEF
      F700C6B5A500FFFFFF0029292900B5B5B5007B7B7B00FFFFFF00FFFFF700FFEF
      E700FFEFE700FFEFDE00D6BDB500634A310000000000000000000063000042A5
      4200000000000000000000000000000000000000000042A54200005A00000000
      000000000000000000000000000000000000000000004A7384005A849C0042B5
      E70029BDEF0010B5EF0000ADEF0000A5EF0000A5E70000ADEF000084B500849C
      B500FFFFF700B5ADA5006B94A50000000000000000004A7384005A849C0042B5
      E70029BDEF0010B5EF0000ADEF0000A5EF0000A5E70000ADEF000084B500849C
      B500FFFFF700B5ADA5006B94A50000000000EFDED600BDAD9C00EFEFF700FFFF
      F700CEB5AD00FFFFFF004A4A4A00E7E7E700C6C6C600DEDEDE00FFF7F700F7B5
      8C00F7AD8400FFA57B00D6C6B500634A31000000000000000000000000000063
      0000217B290000000000000000000000000000000000004A3900000000000000
      0000000000000000000000000000000000000000000052738C005A84A50052BD
      E70039C6F70021BDEF0010B5EF00D6CEC600634A3100634A3100634A3100634A
      3100634A3100634A3100634A3100D6CEC6000000000052738C005A84A50052BD
      E70039C6F70021BDEF0010B5EF00D6CEC600634A3100634A3100634A3100634A
      3100634A3100634A3100634A3100D6CEC600FFF7EF00BDAD9C00EFEFF700FFFF
      FF00CEBDAD00FFFFFF007373730094949C0094949C00E7DEDE00FFFFFF00FFFF
      F700FFFFF700FFF7EF00CECEC600634A39000000000000000000000000000000
      0000004200000042000000000000000000000000000000420000001018000000
      00000000000000000000000000000000000000000000527B8C00638CA50063C6
      E70052CEF70039C6EF0021B5EF00BDA59400F7E7DE00DEC6B500DEBDAD00DEBD
      AD00D6BDA500D6BDA500D6B5A500634A310000000000527B8C00638CA50063C6
      E70052CEF70039C6EF0021B5EF00BDA59400F7E7DE00DEC6B500DEBDAD00DEBD
      AD00D6BDA500D6BDA500D6B5A500634A3100EFEFF700C6B5A500FFFFFF00FFFF
      FF00D6C6B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007B634A000000000000000000000000000000
      0000000000000063000000000000000000000000000000000000004200000000
      000000000000000000000000000000000000000000005A8494006394AD0073CE
      E70063D6F7004ACEEF0031BDEF00BDA59400FFEFE700F7E7DE00F7DED600634A
      3100F7D6CE00EFD6C600D6BDA500634A3100000000005A8494006394AD0073CE
      E70063D6F7004ACEEF0031BDEF00BDA59400FFEFE700F7E7DE00F7DED600634A
      3100F7D6CE00EFD6C600D6BDA500634A3100FFFFF700CEB5AD00FFFFFF00FFFF
      FF00D6C6B500D6C6B500CEBDAD00CEBDAD00CEB5AD00C6B5A500C6ADA500BDA5
      9400BDA59400B5A59400B5A59400B5A594000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A849C006B9CAD0084D6
      EF007BDEF70063D6F7004ACEF700BDA59400FFF7EF00F7EFE700F7E7DE00634A
      3100F7DECE00F7D6CE00D6BDA500634A3100000000005A849C006B9CAD0084D6
      EF007BDEF70063D6F7004ACEF700BDA59400FFF7EF00F7EFE700F7E7DE00634A
      3100F7DECE00F7D6CE00D6BDA500634A3100FFFFFF00CEBDAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000638C9C006B9CB50094DE
      EF008CE7F70073DEF7005AD6F700BDA59400FFF7F700634A3100634A3100634A
      3100634A3100634A3100DEBDAD00634A310000000000638C9C006B9CB50094DE
      EF008CE7F70073DEF7005AD6F700BDA59400FFF7F700634A3100634A3100634A
      3100634A3100634A3100DEBDAD00634A3100FFFFFF00D6C6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007B634A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000638CA50073A5B500ADEF
      F700A5F7FF0094EFFF0073DEFF00BDAD9C00FFF7F700FFF7EF00FFEFE700634A
      3100F7E7DE00F7DED600DEBDAD00634A310000000000638CA50073A5B500ADEF
      F700A5F7FF0094EFFF0073DEFF00BDAD9C00FFF7F700FFF7EF00FFEFE700634A
      3100F7E7DE00F7DED600DEBDAD00634A3100FFFFFF00D6C6B500D6C6B500CEBD
      AD00CEBDAD00CEB5AD00C6B5A500C6ADA500BDA59400BDA59400B5A59400B5A5
      9400B5A594000000000000000000000000000000000000000000000000000000
      0000004200000063000000000000000000000000000000630000000000000000
      000000000000000000000000000000000000000000008CB5BD00739CAD007BAD
      BD007BB5C6007BBDCE007BC6DE00C6AD9C00FFFFFF00FFF7F700FFF7EF00634A
      3100F7EFE700F7E7DE00DEC6AD00634A3100000000008CB5BD00739CAD007BAD
      BD007BB5C6007BBDCE007BC6DE00C6AD9C00FFFFFF00FFF7F700FFF7EF00634A
      3100F7EFE700F7E7DE00DEC6AD00634A3100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063000000630000217B29000063000000630000004200000000
      0000000000000000000000000000000000000000000000000000FFFFFF00DEEF
      EF00C6D6DE00ADC6D60094B5C600C6AD9C00FFFFFF00FFFFFF00FFF7F700FFF7
      F700FFF7EF00FFEFE700F7E7DE00634A31000000000000000000FFFFFF00DEEF
      EF00C6D6DE00ADC6D60094B5C600C6AD9C00FFFFFF00FFFFFF00FFF7F700FFF7
      F700FFF7EF00FFEFE700F7E7DE00634A31000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000042000000000000000000000000000000420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFEFF700EFEFE700C6AD9C00C6AD9C00BDAD9C00BDA5
      9C00BDA59400BDA59400BDA59400D6CEC6000000000000000000000000000000
      00000000000000000000EFEFF700EFEFE700C6AD9C00C6AD9C00BDAD9C00BDA5
      9C00BDA59400BDA59400BDA59400D6CEC6000000000000000000EFEFEF00CECE
      CE00CECECE00F7F7F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0073635A007373
      73009C84A5007B7B7B00F7F7F700000000000000000000000000000000000000
      000000000000000000000000000000000000B5A59400634A3100634A3100634A
      3100634A3900634A3100634A3100634A3100634A3100634A3100634A3100634A
      3100634A3100634A3100634A3100634A3100B5A59400634A3100634A3100634A
      3100634A3900634A3100634A3100634A3100634A3100634A3100634A3100634A
      3100634A3100634A3100634A3100634A31000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF006B5A5A0052BD
      FF003973CE00A58CA5007B737300F7F7F7000000000000000000000000000000
      000000000000000000000000000000000000BDA59C00D6B59C00C69C8400B58C
      6B00DEBDA500CEAD8C00B58C7300DEBDA500C69C8400B58C7300D6B59C00C69C
      8400B58C6B00D6AD8C00BD9C7B00634A3100BDA59C00D6B59C00C69C8400B58C
      6B00DEBDA500CEAD8C00B58C7300DEBDA500C69C8400B58C7300D6B59C00C69C
      8400B58C6B00D6AD8C00BD9C7B00634A31000000000000000000000000000000
      0000B5A594007B634A00634A3900634A3100634A3100634A3100634A3100634A
      3100634A3100634A3100634A3100634A3100FFFFFF00E7E7E700BDBDBD005A5A
      630052C6FF003973CE00A58CA5007B737300F7F7F70000000000000000000000
      000000000000000000000000000000000000BDAD9C00FFFFFF00FFFFFF00C69C
      7B00FFFFFF00FFFFF700C69C7B00FFF7EF00FFF7EF00BD947B00FFEFDE00FFEF
      E700C69C7B00FFDECE00D6BDAD00634A3100BDAD9C00FFFFFF00FFFFFF00C69C
      7B00FFFFFF00FFFFF700C69C7B00FFF7EF00FFF7EF00BD947B00FFEFDE00FFEF
      E700C69C7B00FFDECE00D6BDAD00634A31000000000000000000000000007B63
      4A00BDA59400FFF7EF00085ACE001852AD0000429400ADA5A500FFE7D600F7D6
      C600F7D6C600F7D6C600DEB59C00634A3100AD390800CE421800E7523100F763
      4A0084525A0052C6FF003973CE00AD8CAD009C9C9C00DEDEDE00B5B5B500BDB5
      B500DEDEDE00FFFFFF000000000000000000C6AD9C00FFFFFF00FFFFFF00CEA5
      8C00FFFFFF00FFFFFF00CEA58400FFF7F700FFF7EF00CEA58400FFEFE700FFEF
      DE00CEA58400FFE7D600D6BDAD00634A3100C6AD9C00FFFFFF00FFFFFF00CEA5
      8C00FFFFFF00FFFFFF00CEA58400FFF7F700FFF7EF00CEA58400FFEFE700FFEF
      DE00CEA58400FFE7D600D6BDAD00634A3100000000000000000000000000EFDE
      D600BDAD9C00EFEFF70063A5F7004284DE00004AA50000429400FFEFDE00BD94
      8400BD948400BD948400DEB59C00634A3100C6421000EF5A4200FF6B5A00FF7B
      6300DE6B4200847B7B0052C6FF006B84AD007B5A4A00A5736B00D6B59400E7CE
      B500A5847B00847B7B00F7F7F70000000000C6AD9C00D6AD9400C69C7B00B58C
      6B00CEA58400BD947B00B58C6B00CEA58400BD947B000842E7000839DE000831
      C6000029B500CEA58400BD947B00634A3100C6AD9C00D6AD9400C69C7B00B58C
      6B00CEA58400BD947B00B58C6B00CEA58400BD947B000842E7000839DE000831
      C6000029B500CEA58400BD947B00634A310000000000B5A594007B634A00FFF7
      EF00BDAD9C00EFEFF70063A5F7001852AD00296BD6001852AD00FFEFE700FFDE
      CE00F7DECE00F7DEC600DEBDA500634A3100AD421000FF6B5200FF846300FF94
      7300E7A57300FFD6A500B55A4A009C7B7300EFB59400FFFFCE00FFFFD600FFFF
      DE00FFFFEF00E7CEC60073737300FFFFFF00C6ADA500FFFFFF00FFFFFF00BD94
      7B00FFFFFF00FFFFFF00BD947B00FFFFFF00FFF7F7002963F700FFF7F700FFF7
      F7000831C600FFE7DE00D6C6B500634A3100C6ADA500FFFFFF00FFFFFF00BD94
      7B00FFFFFF00FFFFFF00BD947B00FFFFFF00FFF7F7002963F700FFF7F700FFF7
      F7000831C600FFE7DE00D6C6B500634A31007B634A00BDA59400FFF7EF00EFEF
      F700C6B5A500FFFFFF0029292900B5B5B5007B7B7B00FFFFFF00FFFFF700FFEF
      E700FFEFE700FFEFDE00D6BDB500634A3100DEDEDE00CE4A2100FF8C7300BD4A
      1800FFC69400FFCE9400BD522900CE9C8C00FFFFCE00FFF7BD00FFFFDE00FFFF
      EF00FFFFFF00FFFFF700AD7B7300DEDEDE00C6B5A500FFFFFF00FFFFFF00CEA5
      8400FFFFFF00FFFFFF00CEA58400FFFFFF00FFFFFF005A84FF00FFFFFF00FFF7
      F7000839DE00FFEFE700D6C6BD00634A3100C6B5A500FFFFFF00FFFFFF00CEA5
      8400FFFFFF00FFFFFF00CEA58400FFFFFF00FFFFFF005A84FF00FFFFFF00FFF7
      F7000839DE00FFEFE700D6C6BD00634A3100EFDED600BDAD9C00EFEFF700FFFF
      F700CEB5AD00FFFFFF004A4A4A00E7E7E700C6C6C600DEDEDE00FFF7F700F7B5
      8C00F7AD8400FFA57B00D6C6B500634A3100FFFFFF00B5B5B5005A2100000008
      6B000821840000086B0084391800F7D6B500FFE7AD00FFEFBD00FFFFD600FFFF
      EF00FFFFEF00FFFFDE00EFD6B500ADADAD00CEB5A500D6AD9400C69C7B00B58C
      6B00CEA58400BD947B00B58C6B00CEA58400BD947B007B9CFF005A84FF002963
      F7000842E700CEA58400C69C7B00634A3100CEB5A500D6AD9400C69C7B00B58C
      6B00CEA58400BD947B00B58C6B00CEA58400BD947B007B9CFF005A84FF002963
      F7000842E700CEA58400C69C7B00634A3100FFF7EF00BDAD9C00EFEFF700FFFF
      FF00CEBDAD00FFFFFF007373730094949C0094949C00E7DEDE00FFFFFF00FFFF
      F700FFFFF700FFF7EF00CECEC600634A39004242420008080800000000001039
      A5001042AD001042A50021215A00F7DEBD00FFDEAD00FFEFB500FFFFCE00FFFF
      D600FFFFDE00FFFFD600EFD6AD00A5A5A500CEB5A500FFFFFF00FFFFFF00BD94
      7B00FFFFFF00FFFFFF00BD947B00FFFFFF00FFFFFF00BD947B00FFFFFF00FFF7
      F700BD947B00FFF7EF00E7DED600634A3900CEB5A500FFFFFF00FFFFFF00BD94
      7B00FFFFFF00FFFFFF00BD947B00FFFFFF00FFFFFF00BD947B00FFFFFF00FFF7
      F700BD947B00FFF7EF00E7DED600634A3900EFEFF700C6B5A500FFFFFF00FFFF
      FF00D6C6B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007B634A00101010001818180010398C00185A
      BD00185AC600185AC600184AA500DEB59C00FFFFEF00FFEFCE00FFE7B500FFEF
      BD00FFF7BD00FFFFCE00C6948400D6D6D600CEB5A500FFFFFF00FFFFFF00CEA5
      8400FFFFFF00FFFFFF00CEA58400FFFFFF00FFFFFF00CEA58400FFFFFF00FFFF
      FF00CEA58400FFF7F700FFF7EF00634A3100CEB5A500FFFFFF00FFFFFF00CEA5
      8400FFFFFF00FFFFFF00CEA58400FFFFFF00FFFFFF00CEA58400FFFFFF00FFFF
      FF00CEA58400FFF7F700FFF7EF00634A3100FFFFF700CEB5AD00FFFFFF00FFFF
      FF00D6C6B500D6C6B500CEBDAD00CEBDAD00CEB5AD00C6B5A500C6ADA500BDA5
      9400BDA59400B5A59400B5A59400B5A59400212121002929290018529C002173
      DE00297BE7002973DE00216BD600634A4A00FFF7EF00FFFFFF00FFE7BD00FFDE
      A500FFF7C600FFD6AD005A525200FFFFFF00EFAD8C00EFAD8C00EFAD8400EFA5
      8400EFA57B00EF9C7300E7947300E7946B00E78C6300E78C5A00E7845200E77B
      4A00E77B4200DE733900DE733900CE6B3900EFAD8C00EFAD8C00EFAD8400EFA5
      8400EFA57B00EF9C7300E7947300E7946B00E78C6300E78C5A00E7845200E77B
      4A00E77B4200DE733900DE733900CE6B3900FFFFFF00CEBDAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000292929003939390000101800319C
      FF00319CFF00319CFF00298CF7006B7B94007B635A00D6AD9C00F7E7B500FFDE
      B500EFBDA500635A5A00EFEFEF0000000000EFAD8C00FFEFE700FFEFE700FFEF
      E700FFEFDE00FFEFDE00FFE7DE00FFAD8C00FFAD8400F7A57B00F7A57B00F7A5
      7B00F7A57B00F7A57B00F79C7300CE6B3900EFAD8C00FFEFE700FFEFE700FFEF
      E700FFEFDE00FFEFDE00FFE7DE00FFAD8C00FFAD8400F7A57B00F7A57B00F7A5
      7B00F7A57B00F7A57B00F79C7300CE6B3900FFFFFF00D6C6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007B634A00000000000000000000000000080808004A4A4A00525252001818
      1800082163001852D6001852A500CECECE00F7F7F700D6D6D600B5B5B500B5B5
      B500DEDEDE00FFFFFF000000000000000000EFAD8C00EFA58C00EFA58400E7A5
      7B00E79C7B00E7947300E7946B00DE8C6300DE845A00DE845200D67B5200D673
      4A00D6734200D66B3900D66B3900CE6B3100EFAD8C00EFA58C00EFA58400E7A5
      7B00E79C7B00E7947300E7946B00DE8C6300DE845A00DE845200D67B5200D673
      4A00D6734200D66B3900D66B3900CE6B3100FFFFFF00D6C6B500D6C6B500CEBD
      AD00CEBDAD00CEB5AD00C6B5A500C6ADA500BDA59400BDA59400B5A59400B5A5
      9400B5A59400000000000000000000000000C6C6C600424242006B6B6B008C8C
      8C00BDBDBD006B6B6B0008080800F7F7F7000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500FFFFFF008C8C8C00FFFF
      FF008C8C8C00FFFFFF0084848400FFFFFF0084848400FFFFFF0073737300FFFF
      FF0063636300FFFFFF005A5A5A00D6D6D600A5A5A500FFFFFF008C8C8C00FFFF
      FF008C8C8C00FFFFFF0084848400FFFFFF0084848400FFFFFF0073737300FFFF
      FF0063636300FFFFFF005A5A5A00D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFFFF00BDBDBD00181818007B7B
      7B005A5A5A0008080800DEDEDE00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0021212100E7E7DE002121
      2100E7E7E70021212100EFE7E70021212100CECECE0021212100D6D6D6002121
      2100EFEFEF0021212100E7E7E700A5A5A500FFFFFF0021212100E7E7DE002121
      2100E7E7E70021212100EFE7E70021212100CECECE0021212100D6D6D6002121
      2100EFEFEF0021212100E7E7E700A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00F7F7F700EFEF
      EF00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600DEDEDE00EFEFEF00FFFF
      FF00000000000000000000000000000000000000000000000000EFEFEF00CECE
      CE00CECECE00F7F7F70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7DE
      CE00DEBDAD00DEBDAD00DEB5A500D6B5A500D6B59C00D6AD9400D6AD9400D6A5
      8C00CEA58C00CE9C84000000000000000000000000000000000000000000F7DE
      CE00DEBDAD00DEBDAD00DEB5A500D6B5A500D6B59C00D6AD9400D6AD9400D6A5
      8C00CEA58C00CE9C84000000000000000000FFFFFF00E7E7E700C6C6C600A5A5
      A5008C8C8C008484840073737300737373007B7B7B008C8C8C00B5B5B500EFEF
      EF000000000000000000000000000000000000000000FFFFFF0073635A007373
      73009C84A5007B7B7B00F7F7F700000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7DE
      D600F7E7D600F7DED600F7DECE00F7DECE00F7D6C600F7D6C600F7CEBD00F7CE
      BD00EFCEBD00CEA58C000000000000000000000000000000000000000000F7DE
      D600F7E7D600F7DED600F7DECE00F7DECE00F7D6C600F7D6C600F7CEBD00F7CE
      BD00EFCEBD00CEA58C000000000000000000E7E7E7009C948C006B5239006B42
      21006B4221008C5221008C521800844A1000734218005A4229008C8C8C00DEDE
      DE000000000000000000000000000000000000000000FFFFFF006B5A5A0052BD
      FF003973CE00A58CA5007B737300F7F7F7000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7E7
      DE00FFE7DE00F7E7DE00F7E7D600F7DED6008C424200946B6300EFCEC600F7D6
      C600F7CEBD00D6A58C000000000000000000000000000000000000000000F7E7
      DE00FFE7DE00F7E7DE00F7E7D600F7DED6008C424200946B6300EFCEC600F7D6
      C600F7CEBD00D6A58C0000000000000000009C7B63009C5A2100C68C52009C6B
      3900844A2100C6946300CE946300BD7B3900B5733100844A180084848400DEDE
      DE0000000000000000000000000000000000FFFFFF00E7E7E700BDBDBD005A5A
      630052C6FF003973CE00A58CA5007B737300F7F7F70000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFE7
      DE00FFEFE700F7E7DE00A55A5A00AD5A5A00CE6B6B009C4A4A00A54A4A007331
      3100F7D6C600D6AD94000000000000000000000000000000000000000000FFE7
      DE00FFEFE700F7E7DE00A55A5A00AD5A5A00CE6B6B009C4A4A00A54A4A007331
      3100F7D6C600D6AD940000000000000000008C521800C6945A00CE9463009463
      3900EFCECE009C6B3900CE9C6B00CE946300B573390073421800ADADAD00EFEF
      EF0000000000000000000000000000000000AD390800CE421800E7523100F763
      4A0084525A0052C6FF003973CE00AD8CAD009C9C9C00DEDEDE00B5B5B500BDB5
      B500DEDEDE00FFFFFF000000000000000000000000000000000000000000FFEF
      E700FFF7EF00EFD6CE00C69C9400E78C8C00AD737300B55A5A00CE636300E7C6
      BD00F7D6CE00D6AD9C000000000000000000000000000000000000000000FFEF
      E700FFF7EF00EFD6CE00C69C9400E78C8C00AD737300B55A5A00CE636300E7C6
      BD00F7D6CE00D6AD9C00000000000000000094633900CE946300DEAD84009C7B
      5A00FFFFFF00BDA58C00B58C5A00CE946300AD7342007B634A00D6D6D600FFFF
      FF0000000000000000000000000000000000C6421000EF5A4200FF6B5A00FF7B
      6300DE6B4200847B7B0052C6FF006B84AD007B5A4A00A5736B00D6B59400E7CE
      B500A5847B00847B7B00F7F7F700000000000000000000000000000000008C42
      420094737300DE949C00F7ADAD00B56B6B00FFEFE700EFCECE00D66B6B00B552
      5200F7DED600D6B59C0000000000000000000000000000000000000000008C42
      420094737300DE949C00F7ADAD00B56B6B00FFEFE700EFCECE00D66B6B00B552
      5200F7DED600D6B59C000000000000000000AD947B00A5734200E7BD9C00AD7B
      6B00BDCECE009CBDC600846B3900A5734200734A2900C6C6C600F7F7F7000000
      000000000000000000000000000000000000AD421000FF6B5200FF846300FF94
      7300E7A57300FFD6A500B55A4A009C7B7300EFB59400FFFFCE00FFFFD600FFFF
      DE00FFFFEF00E7CEC60073737300FFFFFF00FFFFFF00A55A5A00AD5A5A00CE6B
      6B009C4A4A00A54A4A008C424A00FFADAD00945A5A00C6737300BD636300F7E7
      DE00F7E7D600D6B5A5000000000000000000FFFFFF00A55A5A00AD5A5A00CE6B
      6B009C4A4A00A54A4A008C424A00FFADAD00945A5A00C6737300BD636300F7E7
      DE00F7E7D600D6B5A500000000000000000000000000C6AD9C0094734200006B
      8400107BC600107BC6000873AD005A4218006B6B6B00BDBDBD00F7F7F7000000
      000000000000000000000000000000000000DEDEDE00CE4A2100FF8C7300BD4A
      1800FFC69400FFCE9400BD522900CE9C8C00FFFFCE00FFF7BD00FFFFDE00FFFF
      EF00FFFFFF00FFFFF700AD7B7300DEDEDE00EFE7E700CEA5A500E78C8C00AD73
      7300B55A5A00CE636300BD7B7B007B393900F7A5A500A55A5A00E78C8C00D6AD
      AD00FFE7DE00DEBDA5000000000000000000EFE7E700CEA5A500E78C8C00AD73
      7300B55A5A00CE636300BD7B7B007B393900F7A5A500A55A5A00E78C8C00D6AD
      AD00FFE7DE00DEBDA500000000000000000000000000000000006B9CBD00298C
      EF00319CFF00319CFF00319CFF00107BC6004A525A009C9C9C00E7E7E7000000
      000000000000000000000000000000000000FFFFFF00B5B5B5005A2100000008
      6B000821840000086B0084391800F7D6B500FFE7AD00FFEFBD00FFFFD600FFFF
      EF00FFFFEF00FFFFDE00EFD6B500ADADAD00DE9C9C00F7ADAD00B56B6B00FFFF
      FF00F7E7E700D66B6B00B5525200FFFFFF00DE949400DEB5B500FFF7EF00FFEF
      EF00FFEFE700DEBDAD000000000000000000DE9C9C00F7ADAD00B56B6B00FFFF
      FF00F7E7E700D66B6B00B5525200FFFFFF00DE949400DEB5B500FFF7EF00FFEF
      EF00FFEFE700DEBDAD00000000000000000000000000000000002184C60039A5
      FF0042A5FF0042A5FF0039A5FF00319CFF00185A7B007B7B7B00D6D6D6000000
      0000000000000000000000000000000000004242420008080800000000001039
      A5001042AD001042A50021215A00F7DEBD00FFDEAD00FFEFB500FFFFCE00FFFF
      D600FFFFDE00FFFFD600EFD6AD00A5A5A50000000000CEADAD00FFADAD00945A
      5A00C6737300BD636300FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7
      F700FFF7EF00DEC6B500000000000000000000000000CEADAD00FFADAD00945A
      5A00C6737300BD636300FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7
      F700FFF7EF00DEC6B50000000000000000000000000000000000218CCE0042AD
      FF004AB5FF004AB5FF004AADFF0042ADFF00187BBD0073737300D6D6D6000000
      000000000000000000000000000000000000101010001818180010398C00185A
      BD00185AC600185AC600184AA500DEB59C00FFFFEF00FFEFCE00FFE7B500FFEF
      BD00FFF7BD00FFFFCE00C6948400D6D6D600FFFFFF00BD7B7B007B393900F7A5
      A500AD636300E78C8C00DEBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7F700DEC6B5000000000000000000FFFFFF00BD7B7B007B393900F7A5
      A500AD636300E78C8C00DEBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7F700DEC6B50000000000000000000000000000000000218CCE0052B5
      FF0052BDFF0052BDFF0052B5FF004AB5FF00218CCE0073737300D6D6D6000000
      000000000000000000000000000000000000212121002929290018529C002173
      DE00297BE7002973DE00216BD600634A4A00FFF7EF00FFFFFF00FFE7BD00FFDE
      A500FFF7C600FFD6AD005A525200FFFFFF00000000000000000000000000DE94
      9400DEBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDA59400A58C7B000000000000000000000000000000000000000000DE94
      9400DEBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDA59400A58C7B00000000000000000000000000000000002184BD00319C
      D6002994C60039A5DE004AB5FF0042ADF7002184B50084848400DEDEDE000000
      000000000000000000000000000000000000292929003939390000101800319C
      FF00319CFF00319CFF00298CF7006B7B94007B635A00D6AD9C00F7E7B500FFDE
      B500EFBDA500635A5A00EFEFEF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A58C
      7B00C6B5A5006B5239000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A58C
      7B00C6B5A5006B52390000000000000000000000000000000000398CAD00318C
      BD0052A5D60073B5DE005AA5C600398CB50010739C00ADADAD00EFEFEF000000
      000000000000000000000000000000000000080808004A4A4A00525252001818
      1800082163001852D6001852A500CECECE00F7F7F700D6D6D600B5B5B500B5B5
      B500DEDEDE00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A58C
      7B008C735A00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A58C
      7B008C735A000000000000000000000000000000000000000000BDD6E7002184
      B50084C6E70094CEEF008CC6E700298CBD006394A500E7E7E700FFFFFF000000
      000000000000000000000000000000000000C6C6C600424242006B6B6B008C8C
      8C00BDBDBD006B6B6B0008080800F7F7F7000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6AD
      A500C6AD9C00BDAD9C00BDA59400B5A59400B59C9400B59C8C00AD9C8C00AD94
      840000000000000000000000000000000000000000000000000000000000C6AD
      A500C6AD9C00BDAD9C00BDA59400B5A59400B59C9400B59C8C00AD9C8C00AD94
      840000000000000000000000000000000000000000000000000000000000ADCE
      DE005294BD004294BD00428CB5008CADC600EFEFEF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF00BDBDBD00181818007B7B
      7B005A5A5A0008080800DEDEDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDC6CE0021313900B5BDC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDC6CE0021313900B5BDC600000000000000000000000000000000000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000000000000000000000000000000000C67B7B00B55A5A00A55A5A008C4A
      4A007B393900636B6B00526B7B00425A6B005A52420000000000000000000000
      00002931420000000000000000000000000000000000B5A59400634A3100634A
      3100634A3100634A3100634A3100634A3100634A3100634A3100634A3100524A
      4200314A63003973BD00294A6300BDC6CE0000000000B5A59400634A3100634A
      3100634A3100634A3100634A3100634A3100634A3100634A3100634A3100524A
      4200314A63003973BD00294A6300BDC6CE00000000000000000000007B000000
      FF000000FF000000FF000000FF004A4AFF004A4AFF000000FF004A4AFF000000
      FF0000007B00000000000000000000000000CE6B6B00C67B7B00BD7373009C4A
      4A008C4A4A007BADBD005A9CB5005A848C005A848C00425A6B00000000002931
      42005A9CB500425A6B00000000000000000000000000B5A59400FFFFFF00B5A5
      9400B5A59400B5A59400B5A59400B5A59400B5A59400B5A594008C848400314A
      6B00317BD600429CE70052B5EF004A63730000000000B5A59400FFFFFF00B5A5
      9400B5A59400B5A59400B5A59400B5A59400B5A59400B5A594008C848400314A
      6B00317BD600429CE70052B5EF004A6373000000000000007B000000FF004A4A
      FF004A4AFF008484FF008484FF008484FF008484FF004A4AFF004A4AFF000000
      FF0000007B00000000000000000000000000CE737300AD636300945A5A009C4A
      4A008C4A4A007BADBD0073849400736352007B3939005A524A004252630039BD
      EF0094CEDE006B8C9C00000000000000000000000000B5A59400FFFFFF00FFFF
      FF00FFFFFF00F7F7EF00D6D6D600949494006B6B63006363630052525A004273
      940042A5E70063C6FF00738CA500D6DEDE0000000000B5A59400FFFFFF00FFFF
      FF00FFFFFF00F7F7EF00D6D6D600949494006B6B63006363630052525A004273
      940042A5E70063C6FF00738CA500D6DEDE000000000000007B000000FF004A4A
      FF008484FF008484FF00BDBDFF008484FF008484FF008484FF004A4AFF000000
      FF0000007B00000000000000000000000000BD737300C67B7B00BD737300A55A
      5A008C4A4A0073849400947B6B00D6BD9C00D6BD9C00A56B6B005A524A0094CE
      DE00ADF7FF0000000000000000000000000000000000B5A59400FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00948C8C00B5AD9C00D6C6B500CEAD9C007B736B00525A
      52005A94AD00739CB500BDC6C6000000000000000000B5A59400FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00948C8C00B5AD9C00D6C6B500CEAD9C007B736B00525A
      52005A94AD00739CB500BDC6C600000000000000000000007B000000FF004A4A
      FF008484FF00BDBDFF00FFFFFF00BDBDFF00BDBDFF008484FF004A4AFF000000
      7B0000007B00000000000000000000000000D67B7B00E7949400DE848400AD5A
      5A00A56B6B00BDAD9400EFE7BD00EFE7BD00EFE7BD00E7D6A500D6BD9C005A52
      4A000000000000000000000000000000000000000000B5A59400FFFFFF00FFFF
      FF00FFFFFF00B5B5AD00BDBDB500FFEFE700FFE7DE00F7DEC600F7CEB5007B73
      6B009C9C9C00BDC6C600000000000000000000000000B5A59400FFFFFF00FFFF
      FF00FFFFFF00B5B5AD00BDBDB500FFEFE700FFE7DE00F7DEC600F7CEB5007B73
      6B009C9C9C00BDC6C6000000000000000000000000000000000000007B004A4A
      FF008484FF00BDBDFF00BDBDFF00BDBDFF00BDBDFF004A4AFF0000007B000000
      7B0000000000000000000000000000000000DE8C8C00E79C9C00DE8C8C00BD6B
      6B00BD737300DECEB500F7E7CE00F7EFEF00F7E7CE00E7D6AD00E7D6A5005A52
      42000000000000000000000000000000000000000000BDA59400FFFFFF00FFFF
      FF00FFFFFF009C948C00EFEFE700FFF7F700FFEFEF00FFE7DE00F7DECE00CEAD
      9C006B6B6B0000000000000000000000000000000000BDA59400FFFFFF00FFFF
      FF00FFFFFF009C948C00EFEFE700FFF7F700FFEFEF00FFE7DE00F7DECE00CEAD
      9C006B6B6B00000000000000000000000000000000000000000000007B000000
      FF000000FF00006B8400107BC600107BC6000873AD000000FF0000007B000000
      000000000000000000000000000000000000E79C9C00F7ADAD00EFA5A500C67B
      7B00CE848400E7D6CE00FFFFE700FFFFF700FFFFF700EFE7BD00E7D6AD005A52
      42000000000000000000000000000000000000000000BDAD9C00FFFFFF00FFFF
      FF00FFFFFF00A59C9400EFEFE700FFFFFF00FFF7F700FFF7EF00FFE7DE00DEC6
      B50073736B0000000000000000000000000000000000BDAD9C00FFFFFF00FFFF
      FF00FFFFFF00A59C9400EFEFE700FFFFFF00FFF7F700FFF7EF00FFE7DE00DEC6
      B50073736B000000000000000000000000000000000000000000000000000000
      7B00005A8400298CEF00319CFF00319CFF00319CFF00107BC600001018000000
      000000000000000000000000000000000000EFA5A500F7B5B500EFA5AD00CE84
      8400C67B7B00B5AD9C00F7EFEF00FFFFF700F7EFEF00EFE7BD00E7D6AD006363
      63000000000000000000000000000000000000000000C6AD9C00FFFFFF00FFFF
      FF00FFFFFF00C6C6BD00C6BDBD00FFFFFF00FFFFFF00FFF7F700FFEFE700AD9C
      9400ADADA50000000000000000000000000000000000C6AD9C00FFFFFF00FFFF
      FF00FFFFFF00C6C6BD00C6BDBD00FFFFFF00FFFFFF00FFF7F700FFEFE700AD9C
      9400ADADA5000000000000000000000000000000000000000000000000000000
      0000187BC60039A5FF0042A5FF0042A5FF0039A5FF00319CFF00004A73000000
      000000000000000000000000000000000000E79C9C00DE8C8C00CE848400CE84
      8400CE6B6B0094A5A5008C847300E7D6CE00F7E7CE00B5A57B0084736300526B
      7B000000000000000000000000000000000000000000CEB5A500FFFFFF00FFFF
      FF00FFFFFF00F7FFFF00BDBDB500C6C6BD00EFEFE700EFEFE700B5ADA500736B
      6300F7F7F70000000000000000000000000000000000CEB5A500FFFFFF00FFFF
      FF00FFFFFF00F7FFFF00BDBDB500C6C6BD00EFEFE700EFEFE700B5ADA500736B
      6300F7F7F7000000000000000000000000000000000000000000000000000000
      0000218CCE0042ADFF004AB5FF004AB5FF004AADFF0042ADFF00187BBD000000
      000000000000000000000000000000000000E7949400FFBDBD00F7B5B500CE84
      8400BD737300ADF7FF009CB5BD00847363006B635A00738C8C00639CAD004A63
      73000000000000000000000000000000000000000000CEB5A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7FFFF00C6C6C600A59C9400948C840094948C00634A
      39000000000000000000000000000000000000000000CEB5A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7FFFF00C6C6C600A59C9400948C840094948C00634A
      3900000000000000000000000000000000000000000000000000000000000000
      0000218CCE0052B5FF0052BDFF0052BDFF0052B5FF004AB5FF00218CCE000000
      000000000000000000000000000000000000E79C9C00C67B7B00BD737300C67B
      7B00C67B7B006B8C9C005A7384007394A5008CC6D60063ADCE0052ADC6004A5A
      6B000000000000000000000000000000000000000000D6BDAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A59400634A3100634A3100634A
      31000000000000000000000000000000000000000000D6BDAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A59400634A3100634A3100634A
      3100000000000000000000000000000000000000000000000000000000000000
      00002184BD00319CD6002994C60039A5DE004AB5FF0042ADF7002184B5000000
      000000000000000000000000000000000000CE848400DECEB500F7EFEF00CE94
      9400BD7373005A738400E7E7DE00F7EFEF0094B5BD008CC6D6005AC6E7004A63
      73000000000000000000000000000000000000000000D6BDAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA59400D6C6BD00634A3100E7D6
      CE000000000000000000000000000000000000000000D6BDAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA59400D6C6BD00634A3100E7D6
      CE00000000000000000000000000000000000000000000000000000000000000
      000000639400318CBD0052A5D60073B5DE005AA5C600398CB500086B9C000000
      00000000000000000000000000000000000000000000D6A59C00AD636300E7E7
      DE00F7EFEF00C67B7B009CB5BD00E7E7DE00FFFFF7009C9484005A848C00526B
      7B000000000000000000000000000000000000000000DEC6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AD9C00634A3100E7D6CE000000
      00000000000000000000000000000000000000000000DEC6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AD9C00634A3100E7D6CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006394002184B50084C6E70094CEEF008CC6E700298CBD00004A6B000000
      0000000000000000000000000000000000000000000000000000CE949400DECE
      AD00E7D6CE00E7D6CE00C67B7B00526B7B00E7E7DE00F7EFEF00ADA59400526B
      7B000000000000000000000000000000000000000000DEC6B500DEC6B500DEC6
      B500DEC6B500DEC6B500D6BDAD00CEBDAD00CEB5A500E7D6CE00000000000000
      00000000000000000000000000000000000000000000DEC6B500DEC6B500DEC6
      B500DEC6B500DEC6B500D6BDAD00CEBDAD00CEB5A500E7D6CE00000000000000
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
      000000000000FFFFFF00EFEFEF00E7E7E700DEDEDE00DEDEDE00DEDEDE00EFEF
      EF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00EFEFEF00E7E7E700DEDEDE00DEDEDE00DEDEDE00EFEF
      EF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00DEDE
      DE009C9C9C00526B520029632900215A2100105A1000105A1000215A2100395A
      39007B7B7B00EFEFEF0000000000000000000000000000000000FFFFFF00DEDE
      DE009C9C9C00526B520029632900215A2100105A1000105A1000215A2100395A
      39007B7B7B00EFEFEF0000000000000000000000000000000000000000000052
      5200005252000052520000525200005252000052520000525200005252000052
      520000000000000000000000000000000000F7F7F700BDBDBD00A5A5A500A5A5
      A500A5A5A500ADADAD00CECECE00EFEFEF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000009CB59C001084
      100042BD420052C652003184290052C6520052C6520042BD420039B5390021AD
      210008630800D6D6D600000000000000000000000000000000009CB59C001084
      100042BD420052C652003184290052C6520052C6520042BD420039B5390021AD
      210008630800D6D6D600000000000000000000000000000000000052520000CE
      CE0000CECE0000FFFF0000FFFF0000FFFF0000FFFF00009C9C00009C9C00009C
      9C0000737300000000000000000000000000BD522900D64A2100EF5A3900FF63
      5200FF635200D64A2100A539180063524A009C9C9C00949494007B7B7B007373
      7300737373007B7B7B00BDBDBD00FFFFFF00000000000000000029A529004AC6
      4A005AC65A0052BD5200FFFFE7002184210063CE63005AC65A004ABD4A0031B5
      310008730800DEDEDE000000000000000000000000000000000029A529004AC6
      4A005AC65A0052BD5200FFFFE7002184210063CE63005AC65A004ABD4A0031B5
      310008730800DEDEDE000000000000000000000000000052520000CECE0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000CE
      CE0000737300000000000000000000000000C6421000EF5A4200FF735A00FF7B
      6300CE5A2900D6845200FF6B5A00EF5A420042B542002994290052C652004ABD
      4A0039B5390021AD21005A635A00F7F7F700000000000000000031AD310052C6
      520073D6730018841800FFFFF700EFF7E7006BCE6B006BD66B005AC65A0039BD
      3900527B5200FFFFFF000000000000000000000000000000000031AD310052C6
      520073D6730018841800FFFFF700EFF7E7006BCE6B006BD66B005AC65A0039BD
      3900527B5200FFFFFF000000000000000000000000000052520000CECE0000FF
      FF0000FFFF0073FFFF0000C6C60000C6C60073FFFF0000FFFF0000FFFF0000CE
      CE0000737300000000000000000000000000D6947B00FF6B5A00FF846B00EF84
      5A00FFDEA500FFDEA500FF846B00FF63520063CE6300BDDEAD00429C42006BCE
      6B0052C6520039B539006B7B6B00FFFFFF0000000000000000001884180063CE
      63007BD67B00428C3900FFFFFF00FFFFF70084AD73007BD67B0063CE63000873
      0800E7E7E70000000000000000000000000000000000000000001884180063CE
      63007BD67B00428C3900FFFFFF00FFFFF70084AD73007BD67B0063CE63000873
      0800E7E7E700000000000000000000000000000000000052520000CECE0000FF
      FF0073FFFF0000C6C600FFFFFF000000000000C6C60000FFFF0000FFFF0000CE
      CE000073730000000000000000000000000000000000CE633900FF8C6B00EF9C
      7B00BD8C8400FFBD9400FF8C7300BD4A180084DE8400FFFFFF00FFFFFF0063C6
      63006BCE6B00299C2900DEDEDE00000000000000000000000000EFF7EF00298C
      29008CDE8C0084A56300739CAD00006BA500528CA500317B1800086B0800EFEF
      EF00000000000000000000000000000000000000000000000000EFF7EF00298C
      29008CDE8C0084A56300739CAD00006BA500528CA500317B1800086B0800EFEF
      EF0000000000000000000000000000000000000000000052520000CECE0000CE
      CE0000FFFF0000C6C600FFFFFF00000000000000000000C6C60000CECE000052
      520000000000000000000000000000000000EFEFEF004A4A4A00000000000821
      7B001029940000107B00635A5A00319C310094E79400DED6BD00428CAD009CB5
      A50042A54200D6D6D60000000000000000000000000000000000000000000000
      0000D6E7D600006BA500218CDE00218CDE00218CDE00107BBD00525A5A00DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      0000D6E7D600006BA500218CDE00218CDE00218CDE00107BBD00525A5A00DEDE
      DE000000000000000000000000000000000000000000000000000052520000CE
      CE0000CECE00006B8400107BC600107BC6000873AD00004A3900005252000000
      000000000000000000000000000000000000101010001010100008296B00184A
      AD00184AB500184AAD0008186B00BDBDBD0094B5C6002994F7002994F7002994
      EF00105A8C00A5A5A500FFFFFF00000000000000000000000000000000000000
      00005A94B500319CFF00319CFF00399CFF00319CFF00319CFF001073BD008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      00005A94B500319CFF00319CFF00399CFF00319CFF00319CFF001073BD008484
      8400FFFFFF000000000000000000000000000000000000000000000000000052
      5200005A8400298CEF00319CFF00319CFF00319CFF00107BC600005252000000
      00000000000000000000000000000000000018181800212121002163C600216B
      CE00216BD6002163CE0010429C00A5A5A500298CDE0039A5FF0039A5FF0039A5
      FF00319CFF005A636300EFEFEF00000000000000000000000000000000000000
      0000107BBD0039A5FF0042A5FF0042ADFF0042A5FF0039A5FF0039A5FF00395A
      6B00E7E7E7000000000000000000000000000000000000000000000000000000
      0000107BBD0039A5FF0042A5FF0042ADFF0042A5FF0039A5FF0039A5FF00395A
      6B00E7E7E7000000000000000000000000000000000000000000000000000000
      0000187BC60039A5FF0042A5FF0042A5FF0039A5FF00319CFF00004A73000000
      00000000000000000000000000000000000029292900313131002163B500298C
      F7003194FF00298CF7001863C600A5A5A50042ADFF004AB5FF004AB5FF004AAD
      FF0042ADFF00185A8400DEDEDE00000000000000000000000000000000000000
      0000319CE70042ADFF004AB5FF004AB5FF004AB5FF0042ADFF0042ADFF000863
      9400CECECE000000000000000000000000000000000000000000000000000000
      0000319CE70042ADFF004AB5FF004AB5FF004AB5FF0042ADFF0042ADFF000863
      9400CECECE000000000000000000000000000000000000000000000000000000
      0000218CCE0042ADFF004AB5FF004AB5FF004AADFF0042ADFF00187BBD000000
      0000000000000000000000000000000000001818180042424200292929001042
      9C00216BDE003194F700105AA500D6D6D60052B5FF0052BDFF0052BDFF0052BD
      FF004AB5FF00187BBD00D6D6D600000000000000000000000000000000000000
      000039A5EF0052BDFF0052BDFF0052BDFF0052BDFF004AB5FF004AB5FF001884
      C600BDBDBD000000000000000000000000000000000000000000000000000000
      000039A5EF0052BDFF0052BDFF0052BDFF0052BDFF004AB5FF004AB5FF001884
      C600BDBDBD000000000000000000000000000000000000000000000000000000
      0000218CCE0052B5FF0052BDFF0052BDFF0052B5FF004AB5FF00218CCE000000
      000000000000000000000000000000000000DEDEDE0052525200636363009C9C
      9C00737373002929290039394200FFFFFF001884BD00298CBD00318CBD001884
      CE002184CE0010638C00EFEFEF00000000000000000000000000000000000000
      00003194D6004AB5F7002994CE0042ADF70052B5FF0052B5FF004AB5FF00086B
      9C00CECECE000000000000000000000000000000000000000000000000000000
      00003194D6004AB5F7002994CE0042ADF70052B5FF0052B5FF004AB5FF00086B
      9C00CECECE000000000000000000000000000000000000000000000000000000
      00002184BD00319CD6002994C60039A5DE004AB5FF0042ADF7002184B5000000
      00000000000000000000000000000000000000000000BDBDBD00636363009494
      94006B6B6B0029292900F7F7F700000000007BADCE0063ADDE0084C6E7009CCE
      E7003994C600B5B5BD00FFFFFF00000000000000000000000000000000000000
      00001873A5002184B500429CD60073B5DE0063ADCE00318CB500318CB5001063
      8C00EFEFEF000000000000000000000000000000000000000000000000000000
      00001873A5002184B500429CD60073B5DE0063ADCE00318CB500318CB5001063
      8C00EFEFEF000000000000000000000000000000000000000000000000000000
      000000639400318CBD0052A5D60073B5DE005AA5C600398CB500086B9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BADCE005AA5C600398C
      BD00C6D6DE00FFFFFF0000000000000000000000000000000000000000000000
      000000000000318CBD0073B5DE0084C6E7009CCEEF005AADD6002184B500B5B5
      BD00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000318CBD0073B5DE0084C6E7009CCEEF005AADD6002184B500B5B5
      BD00FFFFFF000000000000000000000000000000000000000000000000000000
      0000006394002184B50084C6E70094CEEF008CC6E700298CBD00004A6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEEFF700217BAD00BDDEEF0084BDE700187BAD00C6CED600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000DEEFF700217BAD00BDDEEF0084BDE700187BAD00C6CED600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000006394001873A5004294BD001873A50000527B00000000000000
      0000000000000000000000000000000000000000000000000000ADBDCE006B94
      AD00638CA5005A8CA5005A849C005A849C00527B9400527B94004A738C004A6B
      8C00426B84004263840063849C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5B5C600426B8400C6AD
      AD00E7C6AD00DEBDAD00DEBDA500D6B5A500CEB59C00CEAD9C00C6AD9C00BDA5
      9400C6A59400A594940063849C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A738C00426B8C004A73
      8C005273940063849C00849CB500ADBDCE00D6DEE700FFFFFF00FFFFFF00FFFF
      FF00F7EFE700A5948C0063849C000000000000000000F7F7F700DEDEDE00D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600DEDEDE000000000000000000F7F7F700DEDEDE00D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600DEDEDE00F7F7F70000000000F7F7F700BDBDBD00A5A5A500A5A5
      A500A5A5A500ADADAD00CECECE00EFEFEF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000042637B004A738C00219C
      CE0008A5DE001094CE00188CBD00107BB500106B9C002984AD00638CA500BDD6
      DE00FFF7EF00A594940063849C0000000000F7F7F700C6C6C600848484006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B0084848400C6C6C600F7F7F700C6C6C6008C8C8C007373
      7300737373007373730073737300737373007373730073737300737373007373
      7300737373008C8C8C00C6C6C600F7F7F700BD522900D64A2100EF5A3900FF63
      5200FF635200D64A2100A539180063524A009C9C9C00949494007B7B7B007373
      7300737373007B7B7B00BDBDBD00FFFFFF000000000042637B004A73940018AD
      DE0000ADEF0000ADEF0000ADEF0000ADEF0000A5E700009CDE000873A500849C
      B500FFFFF700AD9C9400638CA50000000000DEDEDE001884B5001884B500107B
      B500107BAD00107BAD000873AD000873A5000873A500006BA500006B9C00006B
      9C0000639C0000639C004A4A4A0084848400DEDEDE000873A5000873A5000873
      A5000873A5000873A5000873A5000873A5000873A5000873A5000873A5000873
      A5000873A500636363008C8C8C00DEDEDE00C6421000EF5A4200FF735A00FF7B
      6300CE5A2900D6845200FF6B5A00EF5A420042B542002994290052C652004ABD
      4A0039B5390021AD21005A635A00F7F7F700000000004A6B8400527B940029AD
      DE0010B5EF0008ADEF0000A5EF0000A5E70000A5E70000A5EF00007BB500849C
      B500FFFFF700ADA59C006B8CA500000000002184BD0063CEFF001884BD009CFF
      FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6
      FF0039A5D6009CFFFF0000639C006B6B6B00189CC600189CC6009CFFFF006BD6
      FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6
      FF00299CBD000873A50073737300D6D6D600D6947B00FF6B5A00FF846B00EF84
      5A00FFDEA500FFDEA500FF846B00FF63520063CE6300BDDEAD00429C42006BCE
      6B0052C6520039B539006B7B6B00FFFFFF00000000004A7384005A849C0042B5
      E70029BDEF0010B5EF0000ADEF0000A5EF0000A5E70000ADEF000084B500849C
      B500FFFFF700B5ADA5006B94A50000000000218CBD0063CEFF00218CBD009CFF
      FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7
      FF0042ADDE009CFFFF0000639C006B6B6B00189CC600189CC6007BE7F7009CFF
      FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BDE
      FF0042B5DE00187B9C0063636300BDBDBD0000000000CE633900FF8C6B00EF9C
      7B00BD8C8400FFBD9400FF8C7300BD4A180084DE8400FFFFFF00FFFFFF0063C6
      63006BCE6B00299C2900DEDEDE00000000000000000052738C005A84A50052BD
      E70039C6F70021BDEF0010B5EF0000ADEF0000A5E70000ADEF000084BD00849C
      B500FFFFF700BDADAD006B94AD0000000000218CC60063CEFF002994C6009CFF
      FF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EF
      FF004AB5E7009CFFFF00006B9C006B6B6B00189CC60021A5CE0039BDD6009CFF
      FF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084E7
      FF0042BDEF00189CC600636363008C8C8C00EFEFEF004A4A4A00000000000821
      7B001029940000107B00635A5A00319C310094E79400DED6BD00428CAD009CB5
      A50042A54200D6D6D600000000000000000000000000527B8C00638CA50063C6
      E70052CEF70039C6EF0021B5EF0010B5EF0000ADEF0000ADF7000084BD0084A5
      B500FFFFFF00BDB5AD007394AD0000000000298CC60063CEFF00319CCE009CFF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7
      FF0052BDEF009CFFFF00006B9C006B6B6B00189CC60042B5E70021A5CE00A5FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7
      FF0052BDE7005ABDCE000873A50073737300101010001010100008296B00184A
      AD00184AB500184AAD0008186B00BDBDBD0094B5C6002994F7002994F7002994
      EF00105A8C00A5A5A500FFFFFF0000000000000000005A8494006394AD0073CE
      E70063D6F7004ACEEF0031BDEF0021B5EF0008ADEF0000ADF7000084C60084A5
      B500FFFFFF00C6B5B500739CB500000000002994C6006BD6FF00319CCE009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF005AC6FF009CFFFF00006BA5006B6B6B00189CC6006BD6FF00189CC6008CF7
      F7009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF005AC6FF0094FFFF00187B9C007373730018181800212121002163C600216B
      CE00216BD6002163CE0010429C00A5A5A500298CDE0039A5FF0039A5FF0039A5
      FF00319CFF005A636300EFEFEF0000000000000000005A849C006B9CAD0084D6
      EF007BDEF70063D6F7004ACEF70031BDEF0018B5EF0000B5F700008CC60084A5
      BD00FFFFFF00C6BDBD00739CB500000000002994C6007BE7FF002994C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084E7FF00FFFFFF000873A5008C8C8C00189CC60084D6FF00189CC6006BBD
      DE00FFFFFF00FFFFFF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084E7FF00FFFFFF00187BA5008C8C8C0029292900313131002163B500298C
      F7003194FF00298CF7001863C600A5A5A50042ADFF004AB5FF004AB5FF004AAD
      FF0042ADFF00185A8400DEDEDE000000000000000000638C9C006B9CB50094DE
      EF008CE7F70073DEF7005AD6F7004AC6EF0031BDEF0010BDF7000894C60084A5
      BD00FFFFFF00CEC6BD007BA5B500000000003194CE0084EFFF0084E7FF002994
      C6002994C6002994C6002994C6002994C6002994C600218CC600218CBD001884
      BD001884B5001884B5001884B500DEDEDE00189CC60084EFFF004AC6E700189C
      C600189CC600189CC600189CC600189CC600189CC600189CC600189CC600189C
      C600189CC600189CC600188CB500C6C6C6001818180042424200292929001042
      9C00216BDE003194F700105AA500D6D6D60052B5FF0052BDFF0052BDFF0052BD
      FF004AB5FF00187BBD00D6D6D6000000000000000000638CA50073A5B500ADEF
      F700A5F7FF0094EFFF0073DEFF005AD6F70042C6EF0021C6FF001894C6008CAD
      BD00FFF7EF00BDADAD000000000000000000319CCE0094F7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00107BAD008C8C8C00DEDEDE0000000000189CC6009CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00189CC600187B9C00C6C6C600F7F7F700DEDEDE0052525200636363009C9C
      9C00737373002929290039394200FFFFFF001884BD00298CBD00318CBD001884
      CE002184CE0010638C00EFEFEF0000000000000000008CB5BD00739CAD007BAD
      BD007BB5C6007BBDCE007BC6DE006BCEE7005ACEEF0039D6FF0029ADDE00738C
      9400DEC6B500000000000000000000000000319CCE00FFFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF00FFFFFF00218CBD002184BD001884B5001884B5001884
      B500107BB500DEDEDE00F7F7F70000000000189CC600FFFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF00FFFFFF00189CC600189CC600189CC600189CC600189C
      C600189CC600DEDEDE00F7F7F7000000000000000000BDBDBD00636363009494
      94006B6B6B0029292900F7F7F700000000007BADCE0063ADDE0084C6E7009CCE
      E7003994C600B5B5BD00FFFFFF00000000000000000000000000FFFFFF00DEEF
      EF00C6D6DE00ADC6D60094B5C6007394AD005A9CB50039A5CE003184AD00A5AD
      B5000000000000000000000000000000000000000000319CCE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00298CC600C6C6C600F7F7F70000000000000000000000
      0000000000000000000000000000000000000000000021A5CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00189CC600C6C6C600F7F7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BADCE005AA5C600398C
      BD00C6D6DE00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000EFEFF700DEE7EF00CEDEE700B5C6CE00949CAD00BDC6
      C600000000000000000000000000000000000000000000000000319CCE00319C
      CE003194CE002994C600DEDEDE00F7F7F7000000000000000000000000000000
      000000000000000000000000000000000000000000000000000021A5CE0021A5
      CE0021A5CE0021A5CE00DEDEDE00F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00EFEFEF008C8C8C007B7B7B008C8C8C00EFEFEF00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00EFEFEF008C8C8C007B7B7B008C8C8C00EFEFEF00EFEF
      EF00000000000000000000000000000000000000000000000000ADBDCE006B94
      AD00638CA5005A8CA5005A849C005A849C00527B9400527B94004A738C004A6B
      8C00426B84004263840063849C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A0029C6EF0029C6EF004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A0029C6EF0029C6EF004A4A4A004A4A4A004A4A
      4A000000000000000000000000000000000000000000A5B5C600426B8400C6AD
      AD00E7C6AD00DEBDAD00DEBDA500D6B5A500CEB59C00CEAD9C00C6AD9C00BDA5
      9400C6A59400A594940063849C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C009C9C9C00DEEFEF00D6EFF7009C9C9C009C9C9C009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C009C9C9C00DEEFEF00D6EFF7009C9C9C009C9C9C009C9C
      9C0000000000000000000000000000000000000000004A738C00426B8C004A73
      8C005273940063849C00849CB500ADBDCE00D6DEE700FFFFFF00FFFFFF00FFFF
      FF00F7EFE700A5948C0063849C00000000000000000000000000000000000000
      00000000000000000000000000007B947B00D6D6D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00F7F7F7009494940052524A00EFEFEF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00F7F7F7009494940052524A00EFEFEF00000000000000
      0000000000000000000000000000000000000000000042637B004A738C00219C
      CE0008A5DE001094CE00188CBD00107BB500106B9C002984AD00638CA500BDD6
      DE00FFF7EF00A594940063849C00000000000000000000000000000000000000
      00000000000000000000000000007B947B0018211800BDC6BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00D6D6CE008C7B73007B736B004A4A4200DED6D600F7F7F700FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00D6D6CE008C7B73007B736B004A4A4200DED6D600F7F7F700FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000042637B004A73940018AD
      DE0000ADEF0000ADEF0000ADEF0000ADEF0000A5E700009CDE000873A500849C
      B500FFFFF700AD9C9400638CA500000000000000000000000000000000000000
      00000000000000000000000000007B947B0042734A0018211800C6C6C6000000
      000000000000000000000000000000000000000000000000000000000000FFF7
      F700CECEC600B5847B00DEB5A500AD7B7B00846363005A4A420084736B00BDAD
      AD00DED6D600F7EFEF00FFFFFF0000000000000000000000000000000000FFF7
      F700CECEC600B5847B00DEB5A500AD7B7B00846363005A4A420084736B00BDAD
      AD00DED6D600F7EFEF00FFFFFF0000000000000000004A6B8400527B940029AD
      DE0010B5EF0008ADEF0000A5EF0000A5E70000A5E70000A5EF00007BB500849C
      B500FFFFF700ADA59C006B8CA500000000000000000000000000000000007B9C
      8400212921002931290031423100394A3900528C630042734A0018211800C6C6
      C600000000000000000000000000000000000000000000000000F7F7F700C6BD
      BD00CE9C8C00EFBD8C00F7E7CE00F7D6BD00E7C6A500BD848400D6A58C00B584
      84007B5A5A00BDADAD00FFFFFF00000000000000000000000000F7F7F700C6BD
      BD00CE9C8C00EFBD8C00F7E7CE00F7D6BD00E7C6A500BD848400D6A58C00B584
      84007B5A5A00BDADAD00FFFFFF0000000000000000004A7384005A849C0042B5
      E70029BDEF0010B5EF0000ADEF0000A5EF0000A5E70000ADEF000084B500849C
      B500FFFFF700B5ADA5006B94A5000000000000000000000000000000000084A5
      8C00ADEFBD0073B584006BAD7B0063A573005A946B0063AD730042734A001821
      1800BDC6BD000000000000000000000000000000000000000000DED6D600E7BD
      9C00F7CE9C00F7C69400FFE7D600F7DECE00E7C6AD009C636300E7BD9C00EFBD
      9400C68C7B00AD9C9400FFFFFF00000000000000000000000000DED6D600E7BD
      9C00F7CE9C00F7C69400FFE7D600F7DECE00E7C6AD009C636300E7BD9C00EFBD
      9400C68C7B00AD9C9400FFFFFF00000000000000000052738C005A84A50052BD
      E70039C6F70021BDEF0010B5EF0000ADEF0000A5E70000ADEF000084BD00849C
      B500FFFFF700BDADAD006B94AD00000000000000000000000000000000008CAD
      9400B5EFC60094E7AD008CDEA50084CE9C0073C68C006BB5840063AD73005294
      6300637363000000000000000000000000000000000000000000CEB5B500F7DE
      AD00F7D6A500F7CE9C00FFEFE700FFE7D600E7CEBD009C636300E7BDA500F7C6
      9C00C6947B00AD9C9400FFFFFF00000000000000000000000000CEB5B500F7DE
      AD00F7D6A500F7CE9C00FFEFE700FFE7D600E7CEBD009C636300E7BDA500F7C6
      9C00C6947B00AD9C9400FFFFFF000000000000000000527B8C00638CA50063C6
      E70052CEF70039C6EF0021B5EF0010B5EF0000ADEF0000ADF7000084BD0084A5
      B500FFFFFF00BDB5AD007394AD000000000000000000000000000000000094B5
      9C00B5F7CE00ADEFC600ADEFBD00A5E7BD00A5E7B50073C68C006BB584007B94
      8400D6E7D6000000000000000000000000000000000000000000CEB5B500FFE7
      B500F7CE9400EFB58400FFF7F700FFEFE700F7DECE00AD7B7300E7C6AD00F7CE
      AD00C6948400A59C9400FFF7F700000000000000000000000000CEB5B500FFE7
      B500F7CE9400EFB58400FFF7F700FFEFE700F7DECE00AD7B7300E7C6AD00F7CE
      AD00C6948400A59C9400FFF7F70000000000000000005A8494006394AD0073CE
      E70063D6F7004ACEEF0031BDEF0021B5EF0008ADEF0000ADF7000084C60084A5
      B500FFFFFF00C6B5B500739CB5000000000000000000000000000000000094BD
      A50094B59C008CAD940084A58C007B9C8400ADE7BD0084C694007B948400D6E7
      D600000000000000000000000000000000000000000000000000CEB5B500D6B5
      94004AADFF00319CFF00E7EFFF00FFF7F700FFEFE700FFE7D600F7DEC600F7D6
      BD00C69C8C00847B7300F7F7F700000000000000000000000000CEB5B500D6B5
      94004AADFF00319CFF00E7EFFF00FFF7F700FFEFE700FFE7D600F7DEC600F7D6
      BD00C69C8C00847B7300F7F7F70000000000000000005A849C006B9CAD0084D6
      EF007BDEF70063D6F7004ACEF70031BDEF0018B5EF0000B5F700008CC60084A5
      BD00FFFFFF00C6BDBD00739CB500000000000000000000000000000000000000
      000000000000000000000000000084A58C00A5E7BD007B948400D6E7D6000000
      000000000000000000000000000000000000000000000000000084C6FF005AC6
      FF005AC6FF004AADFF00319CFF00E7EFFF00FFF7EF00FFEFE700FFE7D600F7DE
      C600A58CA500D6D6D600FFFFFF0000000000000000000000000084C6FF005AC6
      FF005AC6FF004AADFF00319CFF00E7EFFF00FFF7EF00FFEFE700FFE7D600F7DE
      C600A58CA500D6D6D600FFFFFF000000000000000000638C9C006B9CB50094DE
      EF008CE7F70073DEF7005AD6F7004AC6EF0031BDEF0010BDF7000894C60084A5
      BD00FFFFFF00CEC6BD007BA5B500000000000000000000000000000000000000
      00000000000000000000000000008CAD94007B948400D6E7D600000000000000
      00000000000000000000000000000000000000000000000000006BBDFF004AB5
      FF005AC6FF005AC6FF004AB5FF00319CFF00FFFFFF00FFF7EF00FFEFDE006B73
      AD00CECECE00FFFFFF00000000000000000000000000000000006BBDFF004AB5
      FF005AC6FF005AC6FF004AB5FF00319CFF00FFFFFF00FFF7EF00FFEFDE006B73
      AD00CECECE00FFFFFF00000000000000000000000000638CA50073A5B500ADEF
      F700A5F7FF0094EFFF0073DEFF005AD6F70042C6EF0021C6FF001894C6008CAD
      BD00FFF7EF00BDADAD0000000000000000000000000000000000000000000000
      000000000000000000000000000094B59C00E7EFE70000000000000000000000
      00000000000000000000000000000000000000000000000000000000000063BD
      FF004AADFF005ABDFF0063C6FF004AB5FF0039A5FF00FFFFFF00427BCE00C6BD
      BD00F7F7FF0000000000000000000000000000000000000000000000000063BD
      FF004AADFF005ABDFF0063C6FF004AB5FF0039A5FF00FFFFFF00427BCE00C6BD
      BD00F7F7FF00000000000000000000000000000000008CB5BD00739CAD007BAD
      BD007BB5C6007BBDCE007BC6DE006BCEE7005ACEEF0039D6FF0029ADDE00738C
      9400DEC6B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063B5FF0042ADFF0052BDFF0063CEFF0052B5FF0039A5FF004A526B00E7DE
      E700FFFFFF000000000000000000000000000000000000000000000000000000
      000063B5FF0042ADFF0052BDFF0063CEFF0052B5FF0039A5FF004A526B00E7DE
      E700FFFFFF000000000000000000000000000000000000000000FFFFFF00DEEF
      EF00C6D6DE00ADC6D60094B5C6007394AD005A9CB50039A5CE003184AD00A5AD
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063B5FF0063BDFF00ADDEFF00000000000008A5007B7B9400E7E7
      E700FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000063B5FF0063BDFF00ADDEFF00000000000008A5007B7B9400E7E7
      E700FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000EFEFF700DEE7EF00CEDEE700B5C6CE00949CAD00BDC6
      C60000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF00FC0F000000000000E003000000000000
      C003000000000000C003000000000000C007000000000000C207000000000000
      C00F000000000000F00F000000000000B00F000000000000B007000000000000
      9007000000000000500700000000000050070000000000005007000000000000
      E80F000000000000E81F00000000000080838083C001FC0F010101018000E003
      003000308000C003006000608000C003004400448100C207000C000C8004C307
      001800189804C00F800180019804F00FC003C0039800F00FC01FC01F9800F007
      C01FC01F9800F007C01FC01F9800F007C01FC01F9800F007C01FC01F9C04F007
      C01FC01F8000F80FE03FE03FC001F81FFFFFFFFF803F803F00770077803F803F
      002300238003800300030003800380030007000780038003000F000FC003C003
      000F000F80038003000F000F80008000000F000F80008000000F000F80008000
      000F000F80008000000F000FC000C000000F000FC000C000800F800FC000C000
      C00FC00FC000C000FFFFFFFFFE00FE00F00FE1FFE1FFFE3FC00380FF80FFFC1F
      8001007F007FF00F8001000F000FE00700000003000380030000000100010001
      0000000000000000000000000000000000000000000000000000000000008000
      000000000000C000000000010001E000800100010001F0018001800F800FF807
      C003C03FC03FFC1FF00FC07FC07FFE7F803F800F800FF00F803F000F000FC003
      8003000F000F80018003000F000F80018003000F000F0000C003000F000F0000
      8003001F001F00008003801F801F00008003C01FC01F00008003C01FC01F0000
      8003C01FC01F0000C007C01FC01F0000C007C01FC01F8001C007C01FC01F8001
      C007C01FC01FC003C007E03FE03FF00FF00FF00FF87FF007C003C003F871C003
      80018001F860800180018001F860800000000000F041000000000000F0010000
      0000000080030000000000008003000000000000800700000000000080030000
      0000000080030000000000000003000080018001800780008001800180078001
      C003C0038007C003F00FF00FC00FE007FFFFFFFFC001C001FFFFFFFF80018001
      F000E00F80018001E000C7EF80018001E000DFEF800180018000DFCF80018001
      0000CF9F800180010000E7BF800080000000F39F800080000000F3DF80008000
      0000F7DF800080000003F7DF800080000007F7DF800080000007F39F80008000
      001FF01FC000C000FFFFF83FFC00FC00C3FFFFFFFFFFFFFF81FF00000000FFFF
      80FF00000000F000007F00000000E000000300000000E0000001000000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000300010000000000070003000000000007
      00FF00000000001F01FF00000000FFFFFFFFFFFF800FC3FFE003E003000F81FF
      E003E003000F80FFE003E003000F007FE003E003000F0003E003E003000F0001
      E003E003001F000000030003801F000000030003C01F000000030003C01F0000
      80038003C01F000000030003C01F0000E003E003C01F0001E003E003C01F0003
      E007E007C01F00FFE00FE00FE03F01FFFFFFFFFFFFF1FFF1E00F007780008000
      C007002380008000800700038000800080070007800180018007000F80038003
      C00F000F80078007C01F000F80078007E01F000F80078007F01F000F80078007
      F01F000F800F800FF01F000F800F800FF01F000F800F800FF01F800F801F801F
      F01FC00F803F803FF83FFFFFFFFFFFFFFFFFF807F807FFFFFFFFC003C003E00F
      007FC003C003C0070000C003C00380070000C003C00380070000C007C0078107
      8001C00FC00F818F0003F00FF00FC01F0001F007F007E01F0001F007F007F01F
      0001F007F007F01F0001F007F007F01F0001F007F007F01F8101F007F007F01F
      FF83F807F807F01FFFFFF80FF80FF83FC001FFFFFFFFFFFF8001FFFFFFFFFFFF
      800180018001007F800100000000000080010000000000008001000000000000
      8001000000008001800100000000000380010000000000018001000000000001
      8001000000000001800100000000000180030001000000018007000100018101
      C00F807F807FFF83FC0FC0FFC0FFFFFFFFFFF80FF80FC001FFFFF00FF00F8001
      FFFFF00FF00F8001FE7FF83FF83F8001FE3FF003F0038001FE1FE001E0018001
      E00FC001C0018001E007C001C0018001E007C001C0018001E007C001C0018001
      E00FC001C0018001FE1FC001C0018001FE3FC003C0038003FE7FE007E0078007
      FFFFF007F007C00FFFFFF887F887FC0F00000000000000000000000000000000
      000000000000}
  end
  object ppmTree: TPopupMenu
    Images = ImageList1
    OnPopup = ppmTreePopup
    Left = 245
    Top = 117
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Visible = False
                Action = actLogOff
                ImageIndex = 30
              end
              item
                Action = actFileExit
                ImageIndex = 36
              end>
            Action = actFilleMenu
          end
          item
            Items = <
              item
                Caption = '-'
              end
              item
                Caption = '-'
              end>
            Action = actACTION
          end
          item
            Items = <
              item
                Caption = #1050#1072#1092#1077#1076#1088#1072
              end
              item
                Items = <
                  item
                    Action = actAddNorm
                    Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
                  end>
                Caption = #1053#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080
              end>
            Visible = False
            Action = actFacNagrMenu
          end
          item
            Items = <
              item
                Items = <
                  item
                    Action = actAddPrep
                    Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
                  end
                  item
                    Visible = False
                    Action = actEditPrep
                  end
                  item
                    Visible = False
                    Action = actDelPrep
                  end>
                Caption = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1080
              end
              item
                Items = <
                  item
                    Action = actAddPotok
                    Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
                  end>
                Caption = #1055#1086#1090#1086#1082#1080
              end
              item
                Items = <
                  item
                    Items = <
                      item
                        Caption = '&ActionClientItem0'
                      end
                      item
                        Caption = 'A&ctionClientItem1'
                      end
                      item
                        Caption = '-'
                      end
                      item
                        Items = <
                          item
                            Caption = '&ActionClientItem0'
                          end
                          item
                            Caption = 'A&ctionClientItem1'
                          end>
                        Caption = 'Ac&tionClientItem3'
                      end
                      item
                        Caption = 'Act&ionClientItem4'
                      end
                      item
                        Caption = 'Acti&onClientItem5'
                      end>
                    Caption = #1040#1091#1076#1080#1090#1086#1088#1085#1072#1103' '#1085#1072#1075#1088#1091#1079#1082#1072
                  end
                  item
                    Caption = #1042#1085#1077#1072#1091#1076#1080#1090#1086#1088#1085#1072#1103' '#1085#1072#1075#1088#1091#1079#1082#1072
                  end>
                Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
              end>
            Visible = False
            Action = actDepNagrMenu
          end
          item
            Items = <
              item
                Items = <
                  item
                    Caption = '-'
                  end>
                Caption = #1055#1083#1072#1085#1080#1088#1091#1077#1084#1072#1103' '#1085#1072#1075#1088#1091#1079#1082#1072
              end
              item
                Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1085#1072#1075#1088#1091#1079#1082#1072
              end>
            Visible = False
            Action = actPrepNagrMenu
          end
          item
            Items = <
              item
                Action = actAppTweaksShow
                Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080'...'
              end>
            Caption = #1057#1077#1088#1074#1080#1089
          end
          item
            Items = <
              item
                Action = actQMShow
                Caption = #1052#1072#1089#1090#1077#1088' '#1079#1072#1087#1088#1086#1089#1086#1074'...'
                ShortCut = 16465
              end>
            Caption = #1047#1072#1087#1088#1086#1089#1099
          end
          item
            Items = <
              item
                Action = actAbout
                ImageIndex = 13
              end
              item
                Caption = '-'
              end
              item
                Action = actHelpContent
              end>
            Action = actHelpMenu
          end>
        ActionBar = MainMenuBar
      end
      item
        Items = <
          item
            Action = actShowTree
            ImageIndex = 72
            ShowCaption = False
          end
          item
            Items = <
              item
                Action = actPFShowAll
              end
              item
                Caption = '-'
              end
              item
                Action = actPFShowWorked
              end
              item
                Action = actPFShowReleased
              end>
            Action = actPrepodsFilter
            ImageIndex = 0
          end
          item
            Visible = False
            Action = actSprav
            ImageIndex = 12
          end
          item
            Items = <
              item
                Action = actShowAllStudent
              end
              item
                Caption = '-'
              end
              item
                Action = actShowOtchislStudent
              end
              item
                Action = actShowUnOtchislStudent
              end
              item
                Action = actShowAcademStudent
              end>
            Action = actShowStud
            ImageIndex = 0
          end
          item
            Items = <
              item
                Action = actAllSem
              end
              item
                Action = actCurrentSem
              end>
            Visible = False
            Action = actChangeSemFilter
            ImageIndex = 0
          end
          item
            Items = <
              item
                Action = actFilterAllYear
              end
              item
                Action = ActCurFilter
              end>
            Visible = False
            Action = actYearFilter
            ImageIndex = 0
          end
          item
            Items = <
              item
                Action = actFilterActual
              end
              item
                Action = actFilterAll
              end>
            Visible = False
            Action = actFilterGroup
            ImageIndex = 0
          end
          item
            Items = <
              item
                Action = ActAbitCurrent
              end
              item
                Action = actAbitChecked
              end
              item
                Action = ActAbitExiled
              end
              item
                Action = ActAbitMoved
              end
              item
                Caption = '-'
              end
              item
                Action = actShowReal
              end
              item
                Action = actShowPrimary
              end
              item
                Action = actShowSecondary
              end>
            Action = actAbitFilter
            ImageIndex = 0
          end
          item
            Items = <
              item
                Action = actAllKaf
              end
              item
                Action = actCurrentKaf
              end>
            Action = actFilterKaf
            ImageIndex = 0
          end>
        ActionBar = ActionToolBar1
      end
      item
      end
      item
        Items = <
          item
            Items = <
              item
                Action = actMakeBookmark
              end
              item
                Action = actManageBookmarks
              end
              item
                Caption = '-'
              end>
            Action = actScheduleBookmarks
            ImageIndex = 69
          end>
        ActionBar = ActionToolBar2
      end
      item
      end
      item
      end>
    Images = ImageList1
    Left = 345
    Top = 82
    StyleName = 'XP Style'
    object actFilleMenu: TAction
      Category = 'catMainMenu'
      Caption = #1060#1072#1081#1083
      Enabled = False
      OnUpdate = actFilleMenuUpdate
    end
    object actACTION: TAction
      Category = 'catMainMenu'
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      Enabled = False
      OnUpdate = actFilleMenuUpdate
    end
    object actFacNagrMenu: TAction
      Category = 'catMainMenu'
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      Visible = False
      OnUpdate = actFilleMenuUpdate
    end
    object actDepNagrMenu: TAction
      Category = 'catMainMenu'
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      Visible = False
      OnUpdate = actFilleMenuUpdate
    end
    object actPrepNagrMenu: TAction
      Category = 'catMainMenu'
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      Visible = False
      OnUpdate = actFilleMenuUpdate
    end
    object actHelpMenu: TAction
      Category = 'catMainMenu'
      Caption = #1055#1086#1084#1086#1097#1100
      Enabled = False
      OnUpdate = actFilleMenuUpdate
    end
    object actShowTree: TAction
      Category = 'catToolBar'
      AutoCheck = True
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1076#1077#1088#1077#1074#1086
      Checked = True
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1089#1082#1088#1099#1090#1100' '#1076#1077#1088#1077#1074#1086
      OnExecute = actShowTreeExecute
    end
    object actSprav: TAction
      Category = 'catToolBar'
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      ImageIndex = 12
      OnExecute = actSpravExecute
    end
    object actShowStud: TAction
      Category = 'catToolBar'
      Caption = #1060#1080#1083#1100#1090#1088
      Enabled = False
      Hint = #1057#1087#1080#1089#1086#1082' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      ImageIndex = 0
      OnExecute = actShowStudExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actShowAllStudent: TAction
      Category = 'catToolBar'
      Caption = #1042#1089#1077' '#1089#1090#1091#1076#1077#1085#1090#1099
      Enabled = False
      GroupIndex = 1
      OnExecute = actTreeRefreshActionExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actShowOtchislStudent: TAction
      Category = 'catToolBar'
      Caption = #1054#1090#1095#1080#1089#1083#1077#1085#1085#1099#1077
      Enabled = False
      GroupIndex = 1
      OnExecute = actTreeRefreshActionExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actShowUnOtchislStudent: TAction
      Category = 'catToolBar'
      Caption = #1053#1077#1086#1090#1095#1080#1089#1083#1077#1085#1085#1099#1077
      Checked = True
      Enabled = False
      GroupIndex = 1
      OnExecute = actTreeRefreshActionExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actShowAcademStudent: TAction
      Category = 'catToolBar'
      Caption = #1042' '#1072#1082#1072#1076#1077#1084#1080#1095#1077#1089#1082#1086#1084' '#1086#1090#1087#1091#1089#1082#1077
      Enabled = False
      GroupIndex = 1
      OnExecute = actTreeRefreshActionExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actFilterGroup: TAction
      Category = 'catToolBar'
      Caption = #1058#1077#1082#1091#1097#1080#1077' '#1075#1088#1091#1087#1087#1099
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1075#1088#1091#1087#1087#1099
      ImageIndex = 0
      Visible = False
      OnExecute = actFilterGroupExecute
    end
    object actFilterAll: TAction
      Category = 'catToolBar'
      Caption = #1042#1089#1077' '#1075#1088#1091#1087#1087#1099
      GroupIndex = 2
      OnExecute = actFilterAllExecute
    end
    object actFilterActual: TAction
      Category = 'catToolBar'
      Caption = #1058#1077#1082#1091#1097#1080#1077' '#1075#1088#1091#1087#1087#1099
      GroupIndex = 2
      OnExecute = actFilterActualExecute
    end
    object actChangeSemFilter: TAction
      Category = 'catToolBar'
      Caption = #1057#1077#1084#1077#1089#1090#1088#1099' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1075#1086#1076#1072
      ImageIndex = 0
      OnExecute = actChangeSemFilterExecute
    end
    object actCurrentSem: TAction
      Category = 'catToolBar'
      Caption = #1057#1077#1084#1077#1089#1090#1088#1099' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1075#1086#1076#1072
      Checked = True
      GroupIndex = 4
      OnExecute = actTreeRefreshActionExecute
    end
    object actAllSem: TAction
      Category = 'catToolBar'
      Caption = #1042#1089#1077' '#1089#1077#1084#1077#1089#1090#1088#1099
      GroupIndex = 4
      OnExecute = actTreeRefreshActionExecute
    end
    object actYearFilter: TAction
      Category = 'catToolBar'
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
      ImageIndex = 0
      OnExecute = actYearFilterExecute
    end
    object actFilterAllYear: TAction
      Category = 'catToolBar'
      Caption = #1042#1089#1077' '#1075#1086#1076#1072
      GroupIndex = 3
      OnExecute = actTreeRefreshActionExecute
    end
    object ActCurFilter: TAction
      Category = 'catToolBar'
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
      Checked = True
      GroupIndex = 3
      OnExecute = actTreeRefreshActionExecute
    end
    object actScheduleBookmarks: TAction
      Category = 'catToolBar'
      Caption = #1047#1072#1082#1083#1072#1076#1082#1080' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1081
      ImageIndex = 69
      OnUpdate = actFilleMenuUpdate
    end
    object actPrepodsFilter: TAction
      Tag = 1
      Category = 'catToolBar'
      Caption = #1058#1077#1082#1091#1097#1080#1077' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1080
      ImageIndex = 0
      OnExecute = actPrepodsFilterExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actPFShowAll: TAction
      Category = 'catToolBar'
      Caption = #1042#1089#1077' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1080
      GroupIndex = 10
      OnExecute = actPFShowAllExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actPFShowWorked: TAction
      Tag = 1
      Category = 'catToolBar'
      Caption = #1058#1077#1082#1091#1097#1080#1077' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1080
      Checked = True
      GroupIndex = 10
      OnExecute = actPFShowAllExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actPFShowReleased: TAction
      Tag = 2
      Category = 'catToolBar'
      Caption = #1059#1074#1086#1083#1077#1085#1085#1099#1077' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1080
      GroupIndex = 10
      OnExecute = actPFShowAllExecute
      OnUpdate = actFilleMenuUpdate
    end
    object actAbitFilter: TAction
      Category = 'catToolBar'
      Caption = #1060#1080#1083#1100#1090#1088' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074
      ImageIndex = 0
      OnExecute = actAbitFilterExecute
    end
    object ActAbitCurrent: TAction
      Category = 'catToolBar'
      AutoCheck = True
      Caption = #1058#1077#1082#1091#1097#1080#1077
      Checked = True
      OnExecute = actTreeRefreshActionExecute
    end
    object actAbitChecked: TAction
      Category = 'catToolBar'
      AutoCheck = True
      Caption = #1047#1072#1095#1080#1089#1083#1077#1085#1085#1099#1077
      Checked = True
      OnExecute = actTreeRefreshActionExecute
    end
    object ActAbitExiled: TAction
      Category = 'catToolBar'
      AutoCheck = True
      Caption = #1047#1072#1073#1088#1072#1074#1096#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      OnExecute = actTreeRefreshActionExecute
    end
    object ActAbitMoved: TAction
      Category = 'catToolBar'
      AutoCheck = True
      Caption = #1055#1077#1088#1077#1074#1077#1076#1105#1085#1085#1099#1077
      OnExecute = actTreeRefreshActionExecute
    end
    object actShowSecondary: TAction
      Category = 'catToolBar'
      AutoCheck = True
      Caption = #1042#1090#1086#1088#1080#1095#1085#1099#1077' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      Checked = True
      OnExecute = actTreeRefreshActionExecute
    end
    object actShowPrimary: TAction
      Category = 'catToolBar'
      AutoCheck = True
      Caption = #1055#1077#1088#1074#1080#1095#1085#1099#1077' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      Checked = True
      OnExecute = actTreeRefreshActionExecute
    end
    object actShowReal: TAction
      Category = 'catToolBar'
      AutoCheck = True
      Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1077' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      Checked = True
      OnExecute = actTreeRefreshActionExecute
    end
    object actFilterKaf: TAction
      Category = 'catToolBar'
      Caption = #1058#1077#1082#1091#1097#1080#1077' '#1082#1072#1092#1077#1076#1088#1099
      ImageIndex = 0
      OnExecute = actFilterKafExecute
    end
    object actAllKaf: TAction
      Category = 'catToolBar'
      AutoCheck = True
      Caption = #1042#1089#1077' '#1082#1072#1092#1077#1076#1088#1099
      GroupIndex = 11
      OnExecute = actTreeRefreshActionExecute
    end
    object actCurrentKaf: TAction
      Category = 'catToolBar'
      AutoCheck = True
      Caption = #1058#1077#1082#1091#1097#1080#1077' '#1082#1072#1092#1077#1076#1088#1099
      Checked = True
      GroupIndex = 11
      OnExecute = actTreeRefreshActionExecute
    end
  end
  object ppmFacNagr: TPopupMenu
    OnPopup = ppmFacNagrPopup
    Left = 413
    Top = 61
    object N24: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100
      Default = True
      OnClick = N75Click
    end
    object N25: TMenuItem
      Action = actRefreshDSinFrame
    end
    object N85: TMenuItem
      Action = actCollapseAll
    end
    object N94: TMenuItem
      Caption = '-'
    end
    object N83: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1092#1077#1076#1088#1091'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1092#1077#1076#1088#1091'...'
      ImageIndex = 48
      OnClick = actAddKafExecute
    end
    object N84: TMenuItem
      Action = actAddNorm
    end
  end
  object ppmDepNagr: TPopupMenu
    Left = 448
    Top = 60
    object N91: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1092#1077#1076#1088#1091
    end
    object N92: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1092#1077#1076#1088#1091
    end
    object N93: TMenuItem
      Caption = '-'
    end
    object N87: TMenuItem
      Action = actAddPrep
    end
    object N86: TMenuItem
      Action = actAddPotok
    end
  end
  object ppmPrepNagr: TPopupMenu
    Left = 479
    Top = 60
    object N88: TMenuItem
      Action = actEditPrep
    end
    object N89: TMenuItem
      Action = actDelPrep
    end
    object N90: TMenuItem
      Caption = '-'
    end
    object N99: TMenuItem
      Caption = #1055#1083#1072#1085#1080#1088#1091#1077#1084#1072#1103' '#1085#1072#1075#1088#1091#1079#1082#1072
      object N101: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081' '#1087#1083#1072#1085'...'
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081' '#1087#1083#1072#1085'...'
      end
      object N105: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1087#1083#1072#1085' '#1085#1086#1074#1091#1102' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091'...'
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1087#1083#1072#1085' '#1085#1086#1074#1091#1102' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091'...'
      end
    end
    object N100: TMenuItem
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1085#1072#1075#1088#1091#1079#1082#1072
    end
  end
end
