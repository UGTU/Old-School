inherited frmFindAbit: TfrmFindAbit
  Caption = #1048#1084#1087#1086#1088#1090' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
  ClientHeight = 408
  ClientWidth = 430
  OnShow = FormShow
  ExplicitWidth = 436
  ExplicitHeight = 437
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel [0]
    Left = 214
    Top = 8
    Width = 209
    Height = 169
  end
  object Bevel2: TBevel [1]
    Left = 8
    Top = 8
    Width = 200
    Height = 169
  end
  inherited Bevel1: TBevel
    Width = 430
    Height = 367
    ExplicitTop = 2
    ExplicitWidth = 430
    ExplicitHeight = 283
  end
  object SpeedButton1: TSpeedButton [3]
    Left = 8
    Top = 183
    Width = 415
    Height = 26
    Action = actFind
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7727474C6C7C7FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C7
      C64D504F328DB3436674FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFC6C7C64D504F2B97C687D8EF6493A5FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C7C64D504F2B97
      C687D8EF6493A5FF00FFFF00FFFF00FFFF00FFE8E2DECDBAAD937C6B77584477
      58439C7D6BABADAC2D34422B97C687D8EF6493A5FF00FFFF00FFFF00FFFF00FF
      DED6D08668549D8165BFA27ED0AD87B495739375596E54404F809187D8EF6493
      A5FF00FFFF00FFFF00FFFF00FFF7F5F3896E5CC1AB8BECD1AAEED2AEECCFA7E7
      C79ED8B28AA181627256426493A5FF00FFFF00FFFF00FFFF00FFFF00FFC5B7AE
      B09981F2DFBAF3E1C1F2E1C1F0DEBBEDD8B2E7CBA3D3AD879273576D665DFF00
      FFFF00FFFF00FFFF00FFFF00FFB19E91CDBCA4F4E8CCF6EED7F7EFDAF4EAD2F2
      E2C5ECD5B3E3C39DB59472886E5EFF00FFFF00FFFF00FFFF00FFFF00FF978171
      E3DAC4F7F1DEFAF6EBFBF8EEF9F3E6F4E9D3EFDCBEE7CAA5CCA68272543FFF00
      FFFF00FFFF00FFFF00FFFF00FFBFB0A6CFC4B6F9F5EAFCFAF3FCFBF4FBF6EEF6
      EDDAF0DEC1ECCFA9C0A27D795C48FF00FFFF00FFFF00FFFF00FFFF00FFE1DAD6
      C1B4A8F0EBE3FBFAF4FBF9F1FAF5EAF5EDD7F1DFBFE6CBA49E8568B6A79CFF00
      FFFF00FFFF00FFFF00FFFF00FFF3F0EEC1B3A9D1C6BEF6F4EAF9F6E6F6F2DEF4
      EACEE5D4B2B59E807A5E4AEBE7E5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      E7E0DCC0B2A9CABFB3D6CBBBDED4BBC3B298A590768D735FD4CAC2FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7F5F4E0D9D3C7B9AFB7A69AA4
      9182BAAA9DF2E7E2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object Label1: TLabel [4]
    Left = 16
    Top = 42
    Width = 49
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object Label2: TLabel [5]
    Left = 16
    Top = 83
    Width = 22
    Height = 13
    Caption = #1048#1084#1103
  end
  object Label3: TLabel [6]
    Left = 16
    Top = 125
    Width = 47
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
  end
  object Label4: TLabel [7]
    Left = 224
    Top = 41
    Width = 91
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
  end
  inherited Panel1: TPanel
    Top = 367
    Width = 430
    TabOrder = 6
    ExplicitTop = 367
    ExplicitWidth = 430
    inherited bbOK: TBitBtn
      Left = 257
      Top = 6
      ExplicitLeft = 257
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 29
      Top = 6
      Visible = False
      ExplicitLeft = 29
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 341
      Top = 6
      ExplicitLeft = 341
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Left = 16
      Top = 16
      Visible = False
      ExplicitLeft = 16
      ExplicitTop = 16
    end
  end
  object dbgeAbit: TDBGridEh [9]
    Left = 8
    Top = 215
    Width = 415
    Height = 146
    AutoFitColWidths = True
    DataSource = dmStudentData.dsFindAbit
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    IndicatorOptions = []
    Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 7
    OnDblClick = actOKExecute
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object rbFIO: TRadioButton [10]
    Left = 16
    Top = 18
    Width = 113
    Height = 17
    Caption = #1053#1072#1081#1090#1080' '#1087#1086' '#1060#1048#1054
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = rbFIOClick
  end
  object rbNum: TRadioButton [11]
    Left = 224
    Top = 18
    Width = 129
    Height = 17
    Caption = #1053#1072#1081#1090#1080' '#1087#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1102
    TabOrder = 4
    OnClick = rbFIOClick
  end
  object elastname: TDBEditEh [12]
    Left = 16
    Top = 58
    Width = 185
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
    OnClick = elastnameClick
  end
  object emiddlename: TDBEditEh [13]
    Left = 16
    Top = 142
    Width = 185
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 3
    Visible = True
    OnClick = elastnameClick
  end
  object eFirstName: TDBEditEh [14]
    Left = 16
    Top = 100
    Width = 185
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 2
    Visible = True
    OnClick = elastnameClick
  end
  object eNum: TDBNumberEditEh [15]
    Left = 224
    Top = 58
    Width = 190
    Height = 19
    Alignment = taLeftJustify
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 5
    Visible = True
    OnClick = eNumClick
  end
  inherited actBaseDialog: TActionList
    Left = 297
    Top = 72
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
    object actFind: TAction
      Caption = #1053#1072#1081#1090#1080
      OnExecute = actFindExecute
    end
  end
end
