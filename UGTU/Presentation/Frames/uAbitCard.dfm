inherited fmAbitCard: TfmAbitCard
  Width = 569
  HelpKeyword = 'A_Abit_frame.htm'
  ExplicitWidth = 569
  inherited ToolBar1: TToolBar
    Width = 569
    ExplicitWidth = 569
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
    inherited ToolButton12: TToolButton
      Visible = False
    end
    object ToolButton15: TToolButton
      Left = 337
      Top = 0
      Action = frmMain.actGazpromStatement
    end
  end
  inherited Panel1: TPanel
    Width = 569
    ExplicitWidth = 569
    inherited ScrollBox1: TScrollBox
      Width = 565
      ExplicitWidth = 565
      inherited PageControl1: TPageControl
        Width = 565
        ExplicitWidth = 565
        inherited TabSheet1: TTabSheet
          ExplicitWidth = 557
          inherited PageControl2: TPageControl
            Width = 557
            ParentFont = False
            ExplicitWidth = 557
            inherited TabSheet3: TTabSheet
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 549
              ExplicitHeight = 0
              inherited Panel4: TPanel
                Width = 549
                ExplicitWidth = 549
                inherited Panel8: TPanel
                  Width = 547
                  Height = 215
                  ExplicitWidth = 547
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
                    Left = 299
                    Top = 4
                    ExplicitLeft = 299
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
                    Width = 279
                    ExplicitLeft = 14
                    ExplicitWidth = 279
                  end
                  inherited dbcbeCat: TDBLookupComboboxEh
                    Visible = False
                  end
                  inherited eYearFinished: TDBNumberEditEh
                    Left = 299
                    Top = 19
                    Width = 123
                    ExplicitLeft = 299
                    ExplicitTop = 19
                    ExplicitWidth = 123
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
                  Width = 547
                  ExplicitWidth = 547
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
                  Width = 547
                  Height = 166
                  ExplicitTop = 388
                  ExplicitWidth = 547
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
                    Left = 511
                    ExplicitLeft = 511
                  end
                  inherited sbRemoveAddress: TSpeedButton
                    Left = 511
                    ExplicitLeft = 511
                  end
                  inherited SpeedButton2: TSpeedButton
                    Left = 511
                    ExplicitLeft = 511
                  end
                  inherited SpeedButton3: TSpeedButton
                    Left = 130
                    Top = 7
                    ExplicitLeft = 130
                    ExplicitTop = 7
                  end
                  inherited dbgeAddress: TDBGridEh
                    Width = 491
                    Height = 124
                    RowHeight = 0
                  end
                end
              end
            end
            inherited TabSheet4: TTabSheet
              ExplicitWidth = 549
              inherited Panel3: TPanel
                Width = 549
                ExplicitWidth = 549
                inherited Panel5: TPanel
                  Width = 547
                  ExplicitWidth = 547
                  inherited Label27: TLabel
                    Top = 47
                    ExplicitTop = 47
                  end
                  inherited dbcbeCitizenship: TDBLookupComboboxEh
                    Top = 24
                    Width = 510
                    ExplicitTop = 24
                    ExplicitWidth = 510
                  end
                  inherited eBirthPlace: TDBEditEh
                    Width = 512
                    ExplicitWidth = 512
                  end
                end
                inherited Panel2: TPanel
                  Width = 547
                  ExplicitWidth = 547
                  inherited Label30: TLabel
                    Top = 104
                    ExplicitTop = 104
                  end
                  inherited Label34: TLabel
                    Left = 195
                    Top = 144
                    ExplicitLeft = 195
                    ExplicitTop = 144
                  end
                  inherited Label43: TLabel
                    Top = 104
                    ExplicitTop = 104
                  end
                  inherited Label57: TLabel
                    Top = 203
                    ExplicitTop = 203
                  end
                  inherited Label56: TLabel
                    Left = 68
                    Top = 203
                    ExplicitLeft = 68
                    ExplicitTop = 203
                  end
                  inherited Label55: TLabel
                    Top = 183
                    ExplicitTop = 183
                  end
                  inherited Label54: TLabel
                    Top = 144
                    ExplicitTop = 144
                  end
                  inherited Label59: TLabel
                    Left = 239
                    ExplicitLeft = 239
                  end
                  object Label61: TLabel [12]
                    Left = 17
                    Top = 224
                    Width = 38
                    Height = 13
                    Caption = #1051#1100#1075#1086#1090#1099
                  end
                  inherited cbChildren: TCheckBox
                    Top = 32
                    ExplicitTop = 32
                  end
                  inherited cbInvalid: TCheckBox
                    Top = 48
                    ExplicitTop = 48
                  end
                  inherited cbAppNeed: TCheckBox
                    Top = 64
                    ExplicitTop = 64
                  end
                  inherited dbcbeSocWork: TDBLookupComboboxEh
                    Top = 120
                    ExplicitTop = 120
                  end
                  inherited dbcbeMilitaryState: TDBLookupComboboxEh
                    Top = 120
                    Width = 333
                    ExplicitTop = 120
                    ExplicitWidth = 333
                  end
                  inherited eAddInfo: TMemo
                    Top = 163
                    Width = 333
                    Height = 59
                    ExplicitTop = 163
                    ExplicitWidth = 333
                    ExplicitHeight = 59
                  end
                  inherited eDuty: TDBEditEh
                    Top = 161
                    ExplicitTop = 161
                  end
                  inherited eXpyear: TDBNumberEditEh
                    Top = 200
                    ExplicitTop = 200
                  end
                  inherited eXpMonth: TDBNumberEditEh
                    Top = 200
                    ExplicitTop = 200
                  end
                  object eBenefits: TDBEditEh
                    Left = 17
                    Top = 240
                    Width = 512
                    Height = 19
                    Alignment = taLeftJustify
                    DynProps = <>
                    EditButtons = <>
                    Flat = True
                    TabOrder = 14
                    Visible = True
                    OnChange = eFamChange
                  end
                end
              end
            end
            inherited TabSheet5: TTabSheet
              ExplicitWidth = 549
              inherited Splitter1: TSplitter
                Width = 549
                ExplicitWidth = 551
              end
              inherited Panel9: TPanel
                Width = 549
                ExplicitWidth = 549
                inherited dbcbeFamState: TDBLookupComboboxEh
                  Top = 2
                  ExplicitTop = 2
                end
              end
              inherited dbgeFam: TDBGridEh
                Width = 549
                OnColExit = dbgeFamColExit
              end
              inherited dbgeChangeFam: TDBGridEh
                Width = 549
              end
            end
            inherited TabSheet6: TTabSheet
              ExplicitWidth = 549
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
                Width = 498
                OnColExit = dbgeFamExit
              end
              inherited pnlToolDoc: TPanel
                Left = 498
              end
            end
            inherited TabSheet7: TTabSheet
              TabVisible = False
              ExplicitWidth = 549
              inherited gbExiled: TGroupBox
                Width = 549
                ExplicitWidth = 549
                inherited DBGridEh5: TDBGridEh
                  Width = 545
                end
              end
              inherited gbAcadem: TGroupBox
                Width = 549
                ExplicitWidth = 549
                inherited dbgeAcadem: TDBGridEh
                  Width = 545
                end
              end
              inherited gbEntered: TGroupBox
                Width = 549
                ExplicitWidth = 549
                inherited DBGridEh3: TDBGridEh
                  Width = 545
                end
              end
              inherited gbProlongued: TGroupBox
                Width = 549
                ExplicitWidth = 549
                inherited DBGridEh6: TDBGridEh
                  Width = 545
                end
              end
              inherited gbCatChange: TGroupBox
                Width = 549
                ExplicitWidth = 549
                inherited DBGridEh2: TDBGridEh
                  Width = 545
                end
              end
              inherited gbMoved: TGroupBox
                Width = 549
                ExplicitWidth = 549
                inherited DBGridEh4: TDBGridEh
                  Width = 545
                end
              end
            end
            object TabSheet8: TTabSheet
              Caption = #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077
              ImageIndex = 5
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object GroupBox2: TGroupBox
                Left = 0
                Top = 0
                Width = 549
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
                  Width = 545
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
                Width = 549
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
                  Width = 545
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
          ExplicitWidth = 557
          inherited DBGridEh1: TDBGridEh
            Width = 557
          end
          inherited Panel11: TPanel
            Width = 557
            ExplicitWidth = 557
          end
        end
        inherited tsBRSBalls: TTabSheet
          TabVisible = False
          ExplicitWidth = 557
          inherited Panel10: TPanel
            Width = 557
            ExplicitWidth = 557
          end
          inherited dbgeBalls: TDBGridEh
            Width = 557
          end
        end
        inherited TabSheet9: TTabSheet
          TabVisible = False
          ExplicitWidth = 557
          inherited Panel12: TPanel
            Width = 557
            ExplicitWidth = 557
          end
          inherited dbgrNapr: TDBGridEh
            Width = 557
          end
        end
        inherited tsUspevStat: TTabSheet
          TabVisible = False
          ExplicitWidth = 557
          inherited dbgUspevStat: TDBGridEh
            Width = 557
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Width = 569
    ExplicitWidth = 569
    inherited bbSave: TBitBtn
      Left = 386
      ExplicitLeft = 386
    end
    inherited bbUndo: TBitBtn
      Left = 218
      ExplicitLeft = 218
    end
  end
  inherited ilPages: TImageList
    Bitmap = {
      494C010106000900500010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  inherited ppmSpravToExcel: TPopupMenu
    Left = 420
  end
end
