inherited frmAcademStud: TfrmAcademStud
  Left = 297
  Top = 556
  HelpKeyword = 'Stud_academ.htm'
  Caption = #1042#1099#1093#1086#1076' '#1074' '#1072#1082#1072#1076#1077#1084#1080#1095#1077#1089#1082#1080#1081' '#1086#1090#1087#1091#1089#1082
  ClientHeight = 395
  ClientWidth = 573
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 579
  ExplicitHeight = 427
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Left = 288
    Width = 285
    Height = 354
    ExplicitLeft = 288
    ExplicitTop = 1
    ExplicitWidth = 612
    ExplicitHeight = 456
  end
  object GroupBox1: TGroupBox [1]
    Left = 288
    Top = 0
    Width = 285
    Height = 354
    Align = alClient
    Caption = #1057' '#1087#1077#1088#1077#1074#1086#1076#1086#1084' '#1074' '#1075#1088#1091#1087#1087#1091
    TabOrder = 1
    object Label7: TLabel
      Left = 10
      Top = 69
      Width = 78
      Height = 13
      Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
    end
    object Label8: TLabel
      Left = 68
      Top = 23
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
    object Label3: TLabel
      Left = 10
      Top = 114
      Width = 35
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
    end
    object Label6: TLabel
      Left = 47
      Top = 114
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
    object Label9: TLabel
      Left = 10
      Top = 23
      Width = 56
      Height = 13
      Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
    end
    object Label10: TLabel
      Left = 90
      Top = 69
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
    object dbcbeSpec: TDBLookupComboboxEh
      Left = 10
      Top = 86
      Width = 266
      Height = 19
      EditButtons = <>
      Flat = True
      KeyField = 'ik_spec_fac'
      ListField = 'Cname_spec'
      ListSource = dmUgtuStructure.dsSpec
      TabOrder = 1
      Visible = True
      OnChange = dbcbeSpecChange
    end
    object dbcbeGroup: TDBLookupComboboxEh
      Left = 10
      Top = 133
      Width = 266
      Height = 19
      EditButtons = <>
      Flat = True
      KeyField = 'Ik_grup'
      ListField = 'Cname_grup'
      ListSource = dmUgtuStructure.dsGroups
      TabOrder = 2
      Visible = True
      OnChange = dbcbeNumPrikChange
    end
    object dbcbeFac: TDBLookupComboboxEh
      Left = 10
      Top = 41
      Width = 266
      Height = 19
      Enabled = False
      EditButtons = <>
      Flat = True
      KeyField = 'Ik_fac'
      ListField = 'Cname_fac'
      ListSource = dmUgtuStructure.dsFaculty
      TabOrder = 0
      Visible = True
      OnChange = dbcbeFacChange
    end
  end
  inherited Panel1: TPanel
    Top = 354
    Width = 573
    TabOrder = 2
    ExplicitTop = 354
    ExplicitWidth = 573
    inherited bbOK: TBitBtn
      Left = 395
      Top = 6
      Enabled = False
      ExplicitLeft = 395
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 476
      Top = 6
      Enabled = False
      TabOrder = 2
      Visible = False
      ExplicitLeft = 476
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 480
      Top = 6
      TabOrder = 1
      ExplicitLeft = 480
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object GroupBox2: TGroupBox [3]
    Left = 0
    Top = 0
    Width = 288
    Height = 354
    Align = alLeft
    Caption = #1055#1088#1080#1082#1072#1079
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 69
      Width = 86
      Height = 13
      Caption = #1055#1088#1080#1095#1080#1085#1072' '#1086#1090#1087#1091#1089#1082#1072
    end
    object Label2: TLabel
      Left = 9
      Top = 23
      Width = 56
      Height = 13
      Caption = #8470' '#1087#1088#1080#1082#1072#1079#1072
    end
    object Label5: TLabel
      Left = 97
      Top = 69
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
    object Label57: TLabel
      Left = 67
      Top = 23
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
    object Label11: TLabel
      Left = 8
      Top = 114
      Width = 107
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1090#1087#1091#1089#1082#1072
    end
    object Label12: TLabel
      Left = 8
      Top = 158
      Width = 125
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1086#1090#1087#1091#1089#1082#1072
    end
    object Label13: TLabel
      Left = 8
      Top = 200
      Width = 99
      Height = 13
      Caption = #1055#1088#1080#1089#1090#1091#1087#1080#1090#1100' '#1082' '#1091#1095#1077#1073#1077
    end
    object Label4: TLabel
      Left = 9
      Top = 244
      Width = 68
      Height = 13
      Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077
    end
    object sbAddPrikaz: TSpeedButton
      Left = 258
      Top = 37
      Width = 24
      Height = 23
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
      OnClick = sbAddPrikazClick
    end
    object dbcbeCause: TDBLookupComboboxEh
      Left = 9
      Top = 86
      Width = 273
      Height = 19
      EditButtons = <>
      Flat = True
      KeyField = 'Ik_pric'
      ListField = 'Cname_pric'
      ListSource = dmCauses.dsAcademCause
      TabOrder = 1
      Visible = True
      OnChange = dbcbeNumPrikChange
    end
    object dbcbeNumPrik: TDBLookupComboboxEh
      Left = 9
      Top = 41
      Width = 243
      Height = 19
      EditButtons = <>
      Flat = True
      KeyField = 'Ik_prikaz'
      ListField = 'NN_Date'
      ListSource = dmPrikaz.dsPrikaz
      TabOrder = 0
      Visible = True
      OnChange = dbcbeNumPrikChange
    end
    object dbdteBegin: TDBDateTimeEditEh
      Left = 9
      Top = 133
      Width = 273
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
      OnChange = dbcbeNumPrikChange
    end
    object dbdteEnd: TDBDateTimeEditEh
      Left = 9
      Top = 177
      Width = 273
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
      OnChange = dbdteEndChange
      OnExit = dbdteEndExit
    end
    object dbdteLearn: TDBDateTimeEditEh
      Left = 9
      Top = 219
      Width = 273
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 4
      Visible = True
      OnChange = dbdteLearnChange
      OnExit = dbdteLearnExit
    end
    object eOtchObosn: TMemo
      Left = 9
      Top = 263
      Width = 273
      Height = 58
      BevelInner = bvNone
      BorderStyle = bsNone
      MaxLength = 1000
      TabOrder = 5
      OnEnter = eOtchObosnEnter
      OnExit = eOtchObosnExit
    end
    object cbFreeAt: TCheckBox
      Left = 9
      Top = 327
      Width = 144
      Height = 17
      Caption = #1057#1074#1086#1073#1086#1076#1085#1086#1077' '#1087#1086#1089#1077#1097#1077#1085#1080#1077
      TabOrder = 6
    end
  end
  inherited actBaseDialog: TActionList
    Left = 154
    Top = 20
  end
end
