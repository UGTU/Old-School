inherited frmSheduleAddAudEvent: TfrmSheduleAddAudEvent
  Left = 484
  Top = 276
  Caption = 'frmSheduleAddAudEvent'
  ClientHeight = 570
  ClientWidth = 488
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 494
  ExplicitHeight = 602
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 532
    Width = 488
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
    Style = bsLowered
    ExplicitTop = 578
    ExplicitWidth = 498
    ExplicitHeight = 3
  end
  inherited Panel1: TPanel
    Top = 535
    Width = 488
    Height = 35
    BevelEdges = [beTop]
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 535
    ExplicitWidth = 488
    ExplicitHeight = 35
    inherited bbOK: TBitBtn
      Left = 225
      Top = 5
      ExplicitLeft = 225
      ExplicitTop = 5
    end
    inherited bbApply: TBitBtn
      Left = 399
      Top = 5
      TabOrder = 2
      ExplicitLeft = 399
      ExplicitTop = 5
    end
    inherited bbCancel: TBitBtn
      Left = 312
      Top = 5
      TabOrder = 1
      ExplicitLeft = 312
      ExplicitTop = 5
    end
    inherited bbSprav: TBitBtn
      Left = 7
      Top = 5
      Width = 121
      ExplicitLeft = 7
      ExplicitTop = 5
      ExplicitWidth = 121
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 229
    Width = 483
    Height = 301
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 27
      Width = 89
      Height = 13
      Caption = #1060#1086#1088#1084#1072' '#1086#1073#1091#1095#1077#1085#1080#1103':'
    end
    object Label10: TLabel
      Left = 125
      Top = 201
      Width = 38
      Height = 13
      Caption = #1082#1086#1088#1087#1091#1089':'
    end
    object Label11: TLabel
      Left = 216
      Top = 201
      Width = 35
      Height = 13
      Caption = #1085#1086#1084#1077#1088':'
    end
    object Label2: TLabel
      Left = 257
      Top = 176
      Width = 101
      Height = 13
      Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1077#1076#1080#1085#1080#1094#1072':'
    end
    object Label29: TLabel
      Left = 9
      Top = 225
      Width = 105
      Height = 13
      Caption = #1057#1086#1073#1099#1090#1080#1077' '#1074#1099#1087#1086#1083#1085#1103#1077#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 48
      Top = 176
      Width = 71
      Height = 13
      Caption = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080':'
    end
    object Label4: TLabel
      Left = 85
      Top = 126
      Width = 34
      Height = 13
      Caption = #1055#1086#1090#1086#1082':'
    end
    object Label5: TLabel
      Left = 53
      Top = 101
      Width = 66
      Height = 13
      Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
    end
    object Label6: TLabel
      Left = 9
      Top = 52
      Width = 110
      Height = 13
      Caption = #1060#1048#1054' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103':'
    end
    object Label8: TLabel
      Left = 53
      Top = 151
      Width = 66
      Height = 13
      Caption = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081':'
    end
    object Label9: TLabel
      Left = 63
      Top = 201
      Width = 56
      Height = 13
      Caption = #1040#1091#1076#1080#1090#1086#1088#1080#1103':'
    end
    object Label30: TLabel
      Left = 57
      Top = 277
      Width = 62
      Height = 13
      Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099':'
    end
    object Label33: TLabel
      Left = 71
      Top = 2
      Width = 48
      Height = 13
      Caption = #1050#1072#1092#1077#1076#1088#1072':'
    end
    object Label34: TLabel
      Left = 9
      Top = 254
      Width = 110
      Height = 13
      Caption = #1060#1048#1054' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103':'
    end
    object Label35: TLabel
      Left = 57
      Top = 75
      Width = 62
      Height = 13
      Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099':'
    end
    object Bevel4: TBevel
      Left = 1
      Top = 245
      Width = 118
      Height = 5
      Shape = bsTopLine
    end
    object dbcbCalcUnit: TDBLookupComboboxEh
      Left = 364
      Top = 174
      Width = 115
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 8
      Visible = True
      OnKeyValueChanged = dbcbCalcUnitKeyValueChanged
    end
    object dbcbCampus: TDBLookupComboboxEh
      Left = 169
      Top = 199
      Width = 41
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 9
      Visible = True
      OnKeyValueChanged = dbcbCampusKeyValueChanged
    end
    object dbcbDisc: TDBLookupComboboxEh
      Left = 125
      Top = 99
      Width = 354
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 4
      Visible = True
      OnKeyValueChanged = dbcbDiscKeyValueChanged
    end
    object dbcbPotok: TDBLookupComboboxEh
      Left = 125
      Top = 124
      Width = 231
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 5
      Visible = True
      OnKeyValueChanged = dbcbPotokKeyValueChanged
    end
    object dbcbPlanPrep: TDBLookupComboboxEh
      Left = 125
      Top = 50
      Width = 354
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 2
      Visible = True
      OnKeyValueChanged = dbcbPlanPrepKeyValueChanged
    end
    object dbcbRoom: TDBLookupComboboxEh
      Left = 257
      Top = 199
      Width = 109
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 10
      Visible = True
      OnKeyValueChanged = dbcbRoomKeyValueChanged
    end
    object dbcbVidNagruzki: TDBLookupComboboxEh
      Left = 125
      Top = 174
      Width = 126
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 7
      Visible = True
      OnKeyValueChanged = dbcbVidNagruzkiKeyValueChanged
    end
    object dbcbVidZanyat: TDBLookupComboboxEh
      Left = 125
      Top = 149
      Width = 231
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 6
      Visible = True
      OnKeyValueChanged = dbcbVidZanyatKeyValueChanged
    end
    object dbcbExecWorkType: TDBLookupComboboxEh
      Left = 125
      Top = 277
      Width = 231
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 12
      Visible = True
      OnKeyValueChanged = dbcbExecWorkTypeKeyValueChanged
    end
    object dbcbKaf: TDBLookupComboboxEh
      Left = 125
      Top = 0
      Width = 354
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 0
      Visible = True
      OnKeyValueChanged = dbcbKafKeyValueChanged
    end
    object dbcbExecPrep: TDBLookupComboboxEh
      Left = 125
      Top = 252
      Width = 354
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 11
      Visible = True
      OnKeyValueChanged = dbcbExecPrepKeyValueChanged
    end
    object dbcbFormEd: TDBLookupComboboxEh
      Left = 125
      Top = 25
      Width = 231
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 1
      Visible = True
      OnKeyValueChanged = dbcbFormEdKeyValueChanged
    end
    object dbcbPlanWorkType: TDBLookupComboboxEh
      Left = 125
      Top = 75
      Width = 231
      Height = 19
      AlwaysShowBorder = True
      Enabled = False
      EditButtons = <>
      Flat = True
      TabOrder = 3
      Visible = True
      OnKeyValueChanged = dbcbPlanWorkTypeKeyValueChanged
    end
  end
  object Panel2: TPanel [3]
    Left = 149
    Top = 288
    Width = 238
    Height = 65
    BorderStyle = bsSingle
    TabOrder = 2
    Visible = False
    object Image1: TImage
      Left = 16
      Top = 14
      Width = 32
      Height = 32
      Picture.Data = {
        055449636F6E0000010001002020000001002000A81000001600000028000000
        2000000040000000010020000000000080100000000000000000000000000000
        00000000000000000000000000000000010101031919192E1B1B1B3001010115
        0000000200000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000101010B2D2D2D93303030B42F2F2F7F37373737
        0000001000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000004E4C4EAD858484FF888888FF444444D53F3F3F6E
        2A2B2A2B0000000A000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000757073E5E3E0E2FF959495FF909090FE353635C1
        4A4A4A5A15151522000000050000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000766F71A7B4ACAFFFE5E2E4FF8C8B8BFF818181F7
        2B2A2AA7494949490505051A0000000200000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000007B767A0D6D6669CDCBC5C7FFCFCDCFFF8D8C8CFF
        686868EC2A2A2A8C3E3E3E390000001100000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000747074266D6668E3DCD6D9FFB8B6B7FF
        8E8E8EFF4A4A4ADB393838722B2B2B2C00000009000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000706C6F45776F71F1E5DFE2FF
        A5A3A4FF8A8989FF363636C24444445912121221000000040000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000006F6A6E64877E81FB
        E3DDE0FF969595FF767676F62A2929A441414144010101160000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000006D676B81
        978E91FFD6D2D3FF908E8EFF575757E82B2B2B83313131310000000B00000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        6B66699BA59D9EFFC3C0C0FF858485FF3C3C3CD03939395F1313132200000006
        0000000000000002000000080000000E000000100000000E0000000A00000006
        0000000200000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000006E686BAEAFA7A9FFB0AEAEFF6C6B6BFA2C2B2BA7363636490E0E0E21
        00000023080808470E0E0F621313146B16161765171718581010104605050530
        0000001B00000009000000010000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000007D787C06776F73B9B0A9AAFF9C999AFF515151E72A2A2AA43D3D3E96
        5B5B5BCB7A7A7BE6949495ED9E9E9FF0929292ED767676E2595958C44342428B
        2423234F0707072F000000140000000200000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000918A8F077A7375B5B3B1B1FFA9A9A9FF808081F69D9C9CE3
        B7B5B2ABC6C4C165CAC8C828E6B9920BCFBEAE32C8C0B86FB0AEA9B3939392E1
        5D5C5DC944424073151617390000001900000002000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000003D3B3C30777778F7BCBCBEFFC6C2BDA6E0C7AD36
        FFAD660FFFAD6608FFAD6606FFAD6608FFAD660FFFAD6617FFAD6620E4C09D49
        B2ADA7B9757575DE494745841A1A1B3900000014000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000003636375B8F8F90F2CEC5B689FFAD6623FFAD661B
        FFAD6614FFAD660FFFAD660DFFD6B31CFFE0C530FFDEC139FFCCA035FFB27030
        FFAE6839C7BCAEA1767676E1474642720D0D0D2F000000060000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000E0F10356F6F71E0C6BEB3A9FFAD6632FFAD662AFFAD6622
        FFAD661BFFBF871CFFE8D43CFFF1E45AFFEEE05DFFEAD960FFE7D165FFD9B959
        FFC18B4BFFAE6847BAB3AABA5F5F5ECF373533490000001C0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000044444693AFAEABE2E8B98954FFAD6639FFAD6631FFAD662A
        FFB57627FFE4CD4DFFF0E36CFFEFE16BFFEDDD6CFFEAD86EFFE7D172FFE3CB76
        FFDAB96EFFBF885AEEBB89649D9C9AE54644428E1010112E0000000200000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000010111230707072DEC5BAAAA8FFAD6649FFAD6641FFAD6639FFAD6633
        FFD9B953FFEEDF7DFFEEDF7BFFEDDD7AFFEBDA7AFFE9D67CFFE7D27EFFE4CD82
        FFE1C786FFD4AE79FFB2705FC1B7A8B85C5B5BCD2828293C0000000800000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000020202252919090EFD9BB9880FFAD6651FFAD6649FFAD6642FFBF8849
        FFE8D47FFFEDDD8BFFEDDD8AFFECDB89FFEAD988FFE9D689FFE7D28BFFE4CD8E
        FFE2C991FFE0C596FFC59377DCBB9A8E818081E9282929530000000F00000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000020202266A8A7A6EEECB27B6DFFAD6659FFAD6652FFAD664CFFCDA263
        FFECDC9BFFECDC98FFECDC97FFEBDA96FFEAD896FFE9D696FFE7D397FFE5CF99
        FFE3CB9DFFE1C8A0FFD3AC8EEEB47D7A9C9D9DF020201F690000011200000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000027272972B2B0AEF0FDAE6969FFAD6661FFAD665BFFAD6656FFBC825D
        FFDEC184FFECDCA4FFEBDAA3FFEBD9A2FFEAD8A2FFE9D6A2FFE8D3A4FFE6D0A4
        FFE5CEA7FFE3CAA9FFDCBEA3FDAD6875A9A9A9F21C1C1C6F0000010F00000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000004243457CA8A6A3F1ECB17879FFAD6669FFAD6664FFAD665FFFCEA47D
        FFB4735EFFCDA275FFDFC492FFEBDAADFFEAD8ADFFE9D6ADFFE8D5AEFFE7D3AF
        FFE5CFB0FFE4CDB2FFE2C9B3EFB37B82A1A1A0F11B1B1C670000000800000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000042434563959390F0DCB68C8FFFAD6670FFAD666CFFAD6668FFEBD9B9
        FFE1C7A1FFCFA682FFB47367FFC79779FFD7B591FFE2CAA6FFE9D6B7FFE8D4B8
        FFE7D3B9FFE5CFBAFFDFC4B2E0BA95968B8B8BEC1B1B1C4C0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000077777C617F7D7CEFC6B299AFFFAD6677FFAD6674FFAD6671FFEBDAC2
        FFEDDDC4FFECDCC2FFE4CCAEFFD6B398FFC69482FFB37173FFC18B83FFCCA093
        FFD5B0A0FFDABBACFFD1AAA2CCBBA8BB6E6E6FD7141515200000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000008485872B7C7C7CCEADA59BDDEFB2757FFFAD667AFFAD6678FFE7D1BD
        FFEDDECBFFEDDDC9FFEDDDC9FFECDCC8FFECDCC7FFE5CEBAFFDCBDACFFD2ACA0
        FFC99A98FFC08A90F2BB8487B7B2ADE4434444A0000000040000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000091919263898683F5C4AE92B3FFAD677FFFAD667EFFDEC1B3
        FFEEE0D1FFEEDFD0FFEEDFCFFFEDDDCEFFEDDDCEFFECDCCEFFECDBCDFFEBDACD
        FFEBD9CDFFDDC0B4D5C2ADBE7A7A7BE50C0D0D26000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000007E7F7FBF9C948DF5D0B18CA3FFAD6780FFD1A9A3
        FFEFE1D5FFEFE0D5FFEEDFD4FFEEDFD3FFEEDFD3FFEDDED2FFEDDDD2FFEDDDD1
        FFE4CCBFE4CBB3B6A29E9DF33738397F00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000003535351981807FD9A39990F6CAB399BAF2C18E8D
        FFE8D4C8FFF0E3D7FFEFE2D7FFEFE2D6FFEFE1D6FFEFE1D5FFEEE0D4F8E1CABC
        D9C7B4C7A6A2A0F647484AA30000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000009899991C706F6FC8928A84F9B8AC9FE5
        D3C1ACC6ECDCCACBF8E8D9D1FEEFE2D7F8E8D8CFEDDDCBC9D9CABACFBEB4AAEA
        878583F34040428D000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000202121063B3B3C776E6D6AE0
        8E8680F7A49A92FCB4ABA3FDBBB4ADFCB3ABA4FCA29B95FB84817DF35C5C5DC4
        1616173600000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000C0C0D0B
        2C2D2D534847478F535251AE52514FB34E4E4DA0363637761516172C00000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000E0FFFFFFC0FFFFFFC07FFFFFC03FFFFFC01FFFFFC01FFFFFE00FFFFF
        F007FFFFF807FFFFFC03FFFFFE0100FFFF00003FFF00001FFF80000FFFC0000F
        FFC00007FF800007FF800003FF000003FF000003FF000003FF000003FF000003
        FF000007FF000007FF000007FF80000FFFC0001FFFC0003FFFE0007FFFF000FF
        FFFC03FF}
    end
    object Label7: TLabel
      Left = 71
      Top = 14
      Width = 132
      Height = 13
      Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1087#1086#1076#1086#1078#1076#1080#1090#1077'...'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 58
      Top = 33
      Width = 159
      Height = 13
      Caption = ' '#1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1072#1085#1072#1083#1080#1079' '#1076#1072#1085#1085#1099#1093'...'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object ToolBar1: TToolBar [4]
    Left = 125
    Top = 203
    Width = 535
    Height = 24
    Align = alNone
    Anchors = [akLeft, akRight, akBottom]
    ButtonWidth = 211
    Caption = 'ToolBar1'
    Images = ImageList1
    List = True
    ShowCaptions = True
    AllowTextButtons = True
    TabOrder = 3
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Action = actRefreshConflictList
      ParentShowHint = False
      ShowHint = True
      Style = tbsTextButton
    end
    object ToolButton2: TToolButton
      Left = 215
      Top = 0
      Cursor = crHandPoint
      Action = actShowConflictList
      ParentShowHint = False
      ShowHint = True
      Style = tbsTextButton
    end
  end
  object Panel3: TPanel [5]
    Left = 0
    Top = 0
    Width = 488
    Height = 202
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      488
      202)
    object Label28: TLabel
      Left = 84
      Top = 32
      Width = 36
      Height = 13
      Caption = #1042#1088#1077#1084#1103':'
    end
    object Label27: TLabel
      Left = 53
      Top = 8
      Width = 67
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
    end
    object Label25: TLabel
      Left = 238
      Top = 32
      Width = 56
      Height = 13
      Caption = #1086#1082#1086#1085#1095#1072#1085#1080#1077':'
    end
    object Label26: TLabel
      Left = 126
      Top = 32
      Width = 38
      Height = 13
      Caption = #1085#1072#1095#1072#1083#1086':'
    end
    object Label36: TLabel
      Left = 282
      Top = 4
      Width = 108
      Height = 13
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103':'
    end
    object dbeStop: TDBEditEh
      Left = 300
      Top = 31
      Width = 58
      Height = 19
      AlwaysShowBorder = True
      Color = clBtnFace
      EditButtons = <>
      Flat = True
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
    object dbdtBeginDate: TDBDateTimeEditEh
      Left = 126
      Top = 6
      Width = 106
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
      OnChange = dbdtBeginDateChange
    end
    object dbcbStart: TDBComboBoxEh
      Left = 170
      Top = 30
      Width = 62
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      KeyItems.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8')
      TabOrder = 2
      Visible = True
      OnChange = dbcbStartChange
    end
    object Panel5: TPanel
      Left = 8
      Top = 51
      Width = 475
      Height = 150
      BevelOuter = bvNone
      TabOrder = 3
      object Label13: TLabel
        Left = 295
        Top = 109
        Width = 59
        Height = 13
        Caption = #1087#1086#1074#1090#1086#1088#1077#1085#1080#1081
      end
      object Label15: TLabel
        Left = 10
        Top = 6
        Width = 102
        Height = 13
        Caption = #1057#1087#1086#1089#1086#1073' '#1087#1086#1074#1090#1086#1088#1077#1085#1080#1103':'
      end
      object Label3: TLabel
        Left = 5
        Top = 90
        Width = 107
        Height = 13
        Caption = #1050#1088#1080#1090#1077#1088#1080#1081' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
      end
      object dbcbRepeatType: TDBLookupComboboxEh
        Left = 118
        Top = 4
        Width = 183
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        TabOrder = 0
        Visible = True
        OnKeyValueChanged = dbcbRepeatTypeKeyValueChanged
      end
      object dbdtFinalDate: TDBDateTimeEditEh
        Left = 204
        Top = 129
        Width = 85
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        Kind = dtkDateEh
        TabOrder = 8
        Visible = True
        OnChange = dbdtFinalDateChange
      end
      object dbeRepeatCount: TDBEditEh
        Left = 236
        Top = 106
        Width = 53
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        TabOrder = 6
        Text = '1'
        Visible = True
        OnChange = dbeRepeatCountChange
        OnKeyPress = dbeWWeekKeyPress
      end
      object pDayRepeat: TPanel
        Left = 0
        Top = 29
        Width = 385
        Height = 56
        BevelOuter = bvNone
        TabOrder = 2
        object Label16: TLabel
          Left = 174
          Top = 2
          Width = 24
          Height = 13
          Caption = #1076#1077#1085#1100
        end
        object Label23: TLabel
          Left = 72
          Top = 2
          Width = 40
          Height = 13
          Caption = #1082#1072#1078#1076#1099#1081
        end
        object dbeDFDay: TDBEditEh
          Left = 120
          Top = 0
          Width = 31
          Height = 19
          AlwaysShowBorder = True
          EditButtons = <>
          Flat = True
          TabOrder = 0
          Text = '1'
          Visible = True
          OnChange = dbeDFDayChange
          OnKeyPress = dbeWWeekKeyPress
        end
        object UpDown2: TUpDown
          Left = 151
          Top = 0
          Width = 16
          Height = 19
          Associate = dbeDFDay
          Min = 1
          Max = 366
          Position = 1
          TabOrder = 1
        end
      end
      object pMonthRepeat: TPanel
        Left = -3
        Top = 29
        Width = 431
        Height = 55
        BevelOuter = bvNone
        TabOrder = 3
        object Label19: TLabel
          Left = 165
          Top = 2
          Width = 75
          Height = 13
          Caption = #1095#1080#1089#1083#1072' '#1082#1072#1078#1076#1086#1075#1086
        end
        object Label20: TLabel
          Left = 301
          Top = 2
          Width = 38
          Height = 13
          Caption = #1084#1077#1089#1103#1094#1072
        end
        object Label21: TLabel
          Left = 252
          Top = 26
          Width = 43
          Height = 13
          Caption = #1082#1072#1078#1076#1086#1075#1086
        end
        object Label22: TLabel
          Left = 354
          Top = 26
          Width = 38
          Height = 13
          Caption = #1084#1077#1089#1103#1094#1072
        end
        object dbeMFDay: TDBEditEh
          Left = 120
          Top = 0
          Width = 23
          Height = 19
          AlwaysShowBorder = True
          EditButtons = <>
          Flat = True
          TabOrder = 0
          Text = '1'
          Visible = True
          OnChange = dbeMFDayChange
          OnExit = dbeMFDayExit
        end
        object dbeMFMonth: TDBEditEh
          Left = 246
          Top = 0
          Width = 31
          Height = 19
          AlwaysShowBorder = True
          EditButtons = <>
          Flat = True
          TabOrder = 1
          Text = '1'
          Visible = True
          OnChange = dbeMFDayChange
        end
        object rbMF: TRadioButton
          Left = 98
          Top = 2
          Width = 17
          Height = 17
          Checked = True
          TabOrder = 2
          TabStop = True
        end
        object rbMS: TRadioButton
          Left = 98
          Top = 24
          Width = 15
          Height = 17
          TabOrder = 3
        end
        object dbcbMSDayName: TDBComboBoxEh
          Left = 165
          Top = 24
          Width = 81
          Height = 19
          AlwaysShowBorder = True
          EditButtons = <>
          Flat = True
          Items.Strings = (
            #1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
            #1074#1090#1086#1088#1085#1080#1082
            #1089#1088#1077#1076#1091
            #1095#1077#1090#1074#1077#1088#1075
            #1087#1103#1090#1085#1080#1094#1091
            #1089#1091#1073#1073#1086#1090#1091)
          KeyItems.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6')
          TabOrder = 4
          Visible = True
          OnChange = dbcbMSNumChange
        end
        object dbeMSMonth: TDBEditEh
          Left = 301
          Top = 24
          Width = 31
          Height = 19
          AlwaysShowBorder = True
          EditButtons = <>
          Flat = True
          TabOrder = 5
          Text = '1'
          Visible = True
          OnChange = dbcbMSNumChange
        end
        object dbcbMSNum: TDBComboBoxEh
          Left = 120
          Top = 24
          Width = 39
          Height = 19
          AlwaysShowBorder = True
          EditButtons = <>
          Flat = True
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            #1087#1086#1089#1083#1077#1076'.')
          KeyItems.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5')
          TabOrder = 6
          Visible = True
          OnChange = dbcbMSNumChange
        end
        object UpDown3: TUpDown
          Left = 332
          Top = 24
          Width = 16
          Height = 19
          Associate = dbeMSMonth
          Min = 1
          Max = 12
          Position = 1
          TabOrder = 7
        end
        object UpDown4: TUpDown
          Left = 143
          Top = 0
          Width = 16
          Height = 19
          Associate = dbeMFDay
          Min = 1
          Max = 31
          Position = 1
          TabOrder = 8
        end
        object UpDown5: TUpDown
          Left = 277
          Top = 0
          Width = 16
          Height = 19
          Associate = dbeMFMonth
          Min = 1
          Max = 12
          Position = 1
          TabOrder = 9
        end
      end
      object pWeekRepeat: TPanel
        Left = -3
        Top = 29
        Width = 478
        Height = 56
        BevelOuter = bvNone
        TabOrder = 1
        object Label17: TLabel
          Left = 76
          Top = 2
          Width = 39
          Height = 13
          Caption = #1082#1072#1078#1076#1091#1102
        end
        object Label18: TLabel
          Left = 172
          Top = 2
          Width = 132
          Height = 13
          Caption = #1085#1077#1076#1077#1083#1102' '#1074' '#1089#1083#1077#1076#1091#1102#1097#1080#1077' '#1076#1085#1080':'
        end
        object dbeWWeek: TDBEditEh
          Left = 121
          Top = 0
          Width = 27
          Height = 19
          AlwaysShowBorder = True
          EditButtons = <>
          Flat = True
          TabOrder = 0
          Text = '1'
          Visible = True
          OnChange = dbeWWeekChange
          OnKeyPress = dbeWWeekKeyPress
        end
        object cbWMon: TCheckBox
          Left = 221
          Top = 20
          Width = 94
          Height = 17
          Caption = #1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
          TabOrder = 1
          OnClick = cbWMonClick
        end
        object cbWTue: TCheckBox
          Left = 221
          Top = 38
          Width = 81
          Height = 17
          Caption = #1074#1090#1086#1088#1085#1080#1082
          TabOrder = 2
          OnClick = cbWMonClick
        end
        object cbWWen: TCheckBox
          Left = 322
          Top = 20
          Width = 59
          Height = 17
          Caption = #1089#1088#1077#1076#1072
          TabOrder = 3
          OnClick = cbWMonClick
        end
        object cbWThu: TCheckBox
          Left = 322
          Top = 38
          Width = 68
          Height = 17
          Caption = #1095#1077#1090#1074#1077#1088#1075
          TabOrder = 4
          OnClick = cbWMonClick
        end
        object cbWFri: TCheckBox
          Left = 403
          Top = 20
          Width = 69
          Height = 17
          Caption = #1087#1103#1090#1085#1080#1094#1072
          TabOrder = 5
          OnClick = cbWMonClick
        end
        object cbWSat: TCheckBox
          Left = 403
          Top = 38
          Width = 81
          Height = 17
          Caption = #1089#1091#1073#1073#1086#1090#1072
          TabOrder = 6
          OnClick = cbWMonClick
        end
        object UpDown1: TUpDown
          Left = 148
          Top = 0
          Width = 16
          Height = 19
          Associate = dbeWWeek
          Min = 1
          Max = 52
          Position = 1
          TabOrder = 7
          OnChanging = UpDown1Changing
        end
      end
      object rbRLTF: TRadioButton
        Left = 118
        Top = 89
        Width = 149
        Height = 17
        Caption = #1053#1077#1090' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099
        TabOrder = 4
        OnClick = rbRLTFClick
      end
      object rbRLTS: TRadioButton
        Left = 118
        Top = 108
        Width = 114
        Height = 17
        Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1087#1086#1089#1083#1077
        TabOrder = 5
        OnClick = rbRLTFClick
      end
      object rbRLTT: TRadioButton
        Left = 118
        Top = 129
        Width = 82
        Height = 17
        Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100':'
        Checked = True
        TabOrder = 7
        TabStop = True
        OnClick = rbRLTFClick
      end
    end
    object ToolBar2: TToolBar
      Left = 392
      Top = 1
      Width = 97
      Height = 23
      Align = alNone
      Anchors = [akTop, akRight]
      ButtonHeight = 27
      ButtonWidth = 88
      Caption = 'ToolBar2'
      List = True
      ShowCaptions = True
      TabOrder = 4
      Wrapable = False
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Caption = #1088#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081
        DropdownMenu = PopupMenu1
        ImageIndex = 0
        Style = tbsDropDown
        OnClick = N1Click
      end
    end
  end
  object Panel6: TPanel [6]
    Left = 0
    Top = 0
    Width = 488
    Height = 92
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
    DesignSize = (
      488
      92)
    object Label14: TLabel
      Left = 21
      Top = 8
      Width = 99
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103':'
    end
    object Label24: TLabel
      Left = 12
      Top = 33
      Width = 108
      Height = 13
      Caption = #1063#1072#1089#1090#1086#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103':'
    end
    object Label32: TLabel
      Left = 289
      Top = 4
      Width = 108
      Height = 13
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103':'
    end
    object Label37: TLabel
      Left = 126
      Top = 56
      Width = 92
      Height = 13
      Caption = #1042' '#1089#1083#1077#1076#1091#1102#1097#1080#1077' '#1076#1085#1080':'
    end
    object ToolBar3: TToolBar
      Left = 399
      Top = 1
      Width = 89
      Height = 22
      Align = alNone
      Anchors = [akTop, akRight]
      ButtonHeight = 27
      ButtonWidth = 81
      Caption = 'ToolBar2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      List = True
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      object ToolButton4: TToolButton
        Left = 0
        Top = 0
        Caption = #1082#1086#1084#1087#1072#1082#1090#1085#1099#1081
        DropdownMenu = PopupMenu1
        ImageIndex = 0
        Style = tbsDropDown
        OnClick = N2Click
      end
    end
    object dbcbNumeratorType: TDBComboBoxEh
      Left = 126
      Top = 31
      Width = 184
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      Items.Strings = (
        #1050#1072#1078#1076#1091#1102' '#1085#1077#1076#1077#1083#1102
        #1058#1086#1083#1100#1082#1086' '#1087#1086' '#1095#1080#1089#1083#1080#1090#1077#1083#1102
        #1058#1086#1083#1100#1082#1086' '#1087#1086' '#1079#1085#1072#1084#1077#1085#1072#1090#1077#1083#1102)
      KeyItems.Strings = (
        #1050#1072#1078#1076#1091#1102' '#1085#1077#1076#1077#1083#1102
        #1058#1086#1083#1100#1082#1086' '#1087#1086' '#1095#1080#1089#1083#1080#1090#1077#1083#1102
        #1058#1086#1083#1100#1082#1086' '#1087#1086' '#1079#1085#1072#1084#1077#1085#1072#1090#1077#1083#1102
        '')
      ParentShowHint = False
      TabOrder = 1
      Visible = True
      OnChange = dbcbNumeratorTypeChange
    end
    object dbcbPart: TDBComboBoxEh
      Left = 126
      Top = 6
      Width = 92
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 2
      Visible = True
      OnChange = dbcbPartChange
    end
    object cbCWFri: TCheckBox
      Left = 408
      Top = 56
      Width = 81
      Height = 17
      Caption = #1087#1103#1090#1085#1080#1094#1072
      TabOrder = 3
      OnClick = cbCWMonClick
    end
    object cbCWMon: TCheckBox
      Left = 226
      Top = 56
      Width = 97
      Height = 17
      Caption = #1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
      TabOrder = 4
      OnClick = cbCWMonClick
    end
    object cbCWSat: TCheckBox
      Left = 408
      Top = 74
      Width = 81
      Height = 17
      Caption = #1089#1091#1073#1073#1086#1090#1072
      TabOrder = 5
      OnClick = cbCWMonClick
    end
    object cbCWThu: TCheckBox
      Left = 327
      Top = 74
      Width = 73
      Height = 17
      Caption = #1095#1077#1090#1074#1077#1088#1075
      TabOrder = 6
      OnClick = cbCWMonClick
    end
    object cbCWTue: TCheckBox
      Left = 226
      Top = 74
      Width = 81
      Height = 17
      Caption = #1074#1090#1086#1088#1085#1080#1082
      TabOrder = 7
      OnClick = cbCWMonClick
    end
    object cbCWWen: TCheckBox
      Left = 327
      Top = 56
      Width = 73
      Height = 17
      Caption = #1089#1088#1077#1076#1072
      TabOrder = 8
      OnClick = cbCWMonClick
    end
  end
  inherited actBaseDialog: TActionList
    Images = ImageList1
    Left = 9
    Top = 228
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    object actRefreshConflictList: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1089#1086#1074#1084#1077#1089#1090#1080#1084#1086#1089#1090#1100' '#1089#1086#1073#1099#1090#1080#1103
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1073#1099#1090#1080#1081', '#1087#1088#1086#1080#1089#1093#1086#1076#1103#1097#1080#1093' '#1074' '#1101#1090#1086' '#1078#1077' '#1074#1088#1077#1084#1103
      ImageIndex = 1
      OnExecute = actRefreshConflictListExecute
      OnUpdate = actRefreshConflictListUpdate
    end
    object actShowConflictList: TAction
      Caption = ' '#1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1092#1083#1080#1082#1090#1086#1074
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1073#1099#1090#1080#1081', '#1087#1088#1086#1080#1089#1093#1086#1076#1103#1097#1080#1093' '#1074' '#1101#1090#1086' '#1078#1077' '#1074#1088#1077#1084#1103
      ImageIndex = 0
      OnExecute = actShowConflictListExecute
      OnUpdate = actShowConflictListUpdate
    end
  end
  object ImageList1: TImageList
    Left = 40
    Top = 230
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004CACD5000883B8000868
      91004B9DC0000000000000000000000000000000000000000000000000000000
      0000FAF4EF00B9957B00E9E0DA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9EBFA0037A2D0000993CB00289ED800149F
      E6000E8BC3003687AA00C7E0EB00000000000000000000000000000000000000
      0000E6BD9D008B552C00C6B7AC00F2EFEC00EFEAE600FAF9F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F0097928F0097928F009792
      8F0097928F0097928F0097928F003A95BC0023B1F80029A0F70009182A004259
      67002CB0F2000F8FC8003278960000000000000000000000000000000000F5E1
      D200D4864B00AC68340091633F00835C3F007A583E00876D5A00B7A99E00F4F1
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FCFBFC00FAFAFA00F9F9
      F900F8F8F800F7F6F60098D8F3001597CF0029A0F70029A0F700303239003043
      53002CB0F20023A7E70009709B0090C3DA000000000000000000FAF3EE00D89A
      6B00D5804100DA844200D7824100D8834200D7824100BF743A0089532A008468
      5300E4DDD8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FCFCFD00FBFBFC00FAFA
      FA00F9F9F900F7F8F8001797CC0023B1F80029A0F7002298F6000175DD000175
      DD00107FF1002C9BE9001A90C400075576000000000000000000EEB99100E590
      5100E48B4900E3894600E48B4900E89D6600EFBB9400F0C3A200EFBA9300E695
      59009D6D4800E5DDD70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FDFEFD00FDFDFD00FCFC
      FC00FAFAFA00F9F9F9001A98CC0043C4FB0023B1F80028BDFF0009182A000F18
      2600107FF1001679E6001496E000086A92000000000000000000F7DFCC00F1C5
      A400EDB48900E89E6700DF874400E1B59300000000000000000000000000F8E3
      D300EAAA7A00C0865B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FEFEFE00FDFDFE00FCFC
      FD00FCFBFB00FBFBFB0045ABD50050C7FB0055C9F20068DEFF001A283A001D23
      3200107FF1000677E8001F91D300368FB600000000000000000000000000FEFD
      FC00F8E2D200F2C9A900EAA87600B97F53000000000000000000000000000000
      0000FCF2EC00ECB4880000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00FEFEFE00FDFD
      FD00FDFDFD00FCFBFC0086C7E30024A0D40069CDF10089DBF8005B5A5C004F60
      65001895E4002EA3E2002E95BF0094CFE9000000000000000000000000000000
      000000000000FEFEFE00F7DFCD00EDB78D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00FFFFFF00FEFF
      FE00FEFEFD00FCFDFC00FBFAFB00E1F1F9002BA3D6007DCBEA006FCDF30035BD
      FC0029A3DE001CA3DD008B949700000000000000000000000000000000000000
      0000000000000000000000000000FEFDFB0000000000D1AE9300D5CAC3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00FFFFFF00FFFF
      FF00FEFEFF00FDFEFE00FBFBFB00FBFAFB00C3E8F80056B6DE00219DD20025AC
      E6003FB7E900B9E0F10097928F00000000000000000000000000DBA98300BEA4
      90000000000000000000000000000000000000000000DD87470080573900A593
      8500D1C6BE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00FCFDFC00FBFBFB00FAFBFB00F9FAF900F8F7F800F6F7
      F600F5F5F500F3F3F40097928F00000000000000000000000000F7DECB00E591
      5300A17E6400CAC0B900000000000000000000000000E6975B00C4763C00985C
      2E007B543600A38C7A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFEFD00FDFDFD00FBFCFC00FBFBFA00F9F9F900F8F8
      F800F6F6F700F5F5F50097928F0000000000000000000000000000000000F6DB
      C700E89E66009F603000775339007B5C4500AC795300CC7E4400E2884500DD85
      4300CA7A3D009A62390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA0097928F0000000000000000000000000000000000FEFE
      FE00F8E2D200F0BE9900EAA57100E5915100E48D4B00E48E4C00E48E4D00E48C
      4A00E48D4D00E2BB9D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00E0D9D300E0D9D300E0D9
      D300E0D9D300E0D9D300E0D9D300E0D9D300E0D9D30091796800E0D9D3009179
      6800E0D9D3009179680097928F00000000000000000000000000000000000000
      000000000000FBF0E800F6D9C400F2C9AB00EFC09C00F0C09C00EBAD7E00E593
      5400DFA57900FDFAF70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F00000000000000000000000000000000000000
      00000000000000000000FEFEFE00FDF9F600FCF6F100FCF6F100F1C8A900E79C
      6300F5E3D7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F5D8C200F3CF
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FF87F1FF00000000FE01F03F00000000
      0001E00F000000000000C007000000000000C003000000000000C0E300000000
      0000E0F3000000000000F8FF000000000001FE9F000000000001CF8700000000
      0001C383000000000001E003000000000001E003000000000001F80300000000
      0001FC0700000000FFFFFFCF0000000000000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Left = 448
    Top = 56
    object N1: TMenuItem
      Caption = #1050#1086#1084#1087#1072#1082#1090#1085#1099#1081
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081
      GroupIndex = 1
      RadioItem = True
      OnClick = N2Click
    end
  end
end
