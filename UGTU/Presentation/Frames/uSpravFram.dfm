inherited fmSprav: TfmSprav
  Width = 575
  Height = 378
  Align = alClient
  ExplicitWidth = 451
  ExplicitHeight = 305
  inherited Panel1: TPanel
    Width = 575
    Height = 341
    ExplicitWidth = 451
    ExplicitHeight = 268
    object Label1: TLabel
      Left = 273
      Top = 2
      Width = 112
      Height = 13
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
    end
    object gSprav: TDBGridEh
      Left = 2
      Top = 33
      Width = 571
      Height = 306
      Align = alClient
      AutoFitColWidths = True
      DataSource = dsSprav
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      PopupMenu = pmMenu
      SortLocal = True
      TabOrder = 0
      TitleParams.SecondColor = clWindow
      OnColExit = gSpravColExit
      OnKeyPress = gSpravKeyPress
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar1: TToolBar
      Left = 2
      Top = 2
      Width = 571
      Height = 31
      ButtonWidth = 24
      Caption = 'ToolBar1'
      Images = frmMain.ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      DesignSize = (
        571
        31)
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 185
        Height = 22
        Hint = #1053#1072#1074#1080#1075#1072#1090#1086#1088' '#1087#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1091
        DataSource = dsSprav
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert]
        Align = alTop
        Flat = True
        Hints.Strings = (
          #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100' (Ctrl+F)'
          #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100' (Ctrl+P)'
          #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100' (Ctrl+R)'
          #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100' (Ctrl+L)'
          #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' (Ctrl+N)'
          #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
          #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084'e'#1085#1077#1085#1080#1103
          #1054#1090#1084#1077#1085#1072
          #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1091#1092#1077#1088)
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object btnCangeSortType: TToolButton
        Left = 185
        Top = 0
        Action = actCangeSortType
      end
      object btnDel: TToolButton
        Left = 209
        Top = 0
        Action = aDel
      end
      object btnSave: TToolButton
        Left = 233
        Top = 0
        Action = aSave
        ImageIndex = 64
      end
      object btnCansel: TToolButton
        Left = 257
        Top = 0
        Action = aCancel
        ImageIndex = 66
      end
      object ToolButton1: TToolButton
        Left = 281
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 64
        Style = tbsSeparator
      end
      object cbSprav: TComboBox
        Left = 289
        Top = 0
        Width = 190
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Style = csDropDownList
        Anchors = [akTop, akRight]
        Sorted = True
        TabOrder = 1
        OnChange = cbSpravChange
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 341
    Width = 575
    ExplicitTop = 268
    ExplicitWidth = 451
    DesignSize = (
      575
      37)
    inherited bbSave: TBitBtn
      Left = 404
      Top = 5
      Action = aSave
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 280
      ExplicitTop = 5
    end
    inherited bbUndo: TBitBtn
      Left = 232
      Top = 5
      Action = aCancel
      Anchors = [akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 108
      ExplicitTop = 5
    end
    object btnSprav: TBitBtn
      Left = 8
      Top = 6
      Width = 117
      Height = 25
      Action = aOpenSprav
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Default = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000262F38FF0000000000000000CF6B6CFFC968
        69FFB25B5CFF994D4EFF7F3F3FFF6C8F9FFF6A8B9CFF597687FF435869FF2835
        43FF6C8F9FFF00000000455261FF2396C3FF29353EFF00000000CF6B6BFFE88E
        8FFFE6898AFFE27E80FFB65B5BFF6C8F9FFF58C5E1FF4DBEDDFF4DBEDDFF2670
        8BFF1F2A33FF4F5E6FFF21A1D0FF30B8E9FF599CB7FF4F6776FFD27172FFA66C
        6CFFA06364FF955858FF8C4B4BFF7094A5FF58848EFF5B6763FF5D5448FF5B52
        46FF646463FF398099FF3DBBE8FF66AFCCFF758591FF00000000D67879FFF6AA
        ABFFF09D9EFFEA8F90FFCB6868FF73858AFF76756BFFB39E7FFFE7DC9FFFE5D7
        A3FFADA797FF616D6BFF6698A9FF758591FF0000000000000000DA8283FFC37F
        7FFFBC7475FFAF6767FFA45959FF7D7C77FFAA9784FFFFFEC6FFFFF4BAFFFFF2
        B8FFFEECC9FFAFA895FF6F665EFF000000000000000000000000DF8A8BFFFDB9
        BBFFF9B0B1FFF3A4A4FFCE6E6DFF8C8176FFDDCBABFFFFFFDBFFFFFCDFFFFFFC
        D4FFFFF1BAFFE5D0A8FF857467FF000000000000000000000000E39394FFFFBD
        BEFFFDB7B9FFF7ADAEFFCF7170FF9B9187FFDCCEB0FFFFFFF0FFFFFCF4FFFFFC
        E3FFFFF6C5FFE6D2A0FFB6A47DFF000000000000000000000000E79B9CFFFFBD
        BEFFFFBDBEFFFBB5B6FFD17473FFA0A5A2FFB5AB9BFFFFFFFFFFFFFFFBFFFFFF
        E1FFFFFFCAFFB6A47DFFD2BF98FF000000000000000000000000ECA4A5FFFFBD
        BEFFFFBDBEFFFEBCBDFFD27676FF99B5BDFFB3B5ABFFC0B3ACFFF1E6CDFFEDE2
        BFFFB9AD91FF726155FF00000000000000000000000000000000F0ACADFFCD85
        85FFC57A7BFFB86C6CFFAC5D5DFF8FC4D6FF78ABB8FF93A7A7FF9D9B92FF8E8A
        81FF72898AFF515256FF00000000000000000000000000000000F4B3B4FFFFBD
        BEFFFFBDBEFFFFBDBEFFD37979FF92CADBFFA8F3FBFFA8F3FBFFA8F3FBFF4DBE
        DDFF49AFCCFF435161FF00000000000000000000000000000000F5B6B7FFF5B6
        B7FFEDA7A9FFE39394FFCF7171FF8FC3D5FF85B4C7FF7AA4B4FF7095A6FF6A8B
        9CFF57ABC5FF495869FF0000000000000000000000000000000000000000D6A2
        9DFF927C6CFFE5E0DCFFFFFFFFFFCB9497FF91B2B9FF907B6CFFE5E0DCFFFFFF
        FFFF6A8B9CFF55697AFF00000000000000000000000000000000000000000000
        0000C69992FF957D6EFFF4ECE8FFE6D3C9FFCB9196FF8CABB3FF86837DFFF4EC
        E8FFE2F3F5FF6A8B9CFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 603
      Top = 5
      Width = 162
      Height = 25
      Action = aSave
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '
      Default = True
      Layout = blGlyphRight
      ModalResult = 1
      TabOrder = 3
      ExplicitLeft = 479
    end
  end
  object dsSprav: TDataSource
    DataSet = cdsSprav
    Left = 328
    Top = 48
  end
  object Sprav: TADOTable
    CacheSize = 15
    Left = 361
    Top = 48
  end
  object tSpravList: TADOTable
    CacheSize = 15
    TableName = 'Sprav'
    Left = 400
    Top = 88
  end
  object dsSpravList: TDataSource
    DataSet = tSpravList
    Left = 264
    Top = 40
  end
  object prvSprav: TDataSetProvider
    DataSet = tSprav
    ResolveToDataSet = True
    Left = 128
    Top = 122
  end
  object cdsSprav: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSprav'
    BeforePost = cdsSpravBeforePost
    AfterScroll = cdsSpravAfterScroll
    Left = 189
    Top = 193
  end
  object dsDopSprav: TDataSource
    Left = 288
    Top = 136
  end
  object tDopSprav: TADOQuery
    Parameters = <>
    Left = 400
    Top = 144
  end
  object dsDopSprav2: TDataSource
    DataSet = tDopSprav2
    Left = 280
    Top = 176
  end
  object tDopSprav2: TADOQuery
    Parameters = <>
    Left = 368
    Top = 184
  end
  object pmMenu: TPopupMenu
    Left = 144
    Top = 40
    object N1: TMenuItem
      Action = aInsert
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    end
    object N2: TMenuItem
      Action = aDel
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object N3: TMenuItem
      Action = aCancel
    end
    object N4: TMenuItem
      Action = aSave
    end
  end
  object ActionList1: TActionList
    Images = frmMain.ImageList1
    Left = 200
    Top = 64
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 16474
      OnExecute = aCancelExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ShortCut = 16467
      OnExecute = aSaveExecute
    end
    object aNext: TAction
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
      ShortCut = 16466
      OnExecute = aNextExecute
    end
    object aInsert: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ShortCut = 16462
      OnExecute = aInsertExecute
    end
    object aDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 65
      ShortCut = 16430
      OnExecute = aDelExecute
    end
    object aOpenSprav: TAction
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080' '#1074' '#1086#1090#1076#1077#1083#1100#1085#1086#1084' '#1086#1082#1085#1077
      ShortCut = 16463
      OnExecute = aOpenSpravExecute
    end
    object aLast: TAction
      Hint = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
      ShortCut = 16460
      OnExecute = aLastExecute
    end
    object aFirst: TAction
      Hint = #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
      ShortCut = 16454
      OnExecute = aFirstExecute
    end
    object aPred: TAction
      Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
      ShortCut = 16464
      OnExecute = aPredExecute
    end
    object aClose: TAction
      OnExecute = aCloseExecute
    end
    object actCangeSortType: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1080#1087' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
      ImageIndex = 61
      OnExecute = actCangeSortTypeExecute
      OnUpdate = actCangeSortTypeUpdate
    end
  end
  object tSprav: TADOQuery
    Parameters = <>
    SQL.Strings = (
      ''
      ''
      ''
      '')
    Left = 224
    Top = 120
  end
end
