inherited ftmStudent: TftmStudent
  Left = 430
  Top = 346
  HelpKeyword = 'Add_stud.htm'
  Caption = #1055#1088#1072#1074#1082#1072' '#1083#1080#1095#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' '#1089#1090#1091#1076#1077#1085#1090#1072
  ClientHeight = 625
  ClientWidth = 566
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 572
  ExplicitHeight = 654
  PixelsPerInch = 96
  TextHeight = 13
  GlassFrame.SheetOfGlass = True
  inherited Bevel1: TBevel
    Width = 566
    Height = 584
    ExplicitWidth = 564
    ExplicitHeight = 543
  end
  inherited Panel1: TPanel
    Top = 584
    Width = 566
    BevelOuter = bvSpace
    TabOrder = 1
    ExplicitTop = 584
    ExplicitWidth = 566
    DesignSize = (
      566
      41)
    inherited bbOK: TBitBtn
      Left = 309
      Top = 9
      Width = 80
      Default = True
      Enabled = False
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ExplicitLeft = 309
      ExplicitTop = 9
      ExplicitWidth = 80
    end
    inherited bbApply: TBitBtn
      Left = 474
      Top = 9
      Enabled = False
      TabOrder = 0
      NumGlyphs = 2
      ExplicitLeft = 474
      ExplicitTop = 9
    end
    inherited bbCancel: TBitBtn
      Left = 391
      Top = 9
      Kind = bkCancel
      ExplicitLeft = 391
      ExplicitTop = 9
    end
    inherited bbSprav: TBitBtn
      Top = 9
      OnMouseEnter = bbSpravMouseEnter
      ExplicitTop = 9
    end
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 0
    Width = 566
    Height = 584
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1051#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 558
        Height = 556
        ActivePage = TabSheet2
        Align = alClient
        Images = ilPages
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = #1054#1073#1097#1080#1077
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 550
            Height = 524
            Align = alClient
            TabOrder = 0
            object Panel7: TPanel
              Left = 1
              Top = 1
              Width = 548
              Height = 143
              Align = alTop
              TabOrder = 0
              object Bevel2: TBevel
                Left = 455
                Top = 47
                Width = 81
                Height = 88
              end
              object Label44: TLabel
                Left = 477
                Top = 84
                Width = 34
                Height = 13
                Caption = #1060#1054#1058#1054
              end
              object Label3: TLabel
                Left = 213
                Top = 48
                Width = 20
                Height = 13
                Caption = #1055#1086#1083
              end
              object Label4: TLabel
                Left = 13
                Top = 49
                Width = 79
                Height = 13
                Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
              end
              object Label5: TLabel
                Left = 13
                Top = 8
                Width = 49
                Height = 13
                Caption = #1060#1072#1084#1080#1083#1080#1103
              end
              object Label6: TLabel
                Left = 162
                Top = 8
                Width = 22
                Height = 13
                Caption = #1048#1084#1103
              end
              object Label12: TLabel
                Left = 323
                Top = 5
                Width = 47
                Height = 13
                Caption = #1054#1090#1095#1077#1089#1090#1074#1086
              end
              object Label37: TLabel
                Left = 323
                Top = 48
                Width = 77
                Height = 13
                Caption = #1053#1086#1084#1077#1088' '#1079#1072#1095#1077#1090#1082#1080
              end
              object Label13: TLabel
                Left = 323
                Top = 89
                Width = 90
                Height = 13
                Caption = #1057#1086#1090#1086#1074#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
              end
              object Label18: TLabel
                Left = 13
                Top = 89
                Width = 28
                Height = 13
                Caption = 'E-mail'
              end
              object Label45: TLabel
                Left = 63
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
              object Label46: TLabel
                Left = 186
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
              object Label47: TLabel
                Left = 371
                Top = 5
                Width = 4
                Height = 13
                Caption = '*'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object Label48: TLabel
                Left = 94
                Top = 49
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
                Left = 235
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
                Left = 402
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
                Left = 458
                Top = 50
                Width = 75
                Height = 82
                Cursor = crHandPoint
                Stretch = True
                OnClick = iPhotoClick
              end
              object Label8: TLabel
                Left = 213
                Top = 89
                Width = 48
                Height = 13
                Caption = #1058#1077#1083#1077#1092#1086#1085':'
              end
              object dbcbeSex: TDBComboBoxEh
                Left = 213
                Top = 64
                Width = 104
                Height = 19
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                Items.Strings = (
                  #1052#1091#1078#1089#1082#1086#1081
                  #1046#1077#1085#1089#1082#1080#1081)
                ReadOnly = True
                TabOrder = 4
                Text = #1052#1091#1078#1089#1082#1086#1081
                Visible = True
                OnChange = dbcbeSexChange
                OnDropDown = dbcbeSexDropDown
              end
              object dbdteBirthDate: TDBDateTimeEditEh
                Left = 13
                Top = 64
                Width = 192
                Height = 19
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                TabOrder = 3
                Visible = True
                OnChange = actCheckFieldsExecute
                EditFormat = 'DD/MM/YYYY'
              end
              object eFam: TDBEditEh
                Left = 14
                Top = 23
                Width = 142
                Height = 19
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                TabOrder = 0
                Visible = True
                OnChange = actCheckFieldsExecute
                OnExit = eFamExit
                EditMask = ''
              end
              object eName: TDBEditEh
                Left = 162
                Top = 23
                Width = 155
                Height = 19
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                TabOrder = 1
                Visible = True
                OnChange = actCheckFieldsExecute
                OnExit = eNameExit
                EditMask = ''
              end
              object eMid: TDBEditEh
                Left = 323
                Top = 23
                Width = 213
                Height = 19
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                TabOrder = 2
                Visible = True
                OnChange = actCheckFieldsExecute
                OnExit = eMidExit
                EditMask = ''
              end
              object eEmail: TDBEditEh
                Left = 13
                Top = 105
                Width = 192
                Height = 19
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                TabOrder = 6
                Visible = True
                OnExit = eEmailExit
              end
              object eCellphone: TDBEditEh
                Left = 323
                Top = 105
                Width = 123
                Height = 19
                EditButtons = <>
                Flat = True
                TabOrder = 7
                Visible = True
              end
              object eNum: TDBEditEh
                Left = 323
                Top = 64
                Width = 123
                Height = 19
                EditButtons = <>
                Flat = True
                MaxLength = 6
                TabOrder = 5
                Text = '      '
                Visible = True
                OnChange = actCheckFieldsExecute
                OnClick = eNumClick
                EditMask = '000000; ; '
              end
              object ePhone: TDBEditEh
                Left = 213
                Top = 105
                Width = 104
                Height = 19
                EditButtons = <>
                Flat = True
                TabOrder = 8
                Visible = True
              end
            end
            object Panel8: TPanel
              Left = 1
              Top = 144
              Width = 548
              Height = 223
              Align = alTop
              TabOrder = 1
              object Label1: TLabel
                Left = 161
                Top = 5
                Width = 98
                Height = 13
                Caption = #1042#1083#1072#1076#1077#1085#1080#1077' '#1103#1079#1099#1082#1072#1084#1080
              end
              object Label15: TLabel
                Left = 13
                Top = 85
                Width = 115
                Height = 13
                Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
              end
              object Label16: TLabel
                Left = 13
                Top = 5
                Width = 48
                Height = 13
                Caption = #1047#1072#1082#1086#1085#1095#1080#1083
              end
              object Label17: TLabel
                Left = 13
                Top = 46
                Width = 74
                Height = 13
                Caption = #1043#1086#1076' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
              end
              object sbAddLang: TSpeedButton
                Left = 510
                Top = 25
                Width = 26
                Height = 22
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
                  4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
                  B8A494F4E3DAE4CFC2DDC5B7D9BEACD8BCA9D7BAA7D7B9A5D6B7A3D6B6A26349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
                  D7C9EED3C4EDD0BFECCDBBD6B7A3634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  B8A494F8ECE5F6E8E0F4E3DAF3DFD4634935F0D7C9EED3C4EDD0BFD7B9A56349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DA63
                  4935F1DBCFF0D7C9EED3C4D7BAA7634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9D8BCA96349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE563
                  4935F4E3DAF3DFD4F1DBCFD9BEAC634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  C0AB9CFDFAF9FCF7F5FBF4F0F9F0EB634935F6E8E0F4E3DAF3DFD4D9C0AF6349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
                  F0EBF8ECE5F6E8E0F4E3DAE1CDC0634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
                  A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = sbAddLangClick
              end
              object sbDelLang: TSpeedButton
                Left = 510
                Top = 52
                Width = 26
                Height = 22
                Enabled = False
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
                  4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
                  B8A494F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBBEBCAB8EAC8B56349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
                  D7C9EED3C4EDD0BFECCDBBEBCAB8634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  B8A494F8ECE5F6E8E0F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBB6349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DAF3
                  DFD4F1DBCFF0D7C9EED3C4EDD0BF634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9EED3C46349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE5F6
                  E8E0F4E3DAF3DFD4F1DBCFF0D7C9634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  C0AB9CFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DAF3DFD4F1DBCF6349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
                  F0EBF8ECE5F6E8E0F4E3DAF3DFD4634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
                  A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = sbDelLangClick
              end
              object Label33: TLabel
                Left = 13
                Top = 124
                Width = 79
                Height = 13
                Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
              end
              object Label58: TLabel
                Left = 92
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
              object SpeedButton2: TSpeedButton
                Left = 103
                Top = 121
                Width = 26
                Height = 19
                Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1082#1072#1079'...'
                Flat = True
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF009C94
                  8C007B6B630073635A0073635A00D6CEC600634A3100634A3100634A3100634A
                  3100634A3100634A3100634A3100D6CEC600FF00FF00FF00FF00AD7B6B00DEAD
                  9C00D6AD9C00D6A59C00D6A59400BDA59400F7E7DE00DEC6B500DEBDAD00DEBD
                  AD00D6BDA500D6BDA500D6B5A500634A3100FF00FF00FF00FF00B5847300FFE7
                  CE00FFE7CE00FFDEC600FFDEC600BDA59400FFEFE700F7E7DE00F7DED600634A
                  3100F7D6CE00EFD6C600D6BDA500634A3100FF00FF00FF00FF00BD8C7300FFE7
                  CE00FFE7CE00FFE7CE00FFDEC600BDA59400FFF7EF00F7EFE700F7E7DE00634A
                  3100F7DECE00F7D6CE00D6BDA500634A3100FF00FF00FF00FF00C68C7B00FFE7
                  D600FFE7D600FFE7CE00FFE7CE00BDA59400FFF7F700634A3100634A3100634A
                  3100634A3100634A3100DEBDAD00634A3100FF00FF00FF00FF00CE947B00FFEF
                  DE00FFE7D600FFE7D600FFE7CE00BDAD9C00FFF7F700FFF7EF00FFEFE700634A
                  3100F7E7DE00F7DED600DEBDAD00634A3100FF00FF00FF00FF00CE9C8400FFEF
                  DE00FFEFDE00FFE7D600FFE7D600C6AD9C00FFFFFF00FFF7F700FFF7EF00634A
                  3100F7EFE700F7E7DE00DEC6AD00634A3100FF00FF00FF00FF00D6A58400FFEF
                  E700FFEFDE00FFEFDE00FFEFD600C6AD9C00FFFFFF00FFFFFF00FFF7F700FFF7
                  F700FFF7EF00FFEFE700F7E7DE00634A3100FF00FF00FF00FF00DEAD8400FFF7
                  E700FFEFE700FFEFDE00FFEFDE00EFEFE700C6AD9C00C6AD9C00BDAD9C00BDA5
                  9C00BDA59400BDA59400BDA59400D6CEC600FF00FF00FF00FF00DEAD8400FFF7
                  EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7
                  CE00FFE7CE00F7CEBD0073635A00BDB5B500FF00FF00FF00FF00DEAD8400FFF7
                  EF00FFF7EF00FFF7E700FFEFE700FFEFE700FFEFDE00FFEFDE00FFEFD600FFE7
                  D600FFE7D600F7CEBD007B635A00C6BDB500FF00FF00FF00FF00DEAD8400FFFF
                  F700FFF7EF00FFF7EF00FFF7EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEF
                  DE00FFE7D600F7CEBD008C7B7300CEC6C600FF00FF00FF00FF00DEAD8400FFFF
                  F700FFFFF700FFF7F700FFF7EF00FFF7EF00FFF7E700FFEFE700FFD6CE00FFD6
                  CE00F7B5AD00B58C7B00AD9C9400DEDED600FF00FF00FF00FF00DEAD8400FFFF
                  FF00FFFFF700FFFFF700FFF7F700FFF7EF00FFF7EF00FFF7E700F7A54200F7A5
                  4200E794420094847B00CEC6C600F7EFEF00FF00FF00FF00FF00DEAD8400FFFF
                  FF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFF7EF00DEAD8400EFB5
                  73008C736300BDADAD00E7E7DE00FFFFF700FF00FF00FF00FF00DEAD8400DEAD
                  8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8C00D6A58400DEAD8400FFF7
                  EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                OnClick = SpeedButton2Click
              end
              object Label59: TLabel
                Left = 13
                Top = 166
                Width = 105
                Height = 13
                Caption = #1055#1088#1080#1095#1080#1085#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
              end
              object Label60: TLabel
                Left = 119
                Top = 166
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
              object Label61: TLabel
                Left = 382
                Top = 46
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
              object Label62: TLabel
                Left = 63
                Top = 5
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
              object Label63: TLabel
                Left = 89
                Top = 44
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
              object sgLang: TStringGrid
                Left = 162
                Top = 24
                Width = 342
                Height = 136
                Hint = #1048#1085#1086#1089#1090#1088#1072#1085#1085#1099#1081' '#1103#1079#1099#1082
                ColCount = 2
                DefaultColWidth = 50
                DefaultRowHeight = 18
                FixedCols = 0
                RowCount = 2
                GridLineWidth = 0
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
                TabOrder = 2
                OnSelectCell = sgLangSelectCell
                ColWidths = (
                  152
                  167)
              end
              object dbcbeSchool: TDBLookupComboboxEh
                Left = 14
                Top = 24
                Width = 141
                Height = 19
                Hint = #1059#1095#1077#1073#1085#1086#1077' '#1079#1072#1074#1077#1076#1077#1085#1080#1077
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                KeyField = 'ik_zaved'
                ListField = 'cName_zaved'
                ListSource = dmStudentData.dsZaved_stud
                TabOrder = 0
                Visible = True
              end
              object dbcbeCat: TDBLookupComboboxEh
                Left = 13
                Top = 101
                Width = 141
                Height = 19
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_kat_zach'
                ListField = 'Cname_kat_zach'
                ListSource = dmStudentData.dsKatZach
                TabOrder = 1
                Visible = True
              end
              object sgLangKeys: TStringGrid
                Left = 320
                Top = 68
                Width = 235
                Height = 12
                ColCount = 3
                FixedCols = 0
                RowCount = 1
                FixedRows = 0
                TabOrder = 3
                Visible = False
                RowHeights = (
                  24)
              end
              object dbcbeNumPrik: TDBLookupComboboxEh
                Left = 13
                Top = 141
                Width = 141
                Height = 19
                EditButtons = <
                  item
                    Action = actSelectOrder
                    Style = ebsEllipsisEh
                  end>
                Flat = True
                KeyField = 'Ik_prikaz'
                ListField = 'NN_Date'
                ListSource = dmPrikaz.dsPrikaz
                TabOrder = 4
                Visible = True
                OnChange = actCheckFieldsExecute
              end
              object dbcbeCause: TDBLookupComboboxEh
                Left = 13
                Top = 185
                Width = 491
                Height = 19
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_pric'
                ListField = 'Cname_pric'
                ListSource = dmCauses.dsJoinCause
                TabOrder = 5
                Visible = True
                OnChange = actCheckFieldsExecute
              end
              object eYearFinished: TDBNumberEditEh
                Left = 15
                Top = 60
                Width = 141
                Height = 19
                Alignment = taLeftJustify
                EditButton.Style = ebsUpDownEh
                EditButtons = <>
                Flat = True
                MaxValue = 3000.000000000000000000
                MinValue = 1.000000000000000000
                TabOrder = 6
                Visible = True
              end
            end
            object Panel6: TPanel
              Left = 1
              Top = 367
              Width = 548
              Height = 156
              Align = alClient
              TabOrder = 2
              object sbAddAddress: TSpeedButton
                Left = 510
                Top = 23
                Width = 26
                Height = 22
                Action = actAddAddress
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
                  4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
                  B8A494F4E3DAE4CFC2DDC5B7D9BEACD8BCA9D7BAA7D7B9A5D6B7A3D6B6A26349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
                  D7C9EED3C4EDD0BFECCDBBD6B7A3634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  B8A494F8ECE5F6E8E0F4E3DAF3DFD4634935F0D7C9EED3C4EDD0BFD7B9A56349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DA63
                  4935F1DBCFF0D7C9EED3C4D7BAA7634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9D8BCA96349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE563
                  4935F4E3DAF3DFD4F1DBCFD9BEAC634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  C0AB9CFDFAF9FCF7F5FBF4F0F9F0EB634935F6E8E0F4E3DAF3DFD4D9C0AF6349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
                  F0EBF8ECE5F6E8E0F4E3DAE1CDC0634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
                  A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              object sbDelAddress: TSpeedButton
                Left = 510
                Top = 51
                Width = 26
                Height = 22
                Action = actDelAddress
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
                  4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
                  B8A494F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBBEBCAB8EAC8B56349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
                  D7C9EED3C4EDD0BFECCDBBEBCAB8634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  B8A494F8ECE5F6E8E0F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBB6349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DAF3
                  DFD4F1DBCFF0D7C9EED3C4EDD0BF634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9EED3C46349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE5F6
                  E8E0F4E3DAF3DFD4F1DBCFF0D7C9634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  C0AB9CFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DAF3DFD4F1DBCF6349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
                  F0EBF8ECE5F6E8E0F4E3DAF3DFD4634935FF00FFFF00FFFF00FFFF00FFFF00FF
                  C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
                  35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
                  A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              object Label2: TLabel
                Left = 13
                Top = 5
                Width = 37
                Height = 13
                Caption = #1040#1076#1088#1077#1089#1072
              end
              object sgAddress: TStringGrid
                Left = 12
                Top = 24
                Width = 492
                Height = 116
                ColCount = 6
                DefaultRowHeight = 18
                FixedCols = 0
                RowCount = 2
                GridLineWidth = 0
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect]
                TabOrder = 0
                OnSelectCell = sgAddressSelectCell
                ColWidths = (
                  78
                  97
                  99
                  85
                  64
                  64)
              end
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 550
            Height = 524
            Align = alClient
            TabOrder = 0
            object Panel5: TPanel
              Left = 1
              Top = 1
              Width = 548
              Height = 108
              Align = alTop
              TabOrder = 0
              object Label27: TLabel
                Left = 13
                Top = 53
                Width = 85
                Height = 13
                Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
              end
              object Label28: TLabel
                Left = 277
                Top = 11
                Width = 85
                Height = 13
                Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
              end
              object Label29: TLabel
                Left = 13
                Top = 11
                Width = 67
                Height = 13
                Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
              end
              object Label52: TLabel
                Left = 82
                Top = 11
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
              object dbcbeNationality: TDBLookupComboboxEh
                Left = 276
                Top = 30
                Width = 255
                Height = 19
                Hint = #1053#1072#1094#1080#1103
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_nac'
                ListField = 'Cname_nac'
                ListSource = dmStudentData.dsNat
                TabOrder = 0
                Visible = True
                OnChange = actCheckFieldsExecute
              end
              object dbcbeCitizenship: TDBLookupComboboxEh
                Left = 13
                Top = 30
                Width = 257
                Height = 19
                Hint = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                KeyField = 'ik_grazd'
                ListField = 'c_grazd'
                ListSource = dmStudentData.dsCitizen
                TabOrder = 1
                Visible = True
                OnChange = actCheckFieldsExecute
              end
              object eBirthPlace: TDBEditEh
                Left = 13
                Top = 72
                Width = 520
                Height = 19
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                TabOrder = 2
                Visible = True
              end
            end
            object Panel2: TPanel
              Left = 1
              Top = 109
              Width = 548
              Height = 235
              Align = alTop
              TabOrder = 1
              object Label30: TLabel
                Left = 13
                Top = 101
                Width = 114
                Height = 13
                Caption = #1054#1073#1097#1077#1089#1090#1074#1077#1085#1085#1072#1103' '#1088#1072#1073#1086#1090#1072
              end
              object Label31: TLabel
                Left = 13
                Top = 17
                Width = 129
                Height = 13
                Caption = #1044#1086#1074#1091#1079#1086#1074#1089#1082#1072#1103' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1072
              end
              object Label32: TLabel
                Left = 13
                Top = 60
                Width = 93
                Height = 13
                Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1099#1081' '#1091#1095#1077#1090
              end
              object Label34: TLabel
                Left = 198
                Top = 141
                Width = 139
                Height = 13
                Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
              end
              object Label43: TLabel
                Left = 196
                Top = 103
                Width = 249
                Height = 13
                Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1074#1086#1077#1085#1085#1086#1081' '#1089#1083#1091#1078#1073#1077' / '#1074#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077
              end
              object Label42: TLabel
                Left = 196
                Top = 17
                Width = 39
                Height = 13
                Caption = #1052#1077#1076#1072#1083#1100
              end
              object Label53: TLabel
                Left = 235
                Top = 17
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
              object Label51: TLabel
                Left = 196
                Top = 60
                Width = 72
                Height = 13
                Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
              end
              object Label54: TLabel
                Left = 13
                Top = 141
                Width = 58
                Height = 13
                Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
              end
              object Label55: TLabel
                Left = 13
                Top = 181
                Width = 66
                Height = 13
                Caption = #1057#1090#1072#1078' '#1088#1072#1073#1086#1090#1099
              end
              object Label56: TLabel
                Left = 65
                Top = 201
                Width = 17
                Height = 13
                Caption = #1083#1077#1090
              end
              object Label57: TLabel
                Left = 141
                Top = 201
                Width = 44
                Height = 13
                Caption = #1084#1077#1089#1103#1094#1077#1074
              end
              object cbChildren: TCheckBox
                Left = 360
                Top = 25
                Width = 97
                Height = 18
                Caption = #1053#1072#1083#1080#1095#1080#1077' '#1076#1077#1090#1077#1081
                TabOrder = 5
              end
              object cbJob: TCheckBox
                Left = 360
                Top = 78
                Width = 118
                Height = 18
                Caption = #1053#1072#1083#1080#1095#1080#1077' '#1088#1072#1073#1086#1090#1099
                TabOrder = 8
              end
              object cbInvalid: TCheckBox
                Left = 360
                Top = 43
                Width = 97
                Height = 18
                Caption = #1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100
                TabOrder = 6
              end
              object cbAppNeed: TCheckBox
                Left = 360
                Top = 61
                Width = 164
                Height = 18
                Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100' '#1074' '#1086#1073#1097#1077#1078#1080#1090#1080#1080
                TabOrder = 7
              end
              object dbcbePreparation: TDBLookupComboboxEh
                Left = 13
                Top = 33
                Width = 172
                Height = 19
                Hint = #1044#1086#1074#1091#1079#1086#1074#1089#1082#1072#1103' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1072
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_podg'
                ListField = 'Cname_podg'
                ListSource = dmStudentData.dsPrep
                TabOrder = 0
                Visible = True
              end
              object dbcbeSocWork: TDBLookupComboboxEh
                Left = 13
                Top = 118
                Width = 171
                Height = 19
                Hint = #1042#1080#1076' '#1086#1073#1097#1077#1089#1090#1074#1077#1085#1085#1086#1081' '#1088#1072#1073#1086#1090#1099
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_ob_rab'
                ListField = 'Cname_ob_rab'
                ListSource = dmStudentData.dsJob
                TabOrder = 4
                Visible = True
              end
              object dbcbeSpecCount: TDBLookupComboboxEh
                Left = 13
                Top = 76
                Width = 172
                Height = 19
                Hint = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1099#1081' '#1091#1095#1077#1090
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_special_uchet'
                ListField = 'Cspecial_uchet'
                ListSource = dmStudentData.dsCount
                TabOrder = 2
                Visible = True
              end
              object dbcbeMilitaryState: TDBLookupComboboxEh
                Left = 196
                Top = 120
                Width = 337
                Height = 19
                Hint = #1042#1086#1077#1085#1085#1086#1077' '#1079#1074#1072#1085#1080#1077
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_voen_zvanie'
                ListField = 'Cvoen_zvanie'
                ListSource = dmStudentData.dsMilSt
                TabOrder = 3
                Visible = True
              end
              object dbcbeMedal: TDBLookupComboboxEh
                Left = 196
                Top = 33
                Width = 156
                Height = 19
                Hint = #1052#1077#1076#1072#1083#1100
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                KeyField = 'ik_medal'
                ListField = 'cmedal'
                ListSource = dmStudentData.dsMedal
                TabOrder = 1
                Visible = True
                OnChange = actCheckFieldsExecute
              end
              object eAddInfo: TMemo
                Left = 198
                Top = 157
                Width = 335
                Height = 60
                BevelInner = bvNone
                BorderStyle = bsNone
                MaxLength = 1000
                TabOrder = 9
                OnEnter = eAddInfoEnter
                OnExit = eAddInfoExit
              end
              object dbcbeEnterprise: TDBLookupComboboxEh
                Left = 196
                Top = 76
                Width = 156
                Height = 19
                Hint = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
                Alignment = taLeftJustify
                EditButtons = <
                  item
                    Action = actEnterprisePick
                    Style = ebsEllipsisEh
                  end>
                Flat = True
                KeyField = 'Ik_pred'
                ListField = 'Cname_pred'
                ListSource = dmStudentData.dsEnterprise
                TabOrder = 10
                Visible = True
              end
              object eDuty: TDBEditEh
                Left = 13
                Top = 157
                Width = 172
                Height = 19
                Alignment = taLeftJustify
                EditButtons = <>
                Flat = True
                TabOrder = 11
                Visible = True
              end
              object eXPyear: TDBNumberEditEh
                Left = 13
                Top = 198
                Width = 48
                Height = 19
                EditButtons = <>
                Flat = True
                MaxValue = 1000.000000000000000000
                TabOrder = 12
                Visible = True
              end
              object eXPMonth: TDBNumberEditEh
                Left = 87
                Top = 198
                Width = 51
                Height = 19
                EditButtons = <>
                Flat = True
                MaxValue = 11.000000000000000000
                TabOrder = 13
                Visible = True
              end
            end
            object Panel10: TPanel
              Left = 1
              Top = 344
              Width = 548
              Height = 179
              Align = alClient
              TabOrder = 2
              Visible = False
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = #1057#1077#1084#1100#1103' '#1080' '#1092#1072#1084#1080#1083#1080#1103
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object sbAddRel: TSpeedButton
            Left = 524
            Top = 25
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
              4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
              B8A494F4E3DAE4CFC2DDC5B7D9BEACD8BCA9D7BAA7D7B9A5D6B7A3D6B6A26349
              35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
              D7C9EED3C4EDD0BFECCDBBD6B7A3634935FF00FFFF00FFFF00FFFF00FFFF00FF
              B8A494F8ECE5F6E8E0F4E3DAF3DFD4634935F0D7C9EED3C4EDD0BFD7B9A56349
              35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DA63
              4935F1DBCFF0D7C9EED3C4D7BAA7634935FF00FFFF00FFFF00FFFF00FFFF00FF
              BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9D8BCA96349
              35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE563
              4935F4E3DAF3DFD4F1DBCFD9BEAC634935FF00FFFF00FFFF00FFFF00FFFF00FF
              C0AB9CFDFAF9FCF7F5FBF4F0F9F0EB634935F6E8E0F4E3DAF3DFD4D9C0AF6349
              35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
              F0EBF8ECE5F6E8E0F4E3DAE1CDC0634935FF00FFFF00FFFF00FFFF00FFFF00FF
              C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
              35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
              A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = sbAddRelClick
          end
          object sbDelRel: TSpeedButton
            Left = 524
            Top = 50
            Width = 23
            Height = 22
            Enabled = False
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
              4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
              B8A494F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBBEBCAB8EAC8B56349
              35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
              D7C9EED3C4EDD0BFECCDBBEBCAB8634935FF00FFFF00FFFF00FFFF00FFFF00FF
              B8A494F8ECE5F6E8E0F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBB6349
              35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DAF3
              DFD4F1DBCFF0D7C9EED3C4EDD0BF634935FF00FFFF00FFFF00FFFF00FFFF00FF
              BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9EED3C46349
              35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE5F6
              E8E0F4E3DAF3DFD4F1DBCFF0D7C9634935FF00FFFF00FFFF00FFFF00FFFF00FF
              C0AB9CFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DAF3DFD4F1DBCF6349
              35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
              F0EBF8ECE5F6E8E0F4E3DAF3DFD4634935FF00FFFF00FFFF00FFFF00FFFF00FF
              C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
              35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
              A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = sbDelRelClick
          end
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 550
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label38: TLabel
              Left = 0
              Top = 4
              Width = 113
              Height = 13
              Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077':'
            end
            object dbcbeFamState: TDBLookupComboboxEh
              Left = 117
              Top = 1
              Width = 168
              Height = 19
              Hint = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
              EditButtons = <>
              Flat = True
              KeyField = 'ik_sem_pol'
              ListField = 'csem_pol'
              ListSource = dmStudentData.dsSempol
              TabOrder = 0
              Visible = True
            end
          end
          object sgRelatives: TStringGrid
            Left = 0
            Top = 25
            Width = 518
            Height = 499
            Align = alLeft
            ColCount = 8
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            GridLineWidth = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect]
            TabOrder = 1
            OnSelectCell = sgRelativesSelectCell
            ColWidths = (
              119
              100
              128
              101
              102
              94
              107
              64)
          end
          object sgRelKeys: TStringGrid
            Left = -2
            Top = 399
            Width = 552
            Height = 31
            ColCount = 3
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            GridLineWidth = 0
            TabOrder = 2
            Visible = False
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object sbAddDoc: TSpeedButton
            Left = 524
            Top = 0
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
              4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
              B8A494F4E3DAE4CFC2DDC5B7D9BEACD8BCA9D7BAA7D7B9A5D6B7A3D6B6A26349
              35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
              D7C9EED3C4EDD0BFECCDBBD6B7A3634935FF00FFFF00FFFF00FFFF00FFFF00FF
              B8A494F8ECE5F6E8E0F4E3DAF3DFD4634935F0D7C9EED3C4EDD0BFD7B9A56349
              35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DA63
              4935F1DBCFF0D7C9EED3C4D7BAA7634935FF00FFFF00FFFF00FFFF00FFFF00FF
              BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9D8BCA96349
              35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE563
              4935F4E3DAF3DFD4F1DBCFD9BEAC634935FF00FFFF00FFFF00FFFF00FFFF00FF
              C0AB9CFDFAF9FCF7F5FBF4F0F9F0EB634935F6E8E0F4E3DAF3DFD4D9C0AF6349
              35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
              F0EBF8ECE5F6E8E0F4E3DAE1CDC0634935FF00FFFF00FFFF00FFFF00FFFF00FF
              C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
              35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
              A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = sbAddDocClick
          end
          object SbDelDoc: TSpeedButton
            Left = 524
            Top = 28
            Width = 23
            Height = 22
            Enabled = False
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
              4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
              B8A494F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBBEBCAB8EAC8B56349
              35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
              D7C9EED3C4EDD0BFECCDBBEBCAB8634935FF00FFFF00FFFF00FFFF00FFFF00FF
              B8A494F8ECE5F6E8E0F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBB6349
              35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DAF3
              DFD4F1DBCFF0D7C9EED3C4EDD0BF634935FF00FFFF00FFFF00FFFF00FFFF00FF
              BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9EED3C46349
              35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE5F6
              E8E0F4E3DAF3DFD4F1DBCFF0D7C9634935FF00FFFF00FFFF00FFFF00FFFF00FF
              C0AB9CFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DAF3DFD4F1DBCF6349
              35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
              F0EBF8ECE5F6E8E0F4E3DAF3DFD4634935FF00FFFF00FFFF00FFFF00FFFF00FF
              C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
              35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
              A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = SbDelDocClick
          end
          object sgDocs: TStringGrid
            Left = 0
            Top = 0
            Width = 517
            Height = 524
            Align = alLeft
            ColCount = 8
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            GridLineWidth = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowSelect]
            TabOrder = 0
            OnSelectCell = sgRelativesSelectCell
            ColWidths = (
              119
              100
              128
              101
              102
              94
              107
              64)
          end
          object sgDockeys: TStringGrid
            Left = -4
            Top = 399
            Width = 552
            Height = 31
            ColCount = 3
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            GridLineWidth = 0
            TabOrder = 1
            Visible = False
          end
        end
      end
    end
  end
  inherited actBaseDialog: TActionList
    Left = 504
    Top = 24
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    object actCheckFields: TAction
      Caption = 'actCheckFields'
      OnExecute = actCheckFieldsExecute
    end
    object actSAdresAutoFill: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1080#1079' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1072#1076#1088#1077#1089#1072
    end
    object actSelectOrder: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1088#1080#1082#1072#1079'...'
      OnExecute = actSelectOrderExecute
    end
    object actEnterprisePick: TAction
      Caption = 'actEnterprisePick'
      OnExecute = actEnterprisePickExecute
    end
    object actAddAddress: TAction
      OnExecute = actAddAddressExecute
    end
    object actDelAddress: TAction
      Enabled = False
      OnExecute = actDelAddressExecute
    end
  end
  object ilPages: TImageList
    Left = 481
    Top = 71
    Bitmap = {
      494C010105000900140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object odPhoto: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg)|*.jpg;*.jpeg|JPEG Image File (*.jpg)|*.jpg|JP' +
      'EG Image File (*.jpeg)|*.jpeg'
    Left = 442
    Top = 69
  end
end
