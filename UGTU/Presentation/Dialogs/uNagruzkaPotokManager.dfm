object frmNagruzkaPotokManager: TfrmNagruzkaPotokManager
  Left = 0
  Top = 0
  Caption = #1052#1077#1085#1077#1076#1078#1077#1088' '#1091#1095#1077#1073#1085#1099#1093' '#1087#1086#1090#1086#1082#1086#1074
  ClientHeight = 554
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 659
    Height = 29
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 0
    ExplicitLeft = 152
    ExplicitTop = 72
    ExplicitWidth = 150
    object ToolButton8: TToolButton
      Left = 0
      Top = 0
      Action = actJoinSpecialitiesInPotok
    end
    object ToolButton9: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 31
      Top = 0
      Action = actAddPotok
    end
    object ToolButton2: TToolButton
      Left = 54
      Top = 0
      Action = actEditPotok
    end
    object ToolButton3: TToolButton
      Left = 77
      Top = 0
      Action = actDelPotok
    end
    object ToolButton4: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 108
      Top = 0
      Action = actAddPotokShema
    end
    object ToolButton6: TToolButton
      Left = 131
      Top = 0
      Action = actEditPotokShema
    end
    object ToolButton7: TToolButton
      Left = 154
      Top = 0
      Action = actDelPotokShema
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 519
    Width = 659
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      659
      35)
    object Button1: TButton
      Left = 578
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akLeft, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object actList: TActionList
    Images = ImageList1
    Left = 455
    Top = 282
    object actAddPotok: TAction
      Category = 'catPotok'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1090#1086#1082
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1090#1086#1082
      ImageIndex = 1
    end
    object actEditPotok: TAction
      Tag = 1
      Category = 'catPotok'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1090#1086#1082'...'
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1090#1086#1082'...'
      ImageIndex = 6
      ShortCut = 16450
    end
    object actDelPotok: TAction
      Category = 'catPotok'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1090#1086#1082
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1090#1086#1082
      ImageIndex = 0
      ShortCut = 46
    end
    object actAddPotokShema: TAction
      Category = 'catPotok'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1093#1077#1084#1099' '#1088#1072#1079#1073#1080#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072'...'
      Enabled = False
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1093#1077#1084#1091' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072'...'
      ImageIndex = 5
      ShortCut = 16429
    end
    object actEditPotokShema: TAction
      Tag = 1
      Category = 'catPotok'
      Caption = 'actEditPotokShema'
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1093#1077#1084#1091' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072'...'
      ImageIndex = 4
      ShortCut = 16453
    end
    object actDelPotokShema: TAction
      Category = 'catPotok'
      Caption = 'actDelPotokShema'
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1093#1077#1084#1091' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072
      ImageIndex = 3
      ShortCut = 16430
    end
    object actJoinSpecialitiesInPotok: TAction
      Category = 'catPotok'
      Caption = 'actJoinSpecialitiesInPotok'
      Hint = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080' '#1074' '#1087#1086#1090#1086#1082
      ImageIndex = 2
    end
  end
  object ImageList1: TImageList
    Left = 612
    Top = 125
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7C0F000D7C0F000D7C0F000D7C
      0F000D7C0F0032BA4D0032BA4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000795B5A00795B5A00795B
      5A00795B5A00795B5A00795B5A00795B5A000D7C0F003ACA5B003ACA5B005ED5
      7900C0D9B80083CF8B0032BA4D000D7C0F000000000000000000000000000000
      0000000000000000000000000000000000000D7C0F000D7C0F000D7C0F000D7C
      0F000D7C0F0032BA4D0032BA4D00000000000000000000000000000000000000
      0000000000000000000000000000F3EFED00B7ABA100AA9A8A00A6907D00A48B
      7500A6907D00AA9A8A00B1A69D00DED9D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00DDB5B100E1B3
      AC00E0B2AA00DFB0A800DEAEA400DDACA200DCABA0000D7C0F003ACA5B0085B4
      9600BAC8D400A0C89E0065CD6E0032BA4D0000000000795B5A00795B5A00795B
      5A00795B5A00795B5A00795B5A00795B5A000D7C0F003ACA5B003ACA5B005ED5
      7900C0D9B80083CF8B0032BA4D000D7C0F000000000000000000F4F4F400E4E4
      E400E1E2E100E3E3E300ECECEC00A4907F00B4947600F4D5BA00EABE9100F0C2
      9500EDC19500D8B08800BF9B7A00B9A48F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFEF
      DF00FFEEDD00FFEDDB00FFECD900FFEBD700FFEBD500FFD0BA002A72BD002886
      CB001E80CF002A72BD0032BA4D0000000000000000009B7E7E00DDB5B100E1B3
      AC00E0B2AA00DFB0A800DEAEA400DDACA200DCABA0000D7C0F003ACA5B0085B4
      9600BAC8D400A0C89E0065CD6E0032BA4D00DFDFDF0084978E0051896D004B8D
      6B00478B69005E8D750047795D00AC917100CFA98400F4DAC400EFC49F00F4C7
      9900F6CBA200E7C19A00C8A27D00B59E8A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFF2
      E40099330000993300009933000099330000FED4A2002A72BD00449BE0003AAC
      F8003DB0F7002A72BD00000000000000000097575A0097575A0097575A00FFEF
      DF00FFEEDD00FFEDDB00FFECD900FFEBD700FFEBD500FFD0BA002A72BD002886
      CB001E80CF002A72BD0032BA4D0000000000BFBFBF006CC3990064C091005CB8
      890054B28400A0C1A8005AA77D00AFA07100E5B79100F4DFC900FFDDB900F8C9
      9A00FCD6AF00EDCAA800CBA78100A9917D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFF4
      E800FFF2E400A43F0400A43F0400FFEEDD00FFEDDB002A72BD0050B4F80052B4
      FC0052B4FC002A72BD000000000000000000000000009B7E7E00FFFFFF00FFF2
      E40099330000993300009933000099330000FED4A2002A72BD00449BE0003AAC
      F8003DB0F7002A72BD000000000000000000DFDFDF0073CAA0006AC2960065BF
      93006CC09100D1E3C60065B590008DAB7700FFD2A500DACBB800D1CBC200E2BE
      9900F9CCA000EEC69D00D8AA7D00C2B2A2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFF5
      EA00FED4A200B351090075716E0057545100000000002A72BD00449BE0004FA7
      E7004AA4E3002A72BD00000000000000000097575A0097575A0097575A00FFF4
      E800FFF2E400A43F0400A43F0400FFEEDD00FFEDDB002A72BD0050B4F80052B4
      FC0052B4FC002A72BD000000000000000000EFEFEF007DCFA70073CAA00069C4
      950082C3A800B2CABF0060AA85004DA87700AAA78100797F88000A417A004664
      8200CFAA8600DDB18800C5B3A200F5F5F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFF8
      F000FFF5EA00C4640F00A39D9800FDFEFE005193A9000E12160085C6E10099D9
      EF0092F8FF002A72BD000000000000000000000000009B7E7E00FFFFFF00FFF5
      EA00FED4A200B3510900B3510900FED4A200FED4A2002A72BD00449BE0004FA7
      E7004AA4E3002A72BD00000000000000000000000000C1E8D50075CBA10067BC
      91006091B2005780A5003E7D5B0066A5830073899300365C8600224D7A001848
      7A006E747800E0D2C40000000000FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFFA
      F400D4751500D4751500A39D980088B7C70074CEE200499AB2000E1216002A72
      BD002A72BD0000000000000000000000000097575A0097575A0097575A00FFF8
      F000FFF5EA00C4640F00C4640F00FFF2E400FFF1E2002A72BD0085C6E10099D9
      EF0092F8FF002A72BD0000000000000000000000000000000000D4EEE10063B0
      92004F7CA8005B86AA0090ADAA00E0E8E7005F85AC00436F9D003D6794002854
      8000D8DBDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFFF
      FF00FFFAF400FFF8F000FFF6ED004D9CB3008CE0EE0062BFD700499AB2000E12
      1600000000000000000000000000000000000000000063493500634935006349
      35006349350063493500D4751500FED4A200FED4A200FFD7C8002A72BD002A72
      BD002A72BD0000000000000000000000000000000000000000009DB5C3003468
      860075A1CC0081ABD800587FA200A4B6C5006E97C30074727000575451000000
      0000D8DBDE00FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFFF
      FF00FED4A200D4751500D4751500FED4A20057A0B5008CE0EE0062BFD700499A
      B2000E121600000000000000000000000000B8A49400F4E3DA00F3DFD400F0D7
      C900EDD0BF00ECCDBB0063493500FFF5EA00FFF4E800FFD7CA00795B5A000000
      00000000000000000000000000000000000000000000FAFCFD005991A500588C
      AF00A1CBF90096C3F1006D97BE00BDCCD9008DB5DE00A39D9800FDFEFE005193
      A9000E121600E7E6E60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFFF
      FF00FFFFFE00FFA62400FFA62400FFFAF400FFF8F10065A6B7008CE0EE0062BF
      D700499AB2000E1216000000000000000000B8A49400F6E8E000F4E3DA006349
      3500EED3C400EDD0BF0063493500FED4A200FED4A200FFCFC300795B5A000000
      00000000000000000000000000000000000000000000F8FBFC00619CB1008EB9
      DF00CCF4FF00AAD6FE008DAFD40000000000A6D0FA00A39D980088B7C70074CE
      E200499AB2000E12160000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEEDC0073ACB9008CE0
      EE006CC4D9007D8686003535900000000000BCA69700F9F0EB00634935006349
      350063493500F0D7C90063493500FFFAF400FFF8F100FFCFC300795B5A000000
      00000000000000000000000000000000000000000000FEFEFE0089BDCC006CA7
      C200BCE3F400AAD2F90083A5CD00000000008FA4BA0052A4D2004D9CB3008CE0
      EE0062BFD700499AB20011141800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E009B7E7E009B7E
      7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E007DB0
      BB00CAB8AC007385D1005E6CAD0035359000C0AB9C00FCF7F500FBF4F0006349
      3500F4E3DA00F3DFD40063493500FFFFFF00FFFFFF00FFEEDC00795B5A000000
      0000000000000000000000000000000000000000000000000000DCF0F40077BE
      D1005BA0B5005893B0004074930000000000CBC9C600898684006866630057A0
      B5008CE0EE006CC4D9007D868600353590000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005E6CAD00708FDF005E76D0005E6CAD00C3AC9D00FDFAF900FCF7F500F9F0
      EB00F6E8E000F4E3DA00634935009B7E7E009B7E7E009B7E7E009B7E7E000000
      0000000000000000000000000000000000000000000000000000FFFFFF00DFFA
      FF00A5E1F00084C9D80078BBCA00BFDAE20000000000F3F3F300DFDFDF00DFDF
      DF007DB0BB00CAB8AC007385D1005E6CAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005E6CAD005E6CAD006579BC0000000000C2AC9D00C0AB9C00BBA7
      9800B8A39400B9A4950000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005E6CAD00819FEB005E76D0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AC978800846F5E007D68
      56007C67550085715F008773610086716000755F4C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F3EFED00B7ABA100AA9A8A00A6907D00A48B
      7500A6907D00AA9A8A00B1A69D00DED9D4000000000000000000000000000000
      0000000000000000000000000000F3EFED00B7ABA100AA9A8A00A6907D00A48B
      7500A6907D00AA9A8A00B1A69D00DED9D40000000000BCA79900E8E9EB00FBFB
      FB00FFFFFF00F7F4F100EBE9E600F6F4F2007B65530000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7C0F000D7C0F000D7C0F000D7C
      0F000D7C0F0032BA4D0032BA4D00000000000000000000000000F4F4F400E4E4
      E400E1E2E100E3E3E300ECECEC00A4907F00B4947600F4D5BA00EABE9100F0C2
      9500EDC19500D8B08800BF9B7A00B9A48F000000000000000000F4F4F400E4E4
      E400E1E2E100E3E3E300ECECEC00A4907F00B4947600F4D5BA00EABE9100F0C2
      9500EDC19500D8B08800BF9B7A00B9A48F0000000000BBA79900F8F9F9000F0F
      0F00DCDCDB00FFFCFC000A0B0A00F8F9F6007F6A570000000000000000000000
      00000000000000000000000000000000000000000000795B5A00795B5A00795B
      5A00795B5A00795B5A00795B5A00795B5A000D7C0F003ACA5B003ACA5B005ED5
      7900C0D9B80083CF8B0032BA4D000D7C0F00DFDFDF0084978E0051896D004B8D
      6B00478B69005E8D750047795D00AC917100CFA98400F4DAC400EFC49F00F4C7
      9900F6CBA200E7C19A00C8A27D00B59E8A00DFDFDF0084978E0051896D004B8D
      6B00478B69005E8D750047795D00AC917100CFA98400F4DAC400EFC49F00F4C7
      9900F6CBA200E7C19A00C8A27D00B59E8A0000000000BFAB9E00FFFFFF008F8F
      8F0000000000C5C2C2000A090900EAEDED007B66530000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00DDB5B100E1B3
      AC00E0B2AA00DFB0A800DEAEA400DDACA200DCABA0000D7C0F003ACA5B0085B4
      9600BAC8D400A0C89E0065CD6E0032BA4D00BFBFBF006CC3990064C091005CB8
      890054B28400A0C1A8005AA77D00AFA07100E5B79100F4DFC900FFDDB900F8C9
      9A00FCD6AF00EDCAA800CBA78100A9917D00BFBFBF006CC3990064C091005CB8
      890054B28400A0C1A8005AA77D00AFA07100E5B79100F4DFC900FFDDB900F8C9
      9A00FCD6AF00EDCAA800CBA78100A9917D0000000000C7B5A800FFFFFF00FFFF
      FF00979797000000000000000000F4F6F8007E69570000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFEF
      DF00FFEEDD00FFEDDB00FFECD900FFEBD700FFEBD500FFD0BA002A72BD002886
      CB001E80CF002A72BD0032BA4D0000000000DFDFDF0073CAA0006AC2960065BF
      93006CC09100D1E3C60065B590008DAB7700FFD2A500DACBB800D1CBC200E2BE
      9900F9CCA000EEC69D00D8AA7D00C2B2A200DFDFDF0073CAA0006AC2960065BF
      93006CC09100D1E3C60065B590008DAB7700FFD2A500DACBB800D1CBC200E2BE
      9900F9CCA000EEC69D00D8AA7D00C2B2A20000000000CFBFB200F7F7F7001010
      10002B2C2C000000000000000000F3F6F8007C675500755C4800715743006D53
      3E006A4F3B00674B3700BAAEA40000000000000000009B7E7E00FFFFFF00FFF2
      E40099330000993300009933000099330000FED4A2002A72BD00449BE0003AAC
      F8003DB0F7002A72BD000000000000000000EFEFEF007DCFA70073CAA00069C4
      950082C3A800B2CABF0060AA85004DA87700AAA78100797F88000A417A004664
      8200CFAA8600DDB18800C5B3A200F5F5F500EFEFEF007DCFA70073CAA00069C4
      950082C3A800B2CABF0060AA85004DA87700AAA78100797F88000A417A004664
      8200CFAA8600DDB18800C5B3A200F5F5F50000000000CEBEB300FFFFFF00F7F7
      F800F2F3F300FBFBFC00F6F7F700FFFFFF008F7C6B00D5C5BC00D0BEB500CBB8
      AC00C6B1A600C3AB9F00684E39000000000097575A0097575A0097575A00FFF4
      E800FFF2E400A43F0400A43F0400FFEEDD00FFEDDB002A72BD0050B4F80052B4
      FC0052B4FC002A72BD00000000000000000000000000C1E8D50075CBA10067BC
      91006091B2005780A5003E7D5B0066A5830073899300365C8600224D7A001848
      7A006E747800E0D2C40000000000FCFCFC0000000000C1E8D50075CBA10067BC
      91006091B2005780A5003E7D5B0066A5830073899300365C8600224D7A001848
      7A006E747800E0D2C40000000000FCFCFC0000000000BCA99B00B8A69800BAA7
      9A00BCAB9D00C1B0A400BEAC9F00BBAA9D00AA968900DACCC400D5C5BC00D0BE
      B500CCB8AD00C6B1A5006D533E0000000000000000009B7E7E00FFFFFF00FFF5
      EA00FED4A200B3510900B3510900FED4A200FED4A2002A72BD00449BE0004FA7
      E7004AA4E3002A72BD0000000000000000000000000000000000D4EEE10063B0
      92004F7CA8005B86AA0090ADAA00E0E8E7005F85AC00436F9D003D6794002854
      8000D8DBDE000000000000000000000000000000000000000000D4EEE10063B0
      92004F7CA8005B86AA0090ADAA00E0E8E7005F85AC00436F9D003D6794002854
      8000D8DBDE000000000000000000000000000000000000000000000000000000
      0000B79E9000F3EFEC00EEE8E400E8E0DC007E6552006E54400063483300D5C5
      BC00D0BEB400CBB8AC00735A46000000000097575A0097575A0097575A00FFF8
      F000FFF5EA00C4640F00C4640F00FFF2E400FFF1E2002A72BD0085C6E10099D9
      EF0092F8FF002A72BD00000000000000000000000000000000009DB5C3003468
      860075A1CC0081ABD800587FA200A4B6C5006E97C3006795C400634A37006349
      35006349350063493500634A37000000000000000000000000009DB5C3003468
      860075A1CC0081ABD800587FA200A4B6C5006E97C3006693C300634935006349
      3500634935006349350063493500000000000000000000000000000000000000
      0000BCA39600F8F6F400F3EFED00EFE8E400E9E0DC00E3D9D300DFD3CB00DACC
      C500D5C5BC00D0BEB5007A604E000000000000000000634A3700634935006349
      350063493500634A3700D4751500FED4A200FED4A200FFD7C8002A72BD002A72
      BD002A72BD0000000000000000000000000000000000FAFCFD005991A500588C
      AF00A1CBF90096C3F1006D97BE00BDCCD9008DB5DE00B8A49400F4E3DA00F3DF
      D400F0D7C900EDD0BF00ECCDBB006349350000000000FAFCFD005991A500588C
      AF00A1CBF90096C3F1006D97BE00BDCCD9008DB5DE00B8A49400F4E3DA00F3DF
      D400F0D7C900EDD0BF00ECCDBB00634935000000000000000000000000000000
      0000C1A99D00FCFBFB00F8F6F400F4EFEC007E6652006E543F0063483300DED3
      CC00DACCC400D5C5BC008068550000000000B8A49400F4E3DA00F3DFD400F0D7
      C900EDD0BF00ECCDBB0063493500FFF5EA00FFF4E800FFD7CA00795B5A000000
      00000000000000000000000000000000000000000000F8FBFC00619CB1008EB9
      DF00CCF4FF00AAD6FE008DAFD40000000000A6D0FA00B8A49400F6E8E000F4E3
      DA00F4E3DA00EED3C400EDD0BF006349350000000000F8FBFC00619CB1008EB9
      DF00CCF4FF00AAD6FE008DAFD40000000000A6D0FA00B8A49400F6E8E000F4E3
      DA0063493500EED3C400EDD0BF00634935000000000000000000000000000000
      0000C5AFA300FFFFFF00FCFBFB00F9F6F500F4EFEC00EEE7E400E9E1DB00E4D9
      D300DED2CC00DACCC50088705D0000000000B8A49400F6E8E000F4E3DA00F4E3
      DA00EED3C400EDD0BF0063493500FED4A200FED4A200FFCFC300795B5A000000
      00000000000000000000000000000000000000000000FEFEFE0089BDCC006CA7
      C200BCE3F400AAD2F90083A5CD00000000008FA4BA00BCA69700F9F0EB006349
      35006349350063493500F0D7C9006349350000000000FEFEFE0089BDCC006CA7
      C200BCE3F400AAD2F90083A5CD00000000008FA4BA00BCA69700F9F0EB006349
      35006349350063493500F0D7C900634935000000000000000000000000000000
      0000C9B4AA00FFFFFF00FFFFFF00FCFBFA00F8F5F400F3EFEC00EEE7E500E8E0
      DC00E3D9D400DFD3CC008E77660000000000BCA69700F9F0EB00634935006349
      350063493500F0D7C90063493500FFFAF400FFF8F100FFCFC300795B5A000000
      0000000000000000000000000000000000000000000000000000DCF0F40077BE
      D1005BA0B5005893B0004074930000000000CBC9C600C0AB9C00FCF7F500FBF4
      F000F4E3DA00F4E3DA00F3DFD400634935000000000000000000DCF0F40077BE
      D1005BA0B5005893B0004074930000000000CBC9C600C0AB9C00FCF7F500FBF4
      F00063493500F4E3DA00F3DFD400634935000000000000000000000000000000
      0000E6DDD800C9B4A900C4ADA200BFA89B00BBA29300B59C8E00B2988900AD94
      8400A88F7F00A38A7900C8BDB50000000000C0AB9C00FCF7F500FBF4F000F4E3
      DA00F4E3DA00F3DFD40063493500FFFFFF00FFFFFF00FFEEDC00795B5A000000
      0000000000000000000000000000000000000000000000000000FFFFFF00DFFA
      FF00A5E1F00084C9D80078BBCA00BFDAE20000000000C3AC9D00FDFAF900FCF7
      F500F9F0EB00F6E8E000F4E3DA00634935000000000000000000FFFFFF00DFFA
      FF00A5E1F00084C9D80078BBCA00BFDAE20000000000C3AC9D00FDFAF900FCF7
      F500F9F0EB00F6E8E000F4E3DA00634935000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3AC9D00FDFAF900FCF7F500F9F0
      EB00F6E8E000F4E3DA00634935009B7E7E009B7E7E009B7E7E009B7E7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C4A6A000C0AB
      9C00BBA79800B8A39400B8A39400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2AC9D00C0AB
      9C00BBA79800B8A39400B9A49500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C4A6A000C0AB9C00BBA7
      9800B8A39400B8A3940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FF01FFFFFFFF00008000FF01FE000000
      80008000C0000000000180000000000080030001000000000003800300000000
      8003000300000000000380038002000080070003C0070000000F8007C0030000
      8007001F800300000003001F810300008001001F810100008000001FC1000000
      FFF0001FC0800000FFF883FFFFF80000FFFFFFFF807FFFFFFE00FE00807FFF01
      C000C000807F800000000000807F800000000000807F00010000000080018003
      00000000800100038002800280018003C007C007F0010003C001C001F0018007
      80008000F001001F81008100F001001F81008100F001001FC100C100F001001F
      C080C080FFFF001FFFC1FFC1FFFF83FF}
  end
end
