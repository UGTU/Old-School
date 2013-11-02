inherited frmNagruzkaSetVidZanyatTaskCount: TfrmNagruzkaSetVidZanyatTaskCount
  Caption = 'frmNagruzkaSetVidZanyatTaskCount'
  ClientHeight = 264
  ClientWidth = 425
  ExplicitWidth = 431
  ExplicitHeight = 296
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 222
    Width = 425
    Height = 7
    Align = alBottom
    Shape = bsBottomLine
    Style = bsLowered
    ExplicitTop = 254
    ExplicitWidth = 425
    ExplicitHeight = 7
  end
  inherited Panel1: TPanel
    Top = 229
    Width = 425
    Height = 35
    BevelOuter = bvNone
    ExplicitTop = 229
    ExplicitWidth = 425
    ExplicitHeight = 35
    inherited bbOK: TBitBtn
      Left = 171
      Top = 5
      ExplicitLeft = 171
      ExplicitTop = 5
    end
    inherited bbApply: TBitBtn
      Left = 337
      Top = 5
      ExplicitLeft = 337
      ExplicitTop = 5
    end
    inherited bbCancel: TBitBtn
      Left = 254
      Top = 5
      ExplicitLeft = 254
      ExplicitTop = 5
    end
    inherited bbSprav: TBitBtn
      Left = 16
      Top = 32
      Visible = False
      ExplicitLeft = 16
      ExplicitTop = 32
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 425
    Height = 222
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object Bevel3: TBevel
      Left = 0
      Top = 0
      Width = 425
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
      Height = 217
      Align = alLeft
      Shape = bsSpacer
      ExplicitLeft = 1
      ExplicitTop = 6
      ExplicitHeight = 208
    end
    object dbgTaskCount: TDBGridEh
      Left = 5
      Top = 5
      Width = 387
      Height = 217
      Align = alClient
      AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
      AutoFitColWidths = True
      DataSource = dsVidZanyatTaskCount
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'by_plan_number'
          Footers = <>
          Title.Caption = #8470' '#1088#1072#1073#1086#1090#1099
          Width = 112
        end
        item
          EditButtons = <>
          FieldName = 'tasks_count'
          Footers = <>
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1076#1072#1085#1080#1081
          Width = 161
        end>
    end
    object Panel3: TPanel
      Left = 392
      Top = 5
      Width = 33
      Height = 217
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
          Action = actAddRecord
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
          Action = actDelRecord
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
  end
  inherited actBaseDialog: TActionList
    Images = ImageList1
    object actAddRecord: TAction
      Caption = 'actAddRecord'
      ImageIndex = 0
    end
    object actDelRecord: TAction
      Caption = 'actDelRecord'
      ImageIndex = 1
    end
  end
  object ImageList1: TImageList
    Left = 264
    Top = 8
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
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
      FFFFFFFF00000000FFFFFFFF00000000}
  end
  object dsVidZanyatTaskCount: TDataSource
    Left = 144
    Top = 24
  end
end
