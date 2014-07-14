inherited fmStudent: TfmStudent
  Width = 725
  Height = 684
  Constraints.MinHeight = 524
  Constraints.MinWidth = 561
  ExplicitWidth = 725
  ExplicitHeight = 684
  object ToolBar1: TToolBar [0]
    Left = 0
    Top = 0
    Width = 725
    Height = 28
    Caption = 'ToolBar1'
    Images = frmMain.ImageList1
    TabOrder = 0
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
    Width = 725
    Height = 619
    TabOrder = 2
    ExplicitTop = 28
    ExplicitWidth = 725
    ExplicitHeight = 619
    object ScrollBox1: TScrollBox
      Left = 2
      Top = 2
      Width = 721
      Height = 615
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 721
        Height = 615
        ActivePage = TabSheet1
        Align = alClient
        Constraints.MinWidth = 557
        MultiLine = True
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheet1: TTabSheet
          Caption = #1051#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 713
            Height = 587
            ActivePage = TabSheet3
            Align = alClient
            Constraints.MinHeight = 426
            Constraints.MinWidth = 540
            Images = ilPages
            Style = tsFlatButtons
            TabOrder = 0
            object TabSheet3: TTabSheet
              Caption = #1054#1073#1097#1080#1077
              object Panel4: TPanel
                Left = 0
                Top = 0
                Width = 705
                Height = 555
                Align = alClient
                TabOrder = 0
                object Panel8: TPanel
                  Left = 1
                  Top = 173
                  Width = 703
                  Height = 177
                  Align = alTop
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
                    Flat = True
                    FooterColor = clWindow
                    FooterFont.Charset = DEFAULT_CHARSET
                    FooterFont.Color = clWindowText
                    FooterFont.Height = -11
                    FooterFont.Name = 'Tahoma'
                    FooterFont.Style = []
                    Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                  object dbcbeSchool: TDBLookupComboboxEh
                    Left = 13
                    Top = 19
                    Width = 515
                    Height = 19
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
                  Width = 703
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
                  object Label3: TLabel
                    Left = 158
                    Top = 48
                    Width = 23
                    Height = 13
                    Caption = #1055#1086#1083':'
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
                  object Label50: TLabel
                    Left = 181
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
                  object dbcbeSex: TDBComboBoxEh
                    Left = 156
                    Top = 64
                    Width = 136
                    Height = 19
                    EditButtons = <>
                    Flat = True
                    Items.Strings = (
                      #1052#1091#1078#1089#1082#1086#1081
                      #1046#1077#1085#1089#1082#1080#1081)
                    ReadOnly = True
                    TabOrder = 4
                    Visible = True
                    OnChange = dbcbeSexChange
                    OnDropDown = dbcbeSexDropDown
                  end
                  object dbdteBirthDate: TDBDateTimeEditEh
                    Left = 12
                    Top = 64
                    Width = 138
                    Height = 19
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
                    EditButtons = <>
                    Flat = True
                    TabOrder = 6
                    Visible = True
                    OnChange = eFamChange
                    OnExit = eEmailExit
                  end
                  object eNum: TDBEditEh
                    Left = 299
                    Top = 64
                    Width = 143
                    Height = 19
                    EditButtons = <>
                    Flat = True
                    MaxLength = 6
                    TabOrder = 5
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
                    EditButtons = <>
                    Flat = True
                    TabOrder = 7
                    Visible = True
                    OnChange = eFamChange
                  end
                  object ePhone: TDBEditEh
                    Left = 156
                    Top = 105
                    Width = 136
                    Height = 19
                    EditButtons = <>
                    Flat = True
                    TabOrder = 8
                    Visible = True
                    OnChange = eFamChange
                  end
                  object bShot: TButton
                    Left = 448
                    Top = 131
                    Width = 93
                    Height = 25
                    Caption = #1057#1085#1080#1084#1086#1082
                    TabOrder = 9
                    OnClick = bShotClick
                  end
                end
                object Panel6: TPanel
                  Left = 1
                  Top = 350
                  Width = 703
                  Height = 204
                  Align = alClient
                  TabOrder = 0
                  DesignSize = (
                    703
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
                    Left = 672
                    Top = 35
                    Width = 23
                    Height = 23
                    Action = actAddAddress
                    Anchors = [akTop, akRight]
                    Flat = True
                  end
                  object sbRemoveAddress: TSpeedButton
                    Left = 672
                    Top = 93
                    Width = 23
                    Height = 23
                    Action = actDeleteAddress
                    Anchors = [akTop, akRight]
                    Flat = True
                  end
                  object SpeedButton2: TSpeedButton
                    Left = 672
                    Top = 64
                    Width = 23
                    Height = 23
                    Action = actEditAddress
                    Anchors = [akTop, akRight]
                    Flat = True
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
                    Width = 654
                    Height = 146
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    DataSource = dmStudentSelectionProcs.dsGetPersonAddress
                    Flat = True
                    FooterColor = clWindow
                    FooterFont.Charset = DEFAULT_CHARSET
                    FooterFont.Color = clWindowText
                    FooterFont.Height = -11
                    FooterFont.Name = 'Tahoma'
                    FooterFont.Style = []
                    Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                    RowHeight = 18
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnDblClick = actEditAddressExecute
                  end
                end
              end
            end
            object TabSheet4: TTabSheet
              Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
              ImageIndex = 1
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 705
                Height = 555
                Align = alClient
                TabOrder = 0
                object Panel5: TPanel
                  Left = 1
                  Top = 1
                  Width = 703
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
                    Top = 8
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
                  object dbcbeCitizenship: TDBLookupComboboxEh
                    Left = 17
                    Top = 28
                    Width = 509
                    Height = 19
                    Alignment = taLeftJustify
                    EditButtons = <>
                    Flat = True
                    KeyField = 'ik_grazd'
                    ListField = 'c_grazd'
                    ListSource = dmStudentData.dsCitizen
                    TabOrder = 0
                    Visible = True
                    OnChange = eFamChange
                  end
                  object eBirthPlace: TDBEditEh
                    Left = 17
                    Top = 71
                    Width = 510
                    Height = 19
                    Alignment = taLeftJustify
                    EditButtons = <>
                    Flat = True
                    TabOrder = 1
                    Visible = True
                    OnChange = eFamChange
                  end
                end
                object Panel2: TPanel
                  Left = 1
                  Top = 102
                  Width = 703
                  Height = 452
                  Align = alClient
                  TabOrder = 1
                  object Label30: TLabel
                    Left = 17
                    Top = 101
                    Width = 119
                    Height = 13
                    Caption = #1054#1073#1097#1077#1089#1090#1074#1077#1085#1085#1072#1103' '#1088#1072#1073#1086#1090#1072':'
                  end
                  object Label31: TLabel
                    Left = 17
                    Top = 19
                    Width = 132
                    Height = 13
                    Caption = #1044#1086#1074#1091#1079#1086#1074#1089#1082#1072#1103' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1072':'
                  end
                  object Label32: TLabel
                    Left = 17
                    Top = 62
                    Width = 99
                    Height = 13
                    Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1099#1081' '#1091#1095#1077#1090':'
                  end
                  object Label34: TLabel
                    Left = 198
                    Top = 141
                    Width = 143
                    Height = 13
                    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103':'
                  end
                  object Label42: TLabel
                    Left = 196
                    Top = 19
                    Width = 43
                    Height = 13
                    Caption = #1052#1077#1076#1072#1083#1100':'
                  end
                  object Label43: TLabel
                    Left = 196
                    Top = 101
                    Width = 253
                    Height = 13
                    Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1074#1086#1077#1085#1085#1086#1081' '#1089#1083#1091#1078#1073#1077' / '#1074#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077': '
                  end
                  object Label57: TLabel
                    Left = 139
                    Top = 205
                    Width = 41
                    Height = 13
                    Caption = #1084#1077#1089#1103#1094#1077#1074
                  end
                  object Label56: TLabel
                    Left = 66
                    Top = 205
                    Width = 18
                    Height = 13
                    Caption = #1083#1077#1090
                  end
                  object Label55: TLabel
                    Left = 17
                    Top = 182
                    Width = 72
                    Height = 13
                    Caption = #1057#1090#1072#1078' '#1088#1072#1073#1086#1090#1099':'
                  end
                  object Label54: TLabel
                    Left = 17
                    Top = 141
                    Width = 61
                    Height = 13
                    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
                  end
                  object Label51: TLabel
                    Left = 196
                    Top = 62
                    Width = 76
                    Height = 13
                    Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099':'
                  end
                  object Label59: TLabel
                    Left = 240
                    Top = 19
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
                  object cbChildren: TCheckBox
                    Left = 363
                    Top = 28
                    Width = 97
                    Height = 17
                    Caption = #1053#1072#1083#1080#1095#1080#1077' '#1076#1077#1090#1077#1081
                    TabOrder = 0
                    OnClick = eFamChange
                  end
                  object cbJob: TCheckBox
                    Left = 363
                    Top = 80
                    Width = 118
                    Height = 17
                    Caption = #1053#1072#1083#1080#1095#1080#1077' '#1088#1072#1073#1086#1090#1099
                    TabOrder = 1
                    OnClick = eFamChange
                  end
                  object cbInvalid: TCheckBox
                    Left = 363
                    Top = 45
                    Width = 97
                    Height = 17
                    Caption = #1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100
                    TabOrder = 2
                    OnClick = eFamChange
                  end
                  object cbAppNeed: TCheckBox
                    Left = 363
                    Top = 63
                    Width = 164
                    Height = 17
                    Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100' '#1074' '#1086#1073#1097#1077#1078#1080#1090#1080#1080
                    TabOrder = 3
                    OnClick = eFamChange
                  end
                  object dbcbePreparation: TDBLookupComboboxEh
                    Left = 17
                    Top = 37
                    Width = 172
                    Height = 19
                    Alignment = taLeftJustify
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
                    Top = 118
                    Width = 172
                    Height = 19
                    Alignment = taLeftJustify
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
                    Left = 17
                    Top = 78
                    Width = 172
                    Height = 19
                    Alignment = taLeftJustify
                    EditButtons = <>
                    Flat = True
                    KeyField = 'Ik_special_uchet'
                    ListField = 'Cspecial_uchet'
                    ListSource = dmStudentData.dsCount
                    TabOrder = 6
                    Visible = True
                    OnChange = eFamChange
                  end
                  object dbcbeMedal: TDBLookupComboboxEh
                    Left = 196
                    Top = 35
                    Width = 157
                    Height = 19
                    Alignment = taLeftJustify
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
                    Left = 195
                    Top = 118
                    Width = 331
                    Height = 19
                    Alignment = taLeftJustify
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
                    Left = 195
                    Top = 158
                    Width = 332
                    Height = 72
                    BevelInner = bvNone
                    BorderStyle = bsNone
                    MaxLength = 1000
                    TabOrder = 9
                    OnChange = eFamChange
                    OnEnter = eAddInfoEnter
                    OnExit = eAddInfoExit
                  end
                  object eDuty: TDBEditEh
                    Left = 17
                    Top = 159
                    Width = 172
                    Height = 19
                    Alignment = taLeftJustify
                    EditButtons = <>
                    Flat = True
                    TabOrder = 10
                    Visible = True
                    OnChange = eFamChange
                  end
                  object dbcbeEnterprise: TDBLookupComboboxEh
                    Left = 196
                    Top = 78
                    Width = 157
                    Height = 19
                    Alignment = taLeftJustify
                    EditButtons = <>
                    Flat = True
                    KeyField = 'Ik_pred'
                    ListField = 'Cname_pred'
                    ListSource = dmStudentData.dsEnterprise
                    TabOrder = 11
                    Visible = True
                    OnChange = eFamChange
                  end
                  object eXpyear: TDBNumberEditEh
                    Left = 17
                    Top = 202
                    Width = 45
                    Height = 19
                    EditButtons = <>
                    Flat = True
                    MaxValue = 1000.000000000000000000
                    TabOrder = 12
                    Visible = True
                    OnChange = eFamChange
                  end
                  object eXpMonth: TDBNumberEditEh
                    Left = 91
                    Top = 202
                    Width = 45
                    Height = 19
                    EditButtons = <>
                    Flat = True
                    MaxValue = 11.000000000000000000
                    TabOrder = 13
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
                Width = 705
                Height = 3
                Cursor = crVSplit
                Align = alTop
                ExplicitWidth = 575
              end
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 705
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
                Width = 705
                Height = 403
                Align = alClient
                DataSource = dmStudentSelectionProcs.dsFamily
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -11
                FooterFont.Name = 'Tahoma'
                FooterFont.Style = []
                Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
                RowHeight = 18
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnExit = dbgeFamExit
              end
              object dbgeChangeFam: TDBGridEh
                Left = 0
                Top = 431
                Width = 705
                Height = 124
                Align = alBottom
                AutoFitColWidths = True
                DataSource = dmStudentSelectionProcs.dsLastnames
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -11
                FooterFont.Name = 'Tahoma'
                FooterFont.Style = []
                Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 2
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
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
              DesignSize = (
                705
                555)
              object dbgeDocuments: TDBGridEh
                Left = 0
                Top = 26
                Width = 705
                Height = 488
                Anchors = [akLeft, akTop, akRight, akBottom]
                AutoFitColWidths = True
                DataSource = dmStudentSelectionProcs.dsDocuments
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -11
                FooterFont.Name = 'Tahoma'
                FooterFont.Style = []
                Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
                RowHeight = 18
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnExit = dbgeFamExit
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
              end
            end
            object TabSheet7: TTabSheet
              Caption = #1057#1086#1073#1099#1090#1080#1103
              ImageIndex = 4
              object gbExiled: TGroupBox
                Left = 0
                Top = 0
                Width = 705
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
                  Width = 701
                  Height = 74
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsExiles
                  Flat = True
                  FooterColor = clWindow
                  FooterFont.Charset = DEFAULT_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -11
                  FooterFont.Name = 'MS Sans Serif'
                  FooterFont.Style = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                end
              end
              object gbAcadem: TGroupBox
                Left = 0
                Top = 179
                Width = 705
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
                  Width = 701
                  Height = 69
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsAcadem
                  Flat = True
                  FooterColor = clWindow
                  FooterFont.Charset = DEFAULT_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -11
                  FooterFont.Name = 'MS Sans Serif'
                  FooterFont.Style = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                end
              end
              object gbEntered: TGroupBox
                Left = 0
                Top = 91
                Width = 705
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
                  Width = 701
                  Height = 71
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsVosst
                  Flat = True
                  FooterColor = clWindow
                  FooterFont.Charset = DEFAULT_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -11
                  FooterFont.Name = 'MS Sans Serif'
                  FooterFont.Style = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                end
              end
              object gbProlongued: TGroupBox
                Left = 0
                Top = 457
                Width = 705
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
                  Width = 701
                  Height = 81
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsExtendedSessions
                  Flat = True
                  FooterColor = clWindow
                  FooterFont.Charset = DEFAULT_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -11
                  FooterFont.Name = 'MS Sans Serif'
                  FooterFont.Style = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                end
              end
              object gbCatChange: TGroupBox
                Left = 0
                Top = 361
                Width = 705
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
                  Width = 701
                  Height = 79
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsSelKatChanges
                  Flat = True
                  FooterColor = clWindow
                  FooterFont.Charset = DEFAULT_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -11
                  FooterFont.Name = 'MS Sans Serif'
                  FooterFont.Style = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                end
              end
              object gbMoved: TGroupBox
                Left = 0
                Top = 265
                Width = 705
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
                  Width = 701
                  Height = 79
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmStudentSelectionProcs.dsMoves
                  Flat = True
                  FooterColor = clWindow
                  FooterFont.Charset = DEFAULT_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -11
                  FooterFont.Name = 'MS Sans Serif'
                  FooterFont.Style = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  RowHeight = 18
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
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
            Width = 713
            Height = 561
            Align = alClient
            AllowedOperations = []
            AutoFitColWidths = True
            DataSource = dmUspevaemost.dsSelUspevForStud
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'Tahoma'
            FooterFont.Style = []
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
            RowSizingAllowed = True
            SortLocal = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnTitleClick = DBGridEh1TitleClick
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 713
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
            Width = 713
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
            Width = 713
            Height = 561
            Align = alClient
            AllowedOperations = []
            AutoFitColWidths = True
            DataSource = dmUspevaemost.dsSelAllBRSBallsForStudent
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'Tahoma'
            FooterFont.Style = []
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
            RowSizingAllowed = True
            SortLocal = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnTitleClick = dbgeBallsTitleClick
          end
        end
        object TabSheet9: TTabSheet
          Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
          ImageIndex = 2
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 713
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
            Width = 713
            Height = 561
            Align = alClient
            AllowedOperations = []
            AutoFitColWidths = True
            DataSource = dmUspevaemost.dsGetAllNaprStud
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'Tahoma'
            FooterFont.Style = []
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
            PopupMenu = ppmStudNapr
            RowSizingAllowed = True
            SortLocal = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnTitleClick = dbgrNaprTitleClick
          end
        end
        object tsUspevStat: TTabSheet
          Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
          ImageIndex = 3
          object dbgUspevStat: TDBGridEh
            Left = 0
            Top = 0
            Width = 713
            Height = 587
            Align = alClient
            AllowedOperations = []
            DataSource = dmUspevaemost.dsUspevStatForStud
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'Tahoma'
            FooterFont.Style = []
            Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
            ReadOnly = True
            RowSizingAllowed = True
            SortLocal = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnTitleClick = dbgUspevStatTitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'n_sem'
                Footers = <>
                Title.Caption = #1057#1077#1084#1077#1089#1090#1088
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'ExamAVGOcenca'
                Footers = <>
                Title.Caption = #1057#1088'. '#1073#1072#1083#1083' '#1079#1072' '#1101#1082#1079#1072#1084#1077#1085#1099
                Width = 140
              end
              item
                EditButtons = <>
                FieldName = 'KPAVGOcenca'
                Footers = <>
                Title.Caption = #1057#1088'. '#1073#1072#1083#1083' '#1079#1072' '#1082#1091#1088#1089#1086#1074#1099#1077
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'AVGOcenca'
                Footers = <>
                Title.Caption = #1048#1090#1086#1075#1086#1074#1099#1081' '#1089#1088'. '#1073#1072#1083#1083
                Width = 137
              end>
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 647
    Width = 725
    ExplicitTop = 647
    ExplicitWidth = 725
    DesignSize = (
      725
      37)
    inherited bbSave: TBitBtn
      Left = 555
      Action = actApply
      ExplicitLeft = 555
    end
    inherited bbUndo: TBitBtn
      Left = 387
      Action = actUndo
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ExplicitLeft = 387
    end
  end
  object ilPages: TImageList
    Left = 434
    Top = 15
    Bitmap = {
      494C010106000900500010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000515200005152000051520000515200005152000051
      5200005152000051520000515200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7EF006B5142006349
      3900634931006B49390073614A006B5139006349310063493100634931006349
      310063493100B5B6B50000000000000000000000000000000000000000000000
      0000000000000051520000CFCE0000CFCE0000FFFF0000FFFF0000FFFF0000FF
      FF00009E9C00009E9C00009E9C00007173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA69C00F7EFEF00E7DF
      D600E7CFC600DEC7BD008C8EB500D6BEB500DEB6A500D6B6A500D6AE9C00D6AE
      9400CE9E8C006349310000000000000000000000000000000000000000000000
      00000051520000CFCE0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000CFCE00007173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFF7EF00F7EF
      EF00F7EFE7003151BD001038B5006B79C600E7D7CE00EFD7C600E7CFBD00E7C7
      B500D6AE94006349310000000000000000000000000000000000000000000000
      00000051520000CFCE0000FFFF0000FFFF0073FFFF0000C7C60000C7C60073FF
      FF0000FFFF0000FFFF0000CFCE00007173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFF7EF00D6D7
      E7002949C6002951EF002149E7001038B5009C96C600EFD7C600EFCFC600E7C7
      B500D6AE94006349310000000000000000000000000000000000000000000000
      00000051520000CFCE0000FFFF0073FFFF0000C7C600FFFFFF000000000000C7
      C60000FFFF0000FFFF0000CFCE00007173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AE9C00FFF7F7001841
      BD002951F7006386FF005271F7003961EF002138B500D6C7C600EFD7CE00E7CF
      BD00D6AE9C006349310000000000000000000000000000000000000000000000
      00000051520000CFCE0000CFCE0000FFFF0000C7C600FFFFFF00000000000000
      000000C7C60000CFCE0000515200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AEA500FFFFF70084A6
      FF007B96FF007B8EF700D6D7E7007B96F7004261E7003951AD00EFD7CE00EFD7
      CE00D6B6A5006349390000000000000000000000000000000000000000000000
      0000000000000051520000CFCE0000CFCE00006984001079C6001079C6000871
      AD00004939000051520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB6A500FFFFFF00E7E7
      FF00BDC7F700F7EFEF00F7EFE700E7DFE7007B96F7002951DE005261AD00EFDF
      D600DEC7B5007359420000000000000000000000000000000000000000000000
      000000000000000000000051520000598400298EEF00319EFF00319EFF00319E
      FF001079C6000051520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00F7EFE700EFE7E700738EF7002149D6008C96
      BD00E7CFC60084695A00000000000000000000000000000000007BAE73006396
      5A00528E4A0039863100000000001879C60039A6FF0042A6FF0042A6FF0039A6
      FF00319EFF000049730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEBEAD00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7F700F7EFEF00EFE7E700F7EFE7007B96EF002149
      D6009C96BD00A58E7B0000000000000000000000000052964A00FFF7FF00E7E7
      E700EFE7EF00F7E7F70039863100218ECE0042AEFF004AB6FF004AB6FF004AAE
      FF0042AEFF001879BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF007B9EAD00638E94006386940063798C005A7184006B868C0094A6AD008CA6
      EF002949D600AD968C000000000000000000428E390000000000000000000071
      0000DEEFDE00F7F7F700EFE7EF00218ECE0052B6FF0052BEFF0052BEFF0052B6
      FF004AB6FF00218ECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF0084AEB50094D7E70094E7F7007BD7EF0063C7DE00529EB5006B868C00F7E7
      DE00E7D7CE00A5968C000000000000000000CEE7C600FFFFFF00000000000079
      000000790000DEEFDE00E7E7EF005A9E5200319ED6002996C60039A6DE004AB6
      FF0042AEF7002186B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEC7B500FFFFFF00FFFF
      FF00F7FFFF0084A6B500A5AEA5009C8E84007BC7D6004A697B00F7EFEF00EFE7
      DE00F7E7DE00847163000000000000000000E7EFE700FFFFFF00000000000079
      000008790800EFF7EF00EFEFEF005A9E5200318EBD0052A6D60073B6DE005AA6
      C600398EB50008699C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700DEC7B500D6BE
      AD00D6BEAD0073A6B500A5E7EF009CE7F7008CD7E70042617300C6AE9C00BDAE
      9C00BDA69400E7E7EF000000000000000000428E390000000000000000000871
      0800FFFFFF00FFFFFF00FFF7FF00398631002186B50084C7E70094CFEF008CC7
      E700298EBD0000496B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084B6C6007BA6B5006B96A50000000000000000000000
      000000000000000000000000000000000000000000003986310000000000FFFF
      FF00000000000000000052964A0000000000006194001871A5004296BD001871
      A50000517B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000639E5A006BA6
      6300529652008CBE8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00EFEFEF00E7E7E700DEDFDE00DEDFDE00DEDFDE00EFEF
      EF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00D6D7
      D600D6D7D600D6D7D600D6D7D600D6D7D600D6D7D600D6D7D600D6D7D600D6D7
      D600D6D7D600D6D7D600F7F7F700000000000000000000000000FFFFFF00DEDF
      DE009C9E9C005269520029612900215921001059100010591000215921003959
      39007B797B00EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6D7D60073717300C6C7C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C6C7C600C6967B00C696
      7B00BD8E7B00BD8E7300B5867300B5867300AD797300AD796B00AD716B00A571
      6B009C696B009C696300D6D7D6000000000000000000000000009CB69C001086
      100042BE420052C752003186290052C7520052C7520042BE420039B6390021AE
      210008610800D6D7D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C7C6004A514A00318EB50042617300F7F7F700BDBEBD00A5A6A500A5A6
      A500A5A6A500ADAEAD00CECFCE00EFEFEF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000B5B6B50073718C00C6968C00FFEF
      D600FFE7CE00FFE7CE00FFE7C600FFDFBD00FFDFBD00FFDFB500FFD7AD00FFD7
      AD00FFD7A5009C696300D6D7D60000000000000000000000000029A629004AC7
      4A005AC75A0052BE5200FFFFE7002186210063CF63005AC75A004ABE4A0031B6
      310008710800DEDFDE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C7
      C6004A514A002996C60084DFEF006396A500BD512900D6492100EF593900FF61
      5200FF615200D6492100A538180063514A009C9E9C00949694007B797B007371
      7300737173007B797B00BDBEBD00FFFFFF00ADD7F700398EEF008479A500F7DF
      CE00FFEFD600FFE7CE00FFE7CE00FFE7C600FFDFBD00FFDFBD00FFDFB500FFD7
      AD00FFD7AD009C696300D6D7D60000000000000000000000000031AE310052C7
      520073D7730018861800FFFFF700EFF7E7006BCF6B006BD76B005AC75A0039BE
      390052795200FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C7C6004A51
      4A002996C60084DFEF006396A50000000000C6411000EF594200FF715A00FF79
      6300CE592900D6865200FF695A00EF59420042B642002996290052C752004ABE
      4A0039B6390021AE21005A615A00F7F7F700000000007BD7FF00398EE7008479
      A500F7DFCE00FFEFD600FFE7CE00FFE7CE00FFE7C600FFDFBD00FFDFBD00FFDF
      B500FFD7AD009C696300D6D7D6000000000000000000000000001886180063CF
      63007BD77B00428E3900FFFFFF00FFFFF70084AE73007BD77B0063CF63000871
      0800E7E7E700000000000000000000000000000000000000000000000000EFE7
      DE00CEBEAD0094796B0073594200735942009C796B00ADAEAD00293042002996
      C60084DFEF006396A5000000000000000000D6967B00FF695A00FF866B00EF86
      5A00FFDFA500FFDFA500FF866B00FF61520063CF6300BDDFAD00429E42006BCF
      6B0052C7520039B639006B796B00FFFFFF0000000000000000007BC7EF003986
      DE007B79A500FFEFDE00F7DFC600F7D7C600FFDFC600FFE7C600FFDFBD00FFDF
      BD00FFDFB5009C696B00D6D7D600000000000000000000000000EFF7EF00298E
      29008CDF8C0084A66300739EAD000069A500528EA5003179180008690800EFEF
      EF00000000000000000000000000000000000000000000000000DED7D6008469
      52009C866300BDA67B00D6AE8400B596730094715A006B5142004A86940084DF
      EF006396A50000000000000000000000000000000000CE613900FF8E6B00EF9E
      7B00BD8E8400FFBE9400FF8E7300BD49180084DF8400FFFFFF00FFFFFF0063C7
      63006BCF6B00299E2900DEDFDE00000000000000000000000000DEAE84007BCF
      FF009C9E9C00D6A68C00FFF7C600FFFFDE00FFFFDE00C69E9400FFE7C600FFDF
      BD00FFDFBD00A5716B00D6D7D600000000000000000000000000000000000000
      0000D6E7D6000069A500218EDE00218EDE00218EDE001079BD0052595A00DEDF
      DE000000000000000000000000000000000000000000F7F7F7008C695A00C6AE
      8C00EFD7AD00EFD7AD00EFCFA500E7C79C00DEB68C00A5866300735142006396
      A50000000000000000000000000000000000EFEFEF004A494A00000000000820
      7B001028940000107B0063595A00319E310094E79400DED7BD00428EAD009CB6
      A50042A64200D6D7D60000000000000000000000000000000000DEAE8C00FFF7
      EF00D6A69C00FFFFCE00FFFFCE00FFFFE700FFFFFF00FFFFFF00CEA69400FFE7
      C600FFDFBD00AD716B00D6D7D600000000000000000000000000000000000000
      00005A96B500319EFF00319EFF00399EFF00319EFF00319EFF001071BD008486
      8400FFFFFF0000000000000000000000000000000000C6B6AD00B59E8400F7DF
      BD00F7E7C600F7E7C600F7DFBD00EFDFB500E7CFA500D6AE8400947152006B61
      5A0000000000000000000000000000000000101010001010100008286B001849
      AD001849B5001849AD0008186B00BDBEBD0094B6C6002996F7002996F7002996
      EF0010598C00A5A6A500FFFFFF00000000000000000000000000E7AE8C00FFFF
      F700FFE7BD00FFDFAD00FFFFCE00FFFFE700FFFFF700FFFFE700CEB69C00FFE7
      CE00FFE7C600AD797300D6D7D600000000000000000000000000000000000000
      00001079BD0039A6FF0042A6FF0042AEFF0042A6FF0039A6FF0039A6FF003959
      6B00E7E7E70000000000000000000000000000000000B59E9400CEBEA500F7EF
      CE00F7EFD600F7EFDE00F7EFD600F7E7C600EFD7B500E7C79C00B59673008C69
      5A000000000000000000000000000000000018181800212021002161C6002169
      CE002169D6002161CE0010419C00A5A6A500298EDE0039A6FF0039A6FF0039A6
      FF00319EFF005A616300EFEFEF00000000000000000000000000E7B68C00FFFF
      FF00FFF7BD00FFDFAD00FFF7C600FFFFD600FFFFDE00FFFFD600D6B69400FFE7
      CE00FFE7CE00B5867300D6D7D600000000000000000000000000000000000000
      0000319EE70042AEFF004AB6FF004AB6FF004AB6FF0042AEFF0042AEFF000861
      9400CECFCE000000000000000000000000000000000094867300E7DFC600F7F7
      DE00FFF7EF00FFFFEF00FFF7E700F7EFD600EFDFBD00E7CFA500CEA684007351
      39000000000000000000000000000000000029282900313031002161B500298E
      F7003196FF00298EF7001861C600A5A6A50042AEFF004AB6FF004AB6FF004AAE
      FF0042AEFF0018598400DEDFDE00000000000000000000000000EFB68C00FFFF
      FF00E7C7A500FFFFEF00FFDFB500FFEFB500FFEFBD00FFF7C600B58E8400FFEF
      D600FFE7CE00BD867300D6D7D600000000000000000000000000000000000000
      000039A6EF0052BEFF0052BEFF0052BEFF0052BEFF004AB6FF004AB6FF001886
      C600BDBEBD0000000000000000000000000000000000BDB6A500CEC7B500FFF7
      EF00FFFFF700FFFFF700FFF7EF00F7EFDE00F7DFC600EFCFAD00C6A67B007B59
      4A00000000000000000000000000000000001818180042414200292829001041
      9C002169DE003196F7001059A500D6D7D60052B6FF0052BEFF0052BEFF0052BE
      FF004AB6FF001879BD00D6D7D600000000000000000000000000EFBE9400FFFF
      FF00F7EFEF00FFF7EF00FFFFE700FFEFBD00FFFFCE00E7AE8C00FFEFDE00FFEF
      D600FFEFD600C68E7B00D6D7D600000000000000000000000000000000000000
      00003196D6004AB6F7002996CE0042AEF70052B6FF0052B6FF004AB6FF000869
      9C00CECFCE0000000000000000000000000000000000E7DFD600C6B6AD00F7EF
      E700FFFFF700FFFFF700FFF7EF00F7EFD600F7DFBD00E7CFA5009C866B00B5A6
      9C0000000000000000000000000000000000DEDFDE0052515200636163009C9E
      9C00737173002928290039384200FFFFFF001886BD00298EBD00318EBD001886
      CE002186CE0010618C00EFEFEF00000000000000000000000000F7BE9400FFFF
      FF00FFFFFF00FFF7F700BD9E9400D6AE9C00DEB6B500FFF7EF00FFF7E700FFE7
      D600FFD7C600C6967B00D6D7D600000000000000000000000000000000000000
      00001871A5002186B500429ED60073B6DE0063AECE00318EB500318EB5001061
      8C00EFEFEF0000000000000000000000000000000000F7F7EF00C6B6AD00D6C7
      BD00F7F7EF00FFF7E700F7F7DE00F7EFCE00E7D7B500B59E84007B594A00EFE7
      E7000000000000000000000000000000000000000000BDBEBD00636163009496
      94006B696B0029282900F7F7F700000000007BAECE0063AEDE0084C7E7009CCF
      E7003996C600B5B6BD00FFFFFF00000000000000000000000000F7C79400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7EF009C69
      6B009C696B009C696B00E7E7E700000000000000000000000000000000000000
      000000000000318EBD0073B6DE0084C7E7009CCFEF005AAED6002186B500B5B6
      BD00FFFFFF000000000000000000000000000000000000000000E7E7DE00C6B6
      AD00CEBEB500D6CFBD00DED7BD00C6B69C00A59673008C715A00D6CFC6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BAECE005AA6C600398E
      BD00C6D7DE00FFFFFF0000000000000000000000000000000000FFC79400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFE7
      B500D69E8400D6D7D60000000000000000000000000000000000000000000000
      000000000000DEEFF7002179AD00BDDFEF0084BEE7001879AD00C6CFD600FFFF
      FF0000000000000000000000000000000000000000000000000000000000F7F7
      F700E7DFD600C6BEAD00B5A69C00A5968400BDAE9C00F7E7E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFCF9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7F700F7F7EF00DEA6
      8400D6D7D600000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFC01000000008003F80000000000
      8003F000000000008003F000000000008003F020000000008003F03100000000
      8003F803000000008003FC03000000008003C203000000008003800300000000
      8003600300000000800320030000000080032003000000008003600300000000
      FC7FAD0700000000FFFFC3FF00000000F807FFFFFFFFC001C003FFF8FFFF0001
      C003FFF0007F0001C003FFE000000001C003FFC100008001C007E0030000C001
      C00FC0078001C001F00F800F0003C001F007800F0001C001F007800F0001C001
      F007800F0001C001F007800F0001C001F007800F0001C001F007800F8101C001
      F807C01FFF83C003F80FE03FFFFFC00700000000000000000000000000000000
      000000000000}
  end
  object odPhoto: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg)|*.jpg;*.jpeg|JPEG Image File (*.jpg)|*.jpg|JP' +
      'EG Image File (*.jpeg)|*.jpeg'
    Left = 400
    Top = 14
  end
  object ActionList1: TActionList
    Images = frmMain.ImageList1
    Left = 464
    Top = 96
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
  end
  object ppmSpravToExcel: TPopupMenu
    Left = 351
    Top = 138
    object MenuItem1: TMenuItem
      Action = actPrintSprav
    end
    object MenuItem2: TMenuItem
      Action = actPrintPensSprav
    end
    object MenuItem3: TMenuItem
      Action = frmMain.actLichnKartStud
    end
  end
  object ppmStudNapr: TPopupMenu
    Images = frmMain.ImageList1
    Left = 320
    Top = 136
    object N1: TMenuItem
      Action = frmMain.actNapr
    end
    object N2: TMenuItem
      Action = frmMain.actNaprClose
    end
  end
end
