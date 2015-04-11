inherited frmAbitCardDialog: TfrmAbitCardDialog
  Left = 409
  Top = 199
  HelpKeyword = 'A_Add_Abit.htm'
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1072#1088#1090#1086#1095#1082#1080' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
  ClientHeight = 662
  ClientWidth = 562
  ExplicitWidth = 568
  ExplicitHeight = 691
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 562
    Height = 621
    ExplicitWidth = 577
    ExplicitHeight = 573
  end
  object Label65: TLabel [1]
    Left = 25
    Top = 340
    Width = 95
    Height = 13
    Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
  end
  inherited Panel1: TPanel
    Top = 621
    Width = 562
    ExplicitTop = 621
    ExplicitWidth = 562
    inherited bbOK: TBitBtn
      Left = 357
      Top = 6
      Width = 94
      Height = 26
      Caption = #1044#1072#1083#1077#1077
      ExplicitLeft = 357
      ExplicitTop = 6
      ExplicitWidth = 94
      ExplicitHeight = 26
    end
    inherited bbApply: TBitBtn
      Left = 469
      Top = 6
      Visible = False
      ExplicitLeft = 469
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 457
      Top = 6
      Width = 95
      Height = 26
      ExplicitLeft = 457
      ExplicitTop = 6
      ExplicitWidth = 95
      ExplicitHeight = 26
    end
    inherited bbSprav: TBitBtn
      Hint = #1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
    end
    object btnBack: TButton
      Left = 293
      Top = 6
      Width = 75
      Height = 25
      Caption = '<< '#1053#1072#1079#1072#1076
      TabOrder = 4
      OnClick = btnBackClick
    end
  end
  inherited PageControl1: TPageControl
    Width = 562
    Height = 621
    TabStop = False
    ExplicitWidth = 562
    ExplicitHeight = 621
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 554
      ExplicitHeight = 593
      inherited PageControl2: TPageControl
        Width = 554
        Height = 593
        OnChange = PageControl2Change
        ExplicitWidth = 554
        ExplicitHeight = 593
        inherited TabSheet3: TTabSheet
          ExplicitWidth = 546
          ExplicitHeight = 561
          inherited Panel4: TPanel
            Width = 546
            Height = 561
            ExplicitWidth = 546
            ExplicitHeight = 561
            inherited Panel7: TPanel
              Width = 544
              ExplicitWidth = 544
              inherited Label4: TLabel
                Top = 48
                ExplicitTop = 48
              end
              inherited Label37: TLabel
                Left = 313
                Top = 113
                Visible = False
                ExplicitLeft = 313
                ExplicitTop = 113
              end
              inherited Label13: TLabel
                Left = 213
                Top = 91
                ExplicitLeft = 213
                ExplicitTop = 91
              end
              inherited Label18: TLabel
                Top = 91
                ExplicitTop = 91
              end
              inherited Label45: TLabel
                Top = 5
                Width = 6
                Font.Style = [fsBold]
                ExplicitTop = 5
                ExplicitWidth = 6
              end
              inherited Label46: TLabel
                Top = 4
                Width = 6
                Font.Style = [fsBold]
                ExplicitTop = 4
                ExplicitWidth = 6
              end
              inherited Label48: TLabel
                Width = 6
                Font.Style = [fsBold]
                ExplicitWidth = 6
              end
              inherited Label50: TLabel
                Left = 392
                Top = 111
                Visible = False
                ExplicitLeft = 392
                ExplicitTop = 111
              end
              inherited Label8: TLabel
                Left = 323
                Top = 48
                ExplicitLeft = 323
                ExplicitTop = 48
              end
              inherited dbdteBirthDate: TDBDateTimeEditEh
                OnExit = dbdteBirthDateExit
                EditFormat = 'DD/MM/YYYY'
              end
              inherited eFam: TDBEditEh
                OnChange = nil
                OnExit = nil
                OnKeyUp = eFamKeyUp
                EditMask = ''
              end
              inherited eName: TDBEditEh
                EditMask = ''
              end
              inherited eMid: TDBEditEh
                EditMask = ''
              end
              inherited eEmail: TDBEditEh
                Left = 14
                Top = 105
                TabOrder = 7
                ExplicitLeft = 14
                ExplicitTop = 105
              end
              inherited eCellphone: TDBEditEh
                Left = 213
                Top = 105
                Width = 228
                ExplicitLeft = 213
                ExplicitTop = 105
                ExplicitWidth = 228
              end
              inherited eNum: TDBEditEh
                Left = 285
                Top = 130
                TabOrder = 9
                Visible = False
                ExplicitLeft = 285
                ExplicitTop = 130
                EditMask = '000000; ; '
              end
              inherited ePhone: TDBEditEh
                Left = 323
                Top = 64
                Width = 118
                TabOrder = 5
                ExplicitLeft = 323
                ExplicitTop = 64
                ExplicitWidth = 118
              end
              inherited rgSex: TRadioGroup
                Left = 221
                TabOrder = 4
                ExplicitLeft = 221
              end
            end
            inherited Panel8: TPanel
              Width = 544
              Height = 264
              ParentFont = False
              ExplicitWidth = 544
              ExplicitHeight = 264
              inherited Label1: TLabel
                Left = 200
                Top = 45
                ExplicitLeft = 200
                ExplicitTop = 45
              end
              inherited Label15: TLabel
                Left = 142
                Top = 133
                Visible = False
                ExplicitLeft = 142
                ExplicitTop = 133
              end
              inherited Label16: TLabel
                Left = 12
                Top = 4
                Width = 146
                Caption = #1054#1082#1086#1085#1095#1080#1083' '#1091#1095#1077#1073#1085#1086#1077' '#1079#1072#1074#1077#1076#1077#1085#1080#1077':'
                Font.Height = -12
                ParentFont = False
                ExplicitLeft = 12
                ExplicitTop = 4
                ExplicitWidth = 146
              end
              inherited Label17: TLabel
                Top = 209
                ExplicitTop = 209
              end
              inherited sbAddLang: TSpeedButton
                Left = 509
                Top = 60
                ExplicitLeft = 509
                ExplicitTop = 60
              end
              inherited sbDelLang: TSpeedButton
                Left = 509
                Top = 86
                ExplicitLeft = 509
                ExplicitTop = 86
              end
              inherited Label33: TLabel
                Left = 149
                Top = 99
                Visible = False
                ExplicitLeft = 149
                ExplicitTop = 99
              end
              inherited Label58: TLabel
                Left = 224
                Top = 109
                Visible = False
                ExplicitLeft = 224
                ExplicitTop = 109
              end
              inherited SpeedButton2: TSpeedButton
                Left = 223
                Top = 137
                Visible = False
                ExplicitLeft = 223
                ExplicitTop = 137
              end
              inherited Label59: TLabel
                Left = 142
                Top = 118
                Visible = False
                ExplicitLeft = 142
                ExplicitTop = 118
              end
              inherited Label60: TLabel
                Left = 191
                Top = 143
                Visible = False
                ExplicitLeft = 191
                ExplicitTop = 143
              end
              inherited Label61: TLabel
                Left = 330
                Top = 48
                Visible = False
                ExplicitLeft = 330
                ExplicitTop = 48
              end
              inherited Label62: TLabel
                Left = 92
                Top = 209
                Width = 6
                Font.Style = [fsBold]
                ExplicitLeft = 92
                ExplicitTop = 209
                ExplicitWidth = 6
              end
              object Label64: TLabel [13]
                Left = 13
                Top = 126
                Width = 31
                Height = 13
                Caption = #1056#1072#1081#1086#1085
              end
              object Label66: TLabel [14]
                Left = 13
                Top = 168
                Width = 95
                Height = 13
                Caption = #1053#1072#1089#1077#1083#1105#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
              end
              object Label68: TLabel [15]
                Left = 159
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
              inherited Label63: TLabel
                Left = 194
                Top = 99
                Visible = False
                ExplicitLeft = 194
                ExplicitTop = 99
              end
              object Label67: TLabel [17]
                Left = 12
                Top = 43
                Width = 36
                Height = 13
                Caption = #1057#1090#1088#1072#1085#1072
              end
              object Label69: TLabel [18]
                Left = 13
                Top = 84
                Width = 36
                Height = 13
                Caption = #1056#1077#1075#1080#1086#1085
              end
              inherited sgLang: TStringGrid
                Left = 200
                Top = 61
                Width = 303
                Height = 183
                TabOrder = 10
                ExplicitLeft = 200
                ExplicitTop = 61
                ExplicitWidth = 303
                ExplicitHeight = 183
              end
              inherited dbcbeSchool: TDBLookupComboboxEh
                Left = 13
                Top = 23
                Width = 490
                EditButtons = <
                  item
                    Style = ebsPlusEh
                    OnClick = dbcbeSchoolEditButtons0Click
                  end>
                TabOrder = 4
                OnChange = dbcbeSchoolChange
                ExplicitLeft = 13
                ExplicitTop = 23
                ExplicitWidth = 490
              end
              inherited dbcbeCat: TDBLookupComboboxEh
                Left = 142
                Top = 152
                TabOrder = 0
                Visible = False
                ExplicitLeft = 142
                ExplicitTop = 152
              end
              inherited sgLangKeys: TStringGrid
                TabOrder = 1
              end
              inherited dbcbeNumPrik: TDBLookupComboboxEh
                Left = 151
                Top = 118
                TabOrder = 2
                Visible = False
                ExplicitLeft = 151
                ExplicitTop = 118
              end
              inherited dbcbeCause: TDBLookupComboboxEh
                Left = 142
                Top = 192
                TabOrder = 3
                Visible = False
                ExplicitLeft = 142
                ExplicitTop = 192
              end
              inherited eYearFinished: TDBNumberEditEh
                Top = 225
                Width = 171
                TabOrder = 9
                OnChange = actCheckFieldsExecute
                ExplicitTop = 225
                ExplicitWidth = 171
              end
              object dbcbeSchoolCountry: TDBLookupComboboxEh
                Left = 12
                Top = 60
                Width = 172
                Height = 19
                Hint = #1057#1090#1088#1072#1085#1072
                Alignment = taLeftJustify
                DataField = ''
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_strana'
                ListField = 'Cstrana'
                ListSource = dmAdress.DSsChoolStrana
                TabOrder = 5
                Visible = True
                OnChange = dbcbeSchoolCountryChange
              end
              object dbcbeSchoolDist: TDBLookupComboboxEh
                Left = 13
                Top = 103
                Width = 171
                Height = 19
                Hint = #1056#1077#1075#1080#1086#1085
                Alignment = taLeftJustify
                DataField = ''
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_region'
                ListField = 'Cregion'
                ListSource = dmAdress.DSsChoolRegion
                TabOrder = 6
                Visible = True
                OnChange = dbcbeSchoolDistChange
              end
              object dbcbeSchoolRegion: TDBLookupComboboxEh
                Left = 13
                Top = 145
                Width = 171
                Height = 19
                Hint = #1056#1072#1081#1086#1085
                Alignment = taLeftJustify
                DataField = ''
                EditButtons = <>
                Flat = True
                KeyField = 'IK_Raion'
                ListField = 'CRaion'
                ListSource = dmAdress.DSsChoolRaion
                TabOrder = 7
                Visible = True
                OnChange = dbcbeSchoolRegionChange
              end
              object dbcbeSchoolPoint: TDBLookupComboboxEh
                Left = 13
                Top = 184
                Width = 171
                Height = 19
                Hint = #1053#1072#1089#1077#1083#1077#1085#1099#1081' '#1087#1091#1085#1082#1090
                Alignment = taLeftJustify
                DataField = ''
                EditButtons = <>
                Flat = True
                KeyField = 'IK_Gorod'
                ListField = 'CGorod'
                ListSource = dmAdress.DSsChoolGorod
                TabOrder = 8
                Visible = True
                OnChange = dbcbeSchoolPointChange
              end
            end
            inherited Panel6: TPanel
              Top = 426
              Width = 544
              Height = 134
              ParentFont = False
              ExplicitTop = 426
              ExplicitWidth = 544
              ExplicitHeight = 134
              inherited sbAddAddress: TSpeedButton
                Left = 509
                ExplicitLeft = 509
              end
              object Label9: TLabel [3]
                Left = 53
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
              inherited sgAddress: TStringGrid
                Height = 105
                RowCount = 1
                FixedRows = 0
                ExplicitHeight = 105
              end
            end
          end
        end
        inherited TabSheet4: TTabSheet
          ExplicitWidth = 546
          ExplicitHeight = 561
          inherited Panel3: TPanel
            Width = 546
            Height = 561
            ExplicitWidth = 546
            ExplicitHeight = 561
            inherited Panel5: TPanel
              Width = 544
              ExplicitWidth = 544
              inherited Label27: TLabel
                Top = 44
                ExplicitTop = 44
              end
              inherited Label28: TLabel
                Left = 249
                Visible = False
                ExplicitLeft = 249
              end
              inherited Label52: TLabel
                Left = 80
                Width = 6
                Font.Style = [fsBold]
                ExplicitLeft = 80
                ExplicitWidth = 6
              end
              object Label3: TLabel [4]
                Left = 100
                Top = 42
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
              inherited dbcbeNationality: TDBLookupComboboxEh
                Left = 249
                Top = 29
                Width = 279
                Visible = False
                ExplicitLeft = 249
                ExplicitTop = 29
                ExplicitWidth = 279
              end
              inherited dbcbeCitizenship: TDBLookupComboboxEh
                Top = 20
                Width = 515
                ExplicitTop = 20
                ExplicitWidth = 515
              end
              inherited eBirthPlace: TDBEditEh
                Top = 60
                Width = 515
                OnKeyUp = eBirthPlaceKeyUp
                ExplicitTop = 60
                ExplicitWidth = 515
              end
            end
            inherited Panel2: TPanel
              Width = 544
              Height = 256
              ParentFont = False
              ExplicitWidth = 544
              ExplicitHeight = 256
              inherited Label30: TLabel
                Visible = False
              end
              inherited Label31: TLabel
                Top = 32
                ExplicitTop = 32
              end
              inherited Label32: TLabel
                Left = 69
                Top = 74
                Visible = False
                ExplicitLeft = 69
                ExplicitTop = 74
              end
              inherited Label34: TLabel
                Top = 160
                ExplicitTop = 160
              end
              inherited Label43: TLabel
                Top = 116
                Width = 252
                Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1074#1086#1077#1085#1085#1086#1081' '#1089#1083#1091#1078#1073#1077' / '#1074#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077' '
                ExplicitTop = 116
                ExplicitWidth = 252
              end
              inherited Label42: TLabel
                Left = 198
                Top = 32
                ExplicitLeft = 198
                ExplicitTop = 32
              end
              object Label70: TLabel [6]
                Left = 13
                Top = 74
                Width = 38
                Height = 13
                Caption = #1051#1100#1075#1086#1090#1099
              end
              inherited cbJob: TCheckBox
                Top = 230
                ExplicitTop = 230
              end
              inherited cbInvalid: TCheckBox
                Visible = False
              end
              inherited dbcbeSocWork: TDBLookupComboboxEh
                Visible = False
              end
              inherited dbcbeSpecCount: TDBLookupComboboxEh
                Visible = False
              end
              inherited dbcbeMilitaryState: TDBLookupComboboxEh
                Width = 515
                ExplicitWidth = 515
              end
              inherited eAddInfo: TMemo
                Width = 515
                Height = 48
                ExplicitWidth = 515
                ExplicitHeight = 48
              end
              object eBenefits: TDBEditEh
                Left = 13
                Top = 89
                Width = 515
                Height = 19
                Alignment = taLeftJustify
                DynProps = <>
                EditButtons = <>
                Flat = True
                TabOrder = 10
                Visible = True
              end
            end
            inherited Panel10: TPanel
              Top = 450
              Width = 544
              Height = 110
              ExplicitTop = 450
              ExplicitWidth = 544
              ExplicitHeight = 110
            end
            inherited pnlWork: TPanel
              Top = 345
              Width = 544
              Height = 105
              ExplicitWidth = 544
              ExplicitHeight = 105
              inherited dbcbeEnterprise: TDBLookupComboboxEh
                Width = 515
                ExplicitWidth = 515
              end
            end
          end
        end
        inherited TabSheet5: TTabSheet
          ExplicitWidth = 546
          ExplicitHeight = 561
          inherited Panel9: TPanel
            Width = 546
            ExplicitWidth = 546
            inherited dbcbeFamState: TDBLookupComboboxEh
              Left = 119
              ExplicitLeft = 119
            end
          end
          inherited sgRelatives: TStringGrid
            Height = 536
            ExplicitHeight = 536
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitWidth = 546
          ExplicitHeight = 561
          inherited sbAddDoc: TSpeedButton
            Left = 520
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF009C96
              8C007B69630073615A0073615A00D6CFC6006349310063493100634931006349
              3100634931006349310063493100D6CFC600FF00FF00FF00FF00AD796B00DEAE
              9C00D6AE9C00D6A69C00D6A69400BDA69400F7E7DE00DEC7B500DEBEAD00DEBE
              AD00D6BEA500D6BEA500D6B6A50063493100FF00FF00FF00FF00B5867300FFE7
              CE00FFE7CE00FFDFC600FFDFC600BDA69400FFEFE700F7E7DE00F7DFD6006349
              3100F7D7CE00EFD7C600D6BEA50063493100FF00FF00FF00FF00BD8E7300FFE7
              CE00FFE7CE00FFE7CE00FFDFC600BDA69400FFF7EF00F7EFE700F7E7DE006349
              3100F7DFCE00F7D7CE00D6BEA50063493100FF00FF00FF00FF00C68E7B00FFE7
              D600FFE7D600FFE7CE00FFE7CE00BDA69400FFF7F70063493100634931006349
              31006349310063493100DEBEAD0063493100FF00FF00FF00FF00CE967B00FFEF
              DE00FFE7D600FFE7D600FFE7CE00BDAE9C00FFF7F700FFF7EF00FFEFE7006349
              3100F7E7DE00F7DFD600DEBEAD0063493100FF00FF00FF00FF00CE9E8400FFEF
              DE00FFEFDE00FFE7D600FFE7D600C6AE9C00FFFFFF00FFF7F700FFF7EF006349
              3100F7EFE700F7E7DE00DEC7AD0063493100FF00FF00FF00FF00D6A68400FFEF
              E700FFEFDE00FFEFDE00FFEFD600C6AE9C00FFFFFF00FFFFFF00FFF7F700FFF7
              F700FFF7EF00FFEFE700F7E7DE0063493100FF00FF00FF00FF00DEAE8400FFF7
              E700FFEFE700FFEFDE00FFEFDE00EFEFE700C6AE9C00C6AE9C00BDAE9C00BDA6
              9C00BDA69400BDA69400BDA69400D6CFC600FF00FF00FF00FF00DEAE8400FFF7
              EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7
              CE00FFE7CE00F7CFBD0073615A00BDB6B500FF00FF00FF00FF00DEAE8400FFF7
              EF00FFF7EF00FFF7E700FFEFE700FFEFE700FFEFDE00FFEFDE00FFEFD600FFE7
              D600FFE7D600F7CFBD007B615A00C6BEB500FF00FF00FF00FF00DEAE8400FFFF
              F700FFF7EF00FFF7EF00FFF7EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEF
              DE00FFE7D600F7CFBD008C797300CEC7C600FF00FF00FF00FF00DEAE8400FFFF
              F700FFFFF700FFF7F700FFF7EF00FFF7EF00FFF7E700FFEFE700FFD7CE00FFD7
              CE00F7B6AD00B58E7B00AD9E9400DEDFD600FF00FF00FF00FF00DEAE8400FFFF
              FF00FFFFF700FFFFF700FFF7F700FFF7EF00FFF7EF00FFF7E700F7A64200F7A6
              4200E796420094867B00CEC7C600F7EFEF00FF00FF00FF00FF00DEAE8400FFFF
              FF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFF7EF00DEAE8400EFB6
              73008C716300BDAEAD00E7E7DE00FFFFF700FF00FF00FF00FF00DEAE8400DEAE
              8400DEAE8400DEAE8400DEAE8400DEAE8400DEAE8C00D6A68400DEAE8400FFF7
              EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ExplicitLeft = 520
          end
          inherited SbDelDoc: TSpeedButton
            Left = 520
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF009C96
              8C007B69630073615A0073615A00D6CFC6006349310063493100634931006349
              3100634931006349310063493100D6CFC600FF00FF00FF00FF00AD796B00DEAE
              9C00D6AE9C00D6A69C00D6A69400BDA69400F7E7DE00F7DFCE00F7D7CE00EFD7
              C600EFD7BD00EFCFBD00EFCFB50063493100FF00FF00FF00FF00B5867300FFE7
              CE00FFE7CE00FFDFC600FFDFC600BDA69400FFEFE700F7E7DE00F7DFD600F7DF
              CE00F7D7CE00EFD7C600EFCFBD0063493100FF00FF00FF00FF00BD8E7300FFE7
              CE00FFE7CE00FFE7CE00FFDFC600BDA69400FFF7EF00F7EFE700F7E7DE00F7DF
              D600F7DFCE00F7D7CE00EFD7BD0063493100FF00FF00FF00FF00C68E7B00FFE7
              D600FFE7D600FFE7CE00FFE7CE00BDA69400FFF7F70063493100634931006349
              31006349310063493100EFD7C60063493100FF00FF00FF00FF00CE967B00FFEF
              DE00FFE7D600FFE7D600FFE7CE00BDAE9C00FFF7F700FFF7EF00FFEFE700F7EF
              E700F7E7DE00F7DFD600F7D7CE0063493100FF00FF00FF00FF00CE9E8400FFEF
              DE00FFEFDE00FFE7D600FFE7D600C6AE9C00FFFFFF00FFF7F700FFF7EF00FFEF
              E700F7EFE700F7E7DE00F7DFCE0063493100FF00FF00FF00FF00D6A68400FFEF
              E700FFEFDE00FFEFDE00FFEFD600C6AE9C00FFFFFF00FFFFFF00FFF7F700FFF7
              F700FFF7EF00FFEFE700F7E7DE0063493100FF00FF00FF00FF00DEAE8400FFF7
              E700FFEFE700FFEFDE00FFEFDE00EFEFE700C6AE9C00C6AE9C00BDAE9C00BDA6
              9C00BDA69400BDA69400BDA69400D6CFC600FF00FF00FF00FF00DEAE8400FFF7
              EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7
              CE00FFE7CE00F7CFBD0073615A00BDB6B500FF00FF00FF00FF00DEAE8400FFF7
              EF00FFF7EF00FFF7E700FFEFE700FFEFE700FFEFDE00FFEFDE00FFEFD600FFE7
              D600FFE7D600F7CFBD007B615A00C6BEB500FF00FF00FF00FF00DEAE8400FFFF
              F700FFF7EF00FFF7EF00FFF7EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEF
              DE00FFE7D600F7CFBD008C797300CEC7C600FF00FF00FF00FF00DEAE8400FFFF
              F700FFFFF700FFF7F700FFF7EF00FFF7EF00FFF7E700FFEFE700FFD7CE00FFD7
              CE00F7B6AD00B58E7B00AD9E9400DEDFD600FF00FF00FF00FF00DEAE8400FFFF
              FF00FFFFF700FFFFF700FFF7F700FFF7EF00FFF7EF00FFF7E700F7A64200F7A6
              4200E796420094867B00CEC7C600F7EFEF00FF00FF00FF00FF00DEAE8400FFFF
              FF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFF7EF00DEAE8400EFB6
              73008C716300BDAEAD00E7E7DE00FFFFF700FF00FF00FF00FF00DEAE8400DEAE
              8400DEAE8400DEAE8400DEAE8400DEAE8400DEAE8C00D6A68400DEAE8400FFF7
              EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ExplicitLeft = 520
          end
          inherited sgDocs: TStringGrid
            Height = 561
            ColCount = 5
            ParentFont = False
            ExplicitHeight = 561
            ColWidths = (
              119
              100
              128
              101
              102)
          end
        end
      end
    end
  end
  inherited ilPages: TImageList
    Bitmap = {
      494C010105000900780010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA69C00F7EFEF00E7DF
      D600E7CFC600DEC7BD008C8EB500D6BEB500DEB6A500D6B6A500D6AE9C00D6AE
      9400CE9E8C006349310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFF7EF00F7EF
      EF00F7EFE7003151BD001038B5006B79C600E7D7CE00EFD7C600E7CFBD00E7C7
      B500D6AE94006349310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFF7EF00D6D7
      E7002949C6002951EF002149E7001038B5009C96C600EFD7C600EFCFC600E7C7
      B500D6AE94006349310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AE9C00FFF7F7001841
      BD002951F7006386FF005271F7003961EF002138B500D6C7C600EFD7CE00E7CF
      BD00D6AE9C006349310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AEA500FFFFF70084A6
      FF007B96FF007B8EF700D6D7E7007B96F7004261E7003951AD00EFD7CE00EFD7
      CE00D6B6A5006349390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB6A500FFFFFF00E7E7
      FF00BDC7F700F7EFEF00F7EFE700E7DFE7007B96F7002951DE005261AD00EFDF
      D600DEC7B5007359420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00F7EFE700EFE7E700738EF7002149D6008C96
      BD00E7CFC60084695A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEBEAD00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7F700F7EFEF00EFE7E700F7EFE7007B96EF002149
      D6009C96BD00A58E7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF007B9EAD00638E94006386940063798C005A7184006B868C0094A6AD008CA6
      EF002949D600AD968C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF0084AEB50094D7E70094E7F7007BD7EF0063C7DE00529EB5006B868C00F7E7
      DE00E7D7CE00A5968C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEC7B500FFFFFF00FFFF
      FF00F7FFFF0084A6B500A5AEA5009C8E84007BC7D6004A697B00F7EFEF00EFE7
      DE00F7E7DE008471630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700DEC7B500D6BE
      AD00D6BEAD0073A6B500A5E7EF009CE7F7008CD7E70042617300C6AE9C00BDAE
      9C00BDA69400E7E7EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084B6C6007BA6B5006B96A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFF0000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      FC7F000000000000FFFF000000000000F807FFFFFFFFC001C003FFF8FFFF0001
      C003FFF0007F0001C003FFE000000001C003FFC100008001C007E0030000C001
      C00FC0078001C001F00F800F0003C001F007800F0001C001F007800F0001C001
      F007800F0001C001F007800F0001C001F007800F0001C001F007800F8101C001
      F807C01FFF83C003F80FE03FFFFFC00700000000000000000000000000000000
      000000000000}
  end
end
