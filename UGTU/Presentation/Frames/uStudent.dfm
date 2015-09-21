inherited fmStudent: TfmStudent
  Width = 684
  Height = 684
  Constraints.MinHeight = 524
  Constraints.MinWidth = 561
  ParentFont = False
  OnExit = FrameExit
  ExplicitWidth = 684
  ExplicitHeight = 684
  object ToolBar1: TToolBar [0]
    Left = 0
    Top = 0
    Width = 684
    Height = 28
    Caption = 'ToolBar1'
    Images = frmMain.ImageList1
    TabOrder = 2
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Action = frmMain.actVypiska
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Action = frmMain.actNapr
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton13: TToolButton
      Left = 46
      Top = 0
      Action = frmMain.actNaprClose
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton9: TToolButton
      Left = 69
      Top = 0
      Action = frmMain.actFamChg
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton8: TToolButton
      Left = 92
      Top = 0
      Action = frmMain.actPasspChg
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton7: TToolButton
      Left = 115
      Top = 0
      Action = frmMain.actPerevod
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton6: TToolButton
      Left = 138
      Top = 0
      Action = frmMain.actAkadem
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton3: TToolButton
      Left = 161
      Top = 0
      Action = frmMain.actOtchisl
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton10: TToolButton
      Left = 184
      Top = 0
      Action = frmMain.actAcademRestore
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton5: TToolButton
      Left = 207
      Top = 0
      Action = frmMain.actVosst
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton14: TToolButton
      Left = 230
      Top = 0
      Action = frmMain.actExtendSession
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton1: TToolButton
      Left = 253
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = ToolButton1Click
    end
    object ToolButton11: TToolButton
      Left = 276
      Top = 0
      Hint = #1051#1080#1095#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1089#1090#1091#1076#1077#1085#1090#1072
      Caption = #1051#1080#1095#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1089#1090#1091#1076#1077#1085#1090#1072
      ImageIndex = 16
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object ToolButton12: TToolButton
      Left = 299
      Top = 0
      Action = actPrintSprav
      DropdownMenu = ppmSpravToExcel
      ParentShowHint = False
      PopupMenu = ppmSpravToExcel
      ShowHint = True
      Style = tbsDropDown
    end
  end
  inherited Panel1: TPanel
    Top = 28
    Width = 684
    Height = 619
    TabOrder = 1
    ExplicitTop = 28
    ExplicitWidth = 684
    ExplicitHeight = 619
    object ScrollBox1: TScrollBox
      Left = 2
      Top = 2
      Width = 680
      Height = 615
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 680
        Height = 615
        ActivePage = tbMagazine
        Align = alClient
        Constraints.MinWidth = 557
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheet1: TTabSheet
          Caption = #1051#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 672
            Height = 587
            ActivePage = TabSheet7
            Align = alClient
            Constraints.MinHeight = 426
            Constraints.MinWidth = 540
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Images = ilPages
            ParentFont = False
            Style = tsFlatButtons
            TabOrder = 0
            object TabSheet3: TTabSheet
              Caption = #1054#1073#1097#1080#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              object Panel4: TPanel
                Left = 0
                Top = 0
                Width = 664
                Height = 555
                Align = alClient
                TabOrder = 0
                object Panel8: TPanel
                  Left = 1
                  Top = 173
                  Width = 662
                  Height = 177
                  Align = alTop
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  object Label1: TLabel
                    Left = 160
                    Top = 44
                    Width = 99
                    Height = 13
                    Caption = #1042#1083#1072#1076#1077#1085#1080#1077' '#1103#1079#1099#1082#1072#1084#1080':'
                  end
                  object Label15: TLabel
                    Left = 13
                    Top = 84
                    Width = 119
                    Height = 13
                    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103':'
                  end
                  object Label16: TLabel
                    Left = 13
                    Top = 4
                    Width = 52
                    Height = 13
                    Caption = #1047#1072#1082#1086#1085#1095#1080#1083':'
                  end
                  object Label17: TLabel
                    Left = 13
                    Top = 44
                    Width = 80
                    Height = 13
                    Caption = #1043#1086#1076' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
                  end
                  object Label47: TLabel
                    Left = 13
                    Top = 124
                    Width = 101
                    Height = 13
                    Caption = #1055#1088#1080#1082#1072#1079' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103':'
                  end
                  object Label53: TLabel
                    Left = 115
                    Top = 124
                    Width = 4
                    Height = 13
                    Caption = '*'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object dbgeLang: TDBGridEh
                    Left = 160
                    Top = 91
                    Width = 368
                    Height = 72
                    AutoFitColWidths = True
                    DataSource = dmStudentSelectionProcs.dsLanguages
                    DynProps = <>
                    Flat = True
                    FooterParams.Color = clWindow
                    IndicatorOptions = []
                    Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    object RowDetailData: TRowDetailPanelControlEh
                    end
                  end
                  object dbcbeSchool: TDBLookupComboboxEh
                    Left = 13
                    Top = 19
                    Width = 515
                    Height = 19
                    DataField = ''
                    EditButtons = <>
                    Flat = True
                    KeyField = 'ik_zaved'
                    ListField = 'cName_zaved'
                    ListSource = dmStudentData.dsZaved_stud
                    TabOrder = 1
                    Visible = True
                    OnChange = eFamChange
                  end
                  object dbcbeCat: TDBLookupComboboxEh
                    Left = 13
                    Top = 100
                    Width = 141
                    Height = 19
                    DataField = ''
                    EditButtons = <>
                    Flat = True
                    KeyField = 'Ik_kat_zach'
                    ListField = 'Cname_kat_zach'
                    ListSource = dmStudentData.dsKatZach
                    TabOrder = 2
                    Visible = True
                    OnChange = eFamChange
                  end
                  object eYearFinished: TDBNumberEditEh
                    Left = 13
                    Top = 60
                    Width = 139
                    Height = 19
                    Alignment = taLeftJustify
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    TabOrder = 3
                    Visible = True
                    OnChange = eFamChange
                  end
                  object DBNavigator1: TDBNavigator
                    Left = 160
                    Top = 63
                    Width = 104
                    Height = 18
                    DataSource = dmStudentSelectionProcs.dsLanguages
                    VisibleButtons = [nbInsert, nbDelete]
                    Flat = True
                    Hints.Strings = (
                      #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
                      #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                      #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                      #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
                      #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                      #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                      #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
                      #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084'e'#1085#1077#1085#1080#1103
                      #1054#1090#1084#1077#1085#1072
                      #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1091#1092#1077#1088)
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 4
                  end
                  object dbcbeOrder: TDBLookupComboboxEh
                    Left = 13
                    Top = 141
                    Width = 141
                    Height = 19
                    DataField = ''
                    EditButtons = <>
                    Flat = True
                    KeyField = 'Ik_prikaz'
                    ListField = 'NN_Date'
                    ListSource = dmStudentData.dsPrikaz
                    TabOrder = 5
                    Visible = True
                    OnChange = eFamChange
                  end
                end
                object Panel7: TPanel
                  Left = 1
                  Top = 1
                  Width = 662
                  Height = 172
                  Align = alTop
                  TabOrder = 1
                  object Bevel2: TBevel
                    Left = 448
                    Top = 47
                    Width = 93
                    Height = 77
                  end
                  object Label44: TLabel
                    Left = 471
                    Top = 82
                    Width = 30
                    Height = 13
                    Caption = #1060#1054#1058#1054
                  end
                  object Label4: TLabel
                    Left = 13
                    Top = 48
                    Width = 84
                    Height = 13
                    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
                  end
                  object Label5: TLabel
                    Left = 13
                    Top = 7
                    Width = 48
                    Height = 13
                    Caption = #1060#1072#1084#1080#1083#1080#1103':'
                  end
                  object Label6: TLabel
                    Left = 158
                    Top = 7
                    Width = 23
                    Height = 13
                    Caption = #1048#1084#1103':'
                  end
                  object Label12: TLabel
                    Left = 300
                    Top = 7
                    Width = 53
                    Height = 13
                    Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
                  end
                  object Label37: TLabel
                    Left = 300
                    Top = 48
                    Width = 79
                    Height = 13
                    Caption = #1053#1086#1084#1077#1088' '#1079#1072#1095#1077#1090#1082#1080':'
                  end
                  object Label13: TLabel
                    Left = 300
                    Top = 89
                    Width = 96
                    Height = 13
                    Caption = #1057#1086#1090#1086#1074#1099#1081' '#1090#1077#1083#1077#1092#1086#1085':'
                  end
                  object Label18: TLabel
                    Left = 13
                    Top = 89
                    Width = 32
                    Height = 13
                    Caption = 'E-mail:'
                  end
                  object Label33: TLabel
                    Left = 60
                    Top = 7
                    Width = 4
                    Height = 13
                    Caption = '*'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label46: TLabel
                    Left = 181
                    Top = 7
                    Width = 4
                    Height = 13
                    Caption = '*'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label49: TLabel
                    Left = 96
                    Top = 48
                    Width = 4
                    Height = 13
                    Caption = '*'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label52: TLabel
                    Left = 379
                    Top = 48
                    Width = 4
                    Height = 13
                    Caption = '*'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object iPhoto: TImage
                    Left = 448
                    Top = 48
                    Width = 93
                    Height = 77
                    Cursor = crHandPoint
                    Stretch = True
                    OnClick = iPhotoClick
                    OnMouseEnter = iPhotoMouseEnter
                  end
                  object Label8: TLabel
                    Left = 158
                    Top = 89
                    Width = 48
                    Height = 13
                    Caption = #1058#1077#1083#1077#1092#1086#1085':'
                  end
                  object Label50: TLabel
                    Left = 203
                    Top = 50
                    Width = 4
                    Height = 13
                    Caption = '*'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object dbdteBirthDate: TDBDateTimeEditEh
                    Left = 12
                    Top = 64
                    Width = 138
                    Height = 19
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    Kind = dtkDateEh
                    TabOrder = 3
                    Visible = True
                    OnChange = eFamChange
                  end
                  object eFam: TDBEditEh
                    Left = 13
                    Top = 23
                    Width = 138
                    Height = 19
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    TabOrder = 0
                    Visible = True
                    OnChange = eFamChange
                    OnExit = eFamExit
                    EditMask = ''
                  end
                  object eName: TDBEditEh
                    Left = 156
                    Top = 23
                    Width = 136
                    Height = 19
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    TabOrder = 1
                    Visible = True
                    OnChange = eFamChange
                    OnExit = eNameExit
                    EditMask = ''
                  end
                  object eMid: TDBEditEh
                    Left = 299
                    Top = 23
                    Width = 242
                    Height = 19
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    TabOrder = 2
                    Visible = True
                    OnChange = eFamChange
                    OnExit = eMidExit
                    EditMask = ''
                  end
                  object eEmail: TDBEditEh
                    Left = 13
                    Top = 105
                    Width = 137
                    Height = 19
                    Alignment = taLeftJustify
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    TabOrder = 5
                    Visible = True
                    OnChange = eFamChange
                    OnExit = eEmailExit
                  end
                  object eNum: TDBEditEh
                    Left = 299
                    Top = 64
                    Width = 143
                    Height = 19
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    MaxLength = 6
                    TabOrder = 4
                    Text = '      '
                    Visible = True
                    OnChange = eFamChange
                    OnExit = eNumExit
                    OnUpdateData = eNumUpdateData
                    EditMask = '000000; ; '
                  end
                  object eCellphone: TDBEditEh
                    Left = 299
                    Top = 105
                    Width = 143
                    Height = 19
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    TabOrder = 6
                    Visible = True
                    OnChange = eFamChange
                  end
                  object ePhone: TDBEditEh
                    Left = 156
                    Top = 105
                    Width = 136
                    Height = 19
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    TabOrder = 7
                    Visible = True
                    OnChange = eFamChange
                  end
                  object bShot: TButton
                    Left = 448
                    Top = 131
                    Width = 93
                    Height = 25
                    Caption = #1057#1085#1080#1084#1086#1082
                    TabOrder = 8
                    OnClick = bShotClick
                  end
                  object rgSex: TRadioGroup
                    Left = 176
                    Top = 53
                    Width = 83
                    Height = 30
                    Caption = #1055#1086#1083
                    Columns = 2
                    ItemIndex = 1
                    Items.Strings = (
                      #1046
                      #1052)
                    TabOrder = 9
                    OnClick = rgSexClick
                  end
                end
                object Panel6: TPanel
                  Left = 1
                  Top = 350
                  Width = 662
                  Height = 204
                  Align = alClient
                  TabOrder = 0
                  DesignSize = (
                    662
                    204)
                  object Label2: TLabel
                    Left = 12
                    Top = 10
                    Width = 85
                    Height = 13
                    Caption = #1040#1076#1088#1077#1089#1072' '#1089#1090#1091#1076#1077#1085#1090#1072
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object sbAddAddress: TSpeedButton
                    Left = 631
                    Top = 35
                    Width = 23
                    Height = 23
                    Action = actAddAddress
                    Anchors = [akTop, akRight]
                    Flat = True
                    ExplicitLeft = 672
                  end
                  object sbRemoveAddress: TSpeedButton
                    Left = 631
                    Top = 93
                    Width = 23
                    Height = 23
                    Action = actDeleteAddress
                    Anchors = [akTop, akRight]
                    Flat = True
                    ExplicitLeft = 672
                  end
                  object SpeedButton2: TSpeedButton
                    Left = 631
                    Top = 64
                    Width = 23
                    Height = 23
                    Action = actEditAddress
                    Anchors = [akTop, akRight]
                    Flat = True
                    ExplicitLeft = 672
                  end
                  object SpeedButton3: TSpeedButton
                    Left = 108
                    Top = 5
                    Width = 230
                    Height = 22
                    Action = actPropToFact
                    Flat = True
                  end
                  object dbgeAddress: TDBGridEh
                    Left = 12
                    Top = 33
                    Width = 613
                    Height = 146
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    DataSource = dmStudentSelectionProcs.dsGetPersonAddress
                    DynProps = <>
                    Flat = True
                    FooterParams.Color = clWindow
                    IndicatorOptions = []
                    Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                    RowHeight = 18
                    TabOrder = 0
                    OnDblClick = actEditAddressExecute
                    object RowDetailData: TRowDetailPanelControlEh
                    end
                  end
                end
              end
            end
            object TabSheet4: TTabSheet
              Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ImageIndex = 1
              ParentFont = False
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 664
                Height = 555
                Align = alClient
                TabOrder = 0
                object Panel5: TPanel
                  Left = 1
                  Top = 1
                  Width = 662
                  Height = 101
                  Align = alTop
                  TabOrder = 0
                  object Label27: TLabel
                    Left = 17
                    Top = 52
                    Width = 89
                    Height = 13
                    Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103':'
                  end
                  object Label29: TLabel
                    Left = 17
                    Top = 8
                    Width = 72
                    Height = 13
                    Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086':'
                  end
                  object Label58: TLabel
                    Left = 89
                    Top = 4
                    Width = 6
                    Height = 13
                    Caption = '*'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbcbeCitizenship: TDBLookupComboboxEh
                    Left = 17
                    Top = 28
                    Width = 509
                    Height = 19
                    Alignment = taLeftJustify
                    DataField = ''
                    EditButtons = <>
                    Flat = True
                    KeyField = 'ik_grazd'
                    ListField = 'c_grazd'
                    ListSource = dmStudentData.dsCitizen
                    TabOrder = 0
                    Visible = True
                    OnChange = dbcbeCitizenshipChange
                  end
                  object eBirthPlace: TDBEditEh
                    Left = 17
                    Top = 71
                    Width = 510
                    Height = 19
                    Alignment = taLeftJustify
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    TabOrder = 1
                    Visible = True
                    OnChange = eFamChange
                  end
                end
                object pnlDop: TPanel
                  Left = 1
                  Top = 102
                  Width = 662
                  Height = 307
                  Align = alTop
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object Label30: TLabel
                    Left = 17
                    Top = 83
                    Width = 119
                    Height = 13
                    Caption = #1054#1073#1097#1077#1089#1090#1074#1077#1085#1085#1072#1103' '#1088#1072#1073#1086#1090#1072':'
                  end
                  object Label31: TLabel
                    Left = 17
                    Top = 38
                    Width = 132
                    Height = 13
                    Caption = #1044#1086#1074#1091#1079#1086#1074#1089#1082#1072#1103' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1072':'
                  end
                  object Label32: TLabel
                    Left = 18
                    Top = 84
                    Width = 99
                    Height = 13
                    Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1099#1081' '#1091#1095#1077#1090':'
                    Visible = False
                  end
                  object Label34: TLabel
                    Left = 17
                    Top = 177
                    Width = 143
                    Height = 13
                    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103':'
                  end
                  object Label42: TLabel
                    Left = 204
                    Top = 40
                    Width = 43
                    Height = 13
                    Caption = #1052#1077#1076#1072#1083#1100':'
                  end
                  object Label43: TLabel
                    Left = 17
                    Top = 135
                    Width = 253
                    Height = 13
                    Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1074#1086#1077#1085#1085#1086#1081' '#1089#1083#1091#1078#1073#1077' / '#1074#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077': '
                  end
                  object cbChildren: TCheckBox
                    Left = 204
                    Top = 9
                    Width = 97
                    Height = 17
                    Caption = #1053#1072#1083#1080#1095#1080#1077' '#1076#1077#1090#1077#1081
                    TabOrder = 0
                    OnClick = eFamChange
                  end
                  object cbJob: TCheckBox
                    Left = 17
                    Top = 280
                    Width = 118
                    Height = 17
                    Caption = #1053#1072#1083#1080#1095#1080#1077' '#1088#1072#1073#1086#1090#1099
                    TabOrder = 1
                    OnClick = cbJobClick
                  end
                  object cbInvalid: TCheckBox
                    Left = 319
                    Top = 9
                    Width = 97
                    Height = 17
                    Caption = #1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                    OnClick = eFamChange
                  end
                  object cbAppNeed: TCheckBox
                    Left = 18
                    Top = 9
                    Width = 164
                    Height = 17
                    Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100' '#1074' '#1086#1073#1097#1077#1078#1080#1090#1080#1080
                    TabOrder = 3
                    OnClick = eFamChange
                  end
                  object dbcbePreparation: TDBLookupComboboxEh
                    Left = 17
                    Top = 56
                    Width = 172
                    Height = 19
                    Alignment = taLeftJustify
                    DataField = ''
                    EditButtons = <>
                    Flat = True
                    KeyField = 'Ik_podg'
                    ListField = 'Cname_podg'
                    ListSource = dmStudentData.dsPrep
                    TabOrder = 4
                    Visible = True
                    OnChange = eFamChange
                  end
                  object dbcbeSocWork: TDBLookupComboboxEh
                    Left = 17
                    Top = 100
                    Width = 172
                    Height = 19
                    Alignment = taLeftJustify
                    DataField = ''
                    EditButtons = <>
                    Flat = True
                    KeyField = 'Ik_ob_rab'
                    ListField = 'Cname_ob_rab'
                    ListSource = dmStudentData.dsJob
                    TabOrder = 5
                    Visible = True
                    OnChange = eFamChange
                  end
                  object dbcbeSpecCount: TDBLookupComboboxEh
                    Left = 18
                    Top = 100
                    Width = 172
                    Height = 19
                    Alignment = taLeftJustify
                    DataField = ''
                    EditButtons = <>
                    Flat = True
                    KeyField = 'Ik_special_uchet'
                    ListField = 'Cspecial_uchet'
                    ListSource = dmStudentData.dsCount
                    TabOrder = 6
                    Visible = False
                    OnChange = eFamChange
                  end
                  object dbcbeMedal: TDBLookupComboboxEh
                    Left = 204
                    Top = 56
                    Width = 212
                    Height = 19
                    Alignment = taLeftJustify
                    DataField = ''
                    EditButtons = <>
                    Flat = True
                    KeyField = 'ik_medal'
                    ListField = 'cmedal'
                    ListSource = dmStudentData.dsMedal
                    TabOrder = 7
                    Visible = True
                    OnChange = eFamChange
                  end
                  object dbcbeMilitaryState: TDBLookupComboboxEh
                    Left = 16
                    Top = 152
                    Width = 609
                    Height = 19
                    Alignment = taLeftJustify
                    DataField = ''
                    EditButtons = <>
                    Flat = True
                    KeyField = 'Ik_voen_zvanie'
                    ListField = 'Cvoen_zvanie'
                    ListSource = dmStudentData.dsMilSt
                    TabOrder = 8
                    Visible = True
                    OnChange = eFamChange
                  end
                  object eAddInfo: TMemo
                    Left = 17
                    Top = 196
                    Width = 608
                    Height = 72
                    BevelInner = bvNone
                    BorderStyle = bsNone
                    MaxLength = 1000
                    TabOrder = 9
                    OnChange = eFamChange
                    OnEnter = eAddInfoEnter
                    OnExit = eAddInfoExit
                  end
                end
                object pnlWork: TPanel
                  Left = 1
                  Top = 409
                  Width = 662
                  Height = 145
                  Align = alClient
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  Visible = False
                  object Label51: TLabel
                    Left = 12
                    Top = 18
                    Width = 76
                    Height = 13
                    Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099':'
                  end
                  object Label54: TLabel
                    Left = 27
                    Top = 48
                    Width = 61
                    Height = 13
                    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
                  end
                  object Label55: TLabel
                    Left = 16
                    Top = 78
                    Width = 72
                    Height = 13
                    Caption = #1057#1090#1072#1078' '#1088#1072#1073#1086#1090#1099':'
                  end
                  object Label56: TLabel
                    Left = 145
                    Top = 78
                    Width = 18
                    Height = 13
                    Caption = #1083#1077#1090
                  end
                  object Label57: TLabel
                    Left = 225
                    Top = 78
                    Width = 41
                    Height = 13
                    Caption = #1084#1077#1089#1103#1094#1077#1074
                  end
                  object dbcbeEnterprise: TDBLookupComboboxEh
                    Left = 94
                    Top = 15
                    Width = 531
                    Height = 19
                    Alignment = taLeftJustify
                    DataField = ''
                    EditButtons = <>
                    Flat = True
                    KeyField = 'Ik_pred'
                    ListField = 'Cname_pred'
                    ListSource = dmStudentData.dsEnterprise
                    TabOrder = 0
                    Visible = True
                    OnChange = eFamChange
                  end
                  object eDuty: TDBEditEh
                    Left = 94
                    Top = 45
                    Width = 172
                    Height = 19
                    Alignment = taLeftJustify
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    TabOrder = 1
                    Visible = True
                    OnChange = eFamChange
                  end
                  object eXpyear: TDBNumberEditEh
                    Left = 94
                    Top = 75
                    Width = 45
                    Height = 19
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    MaxValue = 1000.000000000000000000
                    TabOrder = 2
                    Visible = True
                    OnChange = eFamChange
                  end
                  object eXpMonth: TDBNumberEditEh
                    Left = 174
                    Top = 75
                    Width = 45
                    Height = 19
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    MaxValue = 11.000000000000000000
                    TabOrder = 3
                    Visible = True
                    OnChange = eFamChange
                  end
                end
              end
            end
            object TabSheet5: TTabSheet
              Caption = #1057#1077#1084#1100#1103' '#1080' '#1092#1072#1084#1080#1083#1080#1103
              ImageIndex = 2
              object Splitter1: TSplitter
                Left = 0
                Top = 25
                Width = 664
                Height = 3
                Cursor = crVSplit
                Align = alTop
                ExplicitWidth = 575
              end
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 664
                Height = 25
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label38: TLabel
                  Left = 323
                  Top = 6
                  Width = 112
                  Height = 13
                  Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077':'
                end
                object dbcbeFamState: TDBLookupComboboxEh
                  Left = 441
                  Top = 1
                  Width = 157
                  Height = 19
                  DataField = ''
                  EditButtons = <>
                  Flat = True
                  KeyField = 'ik_sem_pol'
                  ListField = 'csem_pol'
                  ListSource = dmStudentData.dsSempol
                  TabOrder = 0
                  Visible = True
                  OnChange = eFamChange
                end
              end
              object dbgeFam: TDBGridEh
                Left = 0
                Top = 28
                Width = 664
                Height = 403
                Align = alClient
                DataSource = dmStudentSelectionProcs.dsFamily
                DynProps = <>
                Flat = True
                FooterParams.Color = clWindow
                IndicatorOptions = []
                Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
                RowHeight = 18
                TabOrder = 1
                OnExit = dbgeFamExit
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
              object dbgeChangeFam: TDBGridEh
                Left = 0
                Top = 431
                Width = 664
                Height = 124
                Align = alBottom
                AutoFitColWidths = True
                DataSource = dmStudentSelectionProcs.dsLastnames
                DynProps = <>
                Flat = True
                FooterParams.Color = clWindow
                IndicatorOptions = []
                Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 2
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
              object DBNavigator2: TDBNavigator
                Left = 0
                Top = 1
                Width = 315
                Height = 21
                DataSource = dmStudentSelectionProcs.dsFamily
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit]
                Flat = True
                Hints.Strings = (
                  #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
                  #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                  #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                  #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
                  #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                  #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                  #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
                  #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084'e'#1085#1077#1085#1080#1103
                  #1054#1090#1084#1077#1085#1072
                  #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1091#1092#1077#1088
                  '')
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
              end
            end
            object TabSheet6: TTabSheet
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
              ImageIndex = 3
              object dbgeDocuments: TDBGridEh
                Left = 0
                Top = 0
                Width = 613
                Height = 555
                Align = alClient
                AutoFitColWidths = True
                DataSource = dmStudentSelectionProcs.dsDocuments
                DynProps = <>
                Flat = True
                FooterParams.Color = clWindow
                IndicatorOptions = []
                Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                RowHeight = 18
                TabOrder = 0
                TitleParams.Font.Charset = DEFAULT_CHARSET
                TitleParams.Font.Color = clWindowText
                TitleParams.Font.Height = -11
                TitleParams.Font.Name = 'Tahoma'
                TitleParams.Font.Style = []
                TitleParams.ParentFont = False
                OnCellClick = dbgeDocumentsCellClick
                OnDblClick = dbgeDocumentsDblClick
                OnExit = dbgeFamExit
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
              object DBNavigator3: TDBNavigator
                Left = 0
                Top = 2
                Width = 315
                Height = 21
                DataSource = dmStudentSelectionProcs.dsDocuments
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit]
                Flat = True
                Hints.Strings = (
                  #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
                  #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                  #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                  #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
                  #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                  #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                  #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
                  #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084'e'#1085#1077#1085#1080#1103
                  #1054#1090#1084#1077#1085#1072
                  #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1091#1092#1077#1088)
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                Visible = False
              end
              object pnlToolDoc: TPanel
                Left = 613
                Top = 0
                Width = 51
                Height = 555
                Align = alRight
                TabOrder = 2
                object sbAddDoc: TSpeedButton
                  Left = 9
                  Top = 9
                  Width = 23
                  Height = 22
                  Action = actAddDocument
                  Flat = True
                end
                object SpeedButton7: TSpeedButton
                  Left = 9
                  Top = 37
                  Width = 23
                  Height = 22
                  Action = actUpdateDocument
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object SbDelDoc: TSpeedButton
                  Left = 9
                  Top = 65
                  Width = 23
                  Height = 22
                  Action = actDelDocument
                  Flat = True
                end
              end
            end
            object TabSheet7: TTabSheet
              Caption = #1057#1086#1073#1099#1090#1080#1103
              ImageIndex = 4
              object gbExiled: TGroupBox
                Left = 0
                Top = 0
                Width = 664
                Height = 91
                Align = alTop
                Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086#1073' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1080
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object DBGridEh5: TDBGridEh
                  Left = 2
                  Top = 15
                  Width = 660
                  Height = 74
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsExiles
                  DynProps = <>
                  Flat = True
                  FooterParams.Color = clWindow
                  IndicatorOptions = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  object RowDetailData: TRowDetailPanelControlEh
                  end
                end
              end
              object gbAcadem: TGroupBox
                Left = 0
                Top = 179
                Width = 664
                Height = 86
                Align = alTop
                Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086#1073' '#1072#1082#1072#1076#1077#1084#1080#1095#1077#1089#1082#1080#1093' '#1086#1090#1087#1091#1089#1082#1072#1093
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object dbgeAcadem: TDBGridEh
                  Left = 2
                  Top = 15
                  Width = 660
                  Height = 69
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsAcadem
                  DynProps = <>
                  Flat = True
                  FooterParams.Color = clWindow
                  IndicatorOptions = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  object RowDetailData: TRowDetailPanelControlEh
                  end
                end
              end
              object gbEntered: TGroupBox
                Left = 0
                Top = 91
                Width = 664
                Height = 88
                Align = alTop
                Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1080
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                object DBGridEh3: TDBGridEh
                  Left = 2
                  Top = 15
                  Width = 660
                  Height = 71
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsVosst
                  DynProps = <>
                  Flat = True
                  FooterParams.Color = clWindow
                  IndicatorOptions = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  object RowDetailData: TRowDetailPanelControlEh
                  end
                end
              end
              object gbProlongued: TGroupBox
                Left = 0
                Top = 457
                Width = 664
                Height = 98
                Align = alClient
                Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1087#1088#1086#1076#1083#1077#1085#1080#1080' '#1089#1077#1089#1089#1080#1080
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                object DBGridEh6: TDBGridEh
                  Left = 2
                  Top = 15
                  Width = 660
                  Height = 81
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsExtendedSessions
                  DynProps = <>
                  Flat = True
                  FooterParams.Color = clWindow
                  IndicatorOptions = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  object RowDetailData: TRowDetailPanelControlEh
                  end
                end
              end
              object gbCatChange: TGroupBox
                Left = 0
                Top = 361
                Width = 664
                Height = 96
                Align = alTop
                Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1089#1084#1077#1085#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1086#1073#1091#1095#1077#1085#1080#1103
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                object DBGridEh2: TDBGridEh
                  Left = 2
                  Top = 15
                  Width = 660
                  Height = 79
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsSelKatChanges
                  DynProps = <>
                  Flat = True
                  FooterParams.Color = clWindow
                  IndicatorOptions = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  object RowDetailData: TRowDetailPanelControlEh
                  end
                end
              end
              object gbMoved: TGroupBox
                Left = 0
                Top = 265
                Width = 664
                Height = 96
                Align = alTop
                Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1087#1077#1088#1077#1074#1086#1076#1072#1093' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1082#1091#1088#1089
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                object DBGridEh4: TDBGridEh
                  Left = 2
                  Top = 15
                  Width = 660
                  Height = 79
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsMoves
                  DynProps = <>
                  Flat = True
                  FooterParams.Color = clWindow
                  IndicatorOptions = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  object RowDetailData: TRowDetailPanelControlEh
                  end
                end
              end
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1059#1089#1087#1077#1074#1072#1077#1084#1086#1089#1090#1100
          ImageIndex = 1
          object DBGridEh1: TDBGridEh
            Left = 0
            Top = 26
            Width = 672
            Height = 561
            Align = alClient
            AllowedOperations = []
            AutoFitColWidths = True
            DataSource = dmUspevaemost.dsSelUspevForStud
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            IndicatorOptions = []
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove]
            RowSizingAllowed = True
            SortLocal = True
            TabOrder = 0
            OnTitleClick = DBGridEh1TitleClick
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 672
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label45: TLabel
              Left = 5
              Top = 7
              Width = 46
              Height = 13
              Caption = #1057#1077#1084#1077#1089#1090#1088':'
            end
            object KontExcel: TSpeedButton
              Left = 276
              Top = 1
              Width = 147
              Height = 22
              Hint = #1069#1082#1089#1087#1086#1088#1090' '#1087#1086#1083#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072' '#1074' MS Excel'
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
              OnClick = KontExcelClick
            end
            object SpeedButton1: TSpeedButton
              Left = 144
              Top = 2
              Width = 126
              Height = 22
              Action = actObnovl
              Flat = True
              ParentShowHint = False
              ShowHint = True
            end
            object btnPrintSmallUspev: TSpeedButton
              Left = 429
              Top = 0
              Width = 170
              Height = 23
              Hint = #1069#1082#1089#1087#1086#1088#1090' '#1091#1089#1087#1077#1074#1072#1077#1084#1086#1089#1090#1080' '#1074' '#1083#1080#1095#1085#1091#1102' '#1082#1072#1088#1090#1086#1095#1082#1091
              Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' '#1083#1080#1095#1085#1091#1102' '#1082#1072#1088#1090#1086#1095#1082#1091
              Flat = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00E7E7E7008C8C8C00CECECE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00BDB5B500E7DEE7006B6B6B00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00CECECE00E7E7E70073737300FF00FF00FF00FF00FFFFFF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00C6C6C600ADADAD0084848400B5B5B500ADADAD00ADAD
                AD00EFEFEF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF009C9494009C9494009C9494009C949400BDB5A500D6CEBD00ADADA500C6B5
                A5007B736B008C8C84009C9494009C9494009C9494009C949400FF00FF00FF00
                FF009C949400FFFFFF00CEC6BD009C9C9400EFDEC600DECEBD00E7DED600FFFF
                F700E7D6BD00ADA5A500FFFFFF00FFFFFF00FFFFFF009C949400FF00FF00FF00
                FF009C949400FFFFFF00FFFFFF00ADA59C00FFEFCE00FFEFDE00FFF7EF00FFF7
                EF00FFEFD600ADA59C00FFFFFF00FFFFFF00FFFFFF009C949400FF00FF00FF00
                FF009C949400FFFFFF00BD845A009C7B6300D6A57300E7C6A500F7D6B500FFEF
                D600E7CEB500ADADAD00FFFFFF00FFFFFF00FFFFFF009C949400FF00FF00FF00
                FF009C949400FFFFFF00CE946300AD8C6B00C69C7300E7D6BD00FFFFF700EFDE
                CE00BDADA500EFEFEF00FFFFFF00BD845A00FFFFFF009C949400FF00FF00FF00
                FF009C949400FFFFFF00CE9C6B00CE9C6B00A5846300B5A59C00BDB5AD00B5AD
                AD00C6C6C600DEDEDE00FFFFFF00CE946300FFFFFF009C949400FF00FF00FF00
                FF009C949400FFFFFF00DEB57B00DEB57B00DEB57B00DEB57B00EFDEC600FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00DEB57B00FFFFFF009C949400FF00FF00FF00
                FF009C949400FFFFFF00EFCE9400EFCE9400EFCE9400EFCE9400F7E7C600FFFF
                FF00DEDED600DEDED600FFFFFF00EFCE9400FFFFFF009C949400FF00FF00FF00
                FF009C949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C949400FF00FF00FF00
                FF009C949400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
                CE00CECECE00CECECE00CECECE00CECECE00CECECE009C949400FF00FF00FF00
                FF009C949400E7DED600E7DED600E7DED600E7DED600E7DED600E7DED600E7DE
                D600A5948400E7DED600A5948400E7DED6009C847B009C949400FF00FF00FF00
                FF009C9494009C9494009C9494009C9494009C9494009C9494009C9494009C94
                94009C9494009C9494009C9494009C9494009C9494009C949400}
              ParentShowHint = False
              ShowHint = True
              OnClick = btnPrintSmallUspevClick
            end
            object cmbxSem: TDBComboBoxEh
              Left = 56
              Top = 4
              Width = 82
              Height = 19
              Hint = #1053#1086#1084#1077#1088' '#1089#1077#1084#1077#1089#1090#1088#1072', '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1086#1090#1073#1088#1072#1078#1072#1077#1090#1089#1103
              DynProps = <>
              EditButtons = <>
              Flat = True
              Items.Strings = (
                #1074#1089#1077
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
              TabOrder = 0
              Visible = True
              OnChange = cmbxSemChange
            end
          end
        end
        object tsBRSBalls: TTabSheet
          Caption = #1041#1072#1083#1083#1099' '#1087#1086' '#1084#1086#1076#1091#1083#1103#1084
          ImageIndex = 4
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 672
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label7: TLabel
              Left = 5
              Top = 7
              Width = 46
              Height = 13
              Caption = #1057#1077#1084#1077#1089#1090#1088':'
            end
            object SpeedButton4: TSpeedButton
              Left = 419
              Top = 1
              Width = 156
              Height = 22
              Hint = #1069#1082#1089#1087#1086#1088#1090' '#1087#1086#1083#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072' '#1074' MS Excel'
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
              Visible = False
              OnClick = KontExcelClick
            end
            object sbRefresh: TSpeedButton
              Left = 282
              Top = 1
              Width = 130
              Height = 22
              Action = actObnovl
              Flat = True
              ParentShowHint = False
              ShowHint = True
            end
            object Label9: TLabel
              Left = 144
              Top = 6
              Width = 42
              Height = 13
              Hint = '1'
              Caption = #1052#1086#1076#1091#1083#1100':'
            end
            object cbSemBRS: TDBComboBoxEh
              Left = 56
              Top = 4
              Width = 82
              Height = 19
              Hint = #1053#1086#1084#1077#1088' '#1089#1077#1084#1077#1089#1090#1088#1072', '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1086#1090#1073#1088#1072#1078#1072#1077#1090#1089#1103
              DynProps = <>
              EditButtons = <>
              Flat = True
              Items.Strings = (
                #1074#1089#1077
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
              TabOrder = 0
              Text = #1074#1089#1077
              Visible = True
              OnChange = cbSemBRSChange
            end
            object cbModuleBRS: TDBComboBoxEh
              Left = 193
              Top = 4
              Width = 82
              Height = 19
              Hint = #1053#1086#1084#1077#1088' '#1089#1077#1084#1077#1089#1090#1088#1072', '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1086#1090#1073#1088#1072#1078#1072#1077#1090#1089#1103
              DynProps = <>
              EditButtons = <>
              Flat = True
              Items.Strings = (
                #1074#1089#1077
                '1'
                '2'
                '3')
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
              TabOrder = 1
              Text = #1074#1089#1077
              Visible = True
              OnChange = cbModuleBRSChange
            end
          end
          object dbgeBalls: TDBGridEh
            Left = 0
            Top = 26
            Width = 672
            Height = 561
            Align = alClient
            AllowedOperations = []
            AutoFitColWidths = True
            DataSource = dmUspevaemost.dsSelAllBRSBallsForStudent
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            IndicatorOptions = []
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove]
            RowSizingAllowed = True
            SortLocal = True
            TabOrder = 1
            OnTitleClick = dbgeBallsTitleClick
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object TabSheet9: TTabSheet
          Caption = #1047#1072#1082#1088#1099#1090#1099#1077' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
          ImageIndex = 2
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 672
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label39: TLabel
              Left = 5
              Top = 7
              Width = 46
              Height = 13
              Caption = #1057#1077#1084#1077#1089#1090#1088':'
            end
            object cmbxSemNapr: TDBComboBoxEh
              Left = 56
              Top = 4
              Width = 82
              Height = 19
              Hint = #1053#1086#1084#1077#1088' '#1089#1077#1084#1077#1089#1090#1088#1072', '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1086#1090#1073#1088#1072#1078#1072#1077#1090#1089#1103
              DynProps = <>
              EditButtons = <>
              Flat = True
              Items.Strings = (
                #1074#1089#1077
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
              TabOrder = 0
              Visible = True
              OnChange = cmbxSemNaprChange
            end
          end
          object dbgrNapr: TDBGridEh
            Left = 0
            Top = 26
            Width = 672
            Height = 561
            Align = alClient
            AllowedOperations = []
            AutoFitColWidths = True
            DataSource = dmUspevaemost.dsGetAllNaprStud
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            IndicatorOptions = []
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove]
            PopupMenu = ppmStudNapr
            RowSizingAllowed = True
            SortLocal = True
            TabOrder = 1
            OnTitleClick = dbgrNaprTitleClick
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object tsUspevStat: TTabSheet
          Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
          ImageIndex = 3
          object dbgUspevStat: TDBGridEh
            Left = 0
            Top = 0
            Width = 672
            Height = 587
            Align = alClient
            AllowedOperations = []
            DataSource = dmUspevaemost.dsUspevStatForStud
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            IndicatorOptions = []
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove]
            ReadOnly = True
            RowSizingAllowed = True
            SortLocal = True
            TabOrder = 0
            OnTitleClick = dbgUspevStatTitleClick
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'n_sem'
                Footers = <>
                Title.Caption = #1057#1077#1084#1077#1089#1090#1088
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ExamAVGOcenca'
                Footers = <>
                Title.Caption = #1057#1088'. '#1073#1072#1083#1083' '#1079#1072' '#1101#1082#1079#1072#1084#1077#1085#1099
                Width = 140
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'KPAVGOcenca'
                Footers = <>
                Title.Caption = #1057#1088'. '#1073#1072#1083#1083' '#1079#1072' '#1082#1091#1088#1089#1086#1074#1099#1077
                Width = 120
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'AVGOcenca'
                Footers = <>
                Title.Caption = #1048#1090#1086#1075#1086#1074#1099#1081' '#1089#1088'. '#1073#1072#1083#1083
                Width = 137
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object tbMagazine: TTabSheet
          Caption = #1046#1091#1088#1085#1072#1083' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 5
          ParentFont = False
          object panelMagaz: TPanel
            Left = 0
            Top = 0
            Width = 672
            Height = 47
            Align = alTop
            TabOrder = 0
            DesignSize = (
              672
              47)
            object lPeriod: TLabel
              Left = 292
              Top = 12
              Width = 38
              Height = 13
              Anchors = [akRight, akBottom]
              Caption = #1055#1077#1088#1080#1086#1076
              ExplicitLeft = 276
            end
            object lDef: TLabel
              Left = 455
              Top = 12
              Width = 4
              Height = 13
              Anchors = [akRight, akBottom]
              Caption = '-'
            end
            object tbAction: TToolBar
              Left = 195
              Top = 6
              Width = 98
              Height = 25
              Align = alNone
              ButtonHeight = 25
              Images = ilMain
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object tbCreate: TToolButton
                Left = 0
                Top = 0
                Hint = #1053#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                Caption = #1053#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                ImageIndex = 0
                OnClick = tbCreateClick
              end
              object tbUtv: TToolButton
                Left = 23
                Top = 0
                Hint = #1053#1072' '#1088#1072#1089#1089#1084#1086#1090#1088#1077#1085#1080#1080
                ImageIndex = 14
                OnClick = tbUtvClick
              end
              object tbGot: TToolButton
                Left = 46
                Top = 0
                Hint = #1043#1086#1090#1086#1074#1086' '
                ImageIndex = 8
                OnClick = tbGotClick
              end
              object tbPrint: TToolButton
                Left = 69
                Top = 0
                Hint = #1055#1077#1095#1072#1090#1100
                ImageIndex = 9
                OnClick = tbPrintClick
              end
            end
            object bbReset: TBitBtn
              Left = 571
              Top = 8
              Width = 91
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1057#1073#1088#1086#1089' '#1092#1080#1083#1100#1090#1088#1072
              TabOrder = 1
              OnClick = bbResetClick
            end
            object dtpStart: TDateTimePicker
              Left = 340
              Top = 10
              Width = 109
              Height = 21
              Anchors = [akRight, akBottom]
              Date = 42157.433803819450000000
              Time = 42157.433803819450000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnCloseUp = dtpStartCloseUp
            end
            object cbeDest: TDBLookupComboboxEh
              Left = 11
              Top = 8
              Width = 178
              Height = 21
              DataField = ''
              EditButtons = <>
              KeyField = 'Ik_destination'
              ListField = 'cShortNameDestination'
              ListSource = dmDocs.dsDest
              TabOrder = 3
              Visible = True
            end
            object dtpEnd: TDateTimePicker
              Left = 465
              Top = 9
              Width = 100
              Height = 22
              Anchors = [akRight, akBottom]
              Date = 42157.434117662040000000
              Time = 42157.434117662040000000
              TabOrder = 4
              OnCloseUp = dtpEndCloseUp
            end
          end
          object dbgehMagazineDocsStud: TDBGridEh
            Left = 0
            Top = 47
            Width = 672
            Height = 540
            Align = alClient
            AllowedSelections = [gstRecordBookmarks, gstAll]
            ColumnDefValues.AutoDropDown = True
            ColumnDefValues.DblClickNextVal = True
            ColumnDefValues.DropDownShowTitles = True
            ColumnDefValues.EndEllipsis = True
            ColumnDefValues.Footer.ToolTips = True
            ColumnDefValues.HighlightRequired = True
            ColumnDefValues.Title.EndEllipsis = True
            ColumnDefValues.Title.TitleButton = True
            DataSource = dmDocs.dsDocStud
            DynProps = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            IndicatorOptions = [gioShowRowIndicatorEh]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentFont = False
            ReadOnly = True
            SortLocal = True
            STFilter.Local = True
            STFilter.Visible = True
            STFilter.Font.Charset = DEFAULT_CHARSET
            STFilter.Font.Color = clBlue
            STFilter.Font.Height = -11
            STFilter.Font.Name = 'Tahoma'
            STFilter.Font.Style = []
            STFilter.ParentFont = False
            TabOrder = 1
            OnDrawColumnCell = dbgehMagazineDocsStudDrawColumnCell
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'NumberDoc'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                STFilter.KeyField = 'Ik_Document'
                STFilter.ListSource = dmDocs.dsDocs
                Title.Caption = #8470
                Width = 69
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Status'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                STFilter.ListSource = dmDocs.dsDocs
                Title.Caption = #1057#1090#1072#1090#1091#1089
                Width = 172
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DatePod'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080
                Width = 174
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DateCreate'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                Title.Caption = #1044#1072#1090#1072' '#1088#1072#1089#1089#1084#1086#1090#1088#1077#1085#1080#1103
                Width = 162
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'cNameDestination'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                STFilter.KeyField = 'ik_direction'
                STFilter.ListSource = dmDocs.dsDocStud
                Title.Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
                Width = 188
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DateReady'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                Title.Caption = #1044#1072#1090#1072' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080
                Width = 145
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Cname_spec'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                STFilter.KeyField = 'ik_spec'
                STFilter.ListSource = dmDocs.dsDocs
                Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Cname_fac'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                STFilter.KeyField = 'Ik_fac'
                STFilter.ListSource = dmDocs.dsDocs
                Title.Caption = #1048#1085#1089#1090#1080#1090#1091#1090
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DateStartCallSpr'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                STFilter.Visible = False
                Title.Caption = #1057#1087#1088'.'#1074#1099#1079#1086#1074' '#1076#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DateEndCallSpr'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                STFilter.Visible = False
                Title.Caption = #1057#1087#1088'.'#1074#1099#1079#1086#1074' '#1076#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'cNameTransfer'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                STFilter.KeyField = 'Ik_Transfer'
                STFilter.ListSource = dmDocs.dsDocs
                Title.Caption = #1052#1077#1090#1086#1076' '#1087#1077#1088#1077#1076#1072#1095#1080
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'addr'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                Title.Caption = #1052#1077#1089#1090#1086' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DateStartCallSpr'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                Title.Caption = #1053#1072#1095#1072#1083#1086' '#1084#1077#1088#1086#1087#1088#1080#1103#1090#1080#1103
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'DateEndCallSpr'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1084#1077#1088#1086#1087#1088#1080#1103#1090#1080#1103
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Kol_day'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Cname_pric'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                Title.Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1076#1072#1095#1080' '#1072#1082'.'#1089#1087#1088
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'n_sem'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                Title.Caption = #1057#1077#1084#1077#1089#1090#1088' '#1084#1077#1088#1086#1087#1088#1080#1103#1090#1080#1103
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'cName_disc'
                Footers = <>
                PopupMenu = gridColumnSelectMenu
                Title.Caption = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1077
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Ik_Document'
                Footers = <>
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Ik_destination'
                Footers = <>
                Visible = False
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 647
    Width = 684
    TabOrder = 0
    ExplicitTop = 647
    ExplicitWidth = 684
    DesignSize = (
      684
      37)
    inherited bbSave: TBitBtn
      Left = 514
      Action = actApply
      ExplicitLeft = 514
    end
    inherited bbUndo: TBitBtn
      Left = 346
      Action = actUndo
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ExplicitLeft = 346
    end
  end
  object ilPages: TImageList
    Left = 386
    Top = 167
  end
  object odPhoto: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg)|*.jpg;*.jpeg|JPEG Image File (*.jpg)|*.jpg|JP' +
      'EG Image File (*.jpeg)|*.jpeg'
    Left = 496
    Top = 166
  end
  object alAct: TActionList
    Images = frmMain.ImageList1
    Left = 536
    Top = 224
    object actAddAddress: TAction
      Category = 'Address'
      ImageIndex = 21
      OnExecute = actAddAddressExecute
    end
    object actApply: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      OnExecute = actApplyExecute
      OnUpdate = actApplyUpdate
    end
    object actUndo: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OnExecute = actUndoExecute
      OnUpdate = actUndoUpdate
    end
    object actPrintSprav: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1088#1072#1074#1082#1080' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1088#1072#1074#1082#1080' '#1074' Excel'
      ImageIndex = 56
      OnExecute = actPrintSpravExecute
    end
    object actPrintPensSprav: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1088#1072#1074#1082#1080' '#1076#1083#1103' '#1087#1077#1085#1089'. '#1092#1086#1085#1076#1072' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1088#1072#1074#1082#1080' '#1076#1083#1103' '#1087#1077#1085#1089#1080#1086#1085#1085#1086#1075#1086' '#1092#1086#1085#1076#1072' '#1074' Excel'
      OnExecute = actPrintPensSpravExecute
    end
    object actObnovl: TAction
      Category = 'Uspev'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1091#1089#1087#1077#1074#1072#1077#1084#1086#1089#1090#1080
      ImageIndex = 62
      OnExecute = actObnovlExecute
    end
    object actEditAddress: TAction
      Category = 'Address'
      ImageIndex = 20
      OnExecute = actEditAddressExecute
    end
    object actDeleteAddress: TAction
      Category = 'Address'
      ImageIndex = 22
      OnExecute = actDeleteAddressExecute
    end
    object actPropToFact: TAction
      Category = 'Address'
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1072#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1084
      ImageIndex = 62
      OnExecute = actPropToFactExecute
    end
    object actAddDocument: TAction
      Category = 'ctDocument'
      ImageIndex = 44
      OnExecute = actAddDocumentExecute
    end
    object actUpdateDocument: TAction
      Category = 'ctDocument'
      Enabled = False
      ImageIndex = 43
      OnExecute = actUpdateDocumentExecute
    end
    object actDelDocument: TAction
      Category = 'ctDocument'
      Enabled = False
      ImageIndex = 42
      OnExecute = actDelDocumentExecute
    end
  end
  object ppmSpravToExcel: TPopupMenu
    Left = 184
    Top = 416
    object MenuItem3: TMenuItem
      Action = frmMain.actLichnKartStud
    end
  end
  object ppmStudNapr: TPopupMenu
    Images = frmMain.ImageList1
    Left = 168
    Top = 224
    object N1: TMenuItem
      Action = frmMain.actNapr
    end
    object N2: TMenuItem
      Action = frmMain.actNaprClose
    end
  end
  object ilMain: TImageList
    Left = 630
    Top = 224
    Bitmap = {
      494C0101110040004C0210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5A294007B614A0073594200634D
      3900634931006349310063493100634931006349310063493100634931006349
      3100634931006349310063493100634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5A29400EFDBD600EFDBD600EFCF
      BD00EFCFBD00DEBAA500DEBAA500DEBAA500DEBAA500DEBAA50000820000DEB6
      9C00DEB69C00E7AE9400E7AE9400634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDA69400FFF3EF00ADBAD6000859
      CE001855AD0000419400294D9400ADA6A500FFE3D6000082000000FF00000082
      0000F7D7C600F7D7C600DEB69C00634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDAA9C00EFEFF7001855C60063A2
      F7004286DE000049A5001065D600004194000082000000FF000000FF000000FF
      000000820000BD968400DEB69C00634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDAA9C00EFEFF700296DD60063A2
      F7001855AD00296DD6000851B5000082000000FF000000FF00000082000000FF
      000000FF000000820000DEBAA500634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6B2A500FFFBF700DEDFDE00294D
      94009C9A9400848A9C000082000000FF000000FF000000820000BD9684000082
      000000FF000000FF000000820000634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6B6A500FFFFFF00636563002928
      2900B5B6B5007B797B00636563000082000000820000FFF3EF00FFEFE700FFEB
      E7000082000000FF000000FF0000008200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEB6AD00FFFBFF004A494A004A49
      4A00E7E7E700C6C7C6007B797300DEDFDE00FFF7F700F7C7A500F7B28C00F7AE
      8400FFA67B000082000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEBAAD00FFFFFF006B696B007375
      730094969C0094969C007B797300E7DFDE00FFFFFF00FFFBF700FFFBF700FFFB
      F700FFF7EF00FFF7EF000082000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6BEB50000000000E7E3E7007375
      73008482840073757300C6C7C600FFFBFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFFBF700CECBC600008200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6C3B50000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFBFF00FFFBFF00FFFFFF007B614A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6C3B500D6C3B500D6BEB500CEBA
      AD00CEBAAD00CEB6AD00C6B6A500C6B2A500C6AEA500BDAA9C00BDA69400BDA6
      9400B5A29400B5A29400B5A29400B5A294000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8B2A300C8B2
      A300B7A29300B7A29300B9A49500BDA79800C1AB9C00C5AFA000C8B2A300C9B4
      A500C8B2A300C8B2A3000000000000000000F7F3EF00E7DFDE0094796B008C75
      630084715A00E7DFDE007B6552007B614A00735D4A00E7DFDE006B5542006B51
      3900634D3900E7DFDE000000000000000000F7F3EF00E7DFDE0094796B008C75
      630084715A00E7DFDE007B6552007B614A00735D4A00E7DFDE006B5542006B51
      3900634D3900E7DFDE000000000000000000F7F3EF00E7DFDE0094796B008C75
      630084715A00E7DFDE007B6552007B614A00735D4A00E7DFDE006B5542006B51
      3900634D3900E7DFDE0000000000000000000000000000000000CAB4A500FFFF
      FF00FDFCFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CAB4A5000000000000000000E7DFDE00AD9A8C00EFE3DE00F7E7
      E700EFDFD60084695A00B59A8C00DEBEAD00DEB6A50073594200AD8A7300D6A6
      9400CE9E840063493900E7DFDE0000000000E7DFDE00AD9A8C00EFE3DE00F7E7
      E700EFDFD60084695A00B59A8C00DEBEAD00DEB6A50073594200AD8A7300D6A6
      9400CE9E840063493900E7DFDE0000000000E7DFDE00AD9A8C00EFE3DE00F7E7
      E700EFDFD60084695A00B59A8C00DEBEAD00DEB6A50073594200AD8A7300D6A6
      9400CE9E840063493900E7DFDE00000000000000000000000000BFAA9B00FEFC
      FB00DECDC000EBD9D100EEDFD800F2E5DF00F4EAE600F7EFEC00F9F5F20066A2
      6400FEFCFB00BFAA9B000000000000000000B5A29400FFFBF700FFF7F700F7F3
      EF00F7EBE700F7E7DE007B6552007B614A00735D4A00735942006B5542006B51
      3900634D3900634939006349310000000000B5A29400FFFBF700FFF7F700F7F3
      EF00F7EBE700F7E7DE007B6552007B614A00735D4A00735942006B5542006B51
      3900634D3900634939006349310000000000B5A29400FFFBF700FFF7F700F7F3
      EF00F7EBE700F7E7DE007B6552007B614A00735D4A00735942006B5542006B51
      3900634D39006349390063493100000000000000000000000000B7A29300FDFC
      FB00FBF9F700FAF5F200F7EFED00F4EAE600F2E5DF00DDDCD700DFD7CE00DECD
      C000FDFCFB00B7A293000000000000000000B5A29400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DED7CE00DECFC600DEC7B500DEBE
      AD00DEBAA500DEB6A5006349310000000000B5A29400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBAA500DEB6A5006349310000000000B5A29400FFFFFF00FFFBF700FFF7
      F700F7EFEF00F7EBE700F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBAA500DEB6A50063493100000000000000000000000000B7A29300FFFF
      FF00B47F6500B47F6400EDDDD500B37E6300F4EBE600F1E5DF00EFDFD700EBD9
      D100FFFFFF00B7A293000000000000000000B5A29400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFDFD600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6B2A5006349310000000000B5A29400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFDFD600EFDBD600EFD3CE00E7CF
      C600E7C7BD00D6B2A5006349310000000000B5A29400FFFFFF00B57D6300B57D
      6300EFDFD600B57D6300F7EBE700F7E7DE00EFDFD600EFDBD600EFD3CE00E7CF
      C600E7C7BD00D6B2A50063493100000000000000000000000000B9A49500FFFF
      FF00FFFFFF00FDFCFC00FCF9F700FAF4F200F6F0EC00F4EBE500F2E5DF00EEDF
      D800FFFFFF00B9A495000000000000000000BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEBEAD006349310000000000BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7E7DE00EFDFDE00EFDBD600EFD3
      CE00E7CFC600DEBEAD006349310000000000BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFF7F700F7F3EF00F7EBE700F7E7DE00EFDFDE00EFDBD600EFD3
      CE00E7CFC600DEBEAD0063493100000000000000000000000000BDA79800FFFF
      FF00968E8800EEDED700968E8700EDDDD600968D8600958C8500F4EBE600F2E5
      DF00FFFFFF00BDA798000000000000000000BDA69C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7C7BD006349310000000000BDA69C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7EBE700F7E7DE00EFDFDE00EFDB
      D600EFD3CE00E7C7BD006349310000000000BDA69C00FFFFFF00948E8C00EFDF
      D600948E8400EFDFD600948E8400948E84000000000084828400ADB6B500EFDB
      D600EFD3CE00E7C7BD0063493100000000000000000000000000C1AB9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFCFC00FBF8F700FAF4F200F7F0EC00F4EA
      E600FFFFFF00C1AB9C000000000000000000C6AA9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7D3C6006349310000000000C6AA9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7E7DE00EFDF
      D600EFDBD600E7D3C6006349310000000000C6AA9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBF700FFF7F7008482840073716B00525552000000
      0000EFDBD600E7D3C60063493100000000000000000000000000C5AFA000FFFF
      FF00B4806500B4806500968E8800C2B0A300968E8700968E8600F9F4F200F7EF
      EC00FFFFFF00C5AFA0000000000000000000C6AEA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFDBD6006349310000000000C6AEA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7EBE700F7E7
      DE00EFDFDE00EFDBD6006349310000000000C6AEA500FFFFFF00B5826300B582
      6300948E8C00C6B2A500948E8400948E840000619400A59E9C00FFFFFF005292
      AD0008101000EFDBD60063493100000000000000000000000000C8B2A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFCFC00FCF8F700F9F5
      F200FFFFFF00C8B2A3000000000000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFE3DE006349310000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F3EF00F7EB
      E700F7E7DE00EFE3DE006349310000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000619400A59E9C008CB6C60073CF
      E7004A9AB5000810100063493100000000000000000000000000C9B4A500FFFF
      FF00FFFFFF0066A3650066A3650066A36500C0B4AD0066A3650066A3650066A2
      6400FFFFFF00C9B4A5000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFE3DE006349310000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F3
      EF00F7EBE700EFE3DE006349310000000000CEB6A500FFFFFF00FFFFFF0063A2
      630063A2630063A26300C6B6AD0063A2630063A26300006194004A9EB5008CE3
      EF0063BED6004A9AB50008101000000000000000000000000000C8B2A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFC
      FB00FFFFFF00C8B2A3000000000000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7
      F700F7F3EF00F7EBE7006349310000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7
      F700F7F3EF00F7EBE7006349310000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF70052A2
      B5008CE3EF006BC7DE007B868400313494000000000000000000C8B2A300CAB4
      A500CBB5A600CAB4A500C9B3A400C7B2A300C6B0A100C3AE9F00C1AC9D00BFAA
      9B00CAB4A500C8B2A3000000000000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      9400BDA69400BDA29400B5A2940000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      9400BDA69400BDA29400B5A2940000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      94007BB2BD00CEBAAD007386D6005A6DAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A6DAD00849EEF005A75D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000510000005100000051000000510000005100000051
      0000005100000051000000510000002000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000525152004A494A004A49
      4A004A494A005A595200FF00FF0052514A004A4942005251520094969400FF00
      FF004A4942004A4942004A494A005A595A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086000000860000007900000079
      0000008600000086000000860000008600000086000000860000008600000086
      00000086000000790000008E0000003800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000949E8C00FFFFFF00FFFFFF00FFFF
      F700FFFFFF005A59520084867B00FFFFFF00FFFFF700BDBEB500424139008486
      7B00F7EFDE00EFE7D600FFF7EF0094968400F7F7EF00E7DFDE0094796B008C71
      630084715A00E7DFDE007B6152007B614A0073594A00E7DFDE006B5142006B51
      390063493900E7DFDE00000000000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700008600000038000000000000B5B6B5006B696B009C9E
      9C0000000000000000000000000000000000000000000000000000000000E7E7
      E700A5A6A50094969400000000000000000094968C00FFFFFF00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B00E7DFDE00AD9E8C00EFE7DE00F7E7
      E700EFDFD60084695A00B59E8C00DEBEAD00DEB6A50073594200AD8E7300D6A6
      9400CE9E840063493900E7DFDE000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000860000003800009479EF002900DE003928A5006361
      6300CECFCE000000000000000000000000000000000000000000D6D7D6006351
      B5002900DE00A5A6A500000000000000000094968400FFFFFF00EFDFD600D6BE
      AD00C6B6A500C6B6A500CEBEAD00E7DFD600F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B00B5A69400FFFFF700FFF7F700F7F7
      EF00F7EFE700F7E7DE007B6152007B614A0073594A00735942006B5142006B51
      39006349390063493900634931000000000000860000F7EFF70031A63100299E
      2900299629002996290029962900299629002996290021962100299629000086
      000000860000D6E7D6000079000000380000BDAEF7002900DE003108DE005249
      6B007B797B00DEDFDE00000000000000000000000000CEC7D6004228C6002900
      DE007B69CE0000000000000000000000000094968C00FFFFFF00C6AE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D6BEB500F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B00B5A69400FFFFFF00FFFFF700FFF7
      F700F7EFEF00F7EFE700F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBEA500DEB6A500634931000000000000860000F7EFF700008600000086
      0000008E0000008E0000008E0000008E00000086000094BE9400008600000086
      00009CA69C00F7EFF7000079000000380000000000008471EF002900DE003918
      D6005A595A0094969400E7E7E70000000000CEC7D6003918CE002900DE00A59E
      C6000000000000000000000000000000000094968C00FFF7F700C6AE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC7BD00F7EFE700C6B6A500C6B6A500C6B6
      A500C6B6A500C6B6A500F7EFE7008C8E7B00B5A69400FFFFFF00B5796300B579
      6300EFDFD600B5796300F7EFE700F7E7DE00EFDFD600EFDFD600EFD7CE00E7CF
      C600E7C7BD00D6B6A500634931000000000000860000F7EFF700FFF7FF000086
      0000008E0000008E0000008E000000860000A5C7A50000860000008E0000088E
      0800F7EFF700F7EFF700007900000038000000000000000000007B61EF002900
      DE005238C6006361630094969400B5B6C6003918CE002900DE00A59EC6000000
      00000000000000000000000000000000000094968C00FFF7F700CEBEA500FFFF
      FF00D6F7FF00FFFFFF00FFFFFF00DEC7BD00F7EFE700D6C7B500D6C7BD00D6C7
      BD00D6C7BD00D6C7B500F7EFE7008C8E7B00BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700F7F7EF00F7EFE700F7E7DE00EFDFDE00EFDFD600EFD7
      CE00E7CFC600DEBEAD00634931000000000000860000F7EFF700F7EFF700FFFF
      FF00088E08000086000000860000B5CFB5000086000000860000008600000086
      000042A64200F7EFF70000790000003800000000000000000000000000007B61
      EF002900DE005230C60052515A003110C6002900D600A59EC600000000000000
      00000000000000000000000000000000000094968C00FFFFF700CEC7B500EFFF
      FF0052AEEF00EFFFFF00FFFFFF00D6C7BD00F7EFE700D6C7B500D6C7B500D6C7
      B500D6C7B500D6C7B500FFF7EF008C8E7B00BDA69C00FFFFFF00948E8C00EFDF
      D600948E8400EFDFD600948E8400948E8400F7EFE700F7E7DE0000860000EFDF
      D600EFD7CE00E7C7BD00634931000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF70000860000B5CFB50000860000008600007BAE7B00F7EFF700F7EF
      F700F7EFF700F7EFF70000790000003800000000000000000000000000000000
      00007B59EF002900DE002900D6002900D6006B618C00DEDFDE00000000000000
      00000000000000000000000000000000000094968C008CC7EF007BBEEF008CC7
      D6003196D6008CC7D60073B6DE0084B6DE00F7EFE700C6B6A500C6B6A500C6B6
      A500C6B6A500C6B6A500FFF7EF008C8E7B00C6AE9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7F700F7F7EF00F7EFE70000860000EFDF
      D600EFDFD600E7D7C600634931000000000000860000F7EFF700F7EFF700EFEF
      EF009CC79C00B5C7B50000860000008E0000008E000000860000BDBEBD00F7EF
      F700F7EFF700F7EFF70000790000003800000000000000000000000000000000
      0000CEC7D6002908DE002900DE004228C6007371730094969400D6D7D6000000
      0000000000000000000000000000000000009496840094CFF70018B6FF00299E
      DE0021D7F700299EDE0018B6FF008CBEE700FFFFFF00FFFFF700FFF7F700F7F7
      F700F7F7EF00F7EFE700FFFFF70094968C00C6AEA500FFFFFF00B5866300B586
      6300948E8C00C6B6A500948E8400948E8400FFF7F70000860000F7EFE7000086
      0000EFDFDE00EFDFD600634931000000000000860000F7EFF700F7EFF700ADCF
      AD00B5CFB50000860000008600000086000000860000008E000000860000A5A6
      A500F7EFF700F7EFF7000079000000380000000000000000000000000000CEC7
      D6003918CE002900DE007359CE003108E7005A38D6007B798C0084868400C6C7
      C600000000000000000000000000000000008CA6AD009CD7EF00299EDE008CE7
      F700ADF7FF008CE7F700299EDE009CD7EF00A5C7C600B5B6AD00ADAEA500ADAE
      A500ADAEA500ADAEA500BDBEB50000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF70000860000F7F7EF000086
      0000F7E7DE00EFE7DE00634931000000000000860000F7EFF700B5CFB500BDCF
      BD0000860000008600005AAE5A00F7EFF700299E290000860000008E00000086
      0000D6CFD600F7EFF70000790000003800000000000000000000CEC7D6003918
      CE002900DE008C86BD0000000000000000004218E7004A28DE007B719C007B79
      7B00B5B6B5000000000000000000000000004AA6DE00398ECE0021D7EF009CF7
      FF00EFFFFF009CF7FF0021D7EF00318ECE00429EE700FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB6A500FFFFFF00FFFFFF0063A6
      630063A6630063A66300C6B6AD0063A663000086000063A66300FFF7F700F7F7
      EF0000860000EFE7DE00634931000000000000860000F7EFF7004AAE4A0052AE
      520052B6520073BE7300F7EFF700F7EFF700FFF7FF0063B6630052AE52003996
      390039A63900F7EFF700007900000038000000000000BDBEC6003910CE002900
      DE007361B500000000000000000000000000000000005A41E7003108DE007B69
      B5008C8E8C00DEDFDE000000000000000000F7FFFF00BDE7F700319EDE007BDF
      F7008CF7FF007BDFF70039A6DE0094CFF700C6E7FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000860000FFFFFF00FFFFF700FFF7
      F70000860000F7EFE700634931000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000086000000380000C6BEEF003910CE002900DE005A41
      B5000000000000000000000000000000000000000000000000009479EF002900
      DE00CECFE700000000000000000000000000FF00FF0084BEEF0021B6FF00399E
      DE0021CFEF00399EDE0021BEFF007BB6F700FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB6A500CEB6A500CEB6A500CEB6
      A500CEB6A500C6B6A500C6B6A500C6AE9C00C6AE9C00BDAE9C00BDAE9C00BDA6
      9400BDA6940000860000B5A694000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000860000003800004218E7002900DE004228C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF009CCFEF0094C7F700BDDF
      F7003996D600BDDFF70094C7F7009CCFEF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000086000000000000000000000086000000860000008600000086
      000000860000008600000086000000860000008600000086000000860000008E
      0000008E000000860000008600004AAE4A003110E7004A28E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF00FF00FF00FF00EFF7
      FF005AAEEF00EFF7FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000E7DFDE00AD9A8C00B5A29400FFFFFF00FFFBF700FFF7F700F7EFEF00F7EB
      E700F7E7DE00DEDFD600DED7CE00DECFC600A5756B00A5756B00A5756B00A575
      6B00A5756B00A5756B00A5756B00A5716B009C7163009C6D63009C6D63009C69
      63009C6963009465630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F3EF00E7DF
      DE00B5A29400FFFBF700B5A29400FFFFFF00B57D6300B57D6300EFDFD600B57D
      6300F7EBE700F7E7DE00EFDFD600EFDBD600AD7D6B00FFDFBD00DEDBD600DEDB
      D600DED7CE00DECFC600DECFC600DECBBD00DEC3B500DEC3B500DEBEB500DEBE
      AD00DEBEAD009C69630000000000000000000000000000000000AD968400735D
      4A00735D4A00735D4A00735D4A00735D4A00735D4A00735D4A00735D4A00735D
      4A00735D4A00735D4A00735D4A00000000000000000000000000000000000000
      00009C8E84006349310063493100634931006349310063493100634931006349
      3100634931006349310000000000000000000000000000000000E7DFDE00AD9A
      8C00B5A29400FFFFFF00BDA69400FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7
      F700F7F3EF00F7EBE700F7E7DE00EFDFDE00AD7D6B00FFDFBD00FFDFBD00FFDF
      BD00FFDFBD00FFDFBD00FFDFBD00FFDBB500FFDBB500FFDBB500FFD7AD00FFD7
      AD00DEBEAD009C69630000000000000000000000000000000000AD968400DECB
      C600DECBC600DECBC600DECBC600DECBC600DECBC600DECBC600DECBC600DECB
      C600DECBC600DECBC600735D4A00000000000000000000000000000000000000
      00009C8A7B00FFFBFF00DEC3AD00D6BEAD00CEB6A500CEB2A500C6AA9C00BDA6
      9400B5A29400634931000000000000000000F7F3EF00E7DFDE00B5A29400FFFB
      F700B5A29400FFFFFF00BDA69C00FFFFFF00948E8C00EFDFD600948E8400EFDF
      D600948E8400948E8400F7EBE700F7E7DE00B5827300FFE3C600FFE3C600D6A6
      8400D6A68400D6A68400D6A68400D6A68400D6A68400D6A68400D6A68400FFD7
      B500DEBEAD009C6D630000000000000000000000000000000000AD968400FFEB
      E700F7E7DE00F7E3DE00F7DFD60000925A00F7DBCE00F7D7CE00F7D3C600F7D3
      C600F7CFBD00DECBC600735D4A00000000000000000000000000000000000000
      00009C8A7B00FFFFFF00FFFBF700F7F3EF00F7EBE700EFDFD600E7D7CE00E7CF
      BD00BDA69400634931000000000000000000E7DFDE00AD9A8C00B5A29400FFFF
      FF00BDA69400FFFFFF00C6AA9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFF7F700F7F3EF00F7EBE700B5867300FFE7CE00FFE7CE00FFE7
      CE00FFE3CE00FFE7C600FFE3C600FFE3C600FFDFBD00FFDFBD00FFDBBD00FFDB
      B500DEBEB500A571630000000000000000000000000000000000AD968400FFEB
      E700FFEBE700F7E7DE0000925A00008E5A008CDBB5008CDBB500EFD7C600F7D3
      C600F7D3C600DECBC600735D4A00000000000000000000000000000000000000
      00009C8E8400FFFFFF00FFFFFF00FFF7F700F7EFEF00F7E7DE00EFDFD600E7D7
      C600C6AA9C00634931000000000000000000B5A29400FFFBF700B5A29400FFFF
      FF00BDA69C00FFFFFF00C6AEA500FFFFFF00B5826300B5826300948E8C00C6B2
      A500948E8400948E8400FFF7F700F7EFEF00BD8E7300FFEBD600FFEBD600D6A6
      8400D6A68400D6A68400D6A68400D6A68400D6A68400D6A68400D6A68400FFDF
      BD00DEC3B500A5756B0000000000000000000000000000000000AD9A8C00FFEF
      EF00FFEFE70000925A0000925A0000925A0000925A0000925A0000925A00B5DF
      BD00F7D7C600DECBC600735D4A00000000000000000000000000000000000000
      0000A5928400FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7DE00EFDB
      D600CEB2A500634931000000000000000000B5A29400FFFFFF00BDA69400FFFF
      FF00C6AA9C00FFFFFF00CEB2A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBF700FFF7F700C6927B00FFEBDE00FFEBDE00D6A6
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6A68400FFDF
      BD00DEC3B500A5796B0000000000000000000000000000000000B59E8C00FFF3
      EF00FFF3EF00FFEFE70000925A0000925A00D6EFDE00F7E3D600D6EBD6000092
      5A00F7D7CE00DECBC600735D4A00000000000000000000000000000000000000
      0000A5968C00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFF7F700F7EFE700EFE3
      DE00CEB6A500634931000000000000000000B5A29400FFFFFF00BDA69C00FFFF
      FF00C6AEA500FFFFFF00CEB6A500FFFFFF00FFFFFF0063A2630063A2630063A2
      6300C6B6AD0063A2630063A2630063A26300CE9A7B00FFEFDE00FFEFDE00D6A6
      8400FFFFFF009C9A9C000030CE009C9EFF0039518C00FFFFFF00D6A68400FFE3
      C600DECBBD00AD796B0000000000000000000000000000000000B59E8C00FFF7
      F700FFF3EF0073DFB500FFEFE70000925A00FFE7DE0000925A00F7E3D60073D7
      AD00F7DBCE00DECBC600735D4A0000000000000000000000000000000000E79E
      7300C6694200AD593100FFFFFF00FFFFFF00FFFFFF00FFFBFF00F7F3EF00F7EB
      E700D6BEAD00634931000000000000000000BDA69400FFFFFF00C6AA9C00FFFF
      FF00CEB2A500FFFFFF00CEB2A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE9E8400FFF3E700FFF3E700D6A6
      8400FFFFFF00FFFFFF00CEEFFF00CEEFFF009C9EFF0039518C00D6A68400FFE3
      C600DECFC600AD7D6B0000000000000000000000000000000000BDA29400FFFB
      F700FFF7F70000925A00ADEBD600FFEFEF00D6F3E70000925A0000925A00F7E3
      DE00F7DFD600DECBC600735D4A0000000000000000000000000000000000E79E
      7300CE714200AD593100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700F7F3
      EF00DEC3AD00634931000000000000000000BDA69C00FFFFFF00C6AEA500FFFF
      FF00CEB6A500FFFFFF00CEB2A500CEB6A500CEB6A500CEB6A500CEB2A500C6B2
      A500C6B2A500C6AE9C00C6AE9C00BDAA9C00D6A28400FFF7EF00FFF7EF00D6A6
      8400FF303100FF303100CEEFFF007B7DFF004A5DFF002151FF0039518C00FFE7
      CE00DECFC600B582730000000000000000000000000000000000BDA69400FFFB
      FF00FFFBF700D6F7E70000925A0000925A0000925A0000925A00009663000092
      5A00F7E3DE00DECBC600735D4A0000000000000000000000000000000000EFA6
      7B00DE794A00CE714200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AE
      9C00C6AA9C00634931000000000000000000C6AA9C00FFFFFF00CEB2A500FFFF
      FF00CEB2A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBF700FFF7F700D6A68400FFFBF700FFFBF700D6A6
      8400D6A68400D6A68400D6A684009C9EFF007B7DFF004A5DFF002151FF003951
      8C00DED7CE00B586730000000000000000000000000000000000BDAA9C00FFFF
      FF00FFFBFF00FFFBF700D6F7E700ADEBD6008CE3C60000925A0000925A00FFEB
      E700F7E3DE00DECBC600735D4A0000000000000000000000000000000000FFAE
      7B00EF865200DE794A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD9A8C006349
      310063493100634931000000000000000000C6AEA500FFFFFF00CEB6A500FFFF
      FF00CEB2A500CEB6A500CEB6A500CEB6A500CEB2A500C6B2A500C6B2A500C6AE
      9C00C6AE9C00BDAA9C00BDAA9C00BDA69400DEAE8C00FFFBF700FFFBF700FFFB
      F700FFFBF700FFFBF700FFF7EF00FFF7EF009C9EFF007B7DFF004A5DFF002151
      FF0039518C00B586730000000000000000000000000000000000C6AE9C00FFFF
      FF00FFFFFF00FFFBFF00FFFBF700FFF7F700FFF7F70000925A00FFEFEF00FFEF
      E700DECBC600DECBC600735D4A000000000000000000DED7CE00E79E7300FFB6
      8C00FF9E6B00F78E5A009C492900CECFC600FFFFFF00FFFFFF00AD9E8C00D6C7
      BD0063493100D6CBC6000000000000000000CEB2A500FFFFFF00CEB2A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFF7F700F7F3EF00F7EBE700E7AE8C00FFFFFF00FFFFFF00D6A6
      8400D6A68400D6A68400D6A68400D6A68400D6A684009C9EFF007B7DFF004A5D
      FF002151FF0039518C0000000000000000000000000000000000C6B2A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFFBF700FFF7F700FFF3EF00FFF3
      EF00735D4A00735D4A00735D4A00000000000000000000000000DED7CE00FFC7
      A500FFB68C00E7865A00CECFC600FFFFFF00FFFFFF00FFFFFF00B5A294006349
      3100D6CFC600000000000000000000000000CEB6A500FFFFFF00CEB2A500CEB6
      A500CEB6A500CEB6A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA
      9C00BDAA9C00BDA69400BDA69400BDA29400E7B28C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFBF700FFFBF700FFF7EF00FFF3E700FFEFDE009C9EFF007B7D
      FF004A5DFF002151FF0039518C00000000000000000000000000CEB2A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFFBF700FFF7F700947D
      6B00F7DBCE00D6BAAD00735D4A0000000000000000000000000000000000DED7
      C600E7966B00CECFC600B5A69400B5A69400B5A69400B5A69400B5A29400D6CF
      C60000000000000000000000000000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7
      F700F7F3EF00F7EBE7006349310000000000E7B68C00E7B68C00E7B68C00E7B6
      8C00E7B28C00DEAE8C00DEAA8400D6A68400CE9E8400CE9A7B00C6927B009C9E
      FF007B7DFF000030CE000030CE00000000000000000000000000CEB6AD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFFBF700947D
      6B00D6BAAD00AD96840000000000000000000000000000000000000000000000
      0000DED7C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      9400BDA69400BDA29400B5A29400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004DFF00004DFF000030CE00000000000000000000000000CEB6AD00CEB6
      A500C6B2A500C6B2A500C6AE9C00BDAA9C00BDA69400BDA29400B59E8C00B59E
      8C00B59A8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDC7CE0021303900B5BEC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A2
      9400FFFFFF00B5A29400FFFFFF00BDA69400FFFFFF00FFFFFF00FFFFFF009C96
      8C00EFEBE700FFF7F700FFEFEF00FFE7DE000000000000000000000000000000
      00009C8E84006349310063493100634931006349310063493100634931006349
      31006349310063493100000000000000000000000000B5A29400634931006349
      3100634931006349310063493100634931006349310063493100634931005249
      4200314D63003975BD0029496300BDC7CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A2940063493100B5A2
      9400FFFFFF00B5A29400FFFFFF00BDAA9C00FFFFFF00FFFFFF00FFFFFF00A59E
      9400EFEBE700FFFFFF00FFF7F700FFF3EF000000000000000000000000000000
      00009C8A7B00FFFBFF00DEC3AD00D6BEAD00CEB6A500CEB2A500C6AA9C00BDA6
      9400B5A2940063493100000000000000000000000000B5A29400FFFFFF00B5A2
      9400B5A29400B5A29400B5A29400B5A29400B5A29400B5A294008C868400314D
      6B00317DD600429AE70052B2EF004A657300F7F3EF00E7DFDE0094796B008C75
      630084715A00E7DFDE007B6552007B614A00735D4A00E7DFDE006B5542006B51
      3900634D3900E7DFDE00000000000000000000000000B5A29400FFFFFF00B5A2
      9400FFFFFF00BDA69400FFFFFF00C6AE9C00FFFFFF00FFFFFF00FFFFFF00C6C7
      BD00C6BEBD00FFFFFF00FFFFFF00FFF7F7000000000000000000000000000000
      00009C8A7B00FFFFFF00FFFBF700F7F3EF00F7EBE700EFDFD600E7D7CE00E7CF
      BD00BDA6940063493100000000000000000000000000B5A29400FFFFFF00FFFF
      FF00FFFBFF00F7F3EF00D6D7D600949694006B6963006365630052555A004271
      940042A2E70063C7FF00738EA500D6DBDE00E7DFDE00AD9A8C00EFE3DE00F7E7
      E700EFDFD60084695A00B59A8C00DEBEAD00DEB6A50073594200AD8A7300D6A6
      9400CE9E840063493900E7DFDE000000000000000000B5A29400FFFFFF00B5A2
      9400FFFFFF00BDAA9C00FFFFFF00CEB2A500FFFFFF00FFFFFF00FFFFFF00F7FB
      FF00BDBAB500C6C3BD00EFEBE700EFEBE7000000000000000000000000000000
      00009C8E8400FFFFFF00FFFFFF00FFF7F700F7EFEF00F7E7DE00EFDFD600E7D7
      C600C6AA9C0063493100000000000000000000000000B5A29400FFFFFF00FFFF
      FF00FFFFFF00DEDFDE00948E8C00B5AA9C00D6C3B500CEAE9C007B756B005259
      52005A92AD00739AB500BDC3C60000000000B5A29400FFFBF700FFF7F700F7F3
      EF00F7EBE700F7E7DE007B6552007B614A00735D4A00735942006B5542006B51
      3900634D390063493900634931000000000000000000B5A29400FFFFFF00BDA6
      9400FFFFFF00C6AE9C00FFFFFF00CEB6A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7FBFF00C6C7C600A59E9400948E84000000000000000000000000000000
      0000A5928400FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7DE00EFDB
      D600CEB2A50063493100000000000000000000000000B5A29400FFFFFF00FFFF
      FF00FFFFFF00B5B2AD00BDBAB500FFEFE700FFE7DE00F7DBC600F7CFB5007B75
      6B009C9E9C00BDC3C6000000000000000000B5A29400FFFFFF00FFFBF700FFF7
      F700F7EFEF00F7EBE700F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBAA500DEB6A500634931000000000000000000B5A29400FFFFFF00BDAA
      9C00FFFFFF00CEB2A500FFFFFF00D6BAAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5A29400634931000000000000000000000000000000
      0000A5968C00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFF7F700F7EFE700EFE3
      DE00CEB6A50063493100000000000000000000000000BDA69400FFFFFF00FFFF
      FF00FFFFFF009C968C00EFEBE700FFF7F700FFEFEF00FFE7DE00F7DBCE00CEAE
      9C006B6D6B00000000000000000000000000B5A29400FFFFFF00B57D6300B57D
      6300EFDFD600B57D6300F7EBE700F7E7DE00EFDFD600EFDBD600EFD3CE00E7CF
      C600E7C7BD00D6B2A500634931000000000000000000BDA69400FFFFFF00C6AE
      9C00FFFFFF00CEB6A500FFFFFF00D6BEAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BDA69400D6C7BD000000000000000000000000000000
      0000AD9A8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00F7F3EF00F7EB
      E700D6BEAD0063493100000000000000000000000000BDAA9C00FFFFFF00FFFF
      FF00FFFFFF00A59E9400EFEBE700FFFFFF00FFF7F700FFF3EF00FFE7DE00DEC3
      B50073716B00000000000000000000000000BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFF7F700F7F3EF00F7EBE700F7E7DE00EFDFDE00EFDBD600EFD3
      CE00E7CFC600DEBEAD00634931000000000000000000BDAA9C00FFFFFF00CEB2
      A500FFFFFF00D6BAAD00FFFFFF00DEC3B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6AA9C00634931000000000000000000000000000000
      0000B59E9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700F7F3
      EF00DEC3AD0063493100000000000000000000000000C6AE9C00FFFFFF00FFFF
      FF00FFFFFF00C6C7BD00C6BEBD00FFFFFF00FFFFFF00FFF7F700FFEFE700AD9E
      9400ADAAA500000000000000000000000000BDA69C00FFFFFF00948E8C00EFDF
      D600948E8400EFDFD600948E8400948E8400F7EBE700F7E7DE00EFDFDE00EFDB
      D600EFD3CE00E7C7BD00634931000000000000000000C6AE9C00FFFFFF00CEB6
      A500FFFFFF00D6BEAD00FFFFFF00DEC3B500DEC3B500DEC3B500DEC3B500DEC3
      B500D6BEAD00CEBAAD00CEB2A500E7D7CE000000000073C7E70084DBEF0084E7
      FF0039BEE7009CDBDE0094E3F70084D3EF00FFFFFF00FFFFFF00FFFFFF00C6AE
      9C00C6AA9C0063493100000000000000000000000000CEB2A500FFFFFF00FFFF
      FF00FFFFFF00F7FBFF00BDBAB500C6C3BD00EFEBE700EFEBE700B5AEA500736D
      6300F7F7F700000000000000000000000000C6AA9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBF700FFF7F700F7F3EF00F7EBE700F7E7DE00EFDF
      D600EFDBD600E7D3C600634931000000000000000000CEB2A500FFFFFF00D6BA
      AD00FFFFFF00DEC3B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6AA9C0063493100E7D7CE0000000000000000009CE3F70031B6DE007BEB
      FF005AC7E70094F3FF0029B6DE00A5EBFF00FFFFFF00FFFFFF00AD9A8C006349
      31006349310063493100000000000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7FBFF00C6C7C600A59E9400948E840094928C00634D
      390000000000000000000000000000000000C6AEA500FFFFFF00B5826300B582
      6300948E8C00C6B2A500948E8400948E8400FFF7F700F7EFEF00F7EBE700F7E7
      DE00EFDFDE00EFDBD600634931000000000000000000CEB6A500FFFFFF00D6BE
      AD00FFFFFF00DEC3B500DEC3B500DEC3B500DEC3B500DEC3B500D6BEAD00CEBA
      AD00CEB2A500E7D7CE0000000000000000000000000094EBFF0094F3FF00BDFB
      FF00ADEBF700C6FBFF0094F3FF009CF3FF00FFFFFF00FFFFFF00AD9E8C00D6C7
      BD0063493100D6CBC600000000000000000000000000D6BAAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A2940063493100634931006349
      310000000000000000000000000000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7F700F7F3EF00F7EB
      E700F7E7DE00EFE3DE00634931000000000000000000D6BAAD00FFFFFF00DEC3
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AA9C006349
      3100E7D7CE000000000000000000000000000000000021AADE0052BEE700ADEB
      F700F7FFFF00B5EBF70052BEE70031BAE700FFFFFF00FFFFFF00B5A294006349
      3100D6CFC60000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA69400D6C7BD0063493100E7D7
      CE0000000000000000000000000000000000CEB6A500FFFFFF00FFFFFF0063A2
      630063A2630063A26300C6B6AD0063A2630063A2630063A26300FFF7F700F7F3
      EF00F7EBE700EFE3DE00634931000000000000000000D6BEAD00FFFFFF00DEC3
      B500DEC3B500DEC3B500DEC3B500DEC3B500D6BEAD00CEBAAD00CEB2A500E7D7
      CE00000000000000000000000000000000000000000094EBFF0094F3FF00C6FB
      FF00ADE7F700C6FBFF0094F3FF008CD7E700B5A69400B5A69400B5A29400D6CF
      C6000000000000000000000000000000000000000000DEC3B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AA9C0063493100E7D7CE000000
      000000000000000000000000000000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7
      F700F7F3EF00F7EBE700634931000000000000000000DEC3B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AA9C0063493100E7D7CE000000
      0000000000000000000000000000000000000000000094E3F70031BAE7008CF3
      FF005AC3E70094F3FF0029B6DE008CDFF7000000000000000000000000000000
      00000000000000000000000000000000000000000000DEC3B500DEC3B500DEC3
      B500DEC3B500DEC3B500D6BEAD00CEBAAD00CEB2A500E7D7CE00000000000000
      000000000000000000000000000000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      9400BDA69400BDA29400B5A294000000000000000000DEC3B500DEC3B500DEC3
      B500DEC3B500DEC3B500D6BEAD00CEBAAD00CEB2A500E7D7CE00000000000000
      0000000000000000000000000000000000000000000063C3E70084DBEF0094EB
      FF0021AEDE008CEBFF008CDFF70084CFE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000040800000000000007FC00000000000000000000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFC003
      000300030003C003000100010001C003000100010001C003000100010001C003
      000100010001C003000100010001C003000100010001C003000100010001C003
      000100010001C003000100010001C003000100010001C003000100010000C003
      000100010000FFFFFFFFFFFFFFF8FFFFFFFFFC00FFFF8000FFFF0000FFFF0000
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
  object gridColumnSelectMenu: TPopupMenu
    OnPopup = gridColumnSelectMenuPopup
    Left = 384
    Top = 352
  end
  object adoSelDocFiles: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from SelDocumentsFiles(0)'
    Parameters = <>
    Left = 584
    Top = 400
    object adoSelDocFilesik_doc_file: TIntegerField
      FieldName = 'ik_doc_file'
    end
    object adoSelDocFilesIK_doc: TIntegerField
      FieldName = 'IK_doc'
    end
    object adoSelDocFilesdoc_file: TBlobField
      FieldName = 'doc_file'
    end
  end
end
