inherited frmEditControlVZ: TfrmEditControlVZ
  Left = 429
  Top = 312
  BorderStyle = bsSizeToolWin
  Caption = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081' -  "'
  ClientHeight = 326
  ClientWidth = 516
  Constraints.MinWidth = 400
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 532
  ExplicitHeight = 365
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 284
    Width = 516
    Height = 7
    Align = alBottom
    Shape = bsBottomLine
    Style = bsLowered
    ExplicitTop = 277
    ExplicitWidth = 392
    ExplicitHeight = 7
  end
  inherited Panel1: TPanel
    Top = 291
    Width = 516
    Height = 35
    BevelOuter = bvNone
    ExplicitTop = 291
    ExplicitWidth = 516
    ExplicitHeight = 35
    inherited bbOK: TBitBtn
      Left = 259
      Top = 5
      ExplicitLeft = 259
      ExplicitTop = 5
    end
    inherited bbApply: TBitBtn
      Left = 425
      Top = 5
      Width = 86
      ExplicitLeft = 425
      ExplicitTop = 5
      ExplicitWidth = 86
    end
    inherited bbCancel: TBitBtn
      Left = 342
      Top = 5
      ExplicitLeft = 342
      ExplicitTop = 5
    end
    inherited bbSprav: TBitBtn
      Left = 5
      Top = 5
      Width = 113
      Cursor = crHandPoint
      ExplicitLeft = 5
      ExplicitTop = 5
      ExplicitWidth = 113
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 516
    Height = 284
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object Bevel3: TBevel
      Left = 0
      Top = 0
      Width = 516
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 272
    end
    object Bevel5: TBevel
      Left = 0
      Top = 5
      Width = 5
      Height = 279
      Align = alLeft
      Shape = bsSpacer
      ExplicitLeft = 1
      ExplicitTop = 6
      ExplicitHeight = 208
    end
    object dbgContent: TDBGridEh
      Left = 5
      Top = 5
      Width = 478
      Height = 279
      Align = alClient
      AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
      AutoFitColWidths = True
      DataSource = DataSource1
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      IndicatorOptions = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleParams.MultiTitle = True
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel3: TPanel
      Left = 483
      Top = 5
      Width = 33
      Height = 279
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object ToolBar1: TToolBar
        Left = 5
        Top = 0
        Width = 26
        Height = 23
        Align = alNone
        Caption = 'ToolBar1'
        Images = ImageList1
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = actAdd
          ParentShowHint = False
          ShowHint = True
        end
      end
      object ToolBar2: TToolBar
        Left = 5
        Top = 22
        Width = 26
        Height = 23
        Align = alNone
        Caption = 'ToolBar1'
        Images = ImageList1
        TabOrder = 1
        object ToolButton2: TToolButton
          Left = 0
          Top = 0
          Action = actRem
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
  end
  inherited actBaseDialog: TActionList
    Images = ImageList1
    Left = 216
    Top = 112
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    object actRem: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1077#1084#1077#1089#1090#1088
      ImageIndex = 1
      ShortCut = 46
      OnExecute = actRemExecute
      OnUpdate = actRemUpdate
    end
    object actAdd: TAction
      ImageIndex = 0
      ShortCut = 45
      OnExecute = actAddExecute
      OnUpdate = actAddUpdate
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 272
    Top = 64
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1084#1077#1089#1090#1088'...'
    end
    object N2: TMenuItem
      Action = actRem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1077#1084#1077#1089#1090#1088
    end
  end
  object DataSource1: TDataSource
    OnStateChange = DataSource1StateChange
    OnUpdateData = DataSource1UpdateData
    Left = 248
    Top = 112
  end
  object ImageList1: TImageList
    Left = 288
    Top = 112
    Bitmap = {
      494C010102000400140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
