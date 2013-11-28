inherited fmSpec: TfmSpec
  Width = 711
  Height = 710
  ExplicitWidth = 711
  ExplicitHeight = 710
  inherited Panel1: TPanel
    Width = 711
    Height = 710
    ExplicitWidth = 673
    ExplicitHeight = 702
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 707
      Height = 706
      ActivePage = TabSheet1
      Align = alClient
      Images = frmMain.ImageList1
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PageControl1Change
      object tsGroups: TTabSheet
        Caption = #1057#1087#1080#1089#1086#1082' '#1075#1088#1091#1087#1087
        ImageIndex = 38
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 661
        ExplicitHeight = 666
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 22
          Width = 699
          Height = 652
          Align = alClient
          AutoFitColWidths = True
          DataSource = DataSource1
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          SortLocal = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGridEh1DblClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'Cname_grup'
              Footers = <>
              ToolTips = True
            end
            item
              EditButtons = <>
              FieldName = 'Ik_grup'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'nYear_post'
              Footers = <>
              ToolTips = True
            end
            item
              EditButtons = <>
              FieldName = 'DateCreate'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'DateExit'
              Footers = <>
              Visible = False
            end>
        end
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 699
          Height = 22
          Caption = 'ToolBar1'
          Images = ImageList1
          TabOrder = 1
          ExplicitWidth = 661
          object ToolButton1: TToolButton
            Left = 0
            Top = 0
            Action = actAddGroup
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton2: TToolButton
            Left = 23
            Top = 0
            Action = actEdtGroup
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton8: TToolButton
            Left = 46
            Top = 0
            Action = actDelGroup
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton6: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 4
            Style = tbsSeparator
          end
          object ToolButton7: TToolButton
            Left = 77
            Top = 0
            Hint = #1052#1077#1085#1077#1076#1078#1077#1088' '#1075#1088#1091#1087#1087
            Caption = #1052#1077#1085#1077#1076#1078#1077#1088' '#1075#1088#1091#1087#1087
            ImageIndex = 10
            ParentShowHint = False
            ShowHint = True
            OnClick = ToolButton7Click
          end
        end
      end
      object tsSpclz: TTabSheet
        Caption = #1057#1087#1080#1089#1086#1082' '#1089#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1081
        ImageIndex = 19
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 661
        ExplicitHeight = 666
        object dbgSpclz: TDBGridEh
          Left = 0
          Top = 22
          Width = 699
          Height = 652
          Align = alClient
          AutoFitColWidths = True
          DataSource = dsSpclz
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          SortLocal = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbgSpclzDblClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'cName_spclz'
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1087#1086#1083#1085#1086#1077')'
              ToolTips = True
            end
            item
              EditButtons = <>
              FieldName = 'cName_spclz_short'
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1089#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077')'
            end
            item
              EditButtons = <>
              FieldName = 'Csh_spclz'
              Footers = <>
              Title.Caption = #1064#1080#1092#1088
              ToolTips = True
            end
            item
              EditButtons = <>
              FieldName = 'iK_spclz'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'ik_spec'
              Footers = <>
              Visible = False
            end>
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 699
          Height = 22
          AutoSize = True
          Caption = 'ToolBar1'
          Images = ImageList1
          TabOrder = 1
          ExplicitWidth = 661
          object ToolButton3: TToolButton
            Left = 0
            Top = 0
            Action = actAddSpclz
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton4: TToolButton
            Left = 23
            Top = 0
            Action = actEditSpclz
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton5: TToolButton
            Left = 46
            Top = 0
            Action = actDelSpclz
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1059#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageIndex = 39
        ParentFont = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 661
        ExplicitHeight = 666
        inline fmUchPlan1: TfmUchPlan
          Left = 0
          Top = 0
          Width = 699
          Height = 672
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 661
          ExplicitHeight = 674
          inherited Panel1: TPanel
            Width = 699
            Height = 672
            ExplicitWidth = 661
            ExplicitHeight = 674
            inherited Panel3: TPanel
              Width = 699
              Height = 650
              ExplicitWidth = 661
              ExplicitHeight = 652
              inherited ScrollBox1: TScrollBox
                Width = 697
                Height = 648
                ExplicitWidth = 659
                ExplicitHeight = 650
                inherited Bevel1: TBevel
                  Width = 694
                  ExplicitWidth = 455
                end
                inherited Bevel2: TBevel
                  Width = 694
                  ExplicitWidth = 455
                end
                inherited Label1: TLabel
                  Height = 13
                  ExplicitHeight = 13
                end
                inherited Label16: TLabel
                  Width = 89
                  Height = 13
                  Font.Height = -11
                  ParentFont = False
                  ExplicitWidth = 89
                  ExplicitHeight = 13
                end
                inherited Label2: TLabel
                  Width = 82
                  Height = 13
                  ExplicitWidth = 82
                  ExplicitHeight = 13
                end
                inherited Label3: TLabel
                  Width = 86
                  Height = 13
                  ExplicitWidth = 86
                  ExplicitHeight = 13
                end
                inherited Bevel6: TBevel
                  Width = 838
                  ExplicitWidth = 838
                end
                inherited Label4: TLabel
                  Width = 95
                  Height = 13
                  ExplicitWidth = 95
                  ExplicitHeight = 13
                end
                inherited Label29: TLabel
                  Width = 47
                  Height = 13
                  ExplicitWidth = 47
                  ExplicitHeight = 13
                end
                inherited Label30: TLabel
                  Width = 56
                  Height = 13
                  ExplicitWidth = 56
                  ExplicitHeight = 13
                end
                inherited Label31: TLabel
                  Width = 66
                  Height = 13
                  ExplicitWidth = 66
                  ExplicitHeight = 13
                end
                inherited Label36: TLabel
                  Width = 101
                  Height = 13
                  ExplicitWidth = 101
                  ExplicitHeight = 13
                end
                inherited Label37: TLabel
                  Width = 114
                  Height = 13
                  ExplicitWidth = 114
                  ExplicitHeight = 13
                end
                inherited Panel2: TPanel
                  Width = 697
                  Height = 444
                  ExplicitWidth = 659
                  ExplicitHeight = 436
                  inherited Splitter1: TSplitter
                    Height = 444
                    ExplicitTop = 0
                    ExplicitHeight = 470
                  end
                  inherited Panel5: TPanel
                    Height = 444
                    ExplicitHeight = 436
                    inherited dbgDisc: TDBGridEh
                      Top = 27
                      Height = 414
                    end
                  end
                  inherited Panel6: TPanel
                    Width = 344
                    Height = 444
                    ExplicitLeft = 353
                    ExplicitWidth = 306
                    ExplicitHeight = 436
                    inherited ScrollBox2: TScrollBox
                      Width = 344
                      Height = 444
                      ExplicitWidth = 306
                      ExplicitHeight = 436
                      inherited sgDisc: TStringGrid
                        Width = 409
                        Height = 143
                        ExplicitWidth = 409
                        ExplicitHeight = 143
                      end
                      inherited Panel7: TPanel
                        inherited Label12: TLabel
                          Width = 131
                          Height = 13
                          ExplicitWidth = 131
                          ExplicitHeight = 13
                        end
                        inherited Label13: TLabel
                          Width = 111
                          Height = 13
                          ExplicitWidth = 111
                          ExplicitHeight = 13
                        end
                        inherited Label14: TLabel
                          Width = 122
                          Height = 13
                          ExplicitWidth = 122
                          ExplicitHeight = 13
                        end
                        inherited Label15: TLabel
                          Width = 119
                          Height = 13
                          ExplicitWidth = 119
                          ExplicitHeight = 13
                        end
                        inherited Label19: TLabel
                          Width = 134
                          Height = 13
                          ExplicitWidth = 134
                          ExplicitHeight = 13
                        end
                        inherited Label20: TLabel
                          Width = 24
                          Height = 13
                          ExplicitWidth = 24
                          ExplicitHeight = 13
                        end
                        inherited Label25: TLabel
                          Width = 127
                          Height = 13
                          ExplicitWidth = 127
                          ExplicitHeight = 13
                        end
                        inherited Label32: TLabel
                          Width = 151
                          Height = 13
                          ExplicitWidth = 151
                          ExplicitHeight = 13
                        end
                        inherited Label34: TLabel
                          Width = 71
                          Height = 13
                          ExplicitWidth = 71
                          ExplicitHeight = 13
                        end
                      end
                    end
                  end
                end
                inherited dbcbSpclz: TDBLookupComboboxEh
                  Width = 578
                  Height = 19
                  Visible = False
                  ExplicitWidth = 578
                  ExplicitHeight = 19
                end
                inherited dbcbFormEd: TDBLookupComboboxEh
                  Height = 19
                  ExplicitHeight = 19
                end
                inherited dbcbYear: TDBLookupComboboxEh
                  Height = 19
                  ExplicitHeight = 19
                end
                inherited dbcbCklDisc: TDBLookupComboboxEh
                  Width = 578
                  Height = 19
                  ExplicitWidth = 540
                  ExplicitHeight = 19
                end
                inherited dbcbGrpDisc: TDBLookupComboboxEh
                  Width = 578
                  Height = 19
                  ExplicitWidth = 540
                  ExplicitHeight = 19
                end
                inherited Panel8: TPanel
                  inherited Label27: TLabel
                    Width = 48
                    Height = 13
                    ExplicitWidth = 48
                    ExplicitHeight = 13
                  end
                  inherited dbcbKaf: TDBLookupComboboxEh
                    Height = 19
                    ExplicitHeight = 19
                  end
                end
                inherited cmbxSem: TDBComboBoxEh
                  Height = 19
                  AlwaysShowBorder = True
                  ExplicitHeight = 19
                end
                inherited cmbxVidZan: TDBComboBoxEh
                  Width = 365
                  Height = 19
                  ExplicitWidth = 365
                  ExplicitHeight = 19
                end
              end
              inherited dbcbPdgrpDisc: TDBLookupComboboxEh
                Height = 19
                ExplicitHeight = 19
              end
            end
            inherited Panel4: TPanel
              Width = 699
              ExplicitWidth = 661
              inherited ToolBar1: TToolBar
                Width = 699
                ExplicitWidth = 661
                inherited ToolButton5: TToolButton
                  ExplicitWidth = 23
                end
              end
            end
          end
          inherited pnlSave: TPanel
            Left = 79
            Top = 590
            Width = 460
            ExplicitLeft = 79
            ExplicitTop = 590
            ExplicitWidth = 460
            inherited bbSave: TBitBtn
              Left = 290
              ExplicitLeft = 290
            end
          end
          inherited Panel9: TPanel
            inherited Label28: TLabel
              Width = 166
              Height = 13
              ExplicitWidth = 166
              ExplicitHeight = 13
            end
          end
        end
      end
      object tsAcadem: TTabSheet
        Caption = #1040#1082#1072#1076#1077#1084#1080#1095#1077#1089#1082#1080#1077' '#1086#1090#1087#1091#1089#1082#1072
        ImageIndex = 55
        inline fmAcadem: TfmAcadem
          Left = 0
          Top = 0
          Width = 699
          Height = 672
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 699
          ExplicitHeight = 672
          inherited Panel1: TPanel
            Width = 699
            Height = 635
            ExplicitWidth = 661
            ExplicitHeight = 629
            inherited tbAcadem: TToolBar
              Width = 695
              ExplicitWidth = 657
              inherited tbPrint: TToolButton
                ExplicitWidth = 23
              end
              inherited tbEditAcadem: TToolButton
                Left = 23
                ExplicitLeft = 23
                ExplicitWidth = 23
              end
            end
            inherited dbgeAcadem: TDBGridEh
              Width = 695
              Height = 610
            end
          end
          inherited pnlSave: TPanel
            Top = 635
            Width = 699
            ExplicitTop = 629
            ExplicitWidth = 661
            inherited bbSave: TBitBtn
              Left = 530
              ExplicitLeft = 492
            end
            inherited bbUndo: TBitBtn
              Left = 362
              ExplicitLeft = 324
            end
          end
        end
      end
      object tsAverageBalls: TTabSheet
        Caption = #1057#1088#1077#1076#1085#1080#1077' '#1073#1072#1083#1083#1099
        ImageIndex = 71
        inline fmAverageBallsSpec: TfmAverageBalls
          Left = 0
          Top = 0
          Width = 699
          Height = 672
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 699
          ExplicitHeight = 672
          inherited Panel1: TPanel
            Width = 699
            Height = 635
            ExplicitWidth = 661
            ExplicitHeight = 629
            inherited tbAcadem: TToolBar
              Width = 695
              ExplicitWidth = 657
              inherited tbPrint: TToolButton
                ExplicitWidth = 23
              end
            end
            inherited lvBalls: TListView
              Width = 695
              Height = 578
              ExplicitWidth = 657
              ExplicitHeight = 570
            end
            inherited pnlFilters: TPanel
              Width = 695
              ExplicitWidth = 657
            end
          end
          inherited pnlSave: TPanel
            Top = 635
            Width = 699
            ExplicitTop = 629
            ExplicitWidth = 661
            inherited bbSave: TBitBtn
              Left = 530
              ExplicitLeft = 492
            end
            inherited bbUndo: TBitBtn
              Left = 362
              ExplicitLeft = 324
            end
          end
          inherited ilBalls: TImageList
            Bitmap = {
              494C010102000400180010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      object TabSheet2: TTabSheet
        Caption = #1060#1043#1054#1057
        ImageIndex = 5
        inline fmFgos1: TfmFgos
          Left = 0
          Top = 0
          Width = 699
          Height = 672
          Align = alClient
          Constraints.MinWidth = 648
          TabOrder = 0
          ExplicitWidth = 699
          ExplicitHeight = 672
          inherited Panel1: TPanel
            Width = 699
            Height = 635
            ExplicitWidth = 661
            ExplicitHeight = 629
            inherited Panel2: TPanel
              Width = 695
              ExplicitWidth = 657
            end
            inherited Panel3: TPanel
              Width = 695
              ExplicitWidth = 657
            end
            inherited Panel4: TPanel
              Width = 695
              ExplicitWidth = 657
              inherited dbcbTypeCompetence: TDBLookupComboboxEh
                Width = 563
                ExplicitWidth = 525
              end
            end
            inherited ToolBar1: TToolBar
              Width = 695
              ExplicitWidth = 657
            end
            inherited Panel5: TPanel
              Left = 660
              Height = 402
              ExplicitLeft = 622
              ExplicitHeight = 394
              inherited ToolBar7: TToolBar
                inherited ToolButton11: TToolButton
                  ExplicitWidth = 38
                end
              end
            end
            inherited DBGridEh1: TDBGridEh
              Width = 658
              Height = 402
            end
          end
          inherited pnlSave: TPanel
            Top = 635
            Width = 699
            ExplicitTop = 629
            ExplicitWidth = 661
            inherited bbSave: TBitBtn
              Left = 530
              ExplicitLeft = 492
            end
            inherited bbUndo: TBitBtn
              Left = 362
              ExplicitLeft = 324
            end
          end
          inherited imgFgos: TImageList
            Bitmap = {
              494C010149005100540010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
              0000000000003600000028000000400000003001000001002000000000000030
              0100000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000063493500634935006349350000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000C0A99B0000CCFF00634935000000000000000000AE93
              8400A68D7C009F857400997E6B00000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000C0A99B00C0A99B00C0A99B0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000006349
              3500634935006349350000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000C0A9
              9B00FFFFFF00634935000000000000000000AD948400A78D7C00A08574000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000C0A9
              9B00C0A99B00C0A99B0000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000006349
              3500634935006349350000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000C0A9
              9B0000CCFF00634935000000000000000000AE938400A68D7C009F857400997E
              6B00957A6700957A670000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000C0A9
              9B00C0A99B00C0A99B0000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000006349350063493500634935000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000C0A99B00FFFFFF00634935000000
              000000000000AE938400A68D7C009F857400997E6B0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000C0A99B00C0A99B00C0A99B000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
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
              000000000000000000000000FFFFFF00FFFF000000000000FC7F000000000000
              FC61000000000000FC7F000000000000FFFF000000000000E3FF000000000000
              E31F000000000000E3FF000000000000FFFF000000000000E3FF000000000000
              E303000000000000E3FF000000000000FFFF0000000000001FFF000000000000
              187F0000000000001FFF000000000000FFFFFF81FFFF8007FC018003F0038007
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
          inherited imgCmptnc: TImageList
            Bitmap = {
              494C010103000400240010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
              000000000000000000000000000000000000B39A8A0088705E00836A59007E66
              530079604D00745B4800705642006C523E00684E3900654B3600634833006348
              3300000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000D4CCC7006349
              3500634935006349350063493500634935006349350063493500634935006349
              3500D4CCC7000000000000000000000000000000000000000000D4CCC7006349
              3500634935006349350063493500634935006349350063493500634935006349
              3500D4CCC700000000000000000000000000B69C8F00FFFFFF00FFFFFF00FEFC
              FC00FDF9F700FCF4F000FAEFEA00F9EBE400F8E6DD00F6E1D700F5DCD1006348
              3300000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000B8A49400F4E3
              DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCAB800EAC8
              B500634935000000000000000000000000000000000000000000B8A49400F4E3
              DA00E4CFC200DDC5B700D9BEAC00D8BCA900D7BAA700D7B9A500D6B7A300D6B6
              A20063493500000000000000000000000000BAA09300FFFFFF00FFFFFF00A690
              81009F8A79009A827100937B6B008C746300856D5A00F7E6DD00F6E1D700654A
              3500634833006348330000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000B8A49400F6E8
              E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCA
              B800634935000000000000000000000000000000000000000000B8A49400F6E8
              E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00D6B7
              A30063493500000000000000000000000000BEA69800FFFFFF00FFFFFF00AB95
              860001FFFF005F7EF900CCFFCD00FF9900008A726000F8EAE400F7E5DD00684D
              3800F5DCD1006348330000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000B8A49400F8EC
              E500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCD
              BB00634935000000000000000000000000000000000000000000B8A49400F8EC
              E500F6E8E000F4E3DA00F3DFD40063493500F0D7C900EED3C400EDD0BF00D7B9
              A50063493500000000000000000000000000C2AA9D00FFFFFF00FFFFFF00B09A
              8C00FF990000CCFFCD0033CB670001FFFF008E776500FAF0EB00F8EAE4006B51
              3C00F6E1D700654A350063483300634833000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000B9A59500F9F0
              EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0
              BF00634935000000000000000000000000000000000000000000B9A59500F9F0
              EB00F8ECE500F6E8E000F4E3DA0063493500F1DBCF00F0D7C900EED3C400D7BA
              A70063493500000000000000000000000000C5AFA300FFFFFF00FFFFFF00B4A0
              9100AD988900A69181009F89790099827100937C6A00FCF4F000FBEFEA006E55
              4000F7E5DD00684D3800F5DCD100634833000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BCA69700FBF4
              F000F9F0EB006349350063493500634935006349350063493500F0D7C900EED3
              C400634935000000000000000000000000000000000000000000BCA69700FBF4
              F000F9F0EB006349350063493500634935006349350063493500F0D7C900D8BC
              A90063493500000000000000000000000000C9B4A900FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFB00FEF8F700FCF4F0007358
              4400F8EAE4006B513C00F6E1D700654A35000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BEA89A00FCF7
              F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7
              C900634935000000000000000000000000000000000000000000BEA89A00FCF7
              F500FBF4F000F9F0EB00F8ECE50063493500F4E3DA00F3DFD400F1DBCF00D9BE
              AC0063493500000000000000000000000000CDBAB000C9B4A800C5AEA300C0A9
              9D00BDA39600B89F9100B49B8C00B1978800AD948400AA908000A58B7B00A187
              7500FBEFEA006E554000F7E5DD00684D38000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000C0AB9C00FDFA
              F900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DB
              CF00634935000000000000000000000000000000000000000000C0AB9C00FDFA
              F900FCF7F500FBF4F000F9F0EB0063493500F6E8E000F4E3DA00F3DFD400D9C0
              AF00634935000000000000000000000000000000000000000000C9B4A900FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFB00FEF8
              F700FCF4F00073584400F8EAE4006B513C000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000C3AC9D00FEFD
              FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DF
              D400634935000000000000000000000000000000000000000000C3AC9D00FEFD
              FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00E1CD
              C000634935000000000000000000000000000000000000000000CDBAB000C9B4
              A800C5AEA300C0A99D00BDA39600B89F9100B49B8C00B1978800AD948400AA90
              8000A58B7B00A1877500FBEFEA006E5540000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000C4AE9E00FFFF
              FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
              DA00634935000000000000000000000000000000000000000000C4AE9E00FFFF
              FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
              DA00634935000000000000000000000000000000000000000000000000000000
              0000C9B4A900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FEFCFB00FEF8F700FCF4F000735844000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000EFE8E400C3AD
              9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A39400B8A39400B8A3
              9400D4CCC7000000000000000000000000000000000000000000EFE8E400C3AD
              9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A39400B8A39400B8A3
              9400D4CCC7000000000000000000000000000000000000000000000000000000
              0000CDBAB000C9B4A800C5AEA300C0A99D00BDA39600B89F9100B49B8C00B197
              8800AD948400AA908000A58B7B00A18775000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
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
              000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
              FFFFFFFF000F0000C007C007000F0000C007C00700030000C007C00700030000
              C007C00700000000C007C00700000000C007C00700000000C007C00700000000
              C007C007C0000000C007C007C0000000C007C007F0000000C007C007F0000000
              FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
              000000000000}
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 731
    Width = 472
    Align = alNone
    Visible = False
    ExplicitTop = 731
    ExplicitWidth = 472
    inherited bbSave: TBitBtn
      Left = 306
      Top = 7
      ExplicitLeft = 306
      ExplicitTop = 7
    end
    inherited bbUndo: TBitBtn
      Left = -116
      ExplicitLeft = -116
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 179
    Top = 113
  end
  object actList: TActionList
    Images = ImageList1
    Left = 236
    Top = 156
    object actAddGroup: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 1
      ShortCut = 16449
      OnExecute = actAddGroupExecute
    end
    object actEdtGroup: TAction
      Caption = #1055#1088#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      Hint = #1055#1088#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 2
      ShortCut = 16450
      OnExecute = actEdtGroupExecute
      OnUpdate = actEdtGroupUpdate
    end
    object actDelGroup: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 3
      ShortCut = 16451
      OnExecute = actDelGroupExecute
      OnUpdate = actDelGroupUpdate
    end
    object actAddSpclz: TAction
      Tag = 1
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1102'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1102'...'
      ImageIndex = 8
      SecondaryShortCuts.Strings = (
        'Ctrl+D')
      OnExecute = actAddSpclzExecute
      OnUpdate = actAddSpclzUpdate
    end
    object actEditSpclz: TAction
      Tag = 2
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1102'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1102'...'
      ImageIndex = 7
      OnExecute = actAddSpclzExecute
      OnUpdate = actEditSpclzUpdate
    end
    object actDelSpclz: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1102
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1102
      ImageIndex = 9
      OnExecute = actDelSpclzExecute
      OnUpdate = actEditSpclzUpdate
    end
  end
  object ImageList1: TImageList
    Left = 265
    Top = 221
    Bitmap = {
      494C01010B000E00140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000009B9C93FF363733FF2E2E2BFF2E2E
      2BFF32322FFF282823FF00000000363632FF2C2C2AFF30312DFF979794FF0000
      00002C2C2AFF2C2C27FF31312DFF252621FF9B9C93FF31322EFF292926FF2929
      26FF2E2E2AFF181813FF0000000031312DFF282825FF282925FF979794FF0000
      0000282826FF272722FF2D2D29FF13140FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8E7FFFFFFFFFFFFFFFF9FFFFFE
      F6FFFFFFFFFF515247FF7D7F74FFFFFFFFFFFFFBF3FFB8BBB0FF2E2F29FF8285
      79FFF3E8DBFFEDE2D4FFFFF7ECFF8B8B7BFF8B8D7EFFFFFFFFFFFFFFF9FFFFFE
      F6FFFFFFFFFF505146FF7D7F74FFFFFFFFFFFFFBF3FFB8BBB0FF2C2E27FF8285
      79FFF3E8DBFFEDE2D4FFFFF7ECFF8B8B7BFF0000000000000000000000000000
      000000000000000000000000000000290000004200000863080008630800218C
      2100188C1800107B100008630800003100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000088897DFFFFFFFFFFF7EDE5FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FFF7EDE5FFF7EDE5FFF7EDE5FFF7EDE5FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FF828071FF87887CFFFFFFFFFFF7EDE5FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FFF7EDE5FFF7EDE5FFF7EDE5FFF7EDE5FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FF828070FF0000000000000000000000000000
      0000000000000000000000630000219C210052C65200399C39002184210063C6
      630063CE630039BD390031B53100107B10000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086877BFFFFFFFFFFEADDD5FFC5B1
      9BFFC6B3A4FFC6B3A4FFC4B3A2FFE6DCD4FFF7EDE5FFF7EDE5FFF7EDE5FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FF827F71FF85867AFFFFFFFFFFEADDD5FFC5B0
      9AFFC6B3A4FFC6B3A4FFC5B4A3FFE6DCD4FFF7EDE5FFF7EDE5FFF7EDE5FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FF827E70FF0000000000000000000000000000
      00000000000000000000188C18005AC65A0063CE630039943900DEEFCE00429C
      39006BCE6B0063CE630039B53900086B08000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086887CFFFFFBFAFFC4AF99FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD2BCB0FFF7EDE5FFF7EDE5FFF7EDE5FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FF827F71FF85877BFFFFFBFAFFC4AF99FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD2BCB0FFF7EDE5FFF7EDE5FFF7EDE5FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FF827E70FF0000000000000000000000000000
      000000000000000000002184210063CE630084DE8400639C5A00FFFFFF008CBD
      8C005AB55A0063CE630042AD4200004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086887CFFFFF7F4FFBCA48CFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD8C3B8FFF7EDE5FFC6B3A4FFC6B3A4FFC6B3
      A4FFC6B3A4FFC6B3A4FFF5E9E0FF838072FF85877BFFFFF7F4FFBBA38AFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD8C3B8FFF7EDE5FFC6B3A4FFC6B3A4FFC6B3
      A4FFC6B3A4FFC6B3A4FFF5E9E0FF838071FF0000000000000000CECEC6000000
      000000000000000000000063000042A542009CE79C0084AD6B00BDCECE009CBD
      C6003984420042A54200005A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086887CFFFFF7F6FFC4B29DFFFEFF
      FFFFD5F2FEFFFEFFFFFFFFFFFFFFD8C4BAFFF7EDE5FFD2C2B5FFD4C6B8FFD4C6
      B8FFD4C6B8FFD3C4B6FFF7EDE5FF828273FF85877BFFFFF7F6FFC4B19CFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD8C4BAFFF7EDE5FFD2C2B5FFD4C6B8FFD4C6
      B8FFD4C6B8FFD3C4B6FFF7EDE5FF828273FF00000000CECEC6009C4A29000000
      000000000000000000000000000000630000217B2900006B8400107BC600107B
      C6000873AD00004A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086887CFFFEF9F6FFC8BCABFFEBFF
      FFFF51ABE8FFEBFFFFFFFBFFFFFFD6C4B9FFF7EDE5FFD1C1B2FFD4C4B7FFD4C4
      B7FFD4C6B7FFD3C4B6FFFAF1E9FF838274FF85877BFFFFF9F6FFC8B8A6FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD7C4B9FF676666FF68635FFFD4C4B7FFD4C4
      B7FFD4C6B7FFD3C4B6FF74726FFF636362FFCECEC600E7845A00F78C5A00DE7B
      4A00CE734200AD5A3100AD5A310000000000005A8400298CEF00319CFF00319C
      FF00319CFF00107BC60000101800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086887CFF8BC4EAFF7DBDE9FF8FC1
      D0FF3590D1FF8FC1D0FF6DADD7FF82B5D9FFF7EDE5FFC6B3A4FFC6B3A4FFC6B3
      A4FFC6B3A4FFC6B3A4FFFBF4EDFF838375FF85877BFFFFFCFBFFEADDD5FFC6B3
      A4FFC6B3A4FFC6B3A4FFB2A695FFEADDD5FF5A5A5AFF626262FF595959FF9999
      99FF9F9F9FFF575757FF515151FF585855FFE7946B00FFB58C00FF9C6B00EF84
      5200DE7B4A00CE734200C66B420000000000187BC60039A5FF0042A5FF0042A5
      FF0039A5FF00319CFF00004A7300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000858679FF94CAF4FF1FB7F9FF2C98
      D9FF23D5F1FF2E9BD9FF1EB6F9FF8CBDE4FFFFFFFEFFFDFBF6FFFAF7F4FFF7F5
      F2FFF5F2ECFFF3ECE5FFFEFAF4FF898A7EFF848577FFFFFFFFFFEADDD5FFEADD
      D5FFEADDD5FFEADDD5FFEADDD5FFEADDD5FFFFFFFEFF737373FF636363FF7A7A
      7AFF747474FF5E5E5EFF6B6B6BFF88897DFFDED6C600FFC6A500FFB58C00FFAD
      7B00EFA57B00E79C7300E79C730000000000218CCE0042ADFF004AB5FF004AB5
      FF004AADFF0042ADFF00187BBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000829DA0FF99D1EBFF2E99D8FF8DE2
      F6FFAFF3FFFF8DE2F6FF2E99D8FF9AD2EBFF9EBDC3FFA8B3ADFF9BA5A0FF989E
      99FF9D9F97FFA1A298FFAEB2A7FF707165FF878A82FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B8AFFFACAFA6FF676767FF6868
      68FF686868FF6B6B6BFFB0B3A8FF616355FF00000000DED6CE00E79C73000000
      000000000000000000000000000000000000218CCE0052B5FF0052BDFF0052BD
      FF0052B5FF004AB5FF00218CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004EA3DFFF398DCCFF21D0EFFF9DF2
      FFFFECF8FFFF9DF2FFFF21D0EFFF358BCDFF469FE0FF00000000000000000000
      000000000000000000000000000000000000D8DBD1FF919388FF919388FF9193
      88FF919388FF919388FF919388FF919388FFD8DBD1FF00000000636363FF5B5B
      5BFF5E5E5EFF646464FF00000000000000000000000000000000DED6CE000000
      0000000000000000000000000000000000002184BD00319CD6002994C60039A5
      DE004AB5FF0042ADF7002184B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5FBFEFFBAE0F1FF319BDAFF7BDC
      F4FF8BF1FFFF7BDCF4FF38A0DAFF97CAF1FF9ABFE5FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C5C5CFF676767FF6868
      68FF696969FF686868FF696969FF000000000000000000000000000000000000
      00000000000000000000000000000000000000639400318CBD0052A5D60073B5
      DE005AA5C600398CB500086B9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000085BFEFFF24B7FAFF389C
      D8FF20CBEDFF389CD8FF26B9F9FF7EB6F2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000757575FF686868FF656565FF0000
      0000000000006E6E6EFF686868FF5E5E5EFF0000000000000000000000000000
      000000000000000000000000000000000000006394002184B50084C6E70094CE
      EF008CC6E700298CBD00004A6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098C8ECFF93C0F1FFBBDF
      F1FF3891D0FFBBDFF1FF93C0F1FF99C9ECFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000676767FF6E6E6EFF000000000000
      000000000000000000006E6E6EFF656565FF0000000000000000000000000000
      00000000000000000000000000000000000000000000006394001873A5004294
      BD001873A50000527B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFEFF0000000000000000EFF7
      FDFF5CAEEBFFEFF7FDFF0000000000000000FEFEFEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B7A2930060463200654B3700634935006349
      3500634935006349350063493500684E3A000000000000000000000000000000
      0000000000000000000000000000B7A2930060463200654B3700634935006349
      3500634935006349350063493500684E3A009B9C93FF545552FF4B4B48FF4B4B
      48FF4E4E4BFF5B5B57FF0000000052524FFF484846FF555653FF979794FF0000
      0000494947FF494945FF4C4C48FF5B5C58FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDA89900FCFEFC00ECEBE900EAE6E000E8DB
      D200E7D5C900E7D1C100D7C2B3006A513D000000000000000000000000000000
      0000000000000000000000000000BDA89900FCFEFC00ECEBE900EAE6E000E8DB
      D200E7D5C900E7D1C100D7C2B3006A513D0096988AFFFFFFFFFFFFFFF9FFFFFE
      F6FFFFFFFFFF5B5C52FF828479FFFFFFFFFFFFFBF3FFB9BCB1FF41423CFF8285
      79FFF3E8DBFFEDE2D4FFFFF7ECFF939384FFB7A2930060463200634935006349
      350063493500634935006349350063493500634935006349350063493500684E
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6B0A100FCFEFC00DBCAC000DAC8BD00FBFA
      F700D3BCAF00D2BAAC00DFD0C4006C533F000000000000000000000000000000
      0000000000000000000000000000C6B0A100FCFEFC00DBCAC000DAC8BD00FBFA
      F700D3BCAF00D2BAAC00DFD0C4006C533F00939489FFFFFFFFFFF7EDE5FFF1E7
      E0FFE7DDD6FFE8DED7FFF0E6DFFFF5EBE3FFF7EDE5FFF7EDE5FFF7EDE5FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FF8B897BFFBDA89900FCFEFC00E7E6E400E7E2
      DC00E6DCD400E5D6CB00E4CFC100E3CAB800E3C5B100E2C2AC00C7AA9800684E
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCB6A700FCFEFC00FCFEFC00FCFEFC00FCFE
      FC00FBFAF700FBF4EE00E3D5CC006C533F000000000000000000000000000000
      0000000000000000000000000000CCB6A700FCFEFC00FCFEFC00FCFEFC00FCFE
      FC00FBFAF700FBF4EE00E3D5CC006C533F00919287FFFFFFFFFFEADDD5FFC3B4
      A2FFA19185FF9B8C80FFAD9F91FFD8CFC8FFF3E9E1FFF7EDE5FFF7EDE5FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FF8B887BFFC6B0A100FCFEFC00D8C4B900D6C0
      B500D3BCAF00FAEFE600CFB3A500CCAF9F00CCAF9F00F6DBC800C7AA9800684E
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCB6A700FCFEFC00DBCAC000DBCAC000FCFE
      FC00D8C4B900D9C4B900E7DDD5006C533F000000000000000000000000000000
      0000000000000000000000000000CCB6A700FCFEFC00DBCAC000DBCAC000FCFE
      FC00D8C4B900D9C4B900E7DDD5006C533F00919388FFFFFBFAFFC4AF99FF213C
      58FF49627BFF828C99FFB3B3B3FFA9978DFFE0D7CFFFEFE6DEFFF6ECE4FFF7ED
      E5FFF7EDE5FFF7EDE5FFF7EDE5FF8B887BFFCCB6A700FCFEFC00FCFEFC00FCFE
      FC00FBFAF700FBF5EF0075716E005754510000000000D2C2B500CBB2A100684E
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCB6A700FCFEFC00FCFEFC00FCFEFC00FCFE
      FC00FCFEFC00FBFAF700F7E8DF006A503C000000000000000000000000000000
      0000000000000000000000000000CCB6A700FCFEFC00FCFEFC00FCFEFC00FCFE
      FC00FCFEFC00FBFAF700F7E8DF006A503C00919388FFFFF7F4FFC3AE98FF5C71
      8AFF385B7CFF396798FF576D84FF867C79FFBCB4AEFFAD9D8FFFBEAC9EFFC4B2
      A3FFC6B3A4FFC6B3A4FFF5E9E0FF8C897CFFCCB6A700FCFEFC00DBCAC000DAC8
      BD00D8C4B900FBFAF700A39D9800FDFEFE005193A9000E121600B8B1A8007860
      4D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EBAC8D00EAAA8C00EAA98900E9A27E00E68F
      6300E5855500E37B4700E3733900CC6430000000000000000000000000000000
      0000000000000000000000000000EBAC8D00EAAA8C00EAA98900E9A27E00E68F
      6300E5855500E37B4700E3733900CC643000919388FFFFF7F6FFCAB9A6FFC0CA
      D6FF3A6C9CFF8FC0F3FF427CAEFF2B4C6EFF82858AFF9A8E85FFB7AB9FFFCCBE
      B1FFD3C5B7FFD3C4B6FFF7EDE5FF8B8B7DFFCCB6A700FCFEFC00FCFEFC00FCFE
      FC00FCFEFC00FCFEFC00A39D980088B7C70074CEE200499AB2000E1216007C72
      6600E5D6CB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EBAC8D00FFC3A200FEBF9D00FCBB9800FAB0
      8B00F9AB8300F8A67C00F5976800D26C38000000000000000000000000000000
      0000000000000000000000000000EBAC8D00FFC3A200FEBF9D00FCBB9800FAB0
      8B00F9AB8300F8A67C00F5976800D26C3800919388FFFFF9F6FFCEC0B0FFF6F8
      FAFF879DB5FF457DAFFF569CCFFF297DAFFF295B84FF696B6FFF9B8F85FFB7A9
      9EFFCCBEB0FFD2C3B5FFFAF1E9FF8C8B7EFFCCB6A700FCFEFC00DBCAC000DBCA
      C000DBCAC000FCFEFC00C1B9B4004D9CB3008CE0EE0062BFD700499AB2000E12
      16002D6275000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EBAC8D00EAAA8B00EAAA8B00EAA88900E89C
      7700E7946B00E68C6000E3774000E2723900000000000000000010708800125C
      6D00114A5D001244560000000000EBAC8D00EAAA8B00EAAA8B00EAA88900E89C
      7700E7946B00E68C6000E3774000E2723900919388FFFFFCFBFFEADDD5FFC6B3
      A4FFBFAEA2FF395A7BFF297DAFFF5CC2F3FF3D9ACAFF24547CFF656568FF9183
      78FFAB9A8DFFBEAC9EFFFAF3ECFF8C8C7FFFCCB6A700FCFEFC00FCFEFC00FCFE
      FC00FCFEFC00FCFEFC00FBF8F300D5CEC80057A0B5008CE0EE0062BFD700499A
      B2000E1216002D62750000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000021889A0048D7
      EC0020B8D3000C242A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000909185FFFFFFFFFFEADDD5FFEADD
      D5FFEADDD5FFBEBCBFFF396890FF3C9ACAFF73D1F8FF439ECAFF2B5C85FF7B85
      8EFFB4B1ADFFD2CCC6FFF4F0EAFF929389FFEBAC8D00EAAA8C00EAA98900E9A2
      7E00E8997100E68F6300E5875800E6926500CDA9950065A6B7008CE0EE0062BF
      D700499AB2000E1216002855660000000000139AC6001E98B6001E98B6001E98
      B6001E98B6000F5267000D313E000E3C4F000000000000000000000000000000
      000000000000000000000000000000000000139AC6001E98B6001E92AD0065E7
      F7003DD4EE000F5267000D313E000E3C4F000000000000000000000000000000
      00000000000000000000000000000000000095958CFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC6D1DCFF3D6D96FF439ECAFF83DBF8FF469EC7FF2557
      7CFF586269FF80817AFFA0A39AFF95958DFFEBAC8D00FFC3A200FEBF9D00FCBB
      9800FBB69200FAB08B00F8AB8400F8A67C00F3A68000D2B09E0073ACB9008CE0
      EE006CC4D9007D868600353590002F39830039AFD000A4F0FC008BEBF90085F0
      F90062EBFB0043D8F10030BED600104755000000000000000000000000000000
      00000000000000000000000000000000000039AFD000A4F0FC008BEBF90085F0
      F90062EBFB0043D8F10030BED600104755000000000000000000000000000000
      000000000000000000000000000000000000D8DBD1FF919388FF919388FF9193
      88FF919388FF919388FF919388FF727E80FF35678EFF479FC8FF90E2F8FF4B7D
      9EFF3A546CFF828C94FFBCBCBCFFDEDEDEFFEBAC8D00EAAA8B00EAAA8B00EAA8
      8900E9A28100E89C7700E7946B00E68C6000E5865500E68D5F00CA997F007DB0
      BB00CAB8AC007385D1005E6CAD003535900059B6D500D2FBFD00CAF9FC00ADF6
      FB007DF2FC0058E0F40046D5EA001C697C000000000000000000000000000000
      00000000000000000000000000000000000059B6D500D2FBFD00CAF9FC00ADF6
      FB007DF2FC0058E0F40046D5EA001C697C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7D1DCFF3B6D94FF5589ABFF849B
      9CFF558767FF37556BFF838B98FFC5C5C5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EBAC8D007F9F
      AD005E6CAD00708FDF005E76D0005E6CAD0057BADE0068C2DD0045C0CF0045C0
      CF0045C0CF0029A1B6001682900012768D000000000000000000000000000000
      00000000000000000000000000000000000057BADE0068C2DD0045C0CF00C0F8
      FD0082ECFB0029A1B6001682900012768D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCD4DEFF4E6A82FF77AC
      8FFF7FA8B1FF5A5AAFFF2A447EFFC2C2C2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000687EC2005E6CAD005E6CAD006579BC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000062BDDA00CFF9
      FD00ABF4FC002FA8C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CBD4DCFF4E6B
      83FF7E7DCDFF5B62C0FF1F3E79FFDADADAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000061BDE00059B9
      D9003DAFD00021A4CA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C9D1
      DEFF455E94FF2E4C85FFA0B0C0FFF5F5F5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008A2D0C007C2B1000832F
      1B00832F1B00662208003D130100000000000000000000000000000000000000
      000000000000000000000000000000000000000000008A2D0C007C2B1000832F
      1B00832F1B00662208003D130100000000000000000000000000000000000000
      000000000000000000000000000000000000000000008A2D0C007C2B1000832F
      1B00832F1B00662208003D130100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F6F600ECECEC00E7E7
      E700E7E7E700E8E8E800ECECEC00F4F4F400FCFCFC0000000000000000000000
      000000000000000000000000000000000000B73D0F00DD523300F9635000FD70
      5B00F36C5200D26E4100F8655100CC4A29002D32070012571200217921002D84
      2D00217E2100116B11000330030000000000B73D0F00DD523300F9635000FD70
      5B00F36C5200D26E4100F8655100CC4A29002D32070012571200217921002D84
      2D00217E2100116B11000330030000000000B73D0F00DD523300F9635000FD70
      5B00F36C5200D26E4100F8655100CC4A29002D32070012571200217921002D84
      2D00217E2100116B11000330030000000000F4F4F400D0D0D000ACACAC00A0A0
      A000A0A0A000A1A1A100A9A9A900BABABA00D2D2D200E3E3E300E4E4E400DEDE
      DE00DCDCDC00DDDDDD00E3E3E300F0F0F000B73D0F00F9635000FD7A6200FE8C
      6E00DC855600F5CD9B00EF705200FD6A570092873C0053AF4F0067AE5C0061CA
      610055C3550038B53800167A160000000000B73D0F00F9635000FD7A6200FE8C
      6E00DC855600F5CD9B00EF705200FD6A570092873C0053AF4F0067AE5C0061CA
      610055C3550038B53800167A160000000000B73D0F00F9635000FD7A6200FE8C
      6E00DC855600F5CD9B00EF705200FD6A570092873C0053AF4F0067AE5C0061CA
      610055C3550038B53800167A160000000000DECFC800AF6F5800965540009853
      420098534200844D380071534600666666007D7D7D0097979700989898008C8C
      8C00888888008989890098989800C2C2C200A1320300E15D3F00FD886B00E17D
      5100FAC79400FFD3A000E5775000F8745B00919C500086C28000EFF5E00055AF
      550073D2730052C252001875180000000000A1320300E15D3F00FD886B00E17D
      5100FAC79400FFD3A000E5775000F8745B00919C500086C28000EFF5E00055AF
      550073D2730052C252001875180000000000A1320300E15D3F00FD886B00E17D
      5100FAC79400FFD3A000E5775000F8745B00919C500086C28000EFF5E00055AF
      550073D2730052C252001875180000000000C7694600DD523300F9635000FD70
      5B00F36C5200D26E4100F8655100CD4D2C004E522E00336F3300338433003D8E
      3D003288320027792700416341009898980000000000561B0100A14C42004223
      5A004336780060487700BB5B3800937A350082DA8200A4C69700FFF5EC00BACF
      A80063C1630041A34100002900000000000000000000561B0100A14C42004223
      5A004336780060487700BB5B3800937A350082DA8200A4C69700FFF5EC00BACF
      A80063C1630041A34100002900000000000000000000561B0100A14C42004223
      5A004336780060487700BB5B3800937A350082DA8200A4C69700FFF5EC00BACF
      A80063C1630041A341000029000000000000D1836600F9635000FD7A6200FE8C
      6E00DC855600F5CD9B00EF705200FD6A570092873C0053AF4F0067AE5C0061CA
      610055C3550038B538002A852A0099999900000000000404040003060D000F2B
      7100143AA00010319700020F5C00002500004090400043888E001076B900207D
      BB001A715B00001B00000000000000000000000000000404040003060D000F2B
      7100143AA00010319700020F5C00002500004090400043888E001076B900207D
      BB001A715B00001B00000000000000000000000000000404040003060D000F2B
      7100143AA00010319700020F5C00002500004090400043888E001076B900207D
      BB001A715B00001B00000000000000000000F2E3DC00E3664A00FD886B00E17D
      5100FAC79400FFD3A000E5775000F8745B00919C500086C28000EFF5E00055AF
      550073D2730052C252003A8A3A00C2C2C2000A0A0A001A1A1A00122F68001A4D
      B3001D57BD001B4FB5000D32930000082000053D5E002D93F2003399FF003399
      FF002B91EF00042C44000000000000000000000000001A1A1A00122F68001A4D
      B3001D57BD001B4FB5000D32930000082000053D5E002D93F2003399FF003399
      FF002B91EF00042C440000000000000000000A0A0A001A1A1A00122F68001A4D
      B3001D57BD001B4FB5000D32930000082000053D5E002D93F2003399FF003399
      FF002B91EF00042C44000000000000000000F2F2F200BEA79D00A7574E004223
      5A004336780060487700BC5E3B00937A350082DA8200A4C69700FFF5EC00BACF
      A80063C1630045A54500889B8800E8E8E8001515150028282800184281002673
      D9002673D9002673D9001B5CBD00000F2C001D73B0003FA5FF0040A6FF0040A6
      FF003EA4FF001F7BBE0000000000000000001515150028282800184281002673
      D9002673D9002673D9001B5CBD00000F2C001D73B0003FA5FF0040A6FF0040A6
      FF003EA4FF001F7BBE0000000000000000001515150028282800184281002673
      D9002673D9002673D9001B5CBD00000F2C001D73B0003FA5FF0040A6FF0040A6
      FF003EA4FF001F7BBE000000000000000000B6B6B6001616160003060D000F2B
      7100143AA00010319700131F67005069500067A7670043888E001076B900207D
      BB001E735E004B5E4B00A8A8A800ECECEC00202020003535350025456B003090
      F600349AFF003396FA002173D200001631002B86C6004CB2FF004DB3FF004DB3
      FF0049AFFF003197E600000A100000000000202020003535350025456B003090
      F600349AFF003396FA002173D200001631000000000081808000A8B5B5004DB3
      FF0049AFFF003197E600000A100000000000202020003535350025456B003090
      F600349AFF003396FA002173D200001631002B86C6004CB2FF004DB3FF004DB3
      FF0049AFFF003197E600000A1000000000003D3D3D001A1A1A00122F68001A4D
      B3001D57BD001B4FB5000D329300525768006E8EA2002D93F2003399FF003399
      FF002B91EF003656690086868600DADADA00141414004A4A4A00424242003646
      65001B4590002262C60015477D00001831003290CD004DB3FF00634935006349
      350063493500634935006349350000000000141414004A4A4A00424242003646
      65001B4590002262C60015477D00001831008180800075716E00575451000000
      000050B6FF0042A5EA0000273B0000000000141414004A4A4A00424242003646
      65001B4590002262C60015477D00001831003290CD004DB3FF00634935006349
      3500634935006349350063493500000000001515150028282800184281002673
      D9002673D9002673D9001B5CBD004C576B00478DBF003FA5FF0040A6FF0040A6
      FF003EA4FF00267FC0006E6E6E00C8C8C800000000002E2E2E00696969008D8D
      8D00A4A4A4004F4F4F00111D2600000000000B6C9D00B8A49400F4E3DA00F3DF
      D400F0D7C900EDD0BF00ECCDBB0063493500000000002E2E2E00696969008D8D
      8D00A4A4A4004F4F4F00111D26000000000000609000A39D9800FDFEFE005193
      A9000E1216001875A4000000000000000000000000002E2E2E00696969008D8D
      8D00A4A4A4004F4F4F00111D2600000000000B6C9D00B8A49400F4E3DA00F3DF
      D400F0D7C900EDD0BF00ECCDBB00634935002C2C2C003535350025456B003090
      F600349AFF003396FA002173D200526173004D99CF004CB2FF004DB3FF004DB3
      FF0049AFFF003197E60062686C00C2C2C20000000000000000002C2C2C005C5C
      5C004B4B4B0021212100000000000000000000609000B8A49400F6E8E000F4E3
      DA0063493500EED3C400EDD0BF006349350000000000000000002C2C2C005C5C
      5C004B4B4B0021212100000000000000000000609000A39D980088B7C70074CE
      E200499AB2000E121600000000000000000000000000000000002C2C2C005C5C
      5C004B4B4B0021212100000000000000000000609000B8A49400F6E8E000F4E3
      DA00F4E3DA00EED3C400EDD0BF00634935006A6A6A004A4A4A00424242003646
      65001B4590002262C60015477D007986930059A5D7004CB2F2004AB0EC0057BD
      FF0050B6FF0042A5EA0059727F00CFCFCF000000000000000000000000000000
      00000000000000000000000000000000000000000000BCA69700F9F0EB006349
      35006349350063493500F0D7C900634935000000000000000000000000000000
      00000000000000000000000000000000000000000000006394004D9CB3008CE0
      EE0062BFD700499AB2000E121600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCA69700F9F0EB006349
      35006349350063493500F0D7C90063493500EEEEEE003A3A3A00696969008D8D
      8D00A4A4A4004F4F4F0036404800D0D0D0006FA8C5002987B90052A4D20061A8
      D300519FD0001875A400A5A5A500E6E6E6000000000000000000000000000000
      00000000000000000000000000000000000000000000C0AB9C00FCF7F500FBF4
      F00063493500F4E3DA00F3DFD400634935000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000057A0
      B5008CE0EE006CC4D9007D868600353590000000000000000000000000000000
      00000000000000000000000000000000000000000000C0AB9C00FCF7F500FBF4
      F000F4E3DA00F4E3DA00F3DFD4006349350000000000DEDEDE006C6C6C005C5C
      5C005E5E5E0068686800D8D8D800F7F7F700DDEAF000368AB7008BC4E500A1CF
      EA0057A4CF005B92AF00DFDFDF00F9F9F9000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AC9D00FDFAF900FCF7
      F500F9F0EB00F6E8E000F4E3DA00634935000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007DB0BB00CAB8AC007385D1005E6CAD000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AC9D00FDFAF900FCF7
      F500F9F0EB00F6E8E000F4E3DA00634935000000000000000000000000000000
      00000000000000000000000000000000000000000000DEEBF10093BDD3009FC4
      D700A0C0D000F2F2F200FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2AC9D00C0AB
      9C00BBA79800B8A39400B8A39400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005E6CAD00819FEB005E76D0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2AC9D00C0AB
      9C00BBA79800B8A39400B8A3940000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0002100210FFFF000000000000FE000000
      00000000FC00000000000000FC00000000000000FC00000000000000DC010000
      000000009E030000000000000101000000000000010100000000000001010000
      000000009F010000007F0043DF010000007FFF81FF01000080FFFF18FF010000
      80FFFF3CFF830000637FFFFFFFFF0000FFFFFE00FE000210FFFFFE00FE000000
      000FFE00FE000000000FFE00FE000000000FFE00FE000000000FFE00FE000000
      000FFE00FE0000000007FE00FE0000000007FE00C20000000003FFFFC3FF0000
      000100FF00FF0000000000FF00FF0000000000FF00FFFF00FFC000FF00FFFF80
      FFF0FFFFC3FFFFC0FFFFFFFFC3FFFFE0FFFF81FF81FF81FF807F000100010001
      0000000100010001000000010001000100008001800180010000800380038003
      0000000380030003000000030003000300000001000100010000000100010001
      00008100810381000000C300C303C3000000FF80FF81FF800000FF80FFE0FF80
      8000FF80FFF0FF80FF81FFC1FFF8FFC100000000000000000000000000000000
      000000000000}
  end
  object dsSpclz: TDataSource
    OnDataChange = dsSpclzDataChange
    Left = 313
    Top = 221
  end
end
