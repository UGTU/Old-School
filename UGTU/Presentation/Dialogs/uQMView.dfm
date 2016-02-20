inherited frmQMView: TfrmQMView
  Left = 265
  Top = 233
  BorderStyle = bsSizeable
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1079#1072#1087#1088#1086#1089#1072
  ClientHeight = 553
  ClientWidth = 692
  Constraints.MinHeight = 420
  Constraints.MinWidth = 700
  Menu = MainMenu1
  Position = poDesigned
  OnShow = FormShow
  ExplicitWidth = 708
  ExplicitHeight = 612
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 692
    Height = 512
    ExplicitWidth = 671
    ExplicitHeight = 636
  end
  inherited Panel1: TPanel
    Top = 512
    Width = 692
    Visible = False
    ExplicitTop = 512
    ExplicitWidth = 692
    inherited bbOK: TBitBtn
      Left = 470
      Width = 129
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1074' Excel'
      ExplicitLeft = 470
      ExplicitWidth = 129
    end
    inherited bbApply: TBitBtn
      Left = 107
      Visible = False
      ExplicitLeft = 107
    end
    inherited bbCancel: TBitBtn
      Left = 601
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ExplicitLeft = 601
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 692
    Height = 512
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object dbgEhResultQuery: TDBGridEh
      Left = 0
      Top = 29
      Width = 692
      Height = 483
      Align = alClient
      AutoFitColWidths = True
      DataSource = dsResultDataSours
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      IndicatorOptions = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      OnTitleClick = dbgEhResultQueryTitleClick
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 692
      Height = 29
      Align = alTop
      BevelEdges = [beLeft, beRight]
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 231
        Top = 8
        Width = 107
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081':'
      end
      object SpeedButton1: TSpeedButton
        Left = 407
        Top = 5
        Width = 275
        Height = 19
        Hint = #1042#1099#1074#1077#1089#1090#1080' '#1074' Excel'
        Action = actOK
        Caption = #1042#1099#1074#1086#1076' '#1074' Excel'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000004A0000004A
          0000004A0000004A0000004A0000004A00000052000000520000005200000052
          0000005200000052000000520000005200000052000000210000008400000084
          0000007B0000007B000000840000008400000084000000840000008400000084
          0000008400000084000000840000007B0000008C00000039000000840000F7EF
          F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
          F700F7EFF700F7EFF700F7EFF700F7EFF700008400000039000000840000F7EF
          F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
          F700F7EFF700F7EFF700F7EFF700F7EFF700008400000039000000840000F7EF
          F70031A53100299C290029942900299429002994290029942900299429002194
          2100299429000084000000840000D6E7D600007B00000039000000840000F7EF
          F7000084000000840000008C0000008C0000008C0000008C00000084000094BD
          940000840000008400009CA59C00F7EFF700007B00000039000000840000F7EF
          F700FFF7FF0000840000008C0000008C0000008C000000840000A5C6A5000084
          0000008C0000088C0800F7EFF700F7EFF700007B00000039000000840000F7EF
          F700F7EFF700FFFFFF00088C08000084000000840000B5CEB500008400000084
          0000008400000084000042A54200F7EFF700007B00000039000000840000F7EF
          F700F7EFF700F7EFF700F7EFF70000840000B5CEB50000840000008400007BAD
          7B00F7EFF700F7EFF700F7EFF700F7EFF700007B00000039000000840000F7EF
          F700F7EFF700EFEFEF009CC69C00B5C6B50000840000008C0000008C00000084
          0000BDBDBD00F7EFF700F7EFF700F7EFF700007B00000039000000840000F7EF
          F700F7EFF700ADCEAD00B5CEB50000840000008400000084000000840000008C
          000000840000A5A5A500F7EFF700F7EFF700007B00000039000000840000F7EF
          F700B5CEB500BDCEBD0000840000008400005AAD5A00F7EFF700299C29000084
          0000008C000000840000D6CED600F7EFF700007B00000039000000840000F7EF
          F7004AAD4A0052AD520052B5520073BD7300F7EFF700F7EFF700FFF7FF0063B5
          630052AD52003994390039A53900F7EFF700007B00000039000000840000F7EF
          F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
          F700F7EFF700F7EFF700F7EFF700F7EFF700008400000039000000840000F7EF
          F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
          F700F7EFF700F7EFF700F7EFF700F7EFF7000084000000390000008400000084
          0000008400000084000000840000008400000084000000840000008400000084
          000000840000008C0000008C000000840000008400004AAD4A00}
        ParentShowHint = False
        ShowHint = True
      end
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 1
        Width = 224
        Height = 27
        DataSource = dsResultDataSours
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alLeft
        Flat = True
        TabOrder = 0
      end
    end
    object eCountRecords: TDBEditEh
      Left = 344
      Top = 5
      Width = 58
      Height = 19
      DynProps = <>
      EditButtons = <>
      Flat = True
      ReadOnly = True
      TabOrder = 2
      Text = 'eCountRecords'
      Visible = True
    end
    object PanelProgressBar: TPanel
      Left = 203
      Top = 200
      Width = 317
      Height = 44
      Caption = 'PanelProgressBar'
      TabOrder = 3
      Visible = False
      object ProgressBar1: TProgressBar
        Left = 12
        Top = 14
        Width = 297
        Height = 17
        TabOrder = 0
      end
    end
  end
  inherited actBaseDialog: TActionList
    Left = 552
    Top = 22
    inherited actOK: TAction
      Caption = ''
    end
  end
  object dsResultDataSours: TDataSource
    Left = 282
    Top = 35
  end
  object MainMenu1: TMainMenu
    Images = frmMain.ImageList1
    Left = 344
    Top = 34
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Action = actOK
        Caption = #1042#1099#1074#1077#1089#1090#1080' '#1074' Excel'
        ImageIndex = 56
      end
      object N3: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        ImageIndex = 36
        OnClick = bbCloseClick
      end
    end
  end
end
