inherited frmFgosExceptionTable: TfrmFgosExceptionTable
  Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1080#1103' '#1087#1086' '#1060#1043#1054#1057
  ClientHeight = 241
  ClientWidth = 461
  ExplicitWidth = 467
  ExplicitHeight = 273
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 436
    Height = 200
    ExplicitWidth = 457
    ExplicitHeight = 243
  end
  inherited Panel1: TPanel
    Top = 200
    Width = 461
    ExplicitTop = 200
    ExplicitWidth = 461
    inherited bbOK: TBitBtn
      Left = 372
      Top = 6
      ExplicitLeft = 372
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 372
      Visible = False
      ExplicitLeft = 372
    end
    inherited bbCancel: TBitBtn
      Left = 288
      Visible = False
      ExplicitLeft = 288
    end
    inherited bbSprav: TBitBtn
      Top = 6
      Visible = False
      ExplicitTop = 6
    end
  end
  object Panel2: TPanel [2]
    Left = 436
    Top = 0
    Width = 25
    Height = 200
    Align = alRight
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 1
      Top = 24
      Width = 23
      Height = 23
      Caption = 'ToolBar1'
      Constraints.MaxWidth = 23
      Constraints.MinWidth = 23
      Images = ImageList1
      TabOrder = 0
      ExplicitTop = 1
      object ToolButton1: TToolButton
        Tag = 1
        Left = 0
        Top = 0
        Action = actDelException
      end
    end
    object ToolBar2: TToolBar
      Left = 1
      Top = 1
      Width = 23
      Height = 23
      Caption = 'ToolBar1'
      Constraints.MaxWidth = 23
      Constraints.MinWidth = 23
      Images = ImageList1
      TabOrder = 1
      object ToolButton2: TToolButton
        Tag = 1
        Left = 0
        Top = 0
        Action = actAddException
      end
    end
  end
  object dbExceptionFgos: TDBGridEh [3]
    Left = 0
    Top = 0
    Width = 436
    Height = 200
    Align = alClient
    DataSource = dsGetExceptionByFgos
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'cName_disc'
        Footers = <>
        MaxWidth = 323
        ReadOnly = True
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1099
        Width = 323
      end
      item
        EditButtons = <>
        FieldName = 'znach_ZE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077' 1 '#1047#1045
        Width = 95
      end>
  end
  inherited actBaseDialog: TActionList
    Left = 129
    Top = 248
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 368
    Top = 48
    object actAddException: TAction
      Caption = 'actAddException'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1077
      ImageIndex = 1
      OnExecute = actAddExceptionExecute
      OnUpdate = actAddExceptionUpdate
    end
    object actDelException: TAction
      Caption = 'actDelException'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1077
      ImageIndex = 2
      OnExecute = actDelExceptionExecute
      OnUpdate = actDelExceptionUpdate
    end
  end
  object ImageList1: TImageList
    Left = 360
    Top = 88
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000000000000000B39A8A0088705E00836A59007E66
      530079604D00745B4800705642006C523E00684E3900654B3600634833006348
      3300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B69C8F00FFFFFF00FFFFFF00FEFC
      FC00FDF9F700FCF4F000FAEFEA00F9EBE400F8E6DD00F6E1D700F5DCD1006348
      3300000000000000000000000000000000000000000000000000D4CCC7006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500D4CCC7000000000000000000000000000000000000000000D4CCC7006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500D4CCC7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BAA09300FFFFFF00FFFFFF00A690
      81009F8A79009A827100937B6B008C746300856D5A00F7E6DD00F6E1D700654A
      3500634833006348330000000000000000000000000000000000B8A49400F4E3
      DA00E4CFC200DDC5B700D9BEAC00D8BCA900D7BAA700D7B9A500D6B7A300D6B6
      A200634935000000000000000000000000000000000000000000B8A49400F4E3
      DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCAB800EAC8
      B500634935000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEA69800FFFFFF00FFFFFF00AB95
      860001FFFF005F7EF900CCFFCD00FF9900008A726000F8EAE400F7E5DD00684D
      3800F5DCD1006348330000000000000000000000000000000000B8A49400F6E8
      E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00D6B7
      A300634935000000000000000000000000000000000000000000B8A49400F6E8
      E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCA
      B800634935000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C2AA9D00FFFFFF00FFFFFF00B09A
      8C00FF990000CCFFCD0033CB670001FFFF008E776500FAF0EB00F8EAE4006B51
      3C00F6E1D700654A350063483300634833000000000000000000B8A49400F8EC
      E500F6E8E000F4E3DA00F3DFD40063493500F0D7C900EED3C400EDD0BF00D7B9
      A500634935000000000000000000000000000000000000000000B8A49400F8EC
      E500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCD
      BB00634935000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5AFA300FFFFFF00FFFFFF00B4A0
      9100AD988900A69181009F89790099827100937C6A00FCF4F000FBEFEA006E55
      4000F7E5DD00684D3800F5DCD100634833000000000000000000B9A59500F9F0
      EB00F8ECE500F6E8E000F4E3DA0063493500F1DBCF00F0D7C900EED3C400D7BA
      A700634935000000000000000000000000000000000000000000B9A59500F9F0
      EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0
      BF00634935000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9B4A900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFB00FEF8F700FCF4F0007358
      4400F8EAE4006B513C00F6E1D700654A35000000000000000000BCA69700FBF4
      F000F9F0EB006349350063493500634935006349350063493500F0D7C900D8BC
      A900634935000000000000000000000000000000000000000000BCA69700FBF4
      F000F9F0EB006349350063493500634935006349350063493500F0D7C900EED3
      C400634935000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CDBAB000C9B4A800C5AEA300C0A9
      9D00BDA39600B89F9100B49B8C00B1978800AD948400AA908000A58B7B00A187
      7500FBEFEA006E554000F7E5DD00684D38000000000000000000BEA89A00FCF7
      F500FBF4F000F9F0EB00F8ECE50063493500F4E3DA00F3DFD400F1DBCF00D9BE
      AC00634935000000000000000000000000000000000000000000BEA89A00FCF7
      F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7
      C900634935000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9B4A900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFB00FEF8
      F700FCF4F00073584400F8EAE4006B513C000000000000000000C0AB9C00FDFA
      F900FCF7F500FBF4F000F9F0EB0063493500F6E8E000F4E3DA00F3DFD400D9C0
      AF00634935000000000000000000000000000000000000000000C0AB9C00FDFA
      F900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DB
      CF00634935000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDBAB000C9B4
      A800C5AEA300C0A99D00BDA39600B89F9100B49B8C00B1978800AD948400AA90
      8000A58B7B00A1877500FBEFEA006E5540000000000000000000C3AC9D00FEFD
      FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00E1CD
      C000634935000000000000000000000000000000000000000000C3AC9D00FEFD
      FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DF
      D400634935000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9B4A900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFCFB00FEF8F700FCF4F000735844000000000000000000C4AE9E00FFFF
      FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
      DA00634935000000000000000000000000000000000000000000C4AE9E00FFFF
      FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
      DA00634935000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CDBAB000C9B4A800C5AEA300C0A99D00BDA39600B89F9100B49B8C00B197
      8800AD948400AA908000A58B7B00A18775000000000000000000EFE8E400C3AD
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      000FFFFFFFFF0000000FC007C00700000003C007C00700000003C007C0070000
      0000C007C00700000000C007C00700000000C007C00700000000C007C0070000
      C000C007C0070000C000C007C0070000F000C007C0070000F000C007C0070000
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000}
  end
  object dsGetExceptionByFgos: TDataSource
    DataSet = dmFgos.aspGetFgosException
    Left = 400
    Top = 88
  end
end
