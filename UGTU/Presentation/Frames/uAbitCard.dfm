inherited fmAbitCard: TfmAbitCard
  Width = 624
  HelpKeyword = 'A_Abit_frame.htm'
  Visible = False
  ExplicitWidth = 624
  inherited ToolBar1: TToolBar
    Width = 624
    ExplicitWidth = 624
    inherited ToolButton4: TToolButton
      Visible = False
    end
    inherited ToolButton2: TToolButton
      Visible = False
    end
    inherited ToolButton13: TToolButton
      Visible = False
    end
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited ToolButton8: TToolButton
      Visible = False
    end
    inherited ToolButton7: TToolButton
      Visible = False
    end
    inherited ToolButton6: TToolButton
      Visible = False
    end
    inherited ToolButton3: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited ToolButton5: TToolButton
      Visible = False
    end
    inherited ToolButton14: TToolButton
      Visible = False
    end
    inherited ToolButton1: TToolButton
      Action = frmMain.actListToExcel
    end
    inherited ToolButton11: TToolButton
      Action = frmMain.actPostupDlgShow
    end
    object ToolButton15: TToolButton
      Left = 337
      Top = 0
      Action = frmMain.actGazpromStatement
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton16: TToolButton
      Left = 360
      Top = 0
      Caption = 'ToolButton16'
      ImageIndex = 61
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Width = 624
    ParentFont = False
    ExplicitWidth = 624
    inherited ScrollBox1: TScrollBox
      Width = 620
      ExplicitWidth = 620
      inherited PageControl1: TPageControl
        Width = 620
        ExplicitWidth = 620
        inherited TabSheet1: TTabSheet
          ExplicitWidth = 612
          inherited PageControl2: TPageControl
            Width = 612
            ExplicitWidth = 612
            inherited TabSheet3: TTabSheet
              ExplicitWidth = 604
              inherited Panel4: TPanel
                Width = 604
                ExplicitWidth = 604
                inherited Panel8: TPanel
                  Width = 602
                  Height = 215
                  ExplicitWidth = 602
                  ExplicitHeight = 215
                  inherited Label1: TLabel
                    Left = 12
                    ExplicitLeft = 12
                  end
                  inherited Label15: TLabel
                    Visible = False
                  end
                  inherited Label16: TLabel
                    Left = 12
                    ExplicitLeft = 12
                  end
                  inherited Label17: TLabel
                    Left = 448
                    Top = 4
                    ParentFont = False
                    ExplicitLeft = 448
                    ExplicitTop = 4
                  end
                  inherited Label47: TLabel
                    Visible = False
                  end
                  inherited Label53: TLabel
                    Visible = False
                  end
                  inherited dbgeLang: TDBGridEh
                    Left = 12
                    Top = 87
                    Width = 411
                    Height = 109
                    OnColExit = dbgeLangColExit
                  end
                  inherited dbcbeSchool: TDBLookupComboboxEh
                    Left = 14
                    Width = 410
                    ParentFont = False
                    ExplicitLeft = 14
                    ExplicitWidth = 410
                  end
                  inherited dbcbeCat: TDBLookupComboboxEh
                    Visible = False
                  end
                  inherited eYearFinished: TDBNumberEditEh
                    Left = 448
                    Top = 19
                    Width = 53
                    ExplicitLeft = 448
                    ExplicitTop = 19
                    ExplicitWidth = 53
                  end
                  inherited DBNavigator1: TDBNavigator
                    Left = 12
                    Width = 102
                    ExplicitLeft = 12
                    ExplicitWidth = 102
                  end
                  inherited dbcbeOrder: TDBLookupComboboxEh
                    Visible = False
                  end
                end
                inherited Panel7: TPanel
                  Width = 602
                  ExplicitWidth = 602
                  inherited Label4: TLabel
                    Left = 12
                    ExplicitLeft = 12
                  end
                  inherited Label5: TLabel
                    Left = 12
                    ExplicitLeft = 12
                  end
                  inherited Label37: TLabel
                    Left = 306
                    Top = 107
                    Visible = False
                    ExplicitLeft = 306
                    ExplicitTop = 107
                  end
                  inherited Label13: TLabel
                    Top = 48
                    ExplicitTop = 48
                  end
                  inherited Label18: TLabel
                    Left = 12
                    ExplicitLeft = 12
                  end
                  inherited Label52: TLabel
                    Left = 387
                    Top = 107
                    Visible = False
                    ExplicitLeft = 387
                    ExplicitTop = 107
                  end
                  inherited Label8: TLabel
                    Left = 298
                    ExplicitLeft = 298
                  end
                  object Label48: TLabel [15]
                    Left = 356
                    Top = 0
                    Width = 3
                    Height = 13
                  end
                  inherited Label50: TLabel
                    Left = 205
                    Top = 52
                    ExplicitLeft = 205
                    ExplicitTop = 52
                  end
                  inherited eFam: TDBEditEh
                    EditMask = ''
                  end
                  inherited eName: TDBEditEh
                    EditMask = ''
                  end
                  inherited eMid: TDBEditEh
                    EditMask = ''
                  end
                  inherited eEmail: TDBEditEh
                    Left = 12
                    Width = 280
                    ExplicitLeft = 12
                    ExplicitWidth = 280
                  end
                  inherited eNum: TDBEditEh
                    Top = 118
                    Visible = False
                    ExplicitTop = 118
                    EditMask = '000000; ; '
                  end
                  inherited eCellphone: TDBEditEh
                    Top = 64
                    ExplicitTop = 64
                  end
                  inherited ePhone: TDBEditEh
                    Left = 298
                    Width = 144
                    ExplicitLeft = 298
                    ExplicitWidth = 144
                  end
                end
                inherited Panel6: TPanel
                  Top = 388
                  Width = 602
                  Height = 166
                  ExplicitTop = 388
                  ExplicitWidth = 602
                  ExplicitHeight = 166
                  inherited Label2: TLabel
                    Left = 13
                    Top = 11
                    Width = 103
                    Caption = #1040#1076#1088#1077#1089#1072' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
                    ExplicitLeft = 13
                    ExplicitTop = 11
                    ExplicitWidth = 103
                  end
                  inherited sbAddAddress: TSpeedButton
                    Left = 566
                    ExplicitLeft = 511
                  end
                  inherited sbRemoveAddress: TSpeedButton
                    Left = 566
                    ExplicitLeft = 511
                  end
                  inherited SpeedButton2: TSpeedButton
                    Left = 566
                    ExplicitLeft = 511
                  end
                  inherited SpeedButton3: TSpeedButton
                    Left = 130
                    Top = 7
                    ExplicitLeft = 130
                    ExplicitTop = 7
                  end
                  inherited dbgeAddress: TDBGridEh
                    Width = 546
                    Height = 124
                    RowHeight = 0
                  end
                end
              end
            end
            inherited TabSheet4: TTabSheet
              ExplicitWidth = 604
              inherited Panel3: TPanel
                Width = 604
                ExplicitWidth = 604
                inherited Panel5: TPanel
                  Width = 602
                  ParentFont = False
                  ExplicitWidth = 602
                  inherited Label27: TLabel
                    Top = 55
                    ParentFont = False
                    ExplicitTop = 55
                  end
                  inherited Label58: TLabel
                    Top = 5
                    ExplicitTop = 5
                  end
                  object Label3: TLabel [3]
                    Left = 104
                    Top = 51
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
                  inherited dbcbeCitizenship: TDBLookupComboboxEh
                    Top = 24
                    Width = 512
                    ParentFont = False
                    ExplicitTop = 24
                    ExplicitWidth = 512
                  end
                  inherited eBirthPlace: TDBEditEh
                    Width = 512
                    ExplicitWidth = 512
                  end
                end
                inherited pnlDop: TPanel
                  Width = 602
                  Height = 283
                  ExplicitWidth = 602
                  ExplicitHeight = 283
                  inherited Label30: TLabel
                    Left = 205
                    Top = 81
                    ParentFont = False
                    ExplicitLeft = 205
                    ExplicitTop = 81
                  end
                  inherited Label31: TLabel
                    Top = 36
                    ParentFont = False
                    ExplicitTop = 36
                  end
                  inherited Label32: TLabel
                    Left = 17
                    Top = 81
                    ParentFont = False
                    ExplicitLeft = 17
                    ExplicitTop = 81
                  end
                  inherited Label34: TLabel
                    Left = 18
                    Top = 125
                    ParentFont = False
                    ExplicitLeft = 18
                    ExplicitTop = 125
                  end
                  inherited Label42: TLabel
                    Top = 38
                    ExplicitTop = 38
                  end
                  inherited Label43: TLabel
                    Top = 81
                    ParentFont = False
                    ExplicitTop = 81
                  end
                  object Label61: TLabel [6]
                    Left = 17
                    Top = 212
                    Width = 38
                    Height = 13
                    Caption = #1051#1100#1075#1086#1090#1099
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  inherited cbChildren: TCheckBox
                    Top = 6
                    ParentFont = False
                    ExplicitTop = 6
                  end
                  inherited cbJob: TCheckBox
                    Top = 259
                    ExplicitTop = 259
                  end
                  inherited cbInvalid: TCheckBox
                    Left = 317
                    Top = 6
                    ExplicitLeft = 317
                    ExplicitTop = 6
                  end
                  inherited cbAppNeed: TCheckBox
                    Left = 17
                    Top = 6
                    ParentFont = False
                    ExplicitLeft = 17
                    ExplicitTop = 6
                  end
                  inherited dbcbePreparation: TDBLookupComboboxEh
                    Top = 52
                    ParentFont = False
                    ExplicitTop = 52
                  end
                  inherited dbcbeSocWork: TDBLookupComboboxEh
                    Top = 96
                    ParentFont = False
                    ExplicitTop = 96
                  end
                  inherited dbcbeSpecCount: TDBLookupComboboxEh
                    Left = 17
                    Top = 95
                    ParentFont = False
                    ExplicitLeft = 17
                    ExplicitTop = 95
                  end
                  inherited dbcbeMedal: TDBLookupComboboxEh
                    Top = 52
                    ExplicitTop = 52
                  end
                  inherited dbcbeMilitaryState: TDBLookupComboboxEh
                    Left = 18
                    Top = 100
                    Width = 398
                    ParentFont = False
                    ExplicitLeft = 18
                    ExplicitTop = 100
                    ExplicitWidth = 398
                  end
                  inherited eAddInfo: TMemo
                    Top = 144
                    Width = 564
                    Height = 59
                    ParentFont = False
                    ExplicitTop = 144
                    ExplicitWidth = 564
                    ExplicitHeight = 59
                  end
                  object eBenefits: TDBEditEh
                    Left = 17
                    Top = 228
                    Width = 564
                    Height = 19
                    Alignment = taLeftJustify
                    DynProps = <>
                    EditButtons = <>
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Flat = True
                    ParentFont = False
                    TabOrder = 10
                    Visible = True
                    OnChange = eFamChange
                  end
                end
                inherited pnlWork: TPanel
                  Top = 385
                  Width = 602
                  Height = 169
                  ExplicitTop = 385
                  ExplicitWidth = 602
                  ExplicitHeight = 169
                  inherited Label51: TLabel
                    ParentFont = False
                  end
                  inherited Label54: TLabel
                    Top = 46
                    ExplicitTop = 46
                  end
                  inherited Label55: TLabel
                    Top = 74
                    ExplicitTop = 74
                  end
                  inherited Label56: TLabel
                    Top = 74
                    ExplicitTop = 74
                  end
                  inherited Label57: TLabel
                    Left = 221
                    Top = 74
                    ExplicitLeft = 221
                    ExplicitTop = 74
                  end
                  inherited dbcbeEnterprise: TDBLookupComboboxEh
                    Width = 487
                    ParentFont = False
                    ExplicitWidth = 487
                  end
                  inherited eDuty: TDBEditEh
                    Top = 43
                    Width = 168
                    ParentFont = False
                    ExplicitTop = 43
                    ExplicitWidth = 168
                  end
                  inherited eXpyear: TDBNumberEditEh
                    Top = 71
                    ExplicitTop = 71
                  end
                  inherited eXpMonth: TDBNumberEditEh
                    Left = 169
                    Top = 71
                    ExplicitLeft = 169
                    ExplicitTop = 71
                  end
                end
              end
            end
            inherited TabSheet5: TTabSheet
              ExplicitWidth = 604
              inherited Splitter1: TSplitter
                Width = 604
                ExplicitWidth = 551
              end
              inherited Panel9: TPanel
                Width = 604
                ExplicitWidth = 604
                inherited dbcbeFamState: TDBLookupComboboxEh
                  Top = 2
                  ExplicitTop = 2
                end
              end
              inherited dbgeFam: TDBGridEh
                Width = 604
                OnColExit = dbgeFamColExit
              end
              inherited dbgeChangeFam: TDBGridEh
                Width = 604
              end
            end
            inherited TabSheet6: TTabSheet
              ExplicitWidth = 604
              object SpeedButton5: TSpeedButton [0]
                Left = 526
                Top = 29
                Width = 23
                Height = 22
                Action = actAddDocument
                Flat = True
              end
              object SpeedButton6: TSpeedButton [1]
                Left = 526
                Top = 57
                Width = 23
                Height = 22
                Action = actDelDocument
                Flat = True
              end
              inherited dbgeDocuments: TDBGridEh
                Width = 553
                OnColExit = dbgeFamExit
              end
              inherited pnlToolDoc: TPanel
                Left = 553
                ExplicitLeft = 553
              end
            end
            inherited TabSheet7: TTabSheet
              TabVisible = False
              ExplicitWidth = 604
              inherited gbExiled: TGroupBox
                Width = 604
                ExplicitWidth = 604
                inherited DBGridEh5: TDBGridEh
                  Width = 600
                end
              end
              inherited gbAcadem: TGroupBox
                Width = 604
                ExplicitWidth = 604
                inherited dbgeAcadem: TDBGridEh
                  Width = 600
                end
              end
              inherited gbEntered: TGroupBox
                Width = 604
                ExplicitWidth = 604
                inherited DBGridEh3: TDBGridEh
                  Width = 600
                end
              end
              inherited gbProlongued: TGroupBox
                Width = 604
                ExplicitWidth = 604
                inherited DBGridEh6: TDBGridEh
                  Width = 600
                end
              end
              inherited gbCatChange: TGroupBox
                Width = 604
                ExplicitWidth = 604
                inherited DBGridEh2: TDBGridEh
                  Width = 600
                end
              end
              inherited gbMoved: TGroupBox
                Width = 604
                ExplicitWidth = 604
                inherited DBGridEh4: TDBGridEh
                  Width = 600
                end
              end
            end
            object TabSheet8: TTabSheet
              Caption = #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077
              ImageIndex = 5
              object GroupBox2: TGroupBox
                Left = 0
                Top = 0
                Width = 604
                Height = 281
                Align = alTop
                Caption = #1069#1082#1079#1072#1084#1077#1085#1099
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object dbgeExams: TDBGridEh
                  Left = 2
                  Top = 15
                  Width = 600
                  Height = 264
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dm.dsAbitExamView
                  DynProps = <>
                  Flat = True
                  FooterParams.Color = clWindow
                  IndicatorOptions = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                  object RowDetailData: TRowDetailPanelControlEh
                  end
                end
              end
              object GroupBox5: TGroupBox
                Left = 0
                Top = 281
                Width = 604
                Height = 274
                Align = alClient
                Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1103' '#1085#1072' '#1076#1088#1091#1075#1080#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object dbgeAdditionalSpec: TDBGridEh
                  Left = 2
                  Top = 15
                  Width = 600
                  Height = 257
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = dmAbiturientAction.dsAbitOtherlSpec
                  DynProps = <>
                  Enabled = False
                  Flat = True
                  FooterParams.Color = clWindow
                  IndicatorOptions = []
                  Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                  OnCellClick = dbgeListsCellClick
                  object RowDetailData: TRowDetailPanelControlEh
                  end
                end
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          TabVisible = False
          ExplicitWidth = 612
          inherited DBGridEh1: TDBGridEh
            Width = 612
          end
          inherited Panel11: TPanel
            Width = 612
            ExplicitWidth = 612
          end
        end
        inherited tsBRSBalls: TTabSheet
          TabVisible = False
          ExplicitWidth = 612
          inherited Panel10: TPanel
            Width = 612
            ExplicitWidth = 612
          end
          inherited dbgeBalls: TDBGridEh
            Width = 612
          end
        end
        inherited TabSheet9: TTabSheet
          TabVisible = False
          ExplicitWidth = 612
          inherited Panel12: TPanel
            Width = 612
            ExplicitWidth = 612
          end
          inherited dbgrNapr: TDBGridEh
            Width = 612
          end
        end
        inherited tsUspevStat: TTabSheet
          ParentFont = False
          TabVisible = False
          ExplicitWidth = 612
          inherited dbgUspevStat: TDBGridEh
            Width = 612
          end
        end
        inherited tbMagazine: TTabSheet
          TabVisible = False
          ExplicitWidth = 612
          inherited panelMagaz: TPanel
            Width = 612
            ParentFont = False
            ExplicitWidth = 612
          end
          inherited dbgehMagazineDocsStud: TDBGridEh
            Width = 612
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
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Width = 624
    ExplicitWidth = 624
    inherited bbSave: TBitBtn
      Left = 441
      ExplicitLeft = 441
    end
    inherited bbUndo: TBitBtn
      Left = 273
      ExplicitLeft = 273
    end
  end
  inherited ilPages: TImageList
    Bitmap = {
      494C010106000900880010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7EF006B5142006349
      3900634931006B49390073614A006B5139006349310063493100634931006349
      310063493100B5B6B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDC7CE0021303900B5BEC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA69C00F7EFEF00E7DF
      D600E7CFC600DEC7BD008C8EB500D6BEB500DEB6A500D6B6A500D6AE9C00D6AE
      9400CE9E8C006349310000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDC7
      CE00314963003971BD0029496300BDC7CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFF7EF00F7EF
      EF00F7EFE7003151BD001038B5006B79C600E7D7CE00EFD7C600E7CFBD00E7C7
      B500D6AE94006349310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDC7CE003149
      6B003179D600429EE70052B6EF004A6173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFF7EF00D6D7
      E7002949C6002951EF002149E7001038B5009C96C600EFD7C600EFCFC600E7C7
      B500D6AE940063493100000000000000000073868C006B798400636973005259
      630042495200313842002930390042494A00525152004A494A0052515A004271
      940042A6E70063C7FF00738EA500D6DFDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AE9C00FFF7F7001841
      BD002951F7006386FF005271F7003961EF002138B500D6C7C600EFD7CE00E7CF
      BD00D6AE9C0063493100000000000000000073869400A5DFF70073CFEF004ABE
      E70031AEDE00319EC6006B868400B5AE9C00D6C7B500CEAE9C007B716B005259
      52005A96AD006B9EB50042515A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AEA500FFFFF70084A6
      FF007B96FF007B8EF700D6D7E7007B96F7004261E7003951AD00EFD7CE00EFD7
      CE00D6B6A5006349390000000000000000007B8E9400ADEFF70094E7FF0084DF
      FF0073D7FF007BA6AD00BDBEB500FFEFE700FFE7DE00F7DFC600F7CFB5007B71
      6B0039718C004A799C0021202900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB6A500FFFFFF00E7E7
      FF00BDC7F700F7EFEF00F7EFE700E7DFE7007B96F7002951DE005261AD00EFDF
      D600DEC7B5007359420000000000000000007B8E9C00B5EFF7009CEFFF0094E7
      FF0084DFFF008C968C00EFEFE700FFF7F700FFEFEF00FFE7DE00F7DFCE00CEAE
      9C004A5963001079AD0029303900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00F7EFE700EFE7E700738EF7002149D6008C96
      BD00E7CFC60084695A00000000000000000084969C00B5EFFF00ADEFFF009CEF
      FF008CE7FF00949E9400EFEFE700FFFFFF00FFF7F700FFF7EF00FFE7DE00DEC7
      B50052616B001086B50039414A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEBEAD00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7F700F7EFEF00EFE7E700F7EFE7007B96EF002149
      D6009C96BD00A58E7B00000000000000000084969C00BDF7FF00ADF7F700A5EF
      FF009CE7FF0094BEBD00C6BEBD00FFFFFF00FFFFFF00FFF7F700FFEFE700AD9E
      94004A869C00088EBD004A515A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF007B9EAD00638E94006386940063798C005A7184006B868C0094A6AD008CA6
      EF002949D600AD968C000000000000000000849EA500BDF7FF00B5EFFF00B5EF
      FF00A5EFFF0094E7F700A5B6B500C6C7BD00EFEFE700EFEFE700B5AEA5006B86
      8C0039A6DE00088EC60052616B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF0084AEB50094D7E70094E7F7007BD7EF0063C7DE00529EB5006B868C00F7E7
      DE00E7D7CE00A5968C0000000000000000008C9EA500BDF7FF00B5EFFF00B5EF
      FF00ADF7F700A5EFFF0094E7F70094BEC600949E94008C96940073A6B50052B6
      DE004ABEEF00189ECE0063717B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEC7B500FFFFFF00FFFF
      FF00F7FFFF0084A6B500A5AEA5009C8E84007BC7D6004A697B00F7EFEF00EFE7
      DE00F7E7DE008471630000000000000000008CA6AD00BDF7FF00BDF7FF00BDF7
      FF00BDF7FF00B5F7FF00ADEFFF00A5EFFF0094E7FF008CDFFF007BDFFF0073D7
      FF006BCFF7005AC7F70063717B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700DEC7B500D6BE
      AD00D6BEAD0073A6B500A5E7EF009CE7F7008CD7E70042617300C6AE9C00BDAE
      9C00BDA69400E7E7EF0000000000000000008CA6AD008CA6AD008CA6AD008CA6
      AD008CA6AD008C9EAD008C9EA5008C9EA500849EA500849EA5008496A5008496
      A5008496A5008496A500CED7D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084B6C6007BA6B5006B96A50000000000000000000000
      0000000000000000000000000000000000008CA6AD00B5E7EF00B5EFFF00B5EF
      FF00ADEFF70094E7F7008CA6AD00C6D7D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7F7F7008CA6AD008CA6AD008CA6
      AD008CA6AD008CA6AD00DEE7EF00000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFFFFFF000000008003FFF100000000
      8003FFE0000000008003FFC00000000080030000000000008003000100000000
      8003000100000000800300010000000080030001000000008003000100000000
      8003000100000000800300010000000080030001000000008003000100000000
      FC7F00FF00000000FFFF01FF00000000F807FFFFFFFFC001C003FFF8FFFF0001
      C003FFF0007F0001C003FFE000000001C003FFC100008001C007E0030000C001
      C00FC0078001C001F00F800F0003C001F007800F0001C001F007800F0001C001
      F007800F0001C001F007800F0001C001F007800F0001C001F007800F8101C001
      F807C01FFF83C003F80FE03FFFFFC00700000000000000000000000000000000
      000000000000}
  end
  inherited alAct: TActionList
    object ActZachislZayavl: TAction
      Category = 'Abit'
      Caption = #1042#1099#1074#1086#1076' '#1079#1072#1103#1074#1083#1077#1085#1080#1103' '#1085#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1077
      OnExecute = ActZachislZayavlExecute
    end
  end
  inherited ppmSpravToExcel: TPopupMenu
    Left = 420
    inherited MenuItem3: TMenuItem
      Visible = False
    end
    object N4: TMenuItem
      Action = frmMain.actListToExcel
    end
    object N3: TMenuItem
      Action = ActZachislZayavl
      Caption = #1042#1099#1076#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1077
    end
  end
  inherited ilMain: TImageList
    Bitmap = {
      494C0101110040005C0210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  inherited adoSelDocFiles: TADODataSet
    Left = 568
  end
end
