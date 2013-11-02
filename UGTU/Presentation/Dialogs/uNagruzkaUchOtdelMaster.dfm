object frmNagruzkaUchOtdelMaster: TfrmNagruzkaUchOtdelMaster
  Left = 0
  Top = 0
  Caption = #1052#1072#1089#1090#1077#1088' "'#1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1091#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080'"'
  ClientHeight = 566
  ClientWidth = 692
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 630
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 67
    Width = 692
    Height = 499
    ActivePage = tsPlanContingent
    Align = alClient
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 0
    object tsStart: TTabSheet
      Caption = 'tsStart'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        684
        489)
      object Bevel1: TBevel
        Left = -3
        Top = 452
        Width = 687
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
        ExplicitTop = 401
        ExplicitWidth = 657
      end
      object BitBtn2: TBitBtn
        Left = 493
        Top = 461
        Width = 91
        Height = 25
        Action = actStartToSemLength
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077' >>'
        TabOrder = 0
      end
      object BitBtn3: TBitBtn
        Left = 590
        Top = 461
        Width = 91
        Height = 25
        Action = actClose
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
      end
      object StaticText10: TStaticText
        Left = 25
        Top = 12
        Width = 512
        Height = 49
        AutoSize = False
        Caption = 
          #1044#1086#1073#1088#1086' '#1087#1086#1078#1072#1083#1086#1074#1072#1090#1100' '#1074' '#1084#1072#1089#1090#1077#1088' "'#1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1091#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085 +
          #1072#1075#1088#1091#1079#1082#1080'". '#1044#1072#1085#1085#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1084#1086#1078#1077#1090' '#1074#1072#1084' '#1087#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1076#1072#1085#1085 +
          #1099#1077' '#1076#1083#1103' '#1091#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1055#1055#1057' '#1059#1043#1058#1059' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1084#1080' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102 +
          #1097#1080#1093' '#1082#1072#1092#1077#1076#1088'.'
        TabOrder = 2
      end
      object StaticText11: TStaticText
        Left = 25
        Top = 66
        Width = 528
        Height = 36
        AutoSize = False
        Caption = 
          #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1091#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1079#1072#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1087#1086#1089#1083#1077 +
          #1076#1086#1074#1072#1090#1077#1083#1100#1085#1086#1084' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1095#1077#1090#1099#1088#1077#1093' '#1096#1072#1075#1086#1074':'
        TabOrder = 3
      end
      object StaticText12: TStaticText
        Left = 25
        Top = 274
        Width = 375
        Height = 20
        AutoSize = False
        Caption = #1044#1083#1103' '#1085#1072#1095#1072#1083#1072' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1044#1072#1083#1077#1077'".'
        TabOrder = 4
      end
      object StaticText13: TStaticText
        Left = 36
        Top = 111
        Width = 375
        Height = 20
        AutoSize = False
        Caption = '1. '#1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1080' '#1091#1095#1077#1073#1085#1099#1093' '#1089#1077#1084#1077#1089#1090#1088#1086#1074';'
        TabOrder = 5
      end
      object StaticText14: TStaticText
        Left = 36
        Top = 137
        Width = 469
        Height = 20
        AutoSize = False
        Caption = 
          '2. '#1042#1099#1073#1086#1088' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1085#1086#1088#1084' '#1074#1088#1077#1084#1077#1085#1080' '#1080' '#1087#1083#1072#1085#1080#1088#1091#1077#1084#1086#1075#1086' '#1082 +
          #1086#1085#1090#1080#1085#1075#1077#1085#1090#1072' '#1075#1088#1091#1087#1087';'
        TabOrder = 6
      end
      object StaticText15: TStaticText
        Left = 36
        Top = 163
        Width = 469
        Height = 20
        AutoSize = False
        Caption = '3. '#1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1085#1086#1088#1084' '#1074#1088#1077#1084#1077#1085#1080' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072';'
        TabOrder = 7
      end
      object StaticText16: TStaticText
        Left = 36
        Top = 189
        Width = 469
        Height = 20
        AutoSize = False
        Caption = 
          '4. '#1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1087#1083#1072#1085#1080#1088#1091#1077#1084#1086#1075#1086' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090#1072' '#1075#1088#1091#1087#1087' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1092#1072#1082#1091#1083#1100#1090#1077 +
          #1090#1072';'
        TabOrder = 8
      end
      object StaticText20: TStaticText
        Left = 36
        Top = 215
        Width = 469
        Height = 20
        AutoSize = False
        Caption = 
          '5. '#1042#1099#1073#1086#1088' '#1082#1072#1092#1077#1076#1088#1099' '#1076#1083#1103' '#1087#1086#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072#1084#1080' '#1076#1072#1085#1085#1086#1081' '#1082#1072#1092 +
          #1077#1076#1088#1099';'
        TabOrder = 9
      end
      object StaticText21: TStaticText
        Left = 36
        Top = 241
        Width = 375
        Height = 20
        AutoSize = False
        Caption = '6. '#1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1090#1086#1082#1072#1084#1080' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1082#1072#1092#1077#1076#1088#1099'.'
        TabOrder = 10
      end
    end
    object tsSemLength: TTabSheet
      Caption = 'tsSemLength'
      ImageIndex = 1
      TabVisible = False
      DesignSize = (
        684
        489)
      object Bevel2: TBevel
        Left = -3
        Top = 452
        Width = 687
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
        ExplicitTop = 401
        ExplicitWidth = 657
      end
      object Image7: TImage
        Left = 8
        Top = 465
        Width = 21
        Height = 16
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
        Picture.Data = {
          055449636F6E0000010001001010000001002000680400001600000028000000
          1000000020000000010020000000000040040000000000000000000000000000
          00000000000000000000000000000000000000008B3507468B35078D8B3507C7
          8B3507F08B3507F08B3507C78B35078D8B350746000000000000000000000000
          0000000000000000000000008B3507208B35078CA95A30FEC88968FFDDAF96FF
          E6BFAAFFE3B7A0FFDBAA90FFC88968FFA95A30FE8B35078C8B35072000000000
          00000000000000008B3507209F3D09F3C17B56FFE1A384FFE07E4FFFD54510FF
          E77B45FFE57135FFD64512FFE37E50FFE1A585FFC17B56FF9C3D0AF38B350720
          00000000000000008B35078CC37A55FFE2966FFFCC4A13FFC83509FFC83509FF
          FFFFFFFFF8D4C1FFDD330AFFDD330AFFD74A17FFD49272FFC17B56FF8B35078C
          000000008B350746AC5A2FFEE4A483FFD04C12FFC23A0DFFC33406FFC33406FF
          FFFFFFFFF8D4C1FFD73006FFD73006FFD73810FFD34915FFE1A585FFA95A30FE
          8B3507468B35078DCD8A67FFE5895CFFC03D0DFFC03B0DFFC03506FFC03506FF
          F2A882FFEE9362FFD02F04FFD02F04FFCF360DFFCD360EFFE4875BFFC88968FF
          8B35078D8B3507C7E2A98BFFD65318FFC13E0FFFC03A0DFFBE3506FFBE3506FF
          FFFFFFFFFDF5F0FFC82F02FFC82F02FFC7350BFFC5350AFFD0470FFFDEAC93FF
          8B3507C78B3507F0ECB497FFD95621FFCA4617FFC13D0DFFBC3405FFBC3405FF
          F7C9B1FFFFFFFFFFFADFD1FFC02F00FFBF3509FFBE3509FFC33908FFE9BFA9FF
          8B3507F08B3507F0F0BFA5FFDD5A26FFD04E1EFFC84517FFC33C0BFFC33C0BFF
          C33C0BFFFADFD1FFFFFFFFFFF5BEA1FFBC3509FFBC3509FFC03908FFECC6B1FF
          8B3507F08B3507C7E9B191FFE25F22FFDE5F2DFFE45104FFE97233FFE76723FF
          CF4A1AFFCF4A1AFFFCEAE0FFFFFFFFFFE76723FFB83809FFD45E28FFE3B095FF
          8B3507C78B35078DD58A64FFED8E5FFFEA6D3AFFEC8853FFFFFFFFFFF8D4C1FF
          DC5A29FFDC5A29FFFADFD1FFFFFFFFFFE97233FFCB4C1EFFE78D60FFCF8A66FF
          8B35078D8B350746B25B2DFEF1A781FFEB6529FFE45104FFFCEAE0FFFFFFFFFF
          FADFD1FFFADFD1FFFFFFFFFFF8D4C1FFD75B2AFFD35D26FFECB090FFAE5A2EFE
          8B350746000000008B35078CD37E51FFF29B6FFFEC6A2DFFE97233FFF7C9B1FF
          FFFFFFFFFDF5F0FFF5BEA1FFE2622EFFE16226FFF1AF8CFFCE7D52FF8B35078C
          00000000000000008B350720AA4007F3D37E51FFF2A881FFF29564FFED7A43FF
          F28351FFF28656FFEB733DFFF0986CFFF2B291FFD07C51FFA63E07F38B350720
          0000000000000000000000008B3507208B35078CB25B2DFED88C64FFEDB293FF
          F6C3A8FFF5BD9FFFECAF8EFFD78C64FFB25B2DFE8B35078C8B35072000000000
          00000000000000000000000000000000000000008B3507468B35078D8B3507C7
          8B3507F08B3507F08B3507C78B35078D8B350746000000000000000000000000
          00000000F00F33FFC00334FF800134FF800135FF000039FF000055FF0000E8F9
          00006CD800006CF50000F9FF000064FF00003DFF800135FF800133FFC0032DFF
          F00F1CFF}
        OnMouseEnter = Label5MouseEnter
        OnMouseLeave = Label5MouseLeave
      end
      object Label5: TLabel
        Left = 31
        Top = 467
        Width = 43
        Height = 13
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
        Caption = #1057#1087#1088#1072#1074#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnMouseEnter = Label5MouseEnter
        OnMouseLeave = Label5MouseLeave
      end
      object BitBtn4: TBitBtn
        Left = 493
        Top = 461
        Width = 91
        Height = 25
        Action = actSemLengthToSelFac
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077' >>'
        TabOrder = 0
      end
      object BitBtn5: TBitBtn
        Left = 590
        Top = 461
        Width = 91
        Height = 25
        Action = actClose
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
      end
      object BitBtn6: TBitBtn
        Left = 396
        Top = 461
        Width = 91
        Height = 25
        Action = actBack
        Anchors = [akRight, akBottom]
        Caption = '<< '#1053#1072#1079#1072#1076
        TabOrder = 2
      end
      inline fmNagruzkaMain1: TfmNagruzkaMain
        Left = 0
        Top = -4
        Width = 684
        Height = 456
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 3
        ExplicitTop = -4
        ExplicitWidth = 684
        ExplicitHeight = 456
        inherited Panel1: TPanel
          Width = 684
          Height = 456
          BevelInner = bvNone
          BevelOuter = bvNone
          ExplicitWidth = 684
          ExplicitHeight = 456
          inherited Bevel6: TBevel
            Left = 0
            Top = 0
            Width = 684
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 684
          end
          inherited PageControl1: TPageControl
            Left = 0
            Top = 4
            Width = 684
            Height = 452
            ExplicitLeft = 0
            ExplicitTop = 4
            ExplicitWidth = 684
            ExplicitHeight = 452
            inherited tsFac: TTabSheet
              ExplicitLeft = 4
              ExplicitTop = 27
              ExplicitWidth = 690
              ExplicitHeight = 339
              inherited ToolBar1: TToolBar
                inherited ToolButton10: TToolButton
                  ExplicitWidth = 144
                end
              end
              inherited DBGridEh1: TDBGridEh
                Height = 313
              end
              inherited Panel2: TPanel
                Top = 342
                Width = 676
                ExplicitTop = 342
                ExplicitWidth = 676
              end
            end
          end
        end
        inherited pnlSave: TPanel
          Top = 419
          Width = 684
          ExplicitTop = 411
          ExplicitWidth = 684
          inherited bbSave: TBitBtn
            Left = 515
            ExplicitLeft = 515
          end
          inherited bbUndo: TBitBtn
            Left = 502
            ExplicitLeft = 502
          end
        end
      end
    end
    object tsSelectFac: TTabSheet
      Caption = 'tsSelectFac'
      ImageIndex = 2
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        684
        489)
      object Bevel3: TBevel
        Left = -3
        Top = 452
        Width = 687
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
        ExplicitTop = 401
        ExplicitWidth = 657
      end
      object Label13: TLabel
        Left = 39
        Top = 45
        Width = 60
        Height = 13
        Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090':'
      end
      object BitBtn7: TBitBtn
        Left = 493
        Top = 461
        Width = 91
        Height = 25
        Action = actSelFacToNOT
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077' >>'
        TabOrder = 0
      end
      object BitBtn8: TBitBtn
        Left = 590
        Top = 461
        Width = 91
        Height = 25
        Action = actClose
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
      end
      object BitBtn9: TBitBtn
        Left = 396
        Top = 461
        Width = 91
        Height = 25
        Action = actBack
        Anchors = [akRight, akBottom]
        Caption = '<< '#1053#1072#1079#1072#1076
        TabOrder = 2
      end
      object StaticText1: TStaticText
        Left = 25
        Top = 14
        Width = 382
        Height = 19
        AutoSize = False
        Caption = 
          '1. '#1042#1099#1073#1077#1088#1080#1090#1077' '#1080#1079' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1085#1086#1075#1086' '#1085#1080#1078#1077' '#1089#1087#1080#1089#1082#1072' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081' '#1092#1072#1082#1091#1083#1100#1090#1077#1090 +
          ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object StaticText2: TStaticText
        Left = 25
        Top = 119
        Width = 304
        Height = 17
        Caption = '3. '#1055#1077#1088#1077#1081#1076#1080#1090#1077' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1096#1072#1075#1091', '#1085#1072#1078#1072#1074' '#1082#1085#1086#1087#1082#1091' "'#1044#1072#1083#1077#1077'".'
        TabOrder = 4
      end
      object dbcbFaculty: TDBLookupComboboxEh
        Left = 105
        Top = 43
        Width = 366
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        KeyField = 'ik_fac'
        ListField = 'cname_fac'
        TabOrder = 5
        Visible = True
      end
      object StaticText9: TStaticText
        Left = 25
        Top = 78
        Width = 446
        Height = 35
        AutoSize = False
        Caption = 
          '2. '#1055#1086' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1102' '#1088#1072#1073#1086#1090#1099' '#1084#1072#1089#1090#1077#1088#1072' '#1074#1099' '#1089#1084#1086#1078#1077#1090#1077' '#1074#1077#1088#1085#1091#1090#1100#1089#1103' '#1082' '#1076#1072#1085#1085#1086#1084#1091' '#1096 +
          #1072#1075#1091' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072'      '#1076#1088#1091#1075#1086#1075#1086' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072'.'
        TabOrder = 6
      end
    end
    object tsNormOfTime: TTabSheet
      Caption = 'tsNormOfTime'
      ImageIndex = 3
      TabVisible = False
      DesignSize = (
        684
        489)
      object Bevel4: TBevel
        Left = -3
        Top = 452
        Width = 687
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
        ExplicitTop = 401
        ExplicitWidth = 657
      end
      object Image8: TImage
        Left = 8
        Top = 465
        Width = 21
        Height = 16
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
        Picture.Data = {
          055449636F6E0000010001001010000001002000680400001600000028000000
          1000000020000000010020000000000040040000000000000000000000000000
          00000000000000000000000000000000000000008B3507468B35078D8B3507C7
          8B3507F08B3507F08B3507C78B35078D8B350746000000000000000000000000
          0000000000000000000000008B3507208B35078CA95A30FEC88968FFDDAF96FF
          E6BFAAFFE3B7A0FFDBAA90FFC88968FFA95A30FE8B35078C8B35072000000000
          00000000000000008B3507209F3D09F3C17B56FFE1A384FFE07E4FFFD54510FF
          E77B45FFE57135FFD64512FFE37E50FFE1A585FFC17B56FF9C3D0AF38B350720
          00000000000000008B35078CC37A55FFE2966FFFCC4A13FFC83509FFC83509FF
          FFFFFFFFF8D4C1FFDD330AFFDD330AFFD74A17FFD49272FFC17B56FF8B35078C
          000000008B350746AC5A2FFEE4A483FFD04C12FFC23A0DFFC33406FFC33406FF
          FFFFFFFFF8D4C1FFD73006FFD73006FFD73810FFD34915FFE1A585FFA95A30FE
          8B3507468B35078DCD8A67FFE5895CFFC03D0DFFC03B0DFFC03506FFC03506FF
          F2A882FFEE9362FFD02F04FFD02F04FFCF360DFFCD360EFFE4875BFFC88968FF
          8B35078D8B3507C7E2A98BFFD65318FFC13E0FFFC03A0DFFBE3506FFBE3506FF
          FFFFFFFFFDF5F0FFC82F02FFC82F02FFC7350BFFC5350AFFD0470FFFDEAC93FF
          8B3507C78B3507F0ECB497FFD95621FFCA4617FFC13D0DFFBC3405FFBC3405FF
          F7C9B1FFFFFFFFFFFADFD1FFC02F00FFBF3509FFBE3509FFC33908FFE9BFA9FF
          8B3507F08B3507F0F0BFA5FFDD5A26FFD04E1EFFC84517FFC33C0BFFC33C0BFF
          C33C0BFFFADFD1FFFFFFFFFFF5BEA1FFBC3509FFBC3509FFC03908FFECC6B1FF
          8B3507F08B3507C7E9B191FFE25F22FFDE5F2DFFE45104FFE97233FFE76723FF
          CF4A1AFFCF4A1AFFFCEAE0FFFFFFFFFFE76723FFB83809FFD45E28FFE3B095FF
          8B3507C78B35078DD58A64FFED8E5FFFEA6D3AFFEC8853FFFFFFFFFFF8D4C1FF
          DC5A29FFDC5A29FFFADFD1FFFFFFFFFFE97233FFCB4C1EFFE78D60FFCF8A66FF
          8B35078D8B350746B25B2DFEF1A781FFEB6529FFE45104FFFCEAE0FFFFFFFFFF
          FADFD1FFFADFD1FFFFFFFFFFF8D4C1FFD75B2AFFD35D26FFECB090FFAE5A2EFE
          8B350746000000008B35078CD37E51FFF29B6FFFEC6A2DFFE97233FFF7C9B1FF
          FFFFFFFFFDF5F0FFF5BEA1FFE2622EFFE16226FFF1AF8CFFCE7D52FF8B35078C
          00000000000000008B350720AA4007F3D37E51FFF2A881FFF29564FFED7A43FF
          F28351FFF28656FFEB733DFFF0986CFFF2B291FFD07C51FFA63E07F38B350720
          0000000000000000000000008B3507208B35078CB25B2DFED88C64FFEDB293FF
          F6C3A8FFF5BD9FFFECAF8EFFD78C64FFB25B2DFE8B35078C8B35072000000000
          00000000000000000000000000000000000000008B3507468B35078D8B3507C7
          8B3507F08B3507F08B3507C78B35078D8B350746000000000000000000000000
          00000000F00F33FFC00334FF800134FF800135FF000039FF000055FF0000E8F9
          00006CD800006CF50000F9FF000064FF00003DFF800135FF800133FFC0032DFF
          F00F1CFF}
        OnMouseEnter = Label6MouseEnter
        OnMouseLeave = Label6MouseLeave
      end
      object Label6: TLabel
        Left = 31
        Top = 467
        Width = 43
        Height = 13
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
        Caption = #1057#1087#1088#1072#1074#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnMouseEnter = Label6MouseEnter
        OnMouseLeave = Label6MouseLeave
      end
      object BitBtn10: TBitBtn
        Left = 493
        Top = 461
        Width = 91
        Height = 25
        Action = actNOTToPC
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077' >>'
        TabOrder = 0
      end
      object BitBtn11: TBitBtn
        Left = 590
        Top = 461
        Width = 91
        Height = 25
        Action = actClose
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
      end
      object BitBtn12: TBitBtn
        Left = 396
        Top = 461
        Width = 91
        Height = 25
        Action = actBack
        Anchors = [akRight, akBottom]
        Caption = '<< '#1053#1072#1079#1072#1076
        TabOrder = 2
      end
      inline fmNagruzkaFac1: TfmNagruzkaFac
        Left = 0
        Top = -4
        Width = 684
        Height = 454
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 3
        ExplicitTop = -4
        ExplicitWidth = 684
        ExplicitHeight = 454
        inherited Panel1: TPanel
          Width = 684
          Height = 454
          BevelInner = bvNone
          BevelOuter = bvNone
          ExplicitWidth = 684
          ExplicitHeight = 454
          inherited Bevel6: TBevel
            Left = 0
            Top = 0
            Width = 684
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 684
          end
          inherited PageControl1: TPageControl
            Left = 0
            Top = 4
            Width = 684
            Height = 450
            ExplicitLeft = 0
            ExplicitTop = 4
            ExplicitWidth = 684
            ExplicitHeight = 450
            inherited tsDepartments: TTabSheet
              ExplicitLeft = 4
              ExplicitTop = 27
              ExplicitWidth = 575
              ExplicitHeight = 379
              inherited DBGridEh1: TDBGridEh
                Height = 357
              end
            end
            inherited tsTimeNorm: TTabSheet
              ExplicitWidth = 676
              ExplicitHeight = 383
              inherited Bevel2: TBevel
                Top = 382
              end
              inherited ToolBar2: TToolBar
                Width = 676
                Height = 24
                EdgeBorders = [ebLeft, ebTop, ebRight]
                ExplicitWidth = 676
                ExplicitHeight = 24
              end
              inherited Panel2: TPanel
                Top = 24
                Width = 676
                Height = 361
                ExplicitTop = 24
                ExplicitWidth = 676
                ExplicitHeight = 361
                inherited Panel6: TPanel
                  inherited dbcbNorm: TDBLookupComboboxEh
                    Width = 566
                    ExplicitWidth = 566
                  end
                end
                inherited Panel7: TPanel
                  inherited dbgVidZanyat: TDBGridEh
                    Width = 667
                    Height = 320
                  end
                end
                inherited Panel8: TPanel
                  Height = 159
                  ExplicitHeight = 159
                end
              end
              inherited Panel5: TPanel
                Top = 386
                ExplicitTop = 386
              end
            end
            inherited tsContingent: TTabSheet
              ExplicitLeft = 0
              ExplicitTop = 27
              ExplicitWidth = 0
              ExplicitHeight = 379
              inherited Bevel1: TBevel
                Top = 342
                ExplicitTop = 342
              end
              inherited Panel4: TPanel
                Top = 347
                ExplicitTop = 347
                inherited ToolBar4: TToolBar
                  Left = 251
                  ExplicitLeft = 251
                  inherited BitBtn1: TToolButton
                    ExplicitWidth = 137
                  end
                  inherited BitBtn2: TToolButton
                    ExplicitWidth = 142
                  end
                end
              end
            end
          end
        end
        inherited pnlSave: TPanel
          Top = 417
          Width = 684
          ExplicitTop = 415
          ExplicitWidth = 684
          inherited bbSave: TBitBtn
            Left = 515
            ExplicitLeft = 515
          end
          inherited bbUndo: TBitBtn
            Left = 505
            ExplicitLeft = 505
          end
        end
      end
    end
    object tsPlanContingent: TTabSheet
      Caption = 'tsPlanContingent'
      ImageIndex = 4
      TabVisible = False
      DesignSize = (
        684
        489)
      object Bevel5: TBevel
        Left = -3
        Top = 452
        Width = 687
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
        ExplicitTop = 401
        ExplicitWidth = 657
      end
      object Image9: TImage
        Left = 8
        Top = 465
        Width = 21
        Height = 16
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
        Picture.Data = {
          055449636F6E0000010001001010000001002000680400001600000028000000
          1000000020000000010020000000000040040000000000000000000000000000
          00000000000000000000000000000000000000008B3507468B35078D8B3507C7
          8B3507F08B3507F08B3507C78B35078D8B350746000000000000000000000000
          0000000000000000000000008B3507208B35078CA95A30FEC88968FFDDAF96FF
          E6BFAAFFE3B7A0FFDBAA90FFC88968FFA95A30FE8B35078C8B35072000000000
          00000000000000008B3507209F3D09F3C17B56FFE1A384FFE07E4FFFD54510FF
          E77B45FFE57135FFD64512FFE37E50FFE1A585FFC17B56FF9C3D0AF38B350720
          00000000000000008B35078CC37A55FFE2966FFFCC4A13FFC83509FFC83509FF
          FFFFFFFFF8D4C1FFDD330AFFDD330AFFD74A17FFD49272FFC17B56FF8B35078C
          000000008B350746AC5A2FFEE4A483FFD04C12FFC23A0DFFC33406FFC33406FF
          FFFFFFFFF8D4C1FFD73006FFD73006FFD73810FFD34915FFE1A585FFA95A30FE
          8B3507468B35078DCD8A67FFE5895CFFC03D0DFFC03B0DFFC03506FFC03506FF
          F2A882FFEE9362FFD02F04FFD02F04FFCF360DFFCD360EFFE4875BFFC88968FF
          8B35078D8B3507C7E2A98BFFD65318FFC13E0FFFC03A0DFFBE3506FFBE3506FF
          FFFFFFFFFDF5F0FFC82F02FFC82F02FFC7350BFFC5350AFFD0470FFFDEAC93FF
          8B3507C78B3507F0ECB497FFD95621FFCA4617FFC13D0DFFBC3405FFBC3405FF
          F7C9B1FFFFFFFFFFFADFD1FFC02F00FFBF3509FFBE3509FFC33908FFE9BFA9FF
          8B3507F08B3507F0F0BFA5FFDD5A26FFD04E1EFFC84517FFC33C0BFFC33C0BFF
          C33C0BFFFADFD1FFFFFFFFFFF5BEA1FFBC3509FFBC3509FFC03908FFECC6B1FF
          8B3507F08B3507C7E9B191FFE25F22FFDE5F2DFFE45104FFE97233FFE76723FF
          CF4A1AFFCF4A1AFFFCEAE0FFFFFFFFFFE76723FFB83809FFD45E28FFE3B095FF
          8B3507C78B35078DD58A64FFED8E5FFFEA6D3AFFEC8853FFFFFFFFFFF8D4C1FF
          DC5A29FFDC5A29FFFADFD1FFFFFFFFFFE97233FFCB4C1EFFE78D60FFCF8A66FF
          8B35078D8B350746B25B2DFEF1A781FFEB6529FFE45104FFFCEAE0FFFFFFFFFF
          FADFD1FFFADFD1FFFFFFFFFFF8D4C1FFD75B2AFFD35D26FFECB090FFAE5A2EFE
          8B350746000000008B35078CD37E51FFF29B6FFFEC6A2DFFE97233FFF7C9B1FF
          FFFFFFFFFDF5F0FFF5BEA1FFE2622EFFE16226FFF1AF8CFFCE7D52FF8B35078C
          00000000000000008B350720AA4007F3D37E51FFF2A881FFF29564FFED7A43FF
          F28351FFF28656FFEB733DFFF0986CFFF2B291FFD07C51FFA63E07F38B350720
          0000000000000000000000008B3507208B35078CB25B2DFED88C64FFEDB293FF
          F6C3A8FFF5BD9FFFECAF8EFFD78C64FFB25B2DFE8B35078C8B35072000000000
          00000000000000000000000000000000000000008B3507468B35078D8B3507C7
          8B3507F08B3507F08B3507C78B35078D8B350746000000000000000000000000
          00000000F00F33FFC00334FF800134FF800135FF000039FF000055FF0000E8F9
          00006CD800006CF50000F9FF000064FF00003DFF800135FF800133FFC0032DFF
          F00F1CFF}
        OnMouseEnter = Label7MouseEnter
        OnMouseLeave = Label7MouseLeave
      end
      object Label7: TLabel
        Left = 31
        Top = 467
        Width = 43
        Height = 13
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
        Caption = #1057#1087#1088#1072#1074#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnMouseEnter = Label7MouseEnter
        OnMouseLeave = Label7MouseLeave
      end
      object BitBtn13: TBitBtn
        Left = 493
        Top = 461
        Width = 91
        Height = 25
        Action = actPCToSelDep
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077' >>'
        TabOrder = 0
      end
      object BitBtn14: TBitBtn
        Left = 590
        Top = 461
        Width = 91
        Height = 25
        Action = actClose
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
      end
      object BitBtn15: TBitBtn
        Left = 396
        Top = 461
        Width = 91
        Height = 25
        Action = actBack
        Anchors = [akRight, akBottom]
        Caption = '<< '#1053#1072#1079#1072#1076
        TabOrder = 2
      end
      inline fmNagruzkaFac2: TfmNagruzkaFac
        Left = 0
        Top = -4
        Width = 684
        Height = 456
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 3
        ExplicitTop = -4
        ExplicitWidth = 684
        ExplicitHeight = 456
        inherited Panel1: TPanel
          Width = 684
          Height = 456
          BevelInner = bvNone
          BevelOuter = bvNone
          ExplicitWidth = 684
          ExplicitHeight = 456
          inherited Bevel6: TBevel
            Left = 0
            Top = 0
            Width = 684
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 684
          end
          inherited PageControl1: TPageControl
            Left = 0
            Top = 4
            Width = 684
            Height = 452
            ActivePage = fmNagruzkaFac2.tsContingent
            ExplicitLeft = 0
            ExplicitTop = 4
            ExplicitWidth = 684
            ExplicitHeight = 452
            inherited tsDepartments: TTabSheet
              ExplicitLeft = 4
              ExplicitTop = 27
              ExplicitWidth = 575
              ExplicitHeight = 379
              inherited DBGridEh1: TDBGridEh
                Height = 357
              end
            end
            inherited tsTimeNorm: TTabSheet
              ExplicitTop = 27
              ExplicitHeight = 379
              inherited Bevel2: TBevel
                Top = 382
              end
              inherited Panel2: TPanel
                Height = 357
                ExplicitHeight = 357
                inherited Panel8: TPanel
                  Height = 159
                  ExplicitHeight = 159
                end
              end
              inherited Panel5: TPanel
                Top = 386
                ExplicitTop = 386
              end
            end
            inherited tsContingent: TTabSheet
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 676
              ExplicitHeight = 420
              inherited Bevel1: TBevel
                Top = 390
                Width = 676
                ExplicitTop = 346
                ExplicitWidth = 676
              end
              inherited Panel4: TPanel
                Top = 394
                Width = 676
                ExplicitTop = 394
                ExplicitWidth = 676
                inherited ToolBar4: TToolBar
                  Left = 376
                  ExplicitLeft = 376
                  inherited BitBtn1: TToolButton
                    ExplicitWidth = 146
                  end
                  inherited BitBtn2: TToolButton
                    ExplicitWidth = 149
                  end
                end
              end
            end
          end
        end
        inherited pnlSave: TPanel
          Top = 419
          Width = 684
          ExplicitTop = 419
          ExplicitWidth = 684
          inherited bbSave: TBitBtn
            Left = 515
            ExplicitLeft = 515
          end
          inherited bbUndo: TBitBtn
            Left = 505
            ExplicitLeft = 505
          end
        end
      end
    end
    object tsSelectDep: TTabSheet
      Caption = 'tsSelectDep'
      ImageIndex = 6
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        684
        489)
      object Label10: TLabel
        Left = 39
        Top = 40
        Width = 50
        Height = 13
        Caption = #1050#1072#1092#1077#1076#1088#1072':'
      end
      object Bevel7: TBevel
        Left = -3
        Top = 452
        Width = 687
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
        ExplicitTop = 401
        ExplicitWidth = 657
      end
      object StaticText24: TStaticText
        Left = 25
        Top = 111
        Width = 304
        Height = 17
        Caption = '3. '#1055#1077#1088#1077#1081#1076#1080#1090#1077' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1096#1072#1075#1091', '#1085#1072#1078#1072#1074' '#1082#1085#1086#1087#1082#1091' "'#1044#1072#1083#1077#1077'".'
        TabOrder = 0
      end
      object StaticText25: TStaticText
        Left = 25
        Top = 12
        Width = 382
        Height = 19
        AutoSize = False
        Caption = '1. '#1042#1099#1073#1077#1088#1080#1090#1077' '#1080#1079' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1085#1086#1075#1086' '#1085#1080#1078#1077' '#1089#1087#1080#1089#1082#1072' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1091#1102' '#1082#1072#1092#1077#1076#1088#1091':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object StaticText26: TStaticText
        Left = 25
        Top = 69
        Width = 446
        Height = 35
        AutoSize = False
        Caption = 
          '2. '#1055#1086' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1102' '#1088#1072#1073#1086#1090#1099' '#1084#1072#1089#1090#1077#1088#1072' '#1074#1099' '#1089#1084#1086#1078#1077#1090#1077' '#1074#1077#1088#1085#1091#1090#1100#1089#1103' '#1082' '#1076#1072#1085#1085#1086#1084#1091' '#1096 +
          #1072#1075#1091' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072'      '#1076#1088#1091#1075#1086#1081' '#1082#1072#1092#1077#1076#1088#1099'.'
        TabOrder = 2
      end
      object dbcbDep: TDBLookupComboboxEh
        Left = 95
        Top = 38
        Width = 376
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        KeyField = 'ik_kaf'
        ListField = 'cName_kaf'
        TabOrder = 3
        Visible = True
      end
      object BitBtn1: TBitBtn
        Left = 396
        Top = 461
        Width = 91
        Height = 25
        Action = actBack
        Anchors = [akRight, akBottom]
        Caption = '<< '#1053#1072#1079#1072#1076
        TabOrder = 4
      end
      object BitBtn19: TBitBtn
        Left = 590
        Top = 461
        Width = 91
        Height = 25
        Action = actClose
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 5
      end
      object BitBtn20: TBitBtn
        Left = 493
        Top = 461
        Width = 91
        Height = 25
        Action = actSelDepToCP
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077' >>'
        TabOrder = 6
      end
    end
    object tsCreatePotok: TTabSheet
      Caption = 'tsCreatePotok'
      ImageIndex = 7
      TabVisible = False
      DesignSize = (
        684
        489)
      object Bevel8: TBevel
        Left = -3
        Top = 452
        Width = 687
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
        ExplicitTop = 401
        ExplicitWidth = 657
      end
      object Image12: TImage
        Left = 8
        Top = 465
        Width = 21
        Height = 16
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
        Picture.Data = {
          055449636F6E0000010001001010000001002000680400001600000028000000
          1000000020000000010020000000000040040000000000000000000000000000
          00000000000000000000000000000000000000008B3507468B35078D8B3507C7
          8B3507F08B3507F08B3507C78B35078D8B350746000000000000000000000000
          0000000000000000000000008B3507208B35078CA95A30FEC88968FFDDAF96FF
          E6BFAAFFE3B7A0FFDBAA90FFC88968FFA95A30FE8B35078C8B35072000000000
          00000000000000008B3507209F3D09F3C17B56FFE1A384FFE07E4FFFD54510FF
          E77B45FFE57135FFD64512FFE37E50FFE1A585FFC17B56FF9C3D0AF38B350720
          00000000000000008B35078CC37A55FFE2966FFFCC4A13FFC83509FFC83509FF
          FFFFFFFFF8D4C1FFDD330AFFDD330AFFD74A17FFD49272FFC17B56FF8B35078C
          000000008B350746AC5A2FFEE4A483FFD04C12FFC23A0DFFC33406FFC33406FF
          FFFFFFFFF8D4C1FFD73006FFD73006FFD73810FFD34915FFE1A585FFA95A30FE
          8B3507468B35078DCD8A67FFE5895CFFC03D0DFFC03B0DFFC03506FFC03506FF
          F2A882FFEE9362FFD02F04FFD02F04FFCF360DFFCD360EFFE4875BFFC88968FF
          8B35078D8B3507C7E2A98BFFD65318FFC13E0FFFC03A0DFFBE3506FFBE3506FF
          FFFFFFFFFDF5F0FFC82F02FFC82F02FFC7350BFFC5350AFFD0470FFFDEAC93FF
          8B3507C78B3507F0ECB497FFD95621FFCA4617FFC13D0DFFBC3405FFBC3405FF
          F7C9B1FFFFFFFFFFFADFD1FFC02F00FFBF3509FFBE3509FFC33908FFE9BFA9FF
          8B3507F08B3507F0F0BFA5FFDD5A26FFD04E1EFFC84517FFC33C0BFFC33C0BFF
          C33C0BFFFADFD1FFFFFFFFFFF5BEA1FFBC3509FFBC3509FFC03908FFECC6B1FF
          8B3507F08B3507C7E9B191FFE25F22FFDE5F2DFFE45104FFE97233FFE76723FF
          CF4A1AFFCF4A1AFFFCEAE0FFFFFFFFFFE76723FFB83809FFD45E28FFE3B095FF
          8B3507C78B35078DD58A64FFED8E5FFFEA6D3AFFEC8853FFFFFFFFFFF8D4C1FF
          DC5A29FFDC5A29FFFADFD1FFFFFFFFFFE97233FFCB4C1EFFE78D60FFCF8A66FF
          8B35078D8B350746B25B2DFEF1A781FFEB6529FFE45104FFFCEAE0FFFFFFFFFF
          FADFD1FFFADFD1FFFFFFFFFFF8D4C1FFD75B2AFFD35D26FFECB090FFAE5A2EFE
          8B350746000000008B35078CD37E51FFF29B6FFFEC6A2DFFE97233FFF7C9B1FF
          FFFFFFFFFDF5F0FFF5BEA1FFE2622EFFE16226FFF1AF8CFFCE7D52FF8B35078C
          00000000000000008B350720AA4007F3D37E51FFF2A881FFF29564FFED7A43FF
          F28351FFF28656FFEB733DFFF0986CFFF2B291FFD07C51FFA63E07F38B350720
          0000000000000000000000008B3507208B35078CB25B2DFED88C64FFEDB293FF
          F6C3A8FFF5BD9FFFECAF8EFFD78C64FFB25B2DFE8B35078C8B35072000000000
          00000000000000000000000000000000000000008B3507468B35078D8B3507C7
          8B3507F08B3507F08B3507C78B35078D8B350746000000000000000000000000
          00000000F00F33FFC00334FF800134FF800135FF000039FF000055FF0000E8F9
          00006CD800006CF50000F9FF000064FF00003DFF800135FF800133FFC0032DFF
          F00F1CFF}
        OnMouseEnter = Label14MouseEnter
        OnMouseLeave = Label14MouseLeave
      end
      object Label14: TLabel
        Left = 31
        Top = 467
        Width = 43
        Height = 13
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
        Caption = #1057#1087#1088#1072#1074#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnMouseEnter = Label14MouseEnter
        OnMouseLeave = Label14MouseLeave
      end
      object BitBtn21: TBitBtn
        Left = 493
        Top = 461
        Width = 91
        Height = 25
        Action = actCPToFinish
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077' >>'
        TabOrder = 0
      end
      object BitBtn22: TBitBtn
        Left = 590
        Top = 461
        Width = 91
        Height = 25
        Action = actClose
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
      end
      object BitBtn23: TBitBtn
        Left = 396
        Top = 461
        Width = 91
        Height = 25
        Action = actBack
        Anchors = [akRight, akBottom]
        Caption = '<< '#1053#1072#1079#1072#1076
        TabOrder = 2
      end
      inline fmDepCreatePotok: TfmNagruzkaDep
        Left = 0
        Top = -4
        Width = 684
        Height = 454
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 3
        ExplicitTop = -4
        ExplicitWidth = 684
        ExplicitHeight = 454
        inherited Panel1: TPanel
          Width = 684
          Height = 454
          BevelInner = bvNone
          BevelOuter = bvNone
          ExplicitWidth = 684
          ExplicitHeight = 454
          inherited Bevel6: TBevel
            Left = 0
            Top = 0
            Width = 684
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 684
          end
          inherited PageControl1: TPageControl
            Left = 0
            Top = 4
            Width = 684
            Height = 450
            ExplicitLeft = 0
            ExplicitTop = 4
            ExplicitWidth = 684
            ExplicitHeight = 450
            inherited tsPrepods: TTabSheet
              ExplicitLeft = 4
              ExplicitTop = 27
              ExplicitWidth = 653
              ExplicitHeight = 486
              inherited ToolBar1: TToolBar
                inherited ToolButton25: TToolButton
                  ExplicitWidth = 164
                end
              end
              inherited tvPrepods: TTreeView
                Height = 462
                ExplicitHeight = 462
              end
            end
            inherited tsPotok: TTabSheet
              ExplicitLeft = 4
              ExplicitTop = 27
              ExplicitWidth = 653
              ExplicitHeight = 486
              inherited potokTreeView: TTreeView
                Height = 462
                ExplicitHeight = 462
              end
              inherited Panel2: TPanel
                ExplicitWidth = 676
                inherited ToolBar3: TToolBar
                  Width = 676
                  Height = 24
                  EdgeBorders = [ebLeft, ebTop, ebRight]
                  ExplicitWidth = 676
                  ExplicitHeight = 24
                end
              end
            end
            inherited tsNagruzka: TTabSheet
              ExplicitTop = 27
              ExplicitHeight = 453
              inherited ToolBar4: TToolBar
                inherited ToolButton21: TToolButton
                  ExplicitWidth = 38
                end
              end
              inherited Panel7: TPanel
                Height = 430
                ExplicitHeight = 430
                inherited dbgVidZanyatPlan: TDBGridEh
                  Height = 344
                end
                inherited Panel6: TPanel
                  Top = 377
                  ExplicitTop = 377
                  inherited Label28: TLabel
                    ExplicitTop = 312
                  end
                  inherited Label29: TLabel
                    ExplicitTop = 312
                  end
                  inherited Label5: TLabel
                    ExplicitTop = 312
                  end
                  inherited Label7: TLabel
                    ExplicitTop = 312
                  end
                  inherited Label8: TLabel
                    Anchors = [akLeft, akTop, akBottom]
                  end
                end
              end
            end
          end
        end
        inherited pnlSave: TPanel
          Top = 417
          Width = 684
          ExplicitTop = 413
          ExplicitWidth = 684
          inherited bbSave: TBitBtn
            Left = 515
            ExplicitLeft = 515
          end
          inherited bbUndo: TBitBtn
            Left = 71
            ExplicitLeft = 71
          end
        end
      end
    end
    object tsFinish: TTabSheet
      Caption = 'tsFinish'
      ImageIndex = 5
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        684
        489)
      object Bevel6: TBevel
        Left = -3
        Top = 452
        Width = 687
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
        ExplicitTop = 401
        ExplicitWidth = 657
      end
      object BitBtn16: TBitBtn
        Left = 472
        Top = 461
        Width = 112
        Height = 25
        Action = actBackToSelDep
        Anchors = [akRight, akBottom]
        Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1096#1072#1075#1091' 5'
        TabOrder = 0
      end
      object BitBtn17: TBitBtn
        Left = 590
        Top = 461
        Width = 91
        Height = 25
        Action = actClose
        Anchors = [akRight, akBottom]
        Caption = #1043#1086#1090#1086#1074#1086
        TabOrder = 1
      end
      object BitBtn18: TBitBtn
        Left = 256
        Top = 461
        Width = 91
        Height = 25
        Action = actBack
        Anchors = [akRight, akBottom]
        Caption = '<< '#1053#1072#1079#1072#1076
        TabOrder = 2
      end
      object StaticText17: TStaticText
        Left = 25
        Top = 12
        Width = 473
        Height = 20
        AutoSize = False
        Caption = 
          #1056#1072#1073#1086#1090#1072' '#1084#1072#1089#1090#1077#1088#1072' "'#1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1091#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080'" '#1091#1089 +
          #1087#1077#1096#1085#1086' '#1079#1072#1074#1077#1088#1096#1077#1085#1072'. '
        TabOrder = 3
      end
      object StaticText18: TStaticText
        Left = 25
        Top = 40
        Width = 352
        Height = 20
        AutoSize = False
        Caption = #1044#1083#1103' '#1090#1086#1075#1086' '#1095#1090#1086#1073#1099' '#1079#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1084#1072#1089#1090#1077#1088#1072' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1043#1086#1090#1086#1074#1086'".'
        TabOrder = 4
      end
      object StaticText19: TStaticText
        Left = 25
        Top = 68
        Width = 512
        Height = 51
        AutoSize = False
        Caption = 
          #1044#1083#1103' '#1090#1086#1075#1086' '#1095#1090#1086#1073#1099' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1085#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080' '#1088#1072#1089#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' ' +
          #1080' '#1087#1083#1072#1085#1080#1088#1091#1077#1084#1099#1081' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1075#1088#1091#1087#1087' '#1076#1083#1103' '#1076#1088#1091#1075#1086#1075#1086' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085 +
          #1086#1087#1082#1091' "'#1055#1077#1088#1077#1081#1090#1080' '#1082' '#1096#1072#1075#1091' 2" '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1076#1072#1085#1085#1086#1075#1086' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072', '#1072' '#1079#1072#1090#1077#1084' '#1087 +
          #1086#1074#1090#1086#1088#1080#1090#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1096#1072#1075#1086#1074' '#8470'3 '#1080' '#8470'4.'
        TabOrder = 5
      end
      object BitBtn24: TBitBtn
        Left = 353
        Top = 461
        Width = 113
        Height = 25
        Action = actBackToSelFac
        Anchors = [akRight, akBottom]
        Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1096#1072#1075#1091' 2'
        TabOrder = 6
      end
      object StaticText27: TStaticText
        Left = 25
        Top = 124
        Width = 512
        Height = 51
        AutoSize = False
        Caption = 
          #1044#1083#1103' '#1090#1086#1075#1086' '#1095#1090#1086#1073#1099' '#1087#1088#1086#1080#1079#1074#1077#1089#1090#1080' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1090#1086#1082#1072#1084#1080' '#1076#1088#1091#1075#1086#1081' '#1082#1072#1092#1077#1076#1088#1099' '#1092#1072#1082 +
          #1091#1083#1100#1090#1077#1090#1072', '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1085#1072' '#1096#1072#1075#1077' '#8470'2, '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1055#1077#1088#1077#1081#1090#1080' '#1082' '#1096#1072#1075#1091' 5' +
          '" '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1076#1072#1085#1085#1086#1081' '#1082#1072#1092#1077#1076#1088#1099', '#1072' '#1079#1072#1090#1077#1084' '#1087#1086#1074#1090#1086#1088#1080#1090#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1096#1072#1075#1072' '#8470 +
          '6.'
        TabOrder = 7
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 67
    Align = alTop
    Caption = 'Panel1'
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    object PageControl2: TPageControl
      Left = 1
      Top = 1
      Width = 690
      Height = 64
      ActivePage = tsCapNOT
      Align = alTop
      Style = tsFlatButtons
      TabOrder = 0
      object tsCapStart: TTabSheet
        Caption = 'tsCapStart'
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          682
          54)
        object Label12: TLabel
          Left = 8
          Top = 3
          Width = 511
          Height = 14
          Caption = 
            #1044#1086#1073#1088#1086' '#1087#1086#1078#1072#1083#1086#1074#1072#1090#1100' '#1074' '#1084#1072#1089#1090#1077#1088' "'#1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1091#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085 +
            #1072#1075#1088#1091#1079#1082#1080'"'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Image1: TImage
          Left = 618
          Top = 3
          Width = 53
          Height = 44
          Anchors = [akTop, akRight]
          Picture.Data = {
            07544269746D6170A6240000424DA62400000000000036000000280000003500
            00002C0000000100200000000000702400000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB04F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00F5F5F50AECECEC13E5E5E51AFCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CFCF
            CF30AFAFAF50B9B9B946E3E3E31CECECEC13E9E9E916FBFBFB04FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F50ACEB8
            AB59CFA38980D0957299CCC4C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00EFEF
            EF10D6D6D629ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FBFBFB04FFFFFF00DCD6C24BB99C22EA6A2E0BF7865532D2A696
            8783BE8C5FBAA29B9077D1D1D12EF4F4F40BFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F7E2D530D76720FFDE7C18FFE59212FFE28812FFD280
            51BFCCCCCC33E9E9E916FFFFFF00EEC7B252CE6932D8CC9C8480CCCCCC33D2D2
            D22DF5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D0CD38BBB9B64DEBEB
            EB14B99E8486FFD40AFFF9A201FFF47E02FFBA6121F6FC8D18FFF2A018F6A686
            669DDEDEDE21FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DA
            C740E2881AFFFFE100FFFFE100FFFCD902FFDD7815FFCF9B7D8DCCCCCC33F0E8
            E41CD15E1FF1EAA307FFDB740BFFCD5E25E5CCB4A859CFCFCF30FCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00E7E3DD34F2BF46E5C69D44D3896957AD8D3811F6CE7103FFFF9B
            00FFFA8600FFB45600FFDB7006FFFF8E00FFC48544C5DADADA25FBFBFB04FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DAC840E38A1BFFFFE100FFFFE1
            00FFFFDC00FFF7B605FFD5601AFFCEB09F66D0855BB2E38C0DFFFFE100FFFFE1
            00FFEDAA05FFCE5619F2CBC3BF40D6D6D629FCFCFC03FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF3E059FFBF
            1EFFFFA508FFD46C00FFBB5701FFF78700FFFF8B00FFFF8700FFFF8E00FFFF89
            00FFF78000FF8D532BD999918C75E0E0E01FFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC13CCCCCC33E5E5E51AFFFF
            FF00FFFFFF00EACFBC4CE48C1CFFFFC500FFFF9A00FFFF9500FFFF9500FFE77D
            10FFDF8014FFDE7E12FFFCD901FFFFE100FFFFD800FFFFAD00FFE78F07FFCC64
            30D9CBC3BF40E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E7E6E41FF4B932E8FF9400FFFF9200FFFF96
            00FFFC9513EFEEB570ABF9DDBB7DFFB362CCFF8000FFFD8500FFCF6300FFA664
            28D7D6D6D629FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00E8C4A66CE18033FFD6A57F99CCCCCC33D9D9D926DCBCA468DA7F3DE5EDA9
            14FFFFBB00FFFF9500FFFF9500FFFF9500FFFF9A00FFFFE100FFFFE100FFFFE1
            00FFFFE100FFFFA800FFFF9500FFFF9500FFDB610BFFCC94778DE2E2E21DFFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CBC6
            C53CAA9164A5FFD816FFFFA504FFFF9400FFD29F5BA6E0DCD728FFFFFF00FFFF
            FF00DCCCAF72FEA304FFFE8200FFFF8F03FFC8955EABF4F4F40BFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCCAE66E58B33FFF6BE10FFE790
            29FFDB9157CCD99560BFE28528FFF7C10BFFFFDB00FFFFB800FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFDB00FFFFDB00FFFFDB00FFFFBD00FFFF9500FFFF95
            00FFFC9101FFD35710FFCD8762A5CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E4DECE3E864F13F17A3005FFF8B510FFFFA1
            02FFD4933DC3F1F0F00FFFFFFF00FFFFFF00FFFFFF00D5C69782FFD502FFFF8C
            00FFD28133D8CFCECC36FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FAE9DA30E78F37FFFAC20BFFFFD000FFFFD000FFF0A619FFF0A518FFFDCA
            03FFFFD000FFFFD000FFFFB200FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFEB7A09FFD45D11FFD662
            0EFFCC9D8580CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00EFE5B769E8B300FFC46602FFF68C01FFF1910FF4C4BEB849FFFFFF00FFFF
            FF00FFFFFF00F3F2F20DEFD743D3FFE801FFFF8F00FFAE6C31D7C2C1C041FCFC
            FC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDAB6EBFF6B017FFFFC5
            00FFFFBF00FFFF9C00FFFFB700FFFFC500FFFFC500FFFFC500FFFFB100FFFF98
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFA700FFFFC500FFF9B702FFD35A10FFCC9D8580CCCC
            CC33F5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00EEECE131F7C32FE3FF9A
            00FFFF9900FFCA8B3CD0DBDBDB24FFFFFF00FFFFFF00F9F9F906C4B58588FFFF
            0EFFFFD502FFFF8601FFEE9334E1DBD9D82AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F3C79F80F2A323FFFFB800FFFF9E00FFFF9700FFFF97
            00FFFFA300FFFFB000FFFF9E00FFFF9700FFFF9700FFFF9700FFFF9700FFFF97
            00FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9E
            00FFFFB800FFFFBA00FFF6A603FFD35710FFCDB5A959EFEFEF10FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8F8F70CDFB879A9FEA30AFFFF9B00FFB88441CBC7C7
            C838DCDCDC23C5C1BD43BB9269A1FFE320FFFFF515FFF8970CFAC89C729FDED8
            D134FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAEA
            DB30EC9834FFFFA000FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B
            00FFFF9B00FFFF9B00FFFF9B00FFFE9F0CFFFDA61FFFFDAE32FFFEB034FFFFAC
            28FFFFA414FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFFA200FFFFA900FFFF9F
            00FFDF6B0DFFCCA69173E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
            FD14FFCE6BD0FEAE0CFFFF9A00FFC2750FF0554440C26C4838CF933F0EF6EA75
            08FFFFC20EFFFFA301FFCF823CD3EBEBEB14FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDA865CFF29824FFFFA0
            00FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFAA420FFF7AE
            48FFF5BA65F0FAD091AFFCDFB080FCE1B280FDDCA29FFED17EDFFFC152FFFFA8
            14FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFE87B0AFFCF916F99E9E9
            E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF0D548FDA00EF4FF92
            02FDFF9400FFB86201FF7A3300FFA14700FFEF7A01FFED922FDDF0A454C1CFB9
            A068FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFC
            FC03E5E5E51AE5E5E51AE5B17DACF49721FFFFA300FFFFA400FFFFA400FFFFA4
            00FFFFA400FFFDA409FFF4A53CFFEFB66FD3FBE5C950FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFE18ABFFFC966FFFFAB14FFFFA400FFFFA4
            00FFFFA400FFF79705FFDB6812FFDEA98C7CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFEFD04FCEEDA33F7D8969FFFA300FFFF950FF3F0A2
            40D0FF9000FFEF9F41D6DCDAD928FDFDFD02FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDF9F310F0CA9F86DCB58B99E2AB71BFEC99
            42FFFE8F04FFFF9800FFFFA900FFFFA900FFFFA900FFFBA50DFFEE9E45FFECCA
            A57BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFEE8CAFFFDB61FFFFC352FFFFA900FFFFA900FFEF8E0BFFD76419FFE0AD
            8E7BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F6F02EFFBE4FC8D2BDA161F2F1F012F6D3A07EE5DFD830FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FBE8D240F19F44FFF69126FFFA8912FFFB870DFFFF8300FFFFA300FFFFAD
            00FFFFAD00FFFBA70CFFEB973FFFEBCCAD6CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEEA76D0FFE758FFFFCF
            6AFFFFB314FFFFAD00FFE07616FFCFA48A80D2D2D22DFCFCFC03FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9DEBD60F89028FFFF78
            00FFFF7800FFFF7800FFFF8700FFFFB200FFFFB200FFFDAF04FFE99235FFDFBF
            A176FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFBEA20FFE758FFFFE758FFFED264FFFFB81BFFFFB200FFF08A
            0CFFD47234E5CCC5C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8D4A880F88D29FFFF8200FFFF8200FFFF9400FFFFA9
            00FFFFB600FFFFB600FFF19D1BFFDD9E66BFF9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E991A4FEE5
            57FFFEE557FFFDD161FFFEBA1AFFFFB600FFFFA000FFE97812FFD38554BFDFDF
            DF20FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8D5
            A980F9922AFFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFE588
            2DFFD7CBC144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F6EDCC47F8D752FFF8D752FFF8D752FFFAC460FFFEBC
            13FFFFBB00FFFFBB00FFEC9211FFD38D61B2F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADCB570F8A730FFFFBF00FFFFBF
            00FFFFBF00FFFFBF00FFFFBF00FFF9B109FFDB8A4DD9D9D9D926FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE6CF3DEEC7
            53F2F2C84CFFF2C84CFFF3C54FFFF9BC53FFFFBF00FFFFBF00FFFDB902FFDC71
            22FFE2D5CC37FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FCEBD540F7B542FFFFC400FFFFC400FFFFC400FFFFC400FFFFC4
            00FFF7B00BFFDA8F55CCCCCCCC33E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F9F906E2D1AE66E9B84DF2EBB846FFEBB846FFEBB846FFF3B5
            55FFFBBD2EFFF2A610FFE38322FFDB7128FFECB69280FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF5EA20F7C6
            82BFF4B057FFF3AE55FFF7B034FFFFC800FFFFC800FFF6B20AFFDE802FFFD6BA
            8D8DCCCCCC33D2D2D22DE2E2E21DE5E5E51AE2E2E21DD7CFC244DAB473B2E5A7
            40FFE5A740FFE5A740FFE5A740FFEBAA48FFF5B346FFF9B909FFE07E2AFFE6CC
            B950FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9D4A18FF6A447FFFE73
            05FFFFCC00FFFFCC00FFFAC105FFDB7327FFDE983AFFDB9E4BE5D5AD79A5D4B0
            8299D5AD79A5D99F53D9DE983AFFDE983AFFDE983AFFDE983AFFDE983AFFE49D
            41FFF1A94BFFFCC610FFE68C28FFD4A8868DF5F5F50AFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8C784BFFD8017FFFF6F00FFFFB800FFFFD100FFFFD1
            00FFE3861BFFD97C2DFFD78834FFD78834FFD78834FFD78834FFD78834FFD788
            34FFD78834FFD78834FFD78834FFE3933FFFEEA145FFFCC80EFFFBC707FFE385
            30FFD0BEAF59E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8CD
            8FAFFD8117FFFF9600FFFFCF00FFFFD500FFFFD500FFFAC804FFDC7321FFD774
            2AFFD1782DFFD1782EFFD1782EFFD1782EFFD1782EFFD2792EFFD98134FFE58F
            3EFFEFA632FFFED204FFFFD500FFFDD003FFE68D2EFFDFAF8890FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBDCAE80FCB729FFFFDA00FFFFDA
            00FFFFDA00FFFFDA00FFFFDA00FFFDD302FFE89616FFDA7026FFD8722AFFD572
            2BFFD7752DFFDC7B30FFE38536FFEDA328FFF9C70FFFF5B91BFFE89239FFEFA8
            25FFE9972EFFE3A877AAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDF2E130F8BD59FFFED712FFFDD317FFF7BD43FFF6B947FFFEDB
            05FFFFDE00FFFFDE00FFFDD702FFF6C30AFFF2B710FFF5BF0EFFF7C60CFFFFDE
            00FFFCD509FFEFA732FFE59F5DD6F8E2CE40F2C59D80F0BD908FFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE5
            C360F8BA5FFFF7BF70E0FBE3C160F6C078CFFC8E16FFFFDA00FFFFE100FFFFE1
            00FFFEDD05FFFBD214FFF9C91DFFFFE100FFFFE100FFF5BD23FFE1A86EBFECEC
            EC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF2E130FFFFFF00FFFF
            FF00F9D0989FFCA81CFFFFE100FFFFE100FFF8C32FFFEEAB58F2F2BB7AC0F0A8
            58EFFCD50EFFF8C81CFFEEA53FFFEDCFAF6AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADAAD80F7BB50FFFACA
            2DFFF9C631FFF1B567E2F5F0EB19FFFFFF00F6CD9C8FEFA34EFFF1BC82B1F9E0
            C550FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFAF410FCECD640FBDEB670F9D8AB80FCF0DF30FFFF
            FF00FFFFFF00FEF9F410FDF3E920FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          Transparent = True
          ExplicitLeft = 620
        end
        object StaticText3: TStaticText
          Left = 24
          Top = 23
          Width = 512
          Height = 28
          AutoSize = False
          Caption = 
            #1044#1072#1085#1085#1099#1081' '#1084#1072#1089#1090#1077#1088' '#1087#1086#1084#1086#1078#1077#1090' '#1074#1072#1084' '#1087#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1076#1083#1103' '#1091#1095#1077 +
            #1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1055#1055#1057' '#1059#1043#1058#1059'.'
          TabOrder = 0
        end
      end
      object tsCapSemLength: TTabSheet
        Caption = 'tsCapSemLength'
        ImageIndex = 1
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          682
          54)
        object Label11: TLabel
          Left = 8
          Top = 3
          Width = 327
          Height = 14
          Caption = #1064#1072#1075' 1. '#1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1080' '#1089#1077#1084#1077#1089#1090#1088#1086#1074
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Image3: TImage
          Left = 618
          Top = 3
          Width = 53
          Height = 44
          Anchors = [akTop, akRight]
          Picture.Data = {
            07544269746D6170A6240000424DA62400000000000036000000280000003500
            00002C0000000100200000000000702400000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB04F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00F5F5F50AECECEC13E5E5E51AFCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CFCF
            CF30AFAFAF50B9B9B946E3E3E31CECECEC13E9E9E916FBFBFB04FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F50ACEB8
            AB59CFA38980D0957299CCC4C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00EFEF
            EF10D6D6D629ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FBFBFB04FFFFFF00DCD6C24BB99C22EA6A2E0BF7865532D2A696
            8783BE8C5FBAA29B9077D1D1D12EF4F4F40BFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F7E2D530D76720FFDE7C18FFE59212FFE28812FFD280
            51BFCCCCCC33E9E9E916FFFFFF00EEC7B252CE6932D8CC9C8480CCCCCC33D2D2
            D22DF5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D0CD38BBB9B64DEBEB
            EB14B99E8486FFD40AFFF9A201FFF47E02FFBA6121F6FC8D18FFF2A018F6A686
            669DDEDEDE21FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DA
            C740E2881AFFFFE100FFFFE100FFFCD902FFDD7815FFCF9B7D8DCCCCCC33F0E8
            E41CD15E1FF1EAA307FFDB740BFFCD5E25E5CCB4A859CFCFCF30FCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00E7E3DD34F2BF46E5C69D44D3896957AD8D3811F6CE7103FFFF9B
            00FFFA8600FFB45600FFDB7006FFFF8E00FFC48544C5DADADA25FBFBFB04FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DAC840E38A1BFFFFE100FFFFE1
            00FFFFDC00FFF7B605FFD5601AFFCEB09F66D0855BB2E38C0DFFFFE100FFFFE1
            00FFEDAA05FFCE5619F2CBC3BF40D6D6D629FCFCFC03FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF3E059FFBF
            1EFFFFA508FFD46C00FFBB5701FFF78700FFFF8B00FFFF8700FFFF8E00FFFF89
            00FFF78000FF8D532BD999918C75E0E0E01FFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC13CCCCCC33E5E5E51AFFFF
            FF00FFFFFF00EACFBC4CE48C1CFFFFC500FFFF9A00FFFF9500FFFF9500FFE77D
            10FFDF8014FFDE7E12FFFCD901FFFFE100FFFFD800FFFFAD00FFE78F07FFCC64
            30D9CBC3BF40E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E7E6E41FF4B932E8FF9400FFFF9200FFFF96
            00FFFC9513EFEEB570ABF9DDBB7DFFB362CCFF8000FFFD8500FFCF6300FFA664
            28D7D6D6D629FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00E8C4A66CE18033FFD6A57F99CCCCCC33D9D9D926DCBCA468DA7F3DE5EDA9
            14FFFFBB00FFFF9500FFFF9500FFFF9500FFFF9A00FFFFE100FFFFE100FFFFE1
            00FFFFE100FFFFA800FFFF9500FFFF9500FFDB610BFFCC94778DE2E2E21DFFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CBC6
            C53CAA9164A5FFD816FFFFA504FFFF9400FFD29F5BA6E0DCD728FFFFFF00FFFF
            FF00DCCCAF72FEA304FFFE8200FFFF8F03FFC8955EABF4F4F40BFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCCAE66E58B33FFF6BE10FFE790
            29FFDB9157CCD99560BFE28528FFF7C10BFFFFDB00FFFFB800FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFDB00FFFFDB00FFFFDB00FFFFBD00FFFF9500FFFF95
            00FFFC9101FFD35710FFCD8762A5CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E4DECE3E864F13F17A3005FFF8B510FFFFA1
            02FFD4933DC3F1F0F00FFFFFFF00FFFFFF00FFFFFF00D5C69782FFD502FFFF8C
            00FFD28133D8CFCECC36FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FAE9DA30E78F37FFFAC20BFFFFD000FFFFD000FFF0A619FFF0A518FFFDCA
            03FFFFD000FFFFD000FFFFB200FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFEB7A09FFD45D11FFD662
            0EFFCC9D8580CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00EFE5B769E8B300FFC46602FFF68C01FFF1910FF4C4BEB849FFFFFF00FFFF
            FF00FFFFFF00F3F2F20DEFD743D3FFE801FFFF8F00FFAE6C31D7C2C1C041FCFC
            FC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDAB6EBFF6B017FFFFC5
            00FFFFBF00FFFF9C00FFFFB700FFFFC500FFFFC500FFFFC500FFFFB100FFFF98
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFA700FFFFC500FFF9B702FFD35A10FFCC9D8580CCCC
            CC33F5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00EEECE131F7C32FE3FF9A
            00FFFF9900FFCA8B3CD0DBDBDB24FFFFFF00FFFFFF00F9F9F906C4B58588FFFF
            0EFFFFD502FFFF8601FFEE9334E1DBD9D82AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F3C79F80F2A323FFFFB800FFFF9E00FFFF9700FFFF97
            00FFFFA300FFFFB000FFFF9E00FFFF9700FFFF9700FFFF9700FFFF9700FFFF97
            00FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9E
            00FFFFB800FFFFBA00FFF6A603FFD35710FFCDB5A959EFEFEF10FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8F8F70CDFB879A9FEA30AFFFF9B00FFB88441CBC7C7
            C838DCDCDC23C5C1BD43BB9269A1FFE320FFFFF515FFF8970CFAC89C729FDED8
            D134FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAEA
            DB30EC9834FFFFA000FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B
            00FFFF9B00FFFF9B00FFFF9B00FFFE9F0CFFFDA61FFFFDAE32FFFEB034FFFFAC
            28FFFFA414FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFFA200FFFFA900FFFF9F
            00FFDF6B0DFFCCA69173E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
            FD14FFCE6BD0FEAE0CFFFF9A00FFC2750FF0554440C26C4838CF933F0EF6EA75
            08FFFFC20EFFFFA301FFCF823CD3EBEBEB14FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDA865CFF29824FFFFA0
            00FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFAA420FFF7AE
            48FFF5BA65F0FAD091AFFCDFB080FCE1B280FDDCA29FFED17EDFFFC152FFFFA8
            14FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFE87B0AFFCF916F99E9E9
            E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF0D548FDA00EF4FF92
            02FDFF9400FFB86201FF7A3300FFA14700FFEF7A01FFED922FDDF0A454C1CFB9
            A068FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFC
            FC03E5E5E51AE5E5E51AE5B17DACF49721FFFFA300FFFFA400FFFFA400FFFFA4
            00FFFFA400FFFDA409FFF4A53CFFEFB66FD3FBE5C950FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFE18ABFFFC966FFFFAB14FFFFA400FFFFA4
            00FFFFA400FFF79705FFDB6812FFDEA98C7CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFEFD04FCEEDA33F7D8969FFFA300FFFF950FF3F0A2
            40D0FF9000FFEF9F41D6DCDAD928FDFDFD02FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDF9F310F0CA9F86DCB58B99E2AB71BFEC99
            42FFFE8F04FFFF9800FFFFA900FFFFA900FFFFA900FFFBA50DFFEE9E45FFECCA
            A57BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFEE8CAFFFDB61FFFFC352FFFFA900FFFFA900FFEF8E0BFFD76419FFE0AD
            8E7BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F6F02EFFBE4FC8D2BDA161F2F1F012F6D3A07EE5DFD830FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FBE8D240F19F44FFF69126FFFA8912FFFB870DFFFF8300FFFFA300FFFFAD
            00FFFFAD00FFFBA70CFFEB973FFFEBCCAD6CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEEA76D0FFE758FFFFCF
            6AFFFFB314FFFFAD00FFE07616FFCFA48A80D2D2D22DFCFCFC03FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9DEBD60F89028FFFF78
            00FFFF7800FFFF7800FFFF8700FFFFB200FFFFB200FFFDAF04FFE99235FFDFBF
            A176FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFBEA20FFE758FFFFE758FFFED264FFFFB81BFFFFB200FFF08A
            0CFFD47234E5CCC5C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8D4A880F88D29FFFF8200FFFF8200FFFF9400FFFFA9
            00FFFFB600FFFFB600FFF19D1BFFDD9E66BFF9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E991A4FEE5
            57FFFEE557FFFDD161FFFEBA1AFFFFB600FFFFA000FFE97812FFD38554BFDFDF
            DF20FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8D5
            A980F9922AFFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFE588
            2DFFD7CBC144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F6EDCC47F8D752FFF8D752FFF8D752FFFAC460FFFEBC
            13FFFFBB00FFFFBB00FFEC9211FFD38D61B2F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADCB570F8A730FFFFBF00FFFFBF
            00FFFFBF00FFFFBF00FFFFBF00FFF9B109FFDB8A4DD9D9D9D926FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE6CF3DEEC7
            53F2F2C84CFFF2C84CFFF3C54FFFF9BC53FFFFBF00FFFFBF00FFFDB902FFDC71
            22FFE2D5CC37FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FCEBD540F7B542FFFFC400FFFFC400FFFFC400FFFFC400FFFFC4
            00FFF7B00BFFDA8F55CCCCCCCC33E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F9F906E2D1AE66E9B84DF2EBB846FFEBB846FFEBB846FFF3B5
            55FFFBBD2EFFF2A610FFE38322FFDB7128FFECB69280FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF5EA20F7C6
            82BFF4B057FFF3AE55FFF7B034FFFFC800FFFFC800FFF6B20AFFDE802FFFD6BA
            8D8DCCCCCC33D2D2D22DE2E2E21DE5E5E51AE2E2E21DD7CFC244DAB473B2E5A7
            40FFE5A740FFE5A740FFE5A740FFEBAA48FFF5B346FFF9B909FFE07E2AFFE6CC
            B950FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9D4A18FF6A447FFFE73
            05FFFFCC00FFFFCC00FFFAC105FFDB7327FFDE983AFFDB9E4BE5D5AD79A5D4B0
            8299D5AD79A5D99F53D9DE983AFFDE983AFFDE983AFFDE983AFFDE983AFFE49D
            41FFF1A94BFFFCC610FFE68C28FFD4A8868DF5F5F50AFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8C784BFFD8017FFFF6F00FFFFB800FFFFD100FFFFD1
            00FFE3861BFFD97C2DFFD78834FFD78834FFD78834FFD78834FFD78834FFD788
            34FFD78834FFD78834FFD78834FFE3933FFFEEA145FFFCC80EFFFBC707FFE385
            30FFD0BEAF59E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8CD
            8FAFFD8117FFFF9600FFFFCF00FFFFD500FFFFD500FFFAC804FFDC7321FFD774
            2AFFD1782DFFD1782EFFD1782EFFD1782EFFD1782EFFD2792EFFD98134FFE58F
            3EFFEFA632FFFED204FFFFD500FFFDD003FFE68D2EFFDFAF8890FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBDCAE80FCB729FFFFDA00FFFFDA
            00FFFFDA00FFFFDA00FFFFDA00FFFDD302FFE89616FFDA7026FFD8722AFFD572
            2BFFD7752DFFDC7B30FFE38536FFEDA328FFF9C70FFFF5B91BFFE89239FFEFA8
            25FFE9972EFFE3A877AAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDF2E130F8BD59FFFED712FFFDD317FFF7BD43FFF6B947FFFEDB
            05FFFFDE00FFFFDE00FFFDD702FFF6C30AFFF2B710FFF5BF0EFFF7C60CFFFFDE
            00FFFCD509FFEFA732FFE59F5DD6F8E2CE40F2C59D80F0BD908FFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE5
            C360F8BA5FFFF7BF70E0FBE3C160F6C078CFFC8E16FFFFDA00FFFFE100FFFFE1
            00FFFEDD05FFFBD214FFF9C91DFFFFE100FFFFE100FFF5BD23FFE1A86EBFECEC
            EC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF2E130FFFFFF00FFFF
            FF00F9D0989FFCA81CFFFFE100FFFFE100FFF8C32FFFEEAB58F2F2BB7AC0F0A8
            58EFFCD50EFFF8C81CFFEEA53FFFEDCFAF6AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADAAD80F7BB50FFFACA
            2DFFF9C631FFF1B567E2F5F0EB19FFFFFF00F6CD9C8FEFA34EFFF1BC82B1F9E0
            C550FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFAF410FCECD640FBDEB670F9D8AB80FCF0DF30FFFF
            FF00FFFFFF00FEF9F410FDF3E920FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          Transparent = True
          ExplicitLeft = 620
        end
        object StaticText4: TStaticText
          Left = 24
          Top = 23
          Width = 512
          Height = 28
          AutoSize = False
          Caption = 
            #1053#1072' '#1076#1072#1085#1085#1086#1084' '#1096#1072#1075#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1091#1095#1077#1073#1085#1099#1093' '#1089#1077 +
            #1084#1077#1089#1090#1088#1086#1074' ('#1076#1072#1090#1099' '#1085#1072#1095#1072#1083#1072' '#1080' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1089#1077#1084#1077#1089#1090#1088#1086#1074'). '
          TabOrder = 0
        end
      end
      object tsCapSelFac: TTabSheet
        Caption = 'tsCapSelFac'
        ImageIndex = 2
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          682
          54)
        object Label1: TLabel
          Left = 8
          Top = 3
          Width = 167
          Height = 14
          Caption = #1064#1072#1075' 2. '#1042#1099#1073#1086#1088' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Image4: TImage
          Left = 618
          Top = 3
          Width = 53
          Height = 44
          Anchors = [akTop, akRight]
          Picture.Data = {
            07544269746D6170A6240000424DA62400000000000036000000280000003500
            00002C0000000100200000000000702400000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB04F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00F5F5F50AECECEC13E5E5E51AFCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CFCF
            CF30AFAFAF50B9B9B946E3E3E31CECECEC13E9E9E916FBFBFB04FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F50ACEB8
            AB59CFA38980D0957299CCC4C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00EFEF
            EF10D6D6D629ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FBFBFB04FFFFFF00DCD6C24BB99C22EA6A2E0BF7865532D2A696
            8783BE8C5FBAA29B9077D1D1D12EF4F4F40BFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F7E2D530D76720FFDE7C18FFE59212FFE28812FFD280
            51BFCCCCCC33E9E9E916FFFFFF00EEC7B252CE6932D8CC9C8480CCCCCC33D2D2
            D22DF5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D0CD38BBB9B64DEBEB
            EB14B99E8486FFD40AFFF9A201FFF47E02FFBA6121F6FC8D18FFF2A018F6A686
            669DDEDEDE21FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DA
            C740E2881AFFFFE100FFFFE100FFFCD902FFDD7815FFCF9B7D8DCCCCCC33F0E8
            E41CD15E1FF1EAA307FFDB740BFFCD5E25E5CCB4A859CFCFCF30FCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00E7E3DD34F2BF46E5C69D44D3896957AD8D3811F6CE7103FFFF9B
            00FFFA8600FFB45600FFDB7006FFFF8E00FFC48544C5DADADA25FBFBFB04FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DAC840E38A1BFFFFE100FFFFE1
            00FFFFDC00FFF7B605FFD5601AFFCEB09F66D0855BB2E38C0DFFFFE100FFFFE1
            00FFEDAA05FFCE5619F2CBC3BF40D6D6D629FCFCFC03FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF3E059FFBF
            1EFFFFA508FFD46C00FFBB5701FFF78700FFFF8B00FFFF8700FFFF8E00FFFF89
            00FFF78000FF8D532BD999918C75E0E0E01FFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC13CCCCCC33E5E5E51AFFFF
            FF00FFFFFF00EACFBC4CE48C1CFFFFC500FFFF9A00FFFF9500FFFF9500FFE77D
            10FFDF8014FFDE7E12FFFCD901FFFFE100FFFFD800FFFFAD00FFE78F07FFCC64
            30D9CBC3BF40E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E7E6E41FF4B932E8FF9400FFFF9200FFFF96
            00FFFC9513EFEEB570ABF9DDBB7DFFB362CCFF8000FFFD8500FFCF6300FFA664
            28D7D6D6D629FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00E8C4A66CE18033FFD6A57F99CCCCCC33D9D9D926DCBCA468DA7F3DE5EDA9
            14FFFFBB00FFFF9500FFFF9500FFFF9500FFFF9A00FFFFE100FFFFE100FFFFE1
            00FFFFE100FFFFA800FFFF9500FFFF9500FFDB610BFFCC94778DE2E2E21DFFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CBC6
            C53CAA9164A5FFD816FFFFA504FFFF9400FFD29F5BA6E0DCD728FFFFFF00FFFF
            FF00DCCCAF72FEA304FFFE8200FFFF8F03FFC8955EABF4F4F40BFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCCAE66E58B33FFF6BE10FFE790
            29FFDB9157CCD99560BFE28528FFF7C10BFFFFDB00FFFFB800FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFDB00FFFFDB00FFFFDB00FFFFBD00FFFF9500FFFF95
            00FFFC9101FFD35710FFCD8762A5CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E4DECE3E864F13F17A3005FFF8B510FFFFA1
            02FFD4933DC3F1F0F00FFFFFFF00FFFFFF00FFFFFF00D5C69782FFD502FFFF8C
            00FFD28133D8CFCECC36FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FAE9DA30E78F37FFFAC20BFFFFD000FFFFD000FFF0A619FFF0A518FFFDCA
            03FFFFD000FFFFD000FFFFB200FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFEB7A09FFD45D11FFD662
            0EFFCC9D8580CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00EFE5B769E8B300FFC46602FFF68C01FFF1910FF4C4BEB849FFFFFF00FFFF
            FF00FFFFFF00F3F2F20DEFD743D3FFE801FFFF8F00FFAE6C31D7C2C1C041FCFC
            FC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDAB6EBFF6B017FFFFC5
            00FFFFBF00FFFF9C00FFFFB700FFFFC500FFFFC500FFFFC500FFFFB100FFFF98
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFA700FFFFC500FFF9B702FFD35A10FFCC9D8580CCCC
            CC33F5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00EEECE131F7C32FE3FF9A
            00FFFF9900FFCA8B3CD0DBDBDB24FFFFFF00FFFFFF00F9F9F906C4B58588FFFF
            0EFFFFD502FFFF8601FFEE9334E1DBD9D82AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F3C79F80F2A323FFFFB800FFFF9E00FFFF9700FFFF97
            00FFFFA300FFFFB000FFFF9E00FFFF9700FFFF9700FFFF9700FFFF9700FFFF97
            00FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9E
            00FFFFB800FFFFBA00FFF6A603FFD35710FFCDB5A959EFEFEF10FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8F8F70CDFB879A9FEA30AFFFF9B00FFB88441CBC7C7
            C838DCDCDC23C5C1BD43BB9269A1FFE320FFFFF515FFF8970CFAC89C729FDED8
            D134FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAEA
            DB30EC9834FFFFA000FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B
            00FFFF9B00FFFF9B00FFFF9B00FFFE9F0CFFFDA61FFFFDAE32FFFEB034FFFFAC
            28FFFFA414FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFFA200FFFFA900FFFF9F
            00FFDF6B0DFFCCA69173E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
            FD14FFCE6BD0FEAE0CFFFF9A00FFC2750FF0554440C26C4838CF933F0EF6EA75
            08FFFFC20EFFFFA301FFCF823CD3EBEBEB14FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDA865CFF29824FFFFA0
            00FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFAA420FFF7AE
            48FFF5BA65F0FAD091AFFCDFB080FCE1B280FDDCA29FFED17EDFFFC152FFFFA8
            14FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFE87B0AFFCF916F99E9E9
            E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF0D548FDA00EF4FF92
            02FDFF9400FFB86201FF7A3300FFA14700FFEF7A01FFED922FDDF0A454C1CFB9
            A068FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFC
            FC03E5E5E51AE5E5E51AE5B17DACF49721FFFFA300FFFFA400FFFFA400FFFFA4
            00FFFFA400FFFDA409FFF4A53CFFEFB66FD3FBE5C950FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFE18ABFFFC966FFFFAB14FFFFA400FFFFA4
            00FFFFA400FFF79705FFDB6812FFDEA98C7CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFEFD04FCEEDA33F7D8969FFFA300FFFF950FF3F0A2
            40D0FF9000FFEF9F41D6DCDAD928FDFDFD02FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDF9F310F0CA9F86DCB58B99E2AB71BFEC99
            42FFFE8F04FFFF9800FFFFA900FFFFA900FFFFA900FFFBA50DFFEE9E45FFECCA
            A57BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFEE8CAFFFDB61FFFFC352FFFFA900FFFFA900FFEF8E0BFFD76419FFE0AD
            8E7BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F6F02EFFBE4FC8D2BDA161F2F1F012F6D3A07EE5DFD830FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FBE8D240F19F44FFF69126FFFA8912FFFB870DFFFF8300FFFFA300FFFFAD
            00FFFFAD00FFFBA70CFFEB973FFFEBCCAD6CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEEA76D0FFE758FFFFCF
            6AFFFFB314FFFFAD00FFE07616FFCFA48A80D2D2D22DFCFCFC03FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9DEBD60F89028FFFF78
            00FFFF7800FFFF7800FFFF8700FFFFB200FFFFB200FFFDAF04FFE99235FFDFBF
            A176FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFBEA20FFE758FFFFE758FFFED264FFFFB81BFFFFB200FFF08A
            0CFFD47234E5CCC5C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8D4A880F88D29FFFF8200FFFF8200FFFF9400FFFFA9
            00FFFFB600FFFFB600FFF19D1BFFDD9E66BFF9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E991A4FEE5
            57FFFEE557FFFDD161FFFEBA1AFFFFB600FFFFA000FFE97812FFD38554BFDFDF
            DF20FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8D5
            A980F9922AFFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFE588
            2DFFD7CBC144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F6EDCC47F8D752FFF8D752FFF8D752FFFAC460FFFEBC
            13FFFFBB00FFFFBB00FFEC9211FFD38D61B2F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADCB570F8A730FFFFBF00FFFFBF
            00FFFFBF00FFFFBF00FFFFBF00FFF9B109FFDB8A4DD9D9D9D926FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE6CF3DEEC7
            53F2F2C84CFFF2C84CFFF3C54FFFF9BC53FFFFBF00FFFFBF00FFFDB902FFDC71
            22FFE2D5CC37FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FCEBD540F7B542FFFFC400FFFFC400FFFFC400FFFFC400FFFFC4
            00FFF7B00BFFDA8F55CCCCCCCC33E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F9F906E2D1AE66E9B84DF2EBB846FFEBB846FFEBB846FFF3B5
            55FFFBBD2EFFF2A610FFE38322FFDB7128FFECB69280FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF5EA20F7C6
            82BFF4B057FFF3AE55FFF7B034FFFFC800FFFFC800FFF6B20AFFDE802FFFD6BA
            8D8DCCCCCC33D2D2D22DE2E2E21DE5E5E51AE2E2E21DD7CFC244DAB473B2E5A7
            40FFE5A740FFE5A740FFE5A740FFEBAA48FFF5B346FFF9B909FFE07E2AFFE6CC
            B950FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9D4A18FF6A447FFFE73
            05FFFFCC00FFFFCC00FFFAC105FFDB7327FFDE983AFFDB9E4BE5D5AD79A5D4B0
            8299D5AD79A5D99F53D9DE983AFFDE983AFFDE983AFFDE983AFFDE983AFFE49D
            41FFF1A94BFFFCC610FFE68C28FFD4A8868DF5F5F50AFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8C784BFFD8017FFFF6F00FFFFB800FFFFD100FFFFD1
            00FFE3861BFFD97C2DFFD78834FFD78834FFD78834FFD78834FFD78834FFD788
            34FFD78834FFD78834FFD78834FFE3933FFFEEA145FFFCC80EFFFBC707FFE385
            30FFD0BEAF59E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8CD
            8FAFFD8117FFFF9600FFFFCF00FFFFD500FFFFD500FFFAC804FFDC7321FFD774
            2AFFD1782DFFD1782EFFD1782EFFD1782EFFD1782EFFD2792EFFD98134FFE58F
            3EFFEFA632FFFED204FFFFD500FFFDD003FFE68D2EFFDFAF8890FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBDCAE80FCB729FFFFDA00FFFFDA
            00FFFFDA00FFFFDA00FFFFDA00FFFDD302FFE89616FFDA7026FFD8722AFFD572
            2BFFD7752DFFDC7B30FFE38536FFEDA328FFF9C70FFFF5B91BFFE89239FFEFA8
            25FFE9972EFFE3A877AAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDF2E130F8BD59FFFED712FFFDD317FFF7BD43FFF6B947FFFEDB
            05FFFFDE00FFFFDE00FFFDD702FFF6C30AFFF2B710FFF5BF0EFFF7C60CFFFFDE
            00FFFCD509FFEFA732FFE59F5DD6F8E2CE40F2C59D80F0BD908FFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE5
            C360F8BA5FFFF7BF70E0FBE3C160F6C078CFFC8E16FFFFDA00FFFFE100FFFFE1
            00FFFEDD05FFFBD214FFF9C91DFFFFE100FFFFE100FFF5BD23FFE1A86EBFECEC
            EC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF2E130FFFFFF00FFFF
            FF00F9D0989FFCA81CFFFFE100FFFFE100FFF8C32FFFEEAB58F2F2BB7AC0F0A8
            58EFFCD50EFFF8C81CFFEEA53FFFEDCFAF6AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADAAD80F7BB50FFFACA
            2DFFF9C631FFF1B567E2F5F0EB19FFFFFF00F6CD9C8FEFA34EFFF1BC82B1F9E0
            C550FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFAF410FCECD640FBDEB670F9D8AB80FCF0DF30FFFF
            FF00FFFFFF00FEF9F410FDF3E920FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          Transparent = True
          ExplicitLeft = 620
        end
        object StaticText5: TStaticText
          Left = 24
          Top = 23
          Width = 512
          Height = 28
          AutoSize = False
          Caption = 
            #1053#1072' '#1076#1072#1085#1085#1086#1084' '#1096#1072#1075#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1092#1072#1082#1091#1083#1100#1090#1077#1090', '#1076#1083#1103' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1085#1072' '#1089#1083#1077 +
            #1076#1091#1102#1097#1080#1093' '#1096#1072#1075#1072#1093' '#1073#1091#1076#1091#1090' '#1079#1072#1087#1086#1083#1085#1077#1085#1099' '#1085#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1080' '#1087#1083 +
            #1072#1085#1080#1088#1091#1077#1084#1099#1081' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1075#1088#1091#1087#1087'. '
          TabOrder = 0
        end
      end
      object tsCapNOT: TTabSheet
        Caption = 'tsCapNOT'
        ImageIndex = 3
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          682
          54)
        object Label2: TLabel
          Left = 8
          Top = 3
          Width = 371
          Height = 14
          Caption = #1064#1072#1075' 3. '#1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1085#1086#1088#1084' '#1074#1088#1077#1084#1077#1085#1080' '#1091#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Image5: TImage
          Left = 618
          Top = 3
          Width = 53
          Height = 44
          Anchors = [akTop, akRight]
          Picture.Data = {
            07544269746D6170A6240000424DA62400000000000036000000280000003500
            00002C0000000100200000000000702400000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB04F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00F5F5F50AECECEC13E5E5E51AFCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CFCF
            CF30AFAFAF50B9B9B946E3E3E31CECECEC13E9E9E916FBFBFB04FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F50ACEB8
            AB59CFA38980D0957299CCC4C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00EFEF
            EF10D6D6D629ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FBFBFB04FFFFFF00DCD6C24BB99C22EA6A2E0BF7865532D2A696
            8783BE8C5FBAA29B9077D1D1D12EF4F4F40BFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F7E2D530D76720FFDE7C18FFE59212FFE28812FFD280
            51BFCCCCCC33E9E9E916FFFFFF00EEC7B252CE6932D8CC9C8480CCCCCC33D2D2
            D22DF5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D0CD38BBB9B64DEBEB
            EB14B99E8486FFD40AFFF9A201FFF47E02FFBA6121F6FC8D18FFF2A018F6A686
            669DDEDEDE21FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DA
            C740E2881AFFFFE100FFFFE100FFFCD902FFDD7815FFCF9B7D8DCCCCCC33F0E8
            E41CD15E1FF1EAA307FFDB740BFFCD5E25E5CCB4A859CFCFCF30FCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00E7E3DD34F2BF46E5C69D44D3896957AD8D3811F6CE7103FFFF9B
            00FFFA8600FFB45600FFDB7006FFFF8E00FFC48544C5DADADA25FBFBFB04FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DAC840E38A1BFFFFE100FFFFE1
            00FFFFDC00FFF7B605FFD5601AFFCEB09F66D0855BB2E38C0DFFFFE100FFFFE1
            00FFEDAA05FFCE5619F2CBC3BF40D6D6D629FCFCFC03FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF3E059FFBF
            1EFFFFA508FFD46C00FFBB5701FFF78700FFFF8B00FFFF8700FFFF8E00FFFF89
            00FFF78000FF8D532BD999918C75E0E0E01FFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC13CCCCCC33E5E5E51AFFFF
            FF00FFFFFF00EACFBC4CE48C1CFFFFC500FFFF9A00FFFF9500FFFF9500FFE77D
            10FFDF8014FFDE7E12FFFCD901FFFFE100FFFFD800FFFFAD00FFE78F07FFCC64
            30D9CBC3BF40E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E7E6E41FF4B932E8FF9400FFFF9200FFFF96
            00FFFC9513EFEEB570ABF9DDBB7DFFB362CCFF8000FFFD8500FFCF6300FFA664
            28D7D6D6D629FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00E8C4A66CE18033FFD6A57F99CCCCCC33D9D9D926DCBCA468DA7F3DE5EDA9
            14FFFFBB00FFFF9500FFFF9500FFFF9500FFFF9A00FFFFE100FFFFE100FFFFE1
            00FFFFE100FFFFA800FFFF9500FFFF9500FFDB610BFFCC94778DE2E2E21DFFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CBC6
            C53CAA9164A5FFD816FFFFA504FFFF9400FFD29F5BA6E0DCD728FFFFFF00FFFF
            FF00DCCCAF72FEA304FFFE8200FFFF8F03FFC8955EABF4F4F40BFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCCAE66E58B33FFF6BE10FFE790
            29FFDB9157CCD99560BFE28528FFF7C10BFFFFDB00FFFFB800FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFDB00FFFFDB00FFFFDB00FFFFBD00FFFF9500FFFF95
            00FFFC9101FFD35710FFCD8762A5CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E4DECE3E864F13F17A3005FFF8B510FFFFA1
            02FFD4933DC3F1F0F00FFFFFFF00FFFFFF00FFFFFF00D5C69782FFD502FFFF8C
            00FFD28133D8CFCECC36FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FAE9DA30E78F37FFFAC20BFFFFD000FFFFD000FFF0A619FFF0A518FFFDCA
            03FFFFD000FFFFD000FFFFB200FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFEB7A09FFD45D11FFD662
            0EFFCC9D8580CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00EFE5B769E8B300FFC46602FFF68C01FFF1910FF4C4BEB849FFFFFF00FFFF
            FF00FFFFFF00F3F2F20DEFD743D3FFE801FFFF8F00FFAE6C31D7C2C1C041FCFC
            FC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDAB6EBFF6B017FFFFC5
            00FFFFBF00FFFF9C00FFFFB700FFFFC500FFFFC500FFFFC500FFFFB100FFFF98
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFA700FFFFC500FFF9B702FFD35A10FFCC9D8580CCCC
            CC33F5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00EEECE131F7C32FE3FF9A
            00FFFF9900FFCA8B3CD0DBDBDB24FFFFFF00FFFFFF00F9F9F906C4B58588FFFF
            0EFFFFD502FFFF8601FFEE9334E1DBD9D82AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F3C79F80F2A323FFFFB800FFFF9E00FFFF9700FFFF97
            00FFFFA300FFFFB000FFFF9E00FFFF9700FFFF9700FFFF9700FFFF9700FFFF97
            00FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9E
            00FFFFB800FFFFBA00FFF6A603FFD35710FFCDB5A959EFEFEF10FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8F8F70CDFB879A9FEA30AFFFF9B00FFB88441CBC7C7
            C838DCDCDC23C5C1BD43BB9269A1FFE320FFFFF515FFF8970CFAC89C729FDED8
            D134FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAEA
            DB30EC9834FFFFA000FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B
            00FFFF9B00FFFF9B00FFFF9B00FFFE9F0CFFFDA61FFFFDAE32FFFEB034FFFFAC
            28FFFFA414FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFFA200FFFFA900FFFF9F
            00FFDF6B0DFFCCA69173E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
            FD14FFCE6BD0FEAE0CFFFF9A00FFC2750FF0554440C26C4838CF933F0EF6EA75
            08FFFFC20EFFFFA301FFCF823CD3EBEBEB14FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDA865CFF29824FFFFA0
            00FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFAA420FFF7AE
            48FFF5BA65F0FAD091AFFCDFB080FCE1B280FDDCA29FFED17EDFFFC152FFFFA8
            14FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFE87B0AFFCF916F99E9E9
            E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF0D548FDA00EF4FF92
            02FDFF9400FFB86201FF7A3300FFA14700FFEF7A01FFED922FDDF0A454C1CFB9
            A068FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFC
            FC03E5E5E51AE5E5E51AE5B17DACF49721FFFFA300FFFFA400FFFFA400FFFFA4
            00FFFFA400FFFDA409FFF4A53CFFEFB66FD3FBE5C950FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFE18ABFFFC966FFFFAB14FFFFA400FFFFA4
            00FFFFA400FFF79705FFDB6812FFDEA98C7CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFEFD04FCEEDA33F7D8969FFFA300FFFF950FF3F0A2
            40D0FF9000FFEF9F41D6DCDAD928FDFDFD02FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDF9F310F0CA9F86DCB58B99E2AB71BFEC99
            42FFFE8F04FFFF9800FFFFA900FFFFA900FFFFA900FFFBA50DFFEE9E45FFECCA
            A57BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFEE8CAFFFDB61FFFFC352FFFFA900FFFFA900FFEF8E0BFFD76419FFE0AD
            8E7BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F6F02EFFBE4FC8D2BDA161F2F1F012F6D3A07EE5DFD830FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FBE8D240F19F44FFF69126FFFA8912FFFB870DFFFF8300FFFFA300FFFFAD
            00FFFFAD00FFFBA70CFFEB973FFFEBCCAD6CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEEA76D0FFE758FFFFCF
            6AFFFFB314FFFFAD00FFE07616FFCFA48A80D2D2D22DFCFCFC03FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9DEBD60F89028FFFF78
            00FFFF7800FFFF7800FFFF8700FFFFB200FFFFB200FFFDAF04FFE99235FFDFBF
            A176FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFBEA20FFE758FFFFE758FFFED264FFFFB81BFFFFB200FFF08A
            0CFFD47234E5CCC5C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8D4A880F88D29FFFF8200FFFF8200FFFF9400FFFFA9
            00FFFFB600FFFFB600FFF19D1BFFDD9E66BFF9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E991A4FEE5
            57FFFEE557FFFDD161FFFEBA1AFFFFB600FFFFA000FFE97812FFD38554BFDFDF
            DF20FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8D5
            A980F9922AFFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFE588
            2DFFD7CBC144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F6EDCC47F8D752FFF8D752FFF8D752FFFAC460FFFEBC
            13FFFFBB00FFFFBB00FFEC9211FFD38D61B2F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADCB570F8A730FFFFBF00FFFFBF
            00FFFFBF00FFFFBF00FFFFBF00FFF9B109FFDB8A4DD9D9D9D926FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE6CF3DEEC7
            53F2F2C84CFFF2C84CFFF3C54FFFF9BC53FFFFBF00FFFFBF00FFFDB902FFDC71
            22FFE2D5CC37FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FCEBD540F7B542FFFFC400FFFFC400FFFFC400FFFFC400FFFFC4
            00FFF7B00BFFDA8F55CCCCCCCC33E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F9F906E2D1AE66E9B84DF2EBB846FFEBB846FFEBB846FFF3B5
            55FFFBBD2EFFF2A610FFE38322FFDB7128FFECB69280FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF5EA20F7C6
            82BFF4B057FFF3AE55FFF7B034FFFFC800FFFFC800FFF6B20AFFDE802FFFD6BA
            8D8DCCCCCC33D2D2D22DE2E2E21DE5E5E51AE2E2E21DD7CFC244DAB473B2E5A7
            40FFE5A740FFE5A740FFE5A740FFEBAA48FFF5B346FFF9B909FFE07E2AFFE6CC
            B950FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9D4A18FF6A447FFFE73
            05FFFFCC00FFFFCC00FFFAC105FFDB7327FFDE983AFFDB9E4BE5D5AD79A5D4B0
            8299D5AD79A5D99F53D9DE983AFFDE983AFFDE983AFFDE983AFFDE983AFFE49D
            41FFF1A94BFFFCC610FFE68C28FFD4A8868DF5F5F50AFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8C784BFFD8017FFFF6F00FFFFB800FFFFD100FFFFD1
            00FFE3861BFFD97C2DFFD78834FFD78834FFD78834FFD78834FFD78834FFD788
            34FFD78834FFD78834FFD78834FFE3933FFFEEA145FFFCC80EFFFBC707FFE385
            30FFD0BEAF59E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8CD
            8FAFFD8117FFFF9600FFFFCF00FFFFD500FFFFD500FFFAC804FFDC7321FFD774
            2AFFD1782DFFD1782EFFD1782EFFD1782EFFD1782EFFD2792EFFD98134FFE58F
            3EFFEFA632FFFED204FFFFD500FFFDD003FFE68D2EFFDFAF8890FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBDCAE80FCB729FFFFDA00FFFFDA
            00FFFFDA00FFFFDA00FFFFDA00FFFDD302FFE89616FFDA7026FFD8722AFFD572
            2BFFD7752DFFDC7B30FFE38536FFEDA328FFF9C70FFFF5B91BFFE89239FFEFA8
            25FFE9972EFFE3A877AAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDF2E130F8BD59FFFED712FFFDD317FFF7BD43FFF6B947FFFEDB
            05FFFFDE00FFFFDE00FFFDD702FFF6C30AFFF2B710FFF5BF0EFFF7C60CFFFFDE
            00FFFCD509FFEFA732FFE59F5DD6F8E2CE40F2C59D80F0BD908FFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE5
            C360F8BA5FFFF7BF70E0FBE3C160F6C078CFFC8E16FFFFDA00FFFFE100FFFFE1
            00FFFEDD05FFFBD214FFF9C91DFFFFE100FFFFE100FFF5BD23FFE1A86EBFECEC
            EC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF2E130FFFFFF00FFFF
            FF00F9D0989FFCA81CFFFFE100FFFFE100FFF8C32FFFEEAB58F2F2BB7AC0F0A8
            58EFFCD50EFFF8C81CFFEEA53FFFEDCFAF6AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADAAD80F7BB50FFFACA
            2DFFF9C631FFF1B567E2F5F0EB19FFFFFF00F6CD9C8FEFA34EFFF1BC82B1F9E0
            C550FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFAF410FCECD640FBDEB670F9D8AB80FCF0DF30FFFF
            FF00FFFFFF00FEF9F410FDF3E920FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          Transparent = True
          ExplicitLeft = 620
        end
        object StaticText6: TStaticText
          Left = 24
          Top = 23
          Width = 512
          Height = 28
          AutoSize = False
          Caption = 
            #1053#1072' '#1076#1072#1085#1085#1086#1084' '#1096#1072#1075#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1085#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080' '#1091#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' ' +
            #1085#1072#1075#1088#1091#1079#1082#1080' '#1076#1083#1103' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1077#1081' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1085#1072' '#1087#1088#1077#1076#1099#1076#1091#1096#1077#1084' '#1096#1072#1075#1077' '#1092#1072#1082#1091#1083#1100 +
            #1090#1077#1090#1072'.'
          TabOrder = 0
        end
      end
      object tsCapPGC: TTabSheet
        Caption = 'tsCapPGC'
        ImageIndex = 4
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          682
          54)
        object Label3: TLabel
          Left = 8
          Top = 3
          Width = 342
          Height = 14
          Caption = #1064#1072#1075' 4. '#1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1087#1083#1072#1085#1080#1088#1091#1077#1084#1086#1075#1086' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090#1072' '#1075#1088#1091#1087#1087
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Image6: TImage
          Left = 618
          Top = 3
          Width = 53
          Height = 44
          Anchors = [akTop, akRight]
          Picture.Data = {
            07544269746D6170A6240000424DA62400000000000036000000280000003500
            00002C0000000100200000000000702400000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB04F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00F5F5F50AECECEC13E5E5E51AFCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CFCF
            CF30AFAFAF50B9B9B946E3E3E31CECECEC13E9E9E916FBFBFB04FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F50ACEB8
            AB59CFA38980D0957299CCC4C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00EFEF
            EF10D6D6D629ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FBFBFB04FFFFFF00DCD6C24BB99C22EA6A2E0BF7865532D2A696
            8783BE8C5FBAA29B9077D1D1D12EF4F4F40BFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F7E2D530D76720FFDE7C18FFE59212FFE28812FFD280
            51BFCCCCCC33E9E9E916FFFFFF00EEC7B252CE6932D8CC9C8480CCCCCC33D2D2
            D22DF5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D0CD38BBB9B64DEBEB
            EB14B99E8486FFD40AFFF9A201FFF47E02FFBA6121F6FC8D18FFF2A018F6A686
            669DDEDEDE21FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DA
            C740E2881AFFFFE100FFFFE100FFFCD902FFDD7815FFCF9B7D8DCCCCCC33F0E8
            E41CD15E1FF1EAA307FFDB740BFFCD5E25E5CCB4A859CFCFCF30FCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00E7E3DD34F2BF46E5C69D44D3896957AD8D3811F6CE7103FFFF9B
            00FFFA8600FFB45600FFDB7006FFFF8E00FFC48544C5DADADA25FBFBFB04FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DAC840E38A1BFFFFE100FFFFE1
            00FFFFDC00FFF7B605FFD5601AFFCEB09F66D0855BB2E38C0DFFFFE100FFFFE1
            00FFEDAA05FFCE5619F2CBC3BF40D6D6D629FCFCFC03FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF3E059FFBF
            1EFFFFA508FFD46C00FFBB5701FFF78700FFFF8B00FFFF8700FFFF8E00FFFF89
            00FFF78000FF8D532BD999918C75E0E0E01FFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC13CCCCCC33E5E5E51AFFFF
            FF00FFFFFF00EACFBC4CE48C1CFFFFC500FFFF9A00FFFF9500FFFF9500FFE77D
            10FFDF8014FFDE7E12FFFCD901FFFFE100FFFFD800FFFFAD00FFE78F07FFCC64
            30D9CBC3BF40E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E7E6E41FF4B932E8FF9400FFFF9200FFFF96
            00FFFC9513EFEEB570ABF9DDBB7DFFB362CCFF8000FFFD8500FFCF6300FFA664
            28D7D6D6D629FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00E8C4A66CE18033FFD6A57F99CCCCCC33D9D9D926DCBCA468DA7F3DE5EDA9
            14FFFFBB00FFFF9500FFFF9500FFFF9500FFFF9A00FFFFE100FFFFE100FFFFE1
            00FFFFE100FFFFA800FFFF9500FFFF9500FFDB610BFFCC94778DE2E2E21DFFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CBC6
            C53CAA9164A5FFD816FFFFA504FFFF9400FFD29F5BA6E0DCD728FFFFFF00FFFF
            FF00DCCCAF72FEA304FFFE8200FFFF8F03FFC8955EABF4F4F40BFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCCAE66E58B33FFF6BE10FFE790
            29FFDB9157CCD99560BFE28528FFF7C10BFFFFDB00FFFFB800FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFDB00FFFFDB00FFFFDB00FFFFBD00FFFF9500FFFF95
            00FFFC9101FFD35710FFCD8762A5CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E4DECE3E864F13F17A3005FFF8B510FFFFA1
            02FFD4933DC3F1F0F00FFFFFFF00FFFFFF00FFFFFF00D5C69782FFD502FFFF8C
            00FFD28133D8CFCECC36FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FAE9DA30E78F37FFFAC20BFFFFD000FFFFD000FFF0A619FFF0A518FFFDCA
            03FFFFD000FFFFD000FFFFB200FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFEB7A09FFD45D11FFD662
            0EFFCC9D8580CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00EFE5B769E8B300FFC46602FFF68C01FFF1910FF4C4BEB849FFFFFF00FFFF
            FF00FFFFFF00F3F2F20DEFD743D3FFE801FFFF8F00FFAE6C31D7C2C1C041FCFC
            FC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDAB6EBFF6B017FFFFC5
            00FFFFBF00FFFF9C00FFFFB700FFFFC500FFFFC500FFFFC500FFFFB100FFFF98
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFA700FFFFC500FFF9B702FFD35A10FFCC9D8580CCCC
            CC33F5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00EEECE131F7C32FE3FF9A
            00FFFF9900FFCA8B3CD0DBDBDB24FFFFFF00FFFFFF00F9F9F906C4B58588FFFF
            0EFFFFD502FFFF8601FFEE9334E1DBD9D82AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F3C79F80F2A323FFFFB800FFFF9E00FFFF9700FFFF97
            00FFFFA300FFFFB000FFFF9E00FFFF9700FFFF9700FFFF9700FFFF9700FFFF97
            00FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9E
            00FFFFB800FFFFBA00FFF6A603FFD35710FFCDB5A959EFEFEF10FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8F8F70CDFB879A9FEA30AFFFF9B00FFB88441CBC7C7
            C838DCDCDC23C5C1BD43BB9269A1FFE320FFFFF515FFF8970CFAC89C729FDED8
            D134FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAEA
            DB30EC9834FFFFA000FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B
            00FFFF9B00FFFF9B00FFFF9B00FFFE9F0CFFFDA61FFFFDAE32FFFEB034FFFFAC
            28FFFFA414FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFFA200FFFFA900FFFF9F
            00FFDF6B0DFFCCA69173E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
            FD14FFCE6BD0FEAE0CFFFF9A00FFC2750FF0554440C26C4838CF933F0EF6EA75
            08FFFFC20EFFFFA301FFCF823CD3EBEBEB14FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDA865CFF29824FFFFA0
            00FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFAA420FFF7AE
            48FFF5BA65F0FAD091AFFCDFB080FCE1B280FDDCA29FFED17EDFFFC152FFFFA8
            14FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFE87B0AFFCF916F99E9E9
            E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF0D548FDA00EF4FF92
            02FDFF9400FFB86201FF7A3300FFA14700FFEF7A01FFED922FDDF0A454C1CFB9
            A068FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFC
            FC03E5E5E51AE5E5E51AE5B17DACF49721FFFFA300FFFFA400FFFFA400FFFFA4
            00FFFFA400FFFDA409FFF4A53CFFEFB66FD3FBE5C950FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFE18ABFFFC966FFFFAB14FFFFA400FFFFA4
            00FFFFA400FFF79705FFDB6812FFDEA98C7CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFEFD04FCEEDA33F7D8969FFFA300FFFF950FF3F0A2
            40D0FF9000FFEF9F41D6DCDAD928FDFDFD02FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDF9F310F0CA9F86DCB58B99E2AB71BFEC99
            42FFFE8F04FFFF9800FFFFA900FFFFA900FFFFA900FFFBA50DFFEE9E45FFECCA
            A57BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFEE8CAFFFDB61FFFFC352FFFFA900FFFFA900FFEF8E0BFFD76419FFE0AD
            8E7BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F6F02EFFBE4FC8D2BDA161F2F1F012F6D3A07EE5DFD830FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FBE8D240F19F44FFF69126FFFA8912FFFB870DFFFF8300FFFFA300FFFFAD
            00FFFFAD00FFFBA70CFFEB973FFFEBCCAD6CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEEA76D0FFE758FFFFCF
            6AFFFFB314FFFFAD00FFE07616FFCFA48A80D2D2D22DFCFCFC03FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9DEBD60F89028FFFF78
            00FFFF7800FFFF7800FFFF8700FFFFB200FFFFB200FFFDAF04FFE99235FFDFBF
            A176FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFBEA20FFE758FFFFE758FFFED264FFFFB81BFFFFB200FFF08A
            0CFFD47234E5CCC5C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8D4A880F88D29FFFF8200FFFF8200FFFF9400FFFFA9
            00FFFFB600FFFFB600FFF19D1BFFDD9E66BFF9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E991A4FEE5
            57FFFEE557FFFDD161FFFEBA1AFFFFB600FFFFA000FFE97812FFD38554BFDFDF
            DF20FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8D5
            A980F9922AFFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFE588
            2DFFD7CBC144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F6EDCC47F8D752FFF8D752FFF8D752FFFAC460FFFEBC
            13FFFFBB00FFFFBB00FFEC9211FFD38D61B2F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADCB570F8A730FFFFBF00FFFFBF
            00FFFFBF00FFFFBF00FFFFBF00FFF9B109FFDB8A4DD9D9D9D926FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE6CF3DEEC7
            53F2F2C84CFFF2C84CFFF3C54FFFF9BC53FFFFBF00FFFFBF00FFFDB902FFDC71
            22FFE2D5CC37FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FCEBD540F7B542FFFFC400FFFFC400FFFFC400FFFFC400FFFFC4
            00FFF7B00BFFDA8F55CCCCCCCC33E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F9F906E2D1AE66E9B84DF2EBB846FFEBB846FFEBB846FFF3B5
            55FFFBBD2EFFF2A610FFE38322FFDB7128FFECB69280FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF5EA20F7C6
            82BFF4B057FFF3AE55FFF7B034FFFFC800FFFFC800FFF6B20AFFDE802FFFD6BA
            8D8DCCCCCC33D2D2D22DE2E2E21DE5E5E51AE2E2E21DD7CFC244DAB473B2E5A7
            40FFE5A740FFE5A740FFE5A740FFEBAA48FFF5B346FFF9B909FFE07E2AFFE6CC
            B950FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9D4A18FF6A447FFFE73
            05FFFFCC00FFFFCC00FFFAC105FFDB7327FFDE983AFFDB9E4BE5D5AD79A5D4B0
            8299D5AD79A5D99F53D9DE983AFFDE983AFFDE983AFFDE983AFFDE983AFFE49D
            41FFF1A94BFFFCC610FFE68C28FFD4A8868DF5F5F50AFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8C784BFFD8017FFFF6F00FFFFB800FFFFD100FFFFD1
            00FFE3861BFFD97C2DFFD78834FFD78834FFD78834FFD78834FFD78834FFD788
            34FFD78834FFD78834FFD78834FFE3933FFFEEA145FFFCC80EFFFBC707FFE385
            30FFD0BEAF59E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8CD
            8FAFFD8117FFFF9600FFFFCF00FFFFD500FFFFD500FFFAC804FFDC7321FFD774
            2AFFD1782DFFD1782EFFD1782EFFD1782EFFD1782EFFD2792EFFD98134FFE58F
            3EFFEFA632FFFED204FFFFD500FFFDD003FFE68D2EFFDFAF8890FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBDCAE80FCB729FFFFDA00FFFFDA
            00FFFFDA00FFFFDA00FFFFDA00FFFDD302FFE89616FFDA7026FFD8722AFFD572
            2BFFD7752DFFDC7B30FFE38536FFEDA328FFF9C70FFFF5B91BFFE89239FFEFA8
            25FFE9972EFFE3A877AAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDF2E130F8BD59FFFED712FFFDD317FFF7BD43FFF6B947FFFEDB
            05FFFFDE00FFFFDE00FFFDD702FFF6C30AFFF2B710FFF5BF0EFFF7C60CFFFFDE
            00FFFCD509FFEFA732FFE59F5DD6F8E2CE40F2C59D80F0BD908FFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE5
            C360F8BA5FFFF7BF70E0FBE3C160F6C078CFFC8E16FFFFDA00FFFFE100FFFFE1
            00FFFEDD05FFFBD214FFF9C91DFFFFE100FFFFE100FFF5BD23FFE1A86EBFECEC
            EC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF2E130FFFFFF00FFFF
            FF00F9D0989FFCA81CFFFFE100FFFFE100FFF8C32FFFEEAB58F2F2BB7AC0F0A8
            58EFFCD50EFFF8C81CFFEEA53FFFEDCFAF6AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADAAD80F7BB50FFFACA
            2DFFF9C631FFF1B567E2F5F0EB19FFFFFF00F6CD9C8FEFA34EFFF1BC82B1F9E0
            C550FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFAF410FCECD640FBDEB670F9D8AB80FCF0DF30FFFF
            FF00FFFFFF00FEF9F410FDF3E920FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          Transparent = True
          ExplicitLeft = 620
        end
        object StaticText7: TStaticText
          Left = 24
          Top = 23
          Width = 512
          Height = 28
          AutoSize = False
          Caption = 
            #1053#1072' '#1076#1072#1085#1085#1086#1084' '#1096#1072#1075#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1083#1072#1085#1080#1088#1091#1077#1084#1099#1081' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1076#1083#1103' '#1075 +
            #1088#1091#1087#1087', '#1086#1073#1091#1095#1072#1102#1097#1080#1093#1089#1103' '#1085#1072' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1077', '#1082#1086#1090#1086#1088#1099#1081' '#1073#1099#1083' '#1074#1099#1073#1088#1072#1085' '#1085#1072' '#1096#1072#1075#1077' 2.'
          TabOrder = 0
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        ImageIndex = 6
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          682
          54)
        object Label8: TLabel
          Left = 8
          Top = 3
          Width = 151
          Height = 14
          Caption = #1064#1072#1075' 5. '#1042#1099#1073#1086#1088' '#1082#1072#1092#1077#1076#1088#1099
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Image10: TImage
          Left = 618
          Top = 3
          Width = 53
          Height = 44
          Anchors = [akTop, akRight]
          Picture.Data = {
            07544269746D6170A6240000424DA62400000000000036000000280000003500
            00002C0000000100200000000000702400000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB04F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00F5F5F50AECECEC13E5E5E51AFCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CFCF
            CF30AFAFAF50B9B9B946E3E3E31CECECEC13E9E9E916FBFBFB04FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F50ACEB8
            AB59CFA38980D0957299CCC4C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00EFEF
            EF10D6D6D629ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FBFBFB04FFFFFF00DCD6C24BB99C22EA6A2E0BF7865532D2A696
            8783BE8C5FBAA29B9077D1D1D12EF4F4F40BFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F7E2D530D76720FFDE7C18FFE59212FFE28812FFD280
            51BFCCCCCC33E9E9E916FFFFFF00EEC7B252CE6932D8CC9C8480CCCCCC33D2D2
            D22DF5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D0CD38BBB9B64DEBEB
            EB14B99E8486FFD40AFFF9A201FFF47E02FFBA6121F6FC8D18FFF2A018F6A686
            669DDEDEDE21FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DA
            C740E2881AFFFFE100FFFFE100FFFCD902FFDD7815FFCF9B7D8DCCCCCC33F0E8
            E41CD15E1FF1EAA307FFDB740BFFCD5E25E5CCB4A859CFCFCF30FCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00E7E3DD34F2BF46E5C69D44D3896957AD8D3811F6CE7103FFFF9B
            00FFFA8600FFB45600FFDB7006FFFF8E00FFC48544C5DADADA25FBFBFB04FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DAC840E38A1BFFFFE100FFFFE1
            00FFFFDC00FFF7B605FFD5601AFFCEB09F66D0855BB2E38C0DFFFFE100FFFFE1
            00FFEDAA05FFCE5619F2CBC3BF40D6D6D629FCFCFC03FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF3E059FFBF
            1EFFFFA508FFD46C00FFBB5701FFF78700FFFF8B00FFFF8700FFFF8E00FFFF89
            00FFF78000FF8D532BD999918C75E0E0E01FFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC13CCCCCC33E5E5E51AFFFF
            FF00FFFFFF00EACFBC4CE48C1CFFFFC500FFFF9A00FFFF9500FFFF9500FFE77D
            10FFDF8014FFDE7E12FFFCD901FFFFE100FFFFD800FFFFAD00FFE78F07FFCC64
            30D9CBC3BF40E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E7E6E41FF4B932E8FF9400FFFF9200FFFF96
            00FFFC9513EFEEB570ABF9DDBB7DFFB362CCFF8000FFFD8500FFCF6300FFA664
            28D7D6D6D629FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00E8C4A66CE18033FFD6A57F99CCCCCC33D9D9D926DCBCA468DA7F3DE5EDA9
            14FFFFBB00FFFF9500FFFF9500FFFF9500FFFF9A00FFFFE100FFFFE100FFFFE1
            00FFFFE100FFFFA800FFFF9500FFFF9500FFDB610BFFCC94778DE2E2E21DFFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CBC6
            C53CAA9164A5FFD816FFFFA504FFFF9400FFD29F5BA6E0DCD728FFFFFF00FFFF
            FF00DCCCAF72FEA304FFFE8200FFFF8F03FFC8955EABF4F4F40BFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCCAE66E58B33FFF6BE10FFE790
            29FFDB9157CCD99560BFE28528FFF7C10BFFFFDB00FFFFB800FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFDB00FFFFDB00FFFFDB00FFFFBD00FFFF9500FFFF95
            00FFFC9101FFD35710FFCD8762A5CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E4DECE3E864F13F17A3005FFF8B510FFFFA1
            02FFD4933DC3F1F0F00FFFFFFF00FFFFFF00FFFFFF00D5C69782FFD502FFFF8C
            00FFD28133D8CFCECC36FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FAE9DA30E78F37FFFAC20BFFFFD000FFFFD000FFF0A619FFF0A518FFFDCA
            03FFFFD000FFFFD000FFFFB200FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFEB7A09FFD45D11FFD662
            0EFFCC9D8580CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00EFE5B769E8B300FFC46602FFF68C01FFF1910FF4C4BEB849FFFFFF00FFFF
            FF00FFFFFF00F3F2F20DEFD743D3FFE801FFFF8F00FFAE6C31D7C2C1C041FCFC
            FC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDAB6EBFF6B017FFFFC5
            00FFFFBF00FFFF9C00FFFFB700FFFFC500FFFFC500FFFFC500FFFFB100FFFF98
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFA700FFFFC500FFF9B702FFD35A10FFCC9D8580CCCC
            CC33F5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00EEECE131F7C32FE3FF9A
            00FFFF9900FFCA8B3CD0DBDBDB24FFFFFF00FFFFFF00F9F9F906C4B58588FFFF
            0EFFFFD502FFFF8601FFEE9334E1DBD9D82AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F3C79F80F2A323FFFFB800FFFF9E00FFFF9700FFFF97
            00FFFFA300FFFFB000FFFF9E00FFFF9700FFFF9700FFFF9700FFFF9700FFFF97
            00FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9E
            00FFFFB800FFFFBA00FFF6A603FFD35710FFCDB5A959EFEFEF10FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8F8F70CDFB879A9FEA30AFFFF9B00FFB88441CBC7C7
            C838DCDCDC23C5C1BD43BB9269A1FFE320FFFFF515FFF8970CFAC89C729FDED8
            D134FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAEA
            DB30EC9834FFFFA000FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B
            00FFFF9B00FFFF9B00FFFF9B00FFFE9F0CFFFDA61FFFFDAE32FFFEB034FFFFAC
            28FFFFA414FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFFA200FFFFA900FFFF9F
            00FFDF6B0DFFCCA69173E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
            FD14FFCE6BD0FEAE0CFFFF9A00FFC2750FF0554440C26C4838CF933F0EF6EA75
            08FFFFC20EFFFFA301FFCF823CD3EBEBEB14FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDA865CFF29824FFFFA0
            00FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFAA420FFF7AE
            48FFF5BA65F0FAD091AFFCDFB080FCE1B280FDDCA29FFED17EDFFFC152FFFFA8
            14FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFE87B0AFFCF916F99E9E9
            E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF0D548FDA00EF4FF92
            02FDFF9400FFB86201FF7A3300FFA14700FFEF7A01FFED922FDDF0A454C1CFB9
            A068FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFC
            FC03E5E5E51AE5E5E51AE5B17DACF49721FFFFA300FFFFA400FFFFA400FFFFA4
            00FFFFA400FFFDA409FFF4A53CFFEFB66FD3FBE5C950FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFE18ABFFFC966FFFFAB14FFFFA400FFFFA4
            00FFFFA400FFF79705FFDB6812FFDEA98C7CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFEFD04FCEEDA33F7D8969FFFA300FFFF950FF3F0A2
            40D0FF9000FFEF9F41D6DCDAD928FDFDFD02FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDF9F310F0CA9F86DCB58B99E2AB71BFEC99
            42FFFE8F04FFFF9800FFFFA900FFFFA900FFFFA900FFFBA50DFFEE9E45FFECCA
            A57BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFEE8CAFFFDB61FFFFC352FFFFA900FFFFA900FFEF8E0BFFD76419FFE0AD
            8E7BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F6F02EFFBE4FC8D2BDA161F2F1F012F6D3A07EE5DFD830FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FBE8D240F19F44FFF69126FFFA8912FFFB870DFFFF8300FFFFA300FFFFAD
            00FFFFAD00FFFBA70CFFEB973FFFEBCCAD6CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEEA76D0FFE758FFFFCF
            6AFFFFB314FFFFAD00FFE07616FFCFA48A80D2D2D22DFCFCFC03FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9DEBD60F89028FFFF78
            00FFFF7800FFFF7800FFFF8700FFFFB200FFFFB200FFFDAF04FFE99235FFDFBF
            A176FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFBEA20FFE758FFFFE758FFFED264FFFFB81BFFFFB200FFF08A
            0CFFD47234E5CCC5C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8D4A880F88D29FFFF8200FFFF8200FFFF9400FFFFA9
            00FFFFB600FFFFB600FFF19D1BFFDD9E66BFF9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E991A4FEE5
            57FFFEE557FFFDD161FFFEBA1AFFFFB600FFFFA000FFE97812FFD38554BFDFDF
            DF20FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8D5
            A980F9922AFFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFE588
            2DFFD7CBC144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F6EDCC47F8D752FFF8D752FFF8D752FFFAC460FFFEBC
            13FFFFBB00FFFFBB00FFEC9211FFD38D61B2F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADCB570F8A730FFFFBF00FFFFBF
            00FFFFBF00FFFFBF00FFFFBF00FFF9B109FFDB8A4DD9D9D9D926FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE6CF3DEEC7
            53F2F2C84CFFF2C84CFFF3C54FFFF9BC53FFFFBF00FFFFBF00FFFDB902FFDC71
            22FFE2D5CC37FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FCEBD540F7B542FFFFC400FFFFC400FFFFC400FFFFC400FFFFC4
            00FFF7B00BFFDA8F55CCCCCCCC33E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F9F906E2D1AE66E9B84DF2EBB846FFEBB846FFEBB846FFF3B5
            55FFFBBD2EFFF2A610FFE38322FFDB7128FFECB69280FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF5EA20F7C6
            82BFF4B057FFF3AE55FFF7B034FFFFC800FFFFC800FFF6B20AFFDE802FFFD6BA
            8D8DCCCCCC33D2D2D22DE2E2E21DE5E5E51AE2E2E21DD7CFC244DAB473B2E5A7
            40FFE5A740FFE5A740FFE5A740FFEBAA48FFF5B346FFF9B909FFE07E2AFFE6CC
            B950FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9D4A18FF6A447FFFE73
            05FFFFCC00FFFFCC00FFFAC105FFDB7327FFDE983AFFDB9E4BE5D5AD79A5D4B0
            8299D5AD79A5D99F53D9DE983AFFDE983AFFDE983AFFDE983AFFDE983AFFE49D
            41FFF1A94BFFFCC610FFE68C28FFD4A8868DF5F5F50AFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8C784BFFD8017FFFF6F00FFFFB800FFFFD100FFFFD1
            00FFE3861BFFD97C2DFFD78834FFD78834FFD78834FFD78834FFD78834FFD788
            34FFD78834FFD78834FFD78834FFE3933FFFEEA145FFFCC80EFFFBC707FFE385
            30FFD0BEAF59E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8CD
            8FAFFD8117FFFF9600FFFFCF00FFFFD500FFFFD500FFFAC804FFDC7321FFD774
            2AFFD1782DFFD1782EFFD1782EFFD1782EFFD1782EFFD2792EFFD98134FFE58F
            3EFFEFA632FFFED204FFFFD500FFFDD003FFE68D2EFFDFAF8890FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBDCAE80FCB729FFFFDA00FFFFDA
            00FFFFDA00FFFFDA00FFFFDA00FFFDD302FFE89616FFDA7026FFD8722AFFD572
            2BFFD7752DFFDC7B30FFE38536FFEDA328FFF9C70FFFF5B91BFFE89239FFEFA8
            25FFE9972EFFE3A877AAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDF2E130F8BD59FFFED712FFFDD317FFF7BD43FFF6B947FFFEDB
            05FFFFDE00FFFFDE00FFFDD702FFF6C30AFFF2B710FFF5BF0EFFF7C60CFFFFDE
            00FFFCD509FFEFA732FFE59F5DD6F8E2CE40F2C59D80F0BD908FFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE5
            C360F8BA5FFFF7BF70E0FBE3C160F6C078CFFC8E16FFFFDA00FFFFE100FFFFE1
            00FFFEDD05FFFBD214FFF9C91DFFFFE100FFFFE100FFF5BD23FFE1A86EBFECEC
            EC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF2E130FFFFFF00FFFF
            FF00F9D0989FFCA81CFFFFE100FFFFE100FFF8C32FFFEEAB58F2F2BB7AC0F0A8
            58EFFCD50EFFF8C81CFFEEA53FFFEDCFAF6AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADAAD80F7BB50FFFACA
            2DFFF9C631FFF1B567E2F5F0EB19FFFFFF00F6CD9C8FEFA34EFFF1BC82B1F9E0
            C550FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFAF410FCECD640FBDEB670F9D8AB80FCF0DF30FFFF
            FF00FFFFFF00FEF9F410FDF3E920FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          Transparent = True
          ExplicitLeft = 620
        end
        object StaticText22: TStaticText
          Left = 24
          Top = 23
          Width = 512
          Height = 28
          AutoSize = False
          Caption = 
            #1053#1072' '#1076#1072#1085#1085#1086#1084' '#1096#1072#1075#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1082#1072#1092#1077#1076#1088#1091', '#1076#1083#1103' '#1082#1086#1090#1086#1088#1086#1081' '#1085#1072' '#1089#1083#1077#1076#1091#1102 +
            #1097#1077#1084' '#1101#1090#1072#1087#1077' '#1073#1091#1076#1091#1090' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1099' '#1089#1087#1080#1089#1082#1080' '#1087#1086#1090#1086#1082#1086#1074'.'
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 7
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          682
          54)
        object Label9: TLabel
          Left = 8
          Top = 3
          Width = 265
          Height = 14
          Caption = #1064#1072#1075' 6. '#1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1090#1086#1082#1072#1084#1080' '#1082#1072#1092#1077#1076#1088#1099' ""'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Image11: TImage
          Left = 618
          Top = 3
          Width = 53
          Height = 44
          Anchors = [akTop, akRight]
          Picture.Data = {
            07544269746D6170A6240000424DA62400000000000036000000280000003500
            00002C0000000100200000000000702400000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB04F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00F5F5F50AECECEC13E5E5E51AFCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CFCF
            CF30AFAFAF50B9B9B946E3E3E31CECECEC13E9E9E916FBFBFB04FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F50ACEB8
            AB59CFA38980D0957299CCC4C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00EFEF
            EF10D6D6D629ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FBFBFB04FFFFFF00DCD6C24BB99C22EA6A2E0BF7865532D2A696
            8783BE8C5FBAA29B9077D1D1D12EF4F4F40BFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F7E2D530D76720FFDE7C18FFE59212FFE28812FFD280
            51BFCCCCCC33E9E9E916FFFFFF00EEC7B252CE6932D8CC9C8480CCCCCC33D2D2
            D22DF5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D0CD38BBB9B64DEBEB
            EB14B99E8486FFD40AFFF9A201FFF47E02FFBA6121F6FC8D18FFF2A018F6A686
            669DDEDEDE21FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DA
            C740E2881AFFFFE100FFFFE100FFFCD902FFDD7815FFCF9B7D8DCCCCCC33F0E8
            E41CD15E1FF1EAA307FFDB740BFFCD5E25E5CCB4A859CFCFCF30FCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00E7E3DD34F2BF46E5C69D44D3896957AD8D3811F6CE7103FFFF9B
            00FFFA8600FFB45600FFDB7006FFFF8E00FFC48544C5DADADA25FBFBFB04FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DAC840E38A1BFFFFE100FFFFE1
            00FFFFDC00FFF7B605FFD5601AFFCEB09F66D0855BB2E38C0DFFFFE100FFFFE1
            00FFEDAA05FFCE5619F2CBC3BF40D6D6D629FCFCFC03FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF3E059FFBF
            1EFFFFA508FFD46C00FFBB5701FFF78700FFFF8B00FFFF8700FFFF8E00FFFF89
            00FFF78000FF8D532BD999918C75E0E0E01FFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC13CCCCCC33E5E5E51AFFFF
            FF00FFFFFF00EACFBC4CE48C1CFFFFC500FFFF9A00FFFF9500FFFF9500FFE77D
            10FFDF8014FFDE7E12FFFCD901FFFFE100FFFFD800FFFFAD00FFE78F07FFCC64
            30D9CBC3BF40E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E7E6E41FF4B932E8FF9400FFFF9200FFFF96
            00FFFC9513EFEEB570ABF9DDBB7DFFB362CCFF8000FFFD8500FFCF6300FFA664
            28D7D6D6D629FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00E8C4A66CE18033FFD6A57F99CCCCCC33D9D9D926DCBCA468DA7F3DE5EDA9
            14FFFFBB00FFFF9500FFFF9500FFFF9500FFFF9A00FFFFE100FFFFE100FFFFE1
            00FFFFE100FFFFA800FFFF9500FFFF9500FFDB610BFFCC94778DE2E2E21DFFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CBC6
            C53CAA9164A5FFD816FFFFA504FFFF9400FFD29F5BA6E0DCD728FFFFFF00FFFF
            FF00DCCCAF72FEA304FFFE8200FFFF8F03FFC8955EABF4F4F40BFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCCAE66E58B33FFF6BE10FFE790
            29FFDB9157CCD99560BFE28528FFF7C10BFFFFDB00FFFFB800FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFDB00FFFFDB00FFFFDB00FFFFBD00FFFF9500FFFF95
            00FFFC9101FFD35710FFCD8762A5CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E4DECE3E864F13F17A3005FFF8B510FFFFA1
            02FFD4933DC3F1F0F00FFFFFFF00FFFFFF00FFFFFF00D5C69782FFD502FFFF8C
            00FFD28133D8CFCECC36FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FAE9DA30E78F37FFFAC20BFFFFD000FFFFD000FFF0A619FFF0A518FFFDCA
            03FFFFD000FFFFD000FFFFB200FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFEB7A09FFD45D11FFD662
            0EFFCC9D8580CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00EFE5B769E8B300FFC46602FFF68C01FFF1910FF4C4BEB849FFFFFF00FFFF
            FF00FFFFFF00F3F2F20DEFD743D3FFE801FFFF8F00FFAE6C31D7C2C1C041FCFC
            FC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDAB6EBFF6B017FFFFC5
            00FFFFBF00FFFF9C00FFFFB700FFFFC500FFFFC500FFFFC500FFFFB100FFFF98
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFA700FFFFC500FFF9B702FFD35A10FFCC9D8580CCCC
            CC33F5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00EEECE131F7C32FE3FF9A
            00FFFF9900FFCA8B3CD0DBDBDB24FFFFFF00FFFFFF00F9F9F906C4B58588FFFF
            0EFFFFD502FFFF8601FFEE9334E1DBD9D82AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F3C79F80F2A323FFFFB800FFFF9E00FFFF9700FFFF97
            00FFFFA300FFFFB000FFFF9E00FFFF9700FFFF9700FFFF9700FFFF9700FFFF97
            00FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9E
            00FFFFB800FFFFBA00FFF6A603FFD35710FFCDB5A959EFEFEF10FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8F8F70CDFB879A9FEA30AFFFF9B00FFB88441CBC7C7
            C838DCDCDC23C5C1BD43BB9269A1FFE320FFFFF515FFF8970CFAC89C729FDED8
            D134FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAEA
            DB30EC9834FFFFA000FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B
            00FFFF9B00FFFF9B00FFFF9B00FFFE9F0CFFFDA61FFFFDAE32FFFEB034FFFFAC
            28FFFFA414FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFFA200FFFFA900FFFF9F
            00FFDF6B0DFFCCA69173E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
            FD14FFCE6BD0FEAE0CFFFF9A00FFC2750FF0554440C26C4838CF933F0EF6EA75
            08FFFFC20EFFFFA301FFCF823CD3EBEBEB14FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDA865CFF29824FFFFA0
            00FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFAA420FFF7AE
            48FFF5BA65F0FAD091AFFCDFB080FCE1B280FDDCA29FFED17EDFFFC152FFFFA8
            14FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFE87B0AFFCF916F99E9E9
            E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF0D548FDA00EF4FF92
            02FDFF9400FFB86201FF7A3300FFA14700FFEF7A01FFED922FDDF0A454C1CFB9
            A068FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFC
            FC03E5E5E51AE5E5E51AE5B17DACF49721FFFFA300FFFFA400FFFFA400FFFFA4
            00FFFFA400FFFDA409FFF4A53CFFEFB66FD3FBE5C950FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFE18ABFFFC966FFFFAB14FFFFA400FFFFA4
            00FFFFA400FFF79705FFDB6812FFDEA98C7CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFEFD04FCEEDA33F7D8969FFFA300FFFF950FF3F0A2
            40D0FF9000FFEF9F41D6DCDAD928FDFDFD02FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDF9F310F0CA9F86DCB58B99E2AB71BFEC99
            42FFFE8F04FFFF9800FFFFA900FFFFA900FFFFA900FFFBA50DFFEE9E45FFECCA
            A57BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFEE8CAFFFDB61FFFFC352FFFFA900FFFFA900FFEF8E0BFFD76419FFE0AD
            8E7BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F6F02EFFBE4FC8D2BDA161F2F1F012F6D3A07EE5DFD830FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FBE8D240F19F44FFF69126FFFA8912FFFB870DFFFF8300FFFFA300FFFFAD
            00FFFFAD00FFFBA70CFFEB973FFFEBCCAD6CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEEA76D0FFE758FFFFCF
            6AFFFFB314FFFFAD00FFE07616FFCFA48A80D2D2D22DFCFCFC03FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9DEBD60F89028FFFF78
            00FFFF7800FFFF7800FFFF8700FFFFB200FFFFB200FFFDAF04FFE99235FFDFBF
            A176FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFBEA20FFE758FFFFE758FFFED264FFFFB81BFFFFB200FFF08A
            0CFFD47234E5CCC5C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8D4A880F88D29FFFF8200FFFF8200FFFF9400FFFFA9
            00FFFFB600FFFFB600FFF19D1BFFDD9E66BFF9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E991A4FEE5
            57FFFEE557FFFDD161FFFEBA1AFFFFB600FFFFA000FFE97812FFD38554BFDFDF
            DF20FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8D5
            A980F9922AFFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFE588
            2DFFD7CBC144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F6EDCC47F8D752FFF8D752FFF8D752FFFAC460FFFEBC
            13FFFFBB00FFFFBB00FFEC9211FFD38D61B2F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADCB570F8A730FFFFBF00FFFFBF
            00FFFFBF00FFFFBF00FFFFBF00FFF9B109FFDB8A4DD9D9D9D926FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE6CF3DEEC7
            53F2F2C84CFFF2C84CFFF3C54FFFF9BC53FFFFBF00FFFFBF00FFFDB902FFDC71
            22FFE2D5CC37FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FCEBD540F7B542FFFFC400FFFFC400FFFFC400FFFFC400FFFFC4
            00FFF7B00BFFDA8F55CCCCCCCC33E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F9F906E2D1AE66E9B84DF2EBB846FFEBB846FFEBB846FFF3B5
            55FFFBBD2EFFF2A610FFE38322FFDB7128FFECB69280FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF5EA20F7C6
            82BFF4B057FFF3AE55FFF7B034FFFFC800FFFFC800FFF6B20AFFDE802FFFD6BA
            8D8DCCCCCC33D2D2D22DE2E2E21DE5E5E51AE2E2E21DD7CFC244DAB473B2E5A7
            40FFE5A740FFE5A740FFE5A740FFEBAA48FFF5B346FFF9B909FFE07E2AFFE6CC
            B950FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9D4A18FF6A447FFFE73
            05FFFFCC00FFFFCC00FFFAC105FFDB7327FFDE983AFFDB9E4BE5D5AD79A5D4B0
            8299D5AD79A5D99F53D9DE983AFFDE983AFFDE983AFFDE983AFFDE983AFFE49D
            41FFF1A94BFFFCC610FFE68C28FFD4A8868DF5F5F50AFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8C784BFFD8017FFFF6F00FFFFB800FFFFD100FFFFD1
            00FFE3861BFFD97C2DFFD78834FFD78834FFD78834FFD78834FFD78834FFD788
            34FFD78834FFD78834FFD78834FFE3933FFFEEA145FFFCC80EFFFBC707FFE385
            30FFD0BEAF59E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8CD
            8FAFFD8117FFFF9600FFFFCF00FFFFD500FFFFD500FFFAC804FFDC7321FFD774
            2AFFD1782DFFD1782EFFD1782EFFD1782EFFD1782EFFD2792EFFD98134FFE58F
            3EFFEFA632FFFED204FFFFD500FFFDD003FFE68D2EFFDFAF8890FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBDCAE80FCB729FFFFDA00FFFFDA
            00FFFFDA00FFFFDA00FFFFDA00FFFDD302FFE89616FFDA7026FFD8722AFFD572
            2BFFD7752DFFDC7B30FFE38536FFEDA328FFF9C70FFFF5B91BFFE89239FFEFA8
            25FFE9972EFFE3A877AAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDF2E130F8BD59FFFED712FFFDD317FFF7BD43FFF6B947FFFEDB
            05FFFFDE00FFFFDE00FFFDD702FFF6C30AFFF2B710FFF5BF0EFFF7C60CFFFFDE
            00FFFCD509FFEFA732FFE59F5DD6F8E2CE40F2C59D80F0BD908FFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE5
            C360F8BA5FFFF7BF70E0FBE3C160F6C078CFFC8E16FFFFDA00FFFFE100FFFFE1
            00FFFEDD05FFFBD214FFF9C91DFFFFE100FFFFE100FFF5BD23FFE1A86EBFECEC
            EC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF2E130FFFFFF00FFFF
            FF00F9D0989FFCA81CFFFFE100FFFFE100FFF8C32FFFEEAB58F2F2BB7AC0F0A8
            58EFFCD50EFFF8C81CFFEEA53FFFEDCFAF6AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADAAD80F7BB50FFFACA
            2DFFF9C631FFF1B567E2F5F0EB19FFFFFF00F6CD9C8FEFA34EFFF1BC82B1F9E0
            C550FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFAF410FCECD640FBDEB670F9D8AB80FCF0DF30FFFF
            FF00FFFFFF00FEF9F410FDF3E920FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          Transparent = True
          ExplicitLeft = 620
        end
        object StaticText23: TStaticText
          Left = 24
          Top = 23
          Width = 528
          Height = 28
          AutoSize = False
          Caption = 
            #1053#1072' '#1076#1072#1085#1085#1086#1084' '#1096#1072#1075#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1089#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1077' '#1087#1086#1090#1086#1082#1080', '#1080#1079#1084#1077#1085#1080#1090#1100' '#1089#1091#1097#1077#1089#1090#1074 +
            #1091#1102#1097#1080#1077' '#1087#1086#1090#1086#1082#1080' '#1083#1080#1073#1086' '#1091#1076#1072#1083#1080#1090#1100' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1087#1086#1090#1086#1082#1080' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1082#1072#1092#1077#1076#1088#1099', '#1072' '#1079 +
            #1072#1090#1077#1084' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1089#1093#1077#1084#1099' '#1076#1077#1083#1077#1085#1080#1103' '#1076#1083#1103' '#1076#1072#1085#1085#1099#1093' '#1087#1086#1090#1086#1082#1086#1074'. '
          TabOrder = 0
        end
      end
      object tsCapFinish: TTabSheet
        Caption = 'tsCapFinish'
        ImageIndex = 5
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          682
          54)
        object Label4: TLabel
          Left = 8
          Top = 3
          Width = 184
          Height = 14
          Caption = #1047#1072#1074#1077#1088#1096#1077#1085#1080#1077' '#1088#1072#1073#1086#1090#1099' '#1084#1072#1089#1090#1077#1088#1072
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Image2: TImage
          Left = 618
          Top = 3
          Width = 53
          Height = 44
          Anchors = [akTop, akRight]
          Picture.Data = {
            07544269746D6170A6240000424DA62400000000000036000000280000003500
            00002C0000000100200000000000702400000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB04F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00F5F5F50AECECEC13E5E5E51AFCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CFCF
            CF30AFAFAF50B9B9B946E3E3E31CECECEC13E9E9E916FBFBFB04FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F50ACEB8
            AB59CFA38980D0957299CCC4C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00EFEF
            EF10D6D6D629ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FBFBFB04FFFFFF00DCD6C24BB99C22EA6A2E0BF7865532D2A696
            8783BE8C5FBAA29B9077D1D1D12EF4F4F40BFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F7E2D530D76720FFDE7C18FFE59212FFE28812FFD280
            51BFCCCCCC33E9E9E916FFFFFF00EEC7B252CE6932D8CC9C8480CCCCCC33D2D2
            D22DF5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D0CD38BBB9B64DEBEB
            EB14B99E8486FFD40AFFF9A201FFF47E02FFBA6121F6FC8D18FFF2A018F6A686
            669DDEDEDE21FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DA
            C740E2881AFFFFE100FFFFE100FFFCD902FFDD7815FFCF9B7D8DCCCCCC33F0E8
            E41CD15E1FF1EAA307FFDB740BFFCD5E25E5CCB4A859CFCFCF30FCFCFC03FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00E7E3DD34F2BF46E5C69D44D3896957AD8D3811F6CE7103FFFF9B
            00FFFA8600FFB45600FFDB7006FFFF8E00FFC48544C5DADADA25FBFBFB04FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5DAC840E38A1BFFFFE100FFFFE1
            00FFFFDC00FFF7B605FFD5601AFFCEB09F66D0855BB2E38C0DFFFFE100FFFFE1
            00FFEDAA05FFCE5619F2CBC3BF40D6D6D629FCFCFC03FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF3E059FFBF
            1EFFFFA508FFD46C00FFBB5701FFF78700FFFF8B00FFFF8700FFFF8E00FFFF89
            00FFF78000FF8D532BD999918C75E0E0E01FFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC13CCCCCC33E5E5E51AFFFF
            FF00FFFFFF00EACFBC4CE48C1CFFFFC500FFFF9A00FFFF9500FFFF9500FFE77D
            10FFDF8014FFDE7E12FFFCD901FFFFE100FFFFD800FFFFAD00FFE78F07FFCC64
            30D9CBC3BF40E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E7E6E41FF4B932E8FF9400FFFF9200FFFF96
            00FFFC9513EFEEB570ABF9DDBB7DFFB362CCFF8000FFFD8500FFCF6300FFA664
            28D7D6D6D629FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00E8C4A66CE18033FFD6A57F99CCCCCC33D9D9D926DCBCA468DA7F3DE5EDA9
            14FFFFBB00FFFF9500FFFF9500FFFF9500FFFF9A00FFFFE100FFFFE100FFFFE1
            00FFFFE100FFFFA800FFFF9500FFFF9500FFDB610BFFCC94778DE2E2E21DFFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA05CBC6
            C53CAA9164A5FFD816FFFFA504FFFF9400FFD29F5BA6E0DCD728FFFFFF00FFFF
            FF00DCCCAF72FEA304FFFE8200FFFF8F03FFC8955EABF4F4F40BFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCCAE66E58B33FFF6BE10FFE790
            29FFDB9157CCD99560BFE28528FFF7C10BFFFFDB00FFFFB800FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFDB00FFFFDB00FFFFDB00FFFFBD00FFFF9500FFFF95
            00FFFC9101FFD35710FFCD8762A5CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00E4DECE3E864F13F17A3005FFF8B510FFFFA1
            02FFD4933DC3F1F0F00FFFFFFF00FFFFFF00FFFFFF00D5C69782FFD502FFFF8C
            00FFD28133D8CFCECC36FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FAE9DA30E78F37FFFAC20BFFFFD000FFFFD000FFF0A619FFF0A518FFFDCA
            03FFFFD000FFFFD000FFFFB200FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFEB7A09FFD45D11FFD662
            0EFFCC9D8580CCCCCC33ECECEC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00EFE5B769E8B300FFC46602FFF68C01FFF1910FF4C4BEB849FFFFFF00FFFF
            FF00FFFFFF00F3F2F20DEFD743D3FFE801FFFF8F00FFAE6C31D7C2C1C041FCFC
            FC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDAB6EBFF6B017FFFFC5
            00FFFFBF00FFFF9C00FFFFB700FFFFC500FFFFC500FFFFC500FFFFB100FFFF98
            00FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF9500FFFF95
            00FFFF9500FFFF9500FFFFA700FFFFC500FFF9B702FFD35A10FFCC9D8580CCCC
            CC33F5F5F50AFFFFFF00FFFFFF00FFFFFF00FFFFFF00EEECE131F7C32FE3FF9A
            00FFFF9900FFCA8B3CD0DBDBDB24FFFFFF00FFFFFF00F9F9F906C4B58588FFFF
            0EFFFFD502FFFF8601FFEE9334E1DBD9D82AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F3C79F80F2A323FFFFB800FFFF9E00FFFF9700FFFF97
            00FFFFA300FFFFB000FFFF9E00FFFF9700FFFF9700FFFF9700FFFF9700FFFF97
            00FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9700FFFF9E
            00FFFFB800FFFFBA00FFF6A603FFD35710FFCDB5A959EFEFEF10FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8F8F70CDFB879A9FEA30AFFFF9B00FFB88441CBC7C7
            C838DCDCDC23C5C1BD43BB9269A1FFE320FFFFF515FFF8970CFAC89C729FDED8
            D134FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAEA
            DB30EC9834FFFFA000FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFF9B
            00FFFF9B00FFFF9B00FFFF9B00FFFE9F0CFFFDA61FFFFDAE32FFFEB034FFFFAC
            28FFFFA414FFFF9B00FFFF9B00FFFF9B00FFFF9B00FFFFA200FFFFA900FFFF9F
            00FFDF6B0DFFCCA69173E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
            FD14FFCE6BD0FEAE0CFFFF9A00FFC2750FF0554440C26C4838CF933F0EF6EA75
            08FFFFC20EFFFFA301FFCF823CD3EBEBEB14FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDA865CFF29824FFFFA0
            00FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFFAA420FFF7AE
            48FFF5BA65F0FAD091AFFCDFB080FCE1B280FDDCA29FFED17EDFFFC152FFFFA8
            14FFFFA000FFFFA000FFFFA000FFFFA000FFFFA000FFE87B0AFFCF916F99E9E9
            E916FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF0D548FDA00EF4FF92
            02FDFF9400FFB86201FF7A3300FFA14700FFEF7A01FFED922FDDF0A454C1CFB9
            A068FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFC
            FC03E5E5E51AE5E5E51AE5B17DACF49721FFFFA300FFFFA400FFFFA400FFFFA4
            00FFFFA400FFFDA409FFF4A53CFFEFB66FD3FBE5C950FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFE18ABFFFC966FFFFAB14FFFFA400FFFFA4
            00FFFFA400FFF79705FFDB6812FFDEA98C7CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFEFD04FCEEDA33F7D8969FFFA300FFFF950FF3F0A2
            40D0FF9000FFEF9F41D6DCDAD928FDFDFD02FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDF9F310F0CA9F86DCB58B99E2AB71BFEC99
            42FFFE8F04FFFF9800FFFFA900FFFFA900FFFFA900FFFBA50DFFEE9E45FFECCA
            A57BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFEE8CAFFFDB61FFFFC352FFFFA900FFFFA900FFEF8E0BFFD76419FFE0AD
            8E7BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F6F02EFFBE4FC8D2BDA161F2F1F012F6D3A07EE5DFD830FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FBE8D240F19F44FFF69126FFFA8912FFFB870DFFFF8300FFFFA300FFFFAD
            00FFFFAD00FFFBA70CFFEB973FFFEBCCAD6CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEEA76D0FFE758FFFFCF
            6AFFFFB314FFFFAD00FFE07616FFCFA48A80D2D2D22DFCFCFC03FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9DEBD60F89028FFFF78
            00FFFF7800FFFF7800FFFF8700FFFFB200FFFFB200FFFDAF04FFE99235FFDFBF
            A176FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFBEA20FFE758FFFFE758FFFED264FFFFB81BFFFFB200FFF08A
            0CFFD47234E5CCC5C040DCDCDC23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8D4A880F88D29FFFF8200FFFF8200FFFF9400FFFFA9
            00FFFFB600FFFFB600FFF19D1BFFDD9E66BFF9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E991A4FEE5
            57FFFEE557FFFDD161FFFEBA1AFFFFB600FFFFA000FFE97812FFD38554BFDFDF
            DF20FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8D5
            A980F9922AFFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFFFBB00FFE588
            2DFFD7CBC144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F6EDCC47F8D752FFF8D752FFF8D752FFFAC460FFFEBC
            13FFFFBB00FFFFBB00FFEC9211FFD38D61B2F9F9F906FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADCB570F8A730FFFFBF00FFFFBF
            00FFFFBF00FFFFBF00FFFFBF00FFF9B109FFDB8A4DD9D9D9D926FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE6CF3DEEC7
            53F2F2C84CFFF2C84CFFF3C54FFFF9BC53FFFFBF00FFFFBF00FFFDB902FFDC71
            22FFE2D5CC37FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FCEBD540F7B542FFFFC400FFFFC400FFFFC400FFFFC400FFFFC4
            00FFF7B00BFFDA8F55CCCCCCCC33E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00F9F9F906E2D1AE66E9B84DF2EBB846FFEBB846FFEBB846FFF3B5
            55FFFBBD2EFFF2A610FFE38322FFDB7128FFECB69280FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF5EA20F7C6
            82BFF4B057FFF3AE55FFF7B034FFFFC800FFFFC800FFF6B20AFFDE802FFFD6BA
            8D8DCCCCCC33D2D2D22DE2E2E21DE5E5E51AE2E2E21DD7CFC244DAB473B2E5A7
            40FFE5A740FFE5A740FFE5A740FFEBAA48FFF5B346FFF9B909FFE07E2AFFE6CC
            B950FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9D4A18FF6A447FFFE73
            05FFFFCC00FFFFCC00FFFAC105FFDB7327FFDE983AFFDB9E4BE5D5AD79A5D4B0
            8299D5AD79A5D99F53D9DE983AFFDE983AFFDE983AFFDE983AFFDE983AFFE49D
            41FFF1A94BFFFCC610FFE68C28FFD4A8868DF5F5F50AFFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00F8C784BFFD8017FFFF6F00FFFFB800FFFFD100FFFFD1
            00FFE3861BFFD97C2DFFD78834FFD78834FFD78834FFD78834FFD78834FFD788
            34FFD78834FFD78834FFD78834FFE3933FFFEEA145FFFCC80EFFFBC707FFE385
            30FFD0BEAF59E5E5E51AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8CD
            8FAFFD8117FFFF9600FFFFCF00FFFFD500FFFFD500FFFAC804FFDC7321FFD774
            2AFFD1782DFFD1782EFFD1782EFFD1782EFFD1782EFFD2792EFFD98134FFE58F
            3EFFEFA632FFFED204FFFFD500FFFDD003FFE68D2EFFDFAF8890FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBDCAE80FCB729FFFFDA00FFFFDA
            00FFFFDA00FFFFDA00FFFFDA00FFFDD302FFE89616FFDA7026FFD8722AFFD572
            2BFFD7752DFFDC7B30FFE38536FFEDA328FFF9C70FFFF5B91BFFE89239FFEFA8
            25FFE9972EFFE3A877AAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDF2E130F8BD59FFFED712FFFDD317FFF7BD43FFF6B947FFFEDB
            05FFFFDE00FFFFDE00FFFDD702FFF6C30AFFF2B710FFF5BF0EFFF7C60CFFFFDE
            00FFFCD509FFEFA732FFE59F5DD6F8E2CE40F2C59D80F0BD908FFFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE5
            C360F8BA5FFFF7BF70E0FBE3C160F6C078CFFC8E16FFFFDA00FFFFE100FFFFE1
            00FFFEDD05FFFBD214FFF9C91DFFFFE100FFFFE100FFF5BD23FFE1A86EBFECEC
            EC13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF2E130FFFFFF00FFFF
            FF00F9D0989FFCA81CFFFFE100FFFFE100FFF8C32FFFEEAB58F2F2BB7AC0F0A8
            58EFFCD50EFFF8C81CFFEEA53FFFEDCFAF6AFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADAAD80F7BB50FFFACA
            2DFFF9C631FFF1B567E2F5F0EB19FFFFFF00F6CD9C8FEFA34EFFF1BC82B1F9E0
            C550FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FEFAF410FCECD640FBDEB670F9D8AB80FCF0DF30FFFF
            FF00FFFFFF00FEF9F410FDF3E920FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          Transparent = True
          ExplicitLeft = 620
        end
        object StaticText8: TStaticText
          Left = 24
          Top = 23
          Width = 486
          Height = 28
          AutoSize = False
          Caption = 
            #1056#1072#1073#1086#1090#1072' '#1084#1072#1089#1090#1077#1088#1072' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1080' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1091#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1079#1072#1074#1077 +
            #1088#1096#1077#1085#1072'. '
          TabOrder = 0
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 496
    Top = 272
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = actCloseExecute
    end
    object actBackToSelFac: TAction
      Category = 'tsFinish'
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1096#1072#1075#1091' 2'
      OnExecute = actBackToSelFacExecute
    end
    object actStartToSemLength: TAction
      Category = 'tsStart'
      Caption = #1044#1072#1083#1077#1077' >>'
      OnExecute = actStartToSemLengthExecute
    end
    object actBack: TAction
      Caption = '<< '#1053#1072#1079#1072#1076
      OnExecute = actBackExecute
    end
    object actSemLengthToSelFac: TAction
      Category = 'tsSemLength'
      Caption = #1044#1072#1083#1077#1077' >>'
      OnExecute = actSemLengthToSelFacExecute
    end
    object actNOTToPC: TAction
      Category = 'tsNormOfTime'
      Caption = #1044#1072#1083#1077#1077' >>'
      OnExecute = actNOTToPCExecute
    end
    object actPCToSelDep: TAction
      Category = 'tsPlanContignent'
      Caption = #1044#1072#1083#1077#1077' >>'
      OnExecute = actPCToSelDepExecute
    end
    object actSelFacToNOT: TAction
      Category = 'tsSelFac'
      Caption = #1044#1072#1083#1077#1077' >>'
      OnExecute = actSelFacToNOTExecute
      OnUpdate = actSelFacToNOTUpdate
    end
    object actSelDepToCP: TAction
      Category = 'tsSelDep'
      Caption = #1044#1072#1083#1077#1077' >>'
      OnExecute = actSelDepToCPExecute
      OnUpdate = actSelDepToCPUpdate
    end
    object actCPToFinish: TAction
      Category = 'tsCreatePotok'
      Caption = #1044#1072#1083#1077#1077' >>'
      OnExecute = actCPToFinishExecute
    end
    object actBackToSelDep: TAction
      Category = 'tsFinish'
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1096#1072#1075#1091' 5'
      OnExecute = actBackToSelDepExecute
    end
  end
end
