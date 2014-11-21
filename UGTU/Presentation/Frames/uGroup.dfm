inherited fmGroup: TfmGroup
  Width = 703
  Height = 646
  ParentShowHint = False
  ShowHint = True
  ExplicitWidth = 703
  ExplicitHeight = 646
  inherited Panel1: TPanel
    Width = 703
    Height = 613
    ExplicitWidth = 703
    ExplicitHeight = 613
    object pcMain: TPageControl
      Left = 2
      Top = 2
      Width = 699
      Height = 609
      ActivePage = tsNapr
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = pcMainChange
      OnChanging = pcMainChanging
      object tsStudents: TTabSheet
        Caption = #1057#1086#1089#1090#1072#1074' '#1075#1088#1091#1087#1087#1099
        object dbgStudList: TDBGridEh
          Left = 0
          Top = 29
          Width = 691
          Height = 549
          Align = alClient
          AutoFitColWidths = True
          DataSource = DataSource1
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TabOrder = 0
          OnDblClick = dbgStudListDblClick
          OnTitleClick = dbgStudListTitleClick
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 691
          Height = 29
          Images = frmMain.ImageList1
          TabOrder = 1
          object SpeedButton1: TSpeedButton
            Left = 0
            Top = 0
            Width = 23
            Height = 22
            Hint = #1055#1088#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
            Flat = True
            Glyph.Data = {
              76030000424D7603000000000000360000002800000011000000100000000100
              18000000000040030000C40E0000C40E00000000000000000000FFFFFF8A2D0C
              7C2B10832F1B832F1B6622083D1301FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00B73D0FDD5233F96350FD705BF36C52D26E41
              F86551CC4A292D32071257122179212D842D217E21116B11033003FFFFFFFFFF
              FF00B73D0FF96350FD7A62FE8C6EDC8556F5CD9BEF7052FD6A5792873C53AF4F
              67AE5C61CA6155C35538B538167A16FFFFFFFFFFFF00A13203E15D3FFD886BE1
              7D51FAC794FFD3A0E57750F8745B919C5086C280EFF5E055AF5573D27352C252
              187518FFFFFFFFFFFF00FFFFFF561B01A14C4242235A433678604877BB5B3893
              7A3582DA82A4C697FFF5ECBACFA863C16341A341002900FFFFFFFFFFFF00FFFF
              FF04040403060D0F2B71143AA0103197020F5C00250040904043888E1076B920
              7DBB1A715B001B00FFFFFFFFFFFFFFFFFF00FFFFFF1A1A1A122F681A4DB31D57
              BD1B4FB50D3293000820053D5E2D93F23399FF3399FF2B91EF042C44FFFFFFFF
              FFFFFFFFFF001515152828281842812673D92673D92673D91B5CBD000F2C1D73
              B03FA5FF40A6FF40A6FF3EA4FF1F7BBEFFFFFFFFFFFFFFFFFF00202020353535
              25456B3090F6349AFF3396FA2173D2001631000000818080A8B5B54DB3FF49AF
              FF3197E6000A10FFFFFFFFFFFF001414144A4A4A4242423646651B45902262C6
              15477D00183181808075716E57545100000050B6FF42A5EA00273BFFFFFFFFFF
              FF00FFFFFF2E2E2E6969698D8D8DA4A4A44F4F4F111D26FFFFFF006090A39D98
              FDFEFE5193A90E12161875A4FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF2C2C2C5C
              5C5C4B4B4B212121FFFFFFFFFFFF006090A39D9888B7C774CEE2499AB20E1216
              FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF0063944D9CB38CE0EE62BFD7499AB20E1216FFFFFFFFFFFF00FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57
              A0B58CE0EE6CC4D97D8686353590FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DB0BBCAB8AC7385D15E
              6CAD35359000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF5E6CAD819FEB5E76D05E6CAD00}
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = actEdtGroupExecute
          end
          object SpeedButton2: TSpeedButton
            Left = 23
            Top = 0
            Width = 23
            Height = 22
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1072
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000290000004200000B60
              0B000E610E00208C20001A8D1A00137F13000E670E0000360000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00056205002398230056C15600399F
              39002680220060C6600060C960003DB83D0033B33300137F1300FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF001A891A005CC75C0066CC66003D94
              3A00DFECCC00409E3F0069CE690063CA630039B639000A690A00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF002187210066CC660083DA8300609F
              5E00FFFFF9008FBC8E005CB75C0066CC660043AE430000480000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000064000040A6400099E5990080AA
              6E00BFCDCF009FB9C1003986430043A7430007590700FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000640000227E2D000369
              8300157BC200177DC6000B71AF00004C3E00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000588500298F
              EC003399FF003399FF003298FD00157BC20000121B00FF00FF00FF00FF006349
              350063493500634935006349350063493500FF00FF00FF00FF00197EC0003EA4
              FF0040A6FF0040A6FF003EA4FF00369CF900044B7100FF00FF00B8A49400F4E3
              DA00F3DFD400F0D7C900EDD0BF00ECCDBB0063493500FF00FF002288CC0047AD
              FF004AB0FF004AB0FF0048AEFF0042A8FF00197AB900FF00FF00B8A49400F6E8
              E000F4E3DA0063493500EED3C400EDD0BF0063493500FF00FF00278DCC0050B6
              FF0053B9FF0053B9FF0051B7FF004DB3FF00248ACC00FF00FF00BCA69700F9F0
              EB00634935006349350063493500F0D7C90063493500FF00FF002086BF003398
              D1002E91C5003DA3DF004CB2F90045ABF2002180B400FF00FF00C0AB9C00FCF7
              F500FBF4F00063493500F4E3DA00F3DFD40063493500FF00FF0002659700318D
              BF0052A6D50075B6DB005FA3C6003B8CB4000E6C9B00FF00FF00C3AC9D00FDFA
              F900FCF7F500F9F0EB00F6E8E000F4E3DA0063493500FF00FF00006394002381
              B20084C0E40097CAE80089C2E3002C88B80000496E00FF00FF00FF00FF00C2AC
              9D00C0AB9C00BBA79800B8A39400B8A39400FF00FF00FF00FF00FF00FF000062
              94001A76A4004190B9001C76A40000537C00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = SpeedButton2Click
          end
          object SpeedButton3: TSpeedButton
            Left = 46
            Top = 0
            Width = 23
            Height = 22
            Hint = #1055#1077#1088#1077#1074#1086#1076' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1082#1091#1088#1089
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000029000042000B600B0E610E208C201A8D
              1A137F130E670E00360000000000000000000000000000000000000005620523
              982356C156399F3926802260C66060C9603DB83D33B333137F13000000000000
              0000000000000000000000001A891A5CC75C66CC663D943ADFECCC409E3F69CE
              6963CA6339B6390A690A00000000000000000000000000000000000021872166
              CC6683DA83609F5EFFFFF98FBC8E5CB75C66CC6643AE43004800000000000000
              00000000000000000000000000640040A64099E59980AA6EBFCDCF9FB9C13986
              4343A74307590700000000000000000000000000000000000000000000000000
              6400227E2D036983157BC2177DC60B71AF004C3E000000000000000000000000
              E19874C36D42AA5B33000000000000000000005885298FEC3399FF3399FF3298
              FD157BC200121B000000000000000000E19874C87044AA5B3300000000000000
              0000197EC03EA4FF40A6FF40A6FF3EA4FF369CF9044B71000000000000000000
              EEA17AD97B4DC870440000000000000000002288CC47ADFF4AB0FF4AB0FF48AE
              FF42A8FF197AB9000000000000000000F8A87FE98655D97B4D00000000000000
              0000278DCC50B6FF53B9FF53B9FF51B7FF4DB3FF248ACC000000DCD3CAE79A73
              FFB38BFF9E6DF68F5B9D4E28CBC9C40000002086BF3398D12E91C53DA3DF4CB2
              F945ABF22180B4000000000000DCD3CAFBC0A1FFB38CE18658CBC9C400000000
              0000026597318DBF52A6D575B6DB5FA3C63B8CB40E6C9B000000000000000000
              DDD1C7E2956ECBC9C40000000000000000000063942381B284C0E497CAE889C2
              E32C88B800496E00000000000000000000000000000000000000000000000000
              00000000000062941A76A44190B91C76A400537C000000000000}
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = SpeedButton3Click
          end
          object ToolButton14: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton14'
            Style = tbsSeparator
          end
          object SpeedButton6: TSpeedButton
            Left = 77
            Top = 0
            Width = 23
            Height = 22
            Action = actPrntGroup
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360000002800000015000000140000000100
              1800000000000005000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              004F00004C00004E00004F00004F00004F000051000051000052000052000052
              0000520000520000520000520000220000000000000000000000000000000000
              008600008200007E00007F000082000083000083000082000082000081000081
              00008100008000007D00008800003D0000000000000000000000000000000000
              008400F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EE
              F6F6EEF6F6EEF6F6EEF6008000003D0000000000000000000000000000000000
              008400F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EE
              F6F6EEF6F6EEF6F6EEF6008000003D0000000000000000000000000000000000
              008400F6EEF636A0362F982F2A932A2992292C952C2C952C2C952C2394232C97
              2C008500008300D0E1D0007C00003D0000000000000000000000000000000000
              008400F6EEF600860000870000880000880000880000880000830092BD920086
              000087009EA69EF1EDF1007C00003D0000000000000000000000000000000000
              008400F6EEF6FEF7FE008400008800008800008800008600A2C4A20086000088
              00098909F6EEF6F6EEF6007E00003D0000000000000000000000000000000000
              008400F6EEF6F6EEF6FFFBFF0B8D0B008700008200B1C9B10085000087000085
              0000860040A040F6EEF6007C00003D0000000000000000000000000000000000
              008400F6EEF6F6EEF6F6EEF6F6EEF6008500B6CBB600840000870078AA78F6EE
              F6F6EEF6F6EEF6F6EEF6007C00003D0000000000000000000000000000000000
              008400F6EEF6F6EEF6ECEBEC9AC49AB3C4B3008400008800008800008300BEBE
              BEF6EEF6F6EEF6F6EEF6007C00003D0000000000000000000000000000000000
              008600F6EEF6F6EEF6AFCBAFB2C8B20083000087000084000087000088000085
              00A3A3A3F6EEF6F6EEF6007E00003D0000000000000000000000000000000000
              008600F6EEF6B1CAB1B9CEB90083000086005CAD5CF3ECF32C9C2C0087000088
              00008400D0CFD0F0ECF0007E00003D0000000000000000000000000000000000
              008500F6EEF64CAB4C51AE5155B05574BC74F1EEF1F6EEF6FDF7FD62B46251AB
              513994393EA13EF6EEF6007C00003D0000000000000000000000000000000000
              008500F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EE
              F6F6EEF6F6EEF6F6EEF6008100003D0000000000000000000000000000000000
              008500F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EEF6F6EE
              F6F6EEF6F6EEF6F6EEF6008300003A0000000000000000000000000000000000
              0082000083000083000082000083000086000086000085000086000084000084
              00008C00008D000084000083004FAB4F00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            ParentShowHint = False
            ShowHint = True
            Transparent = False
          end
          object ToolButton15: TToolButton
            Left = 100
            Top = 0
            Width = 8
            Caption = 'ToolButton15'
            ImageIndex = 0
            Style = tbsSeparator
          end
          object SpeedButton4: TSpeedButton
            Left = 108
            Top = 0
            Width = 23
            Height = 22
            Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1091#1095#1077#1073#1085#1086#1084#1091' '#1087#1083#1072#1085#1091
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360000002800000015000000140000000100
              1800000000000005000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000007A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
              7A7A7A7A7A7A7A7A7A7A00000000000000000000000000000000000000000000
              000000868686F0F0F2F1F1F3F1F2F3F2F2F4F3F3F4F3F4F5F4F5F6F5F5F7F6F6
              F7F7F7F8F7F8F986868600000000000000000000000000000000000000000000
              000000909090F1F1F3F1F2F3F2F2F4F3F3F5F3F4F5F4F5F6F5F5F7FDFEFEFDFE
              FEFDFEFEF8F9FA90909000000000000000000000000000000000000000000000
              0000009D9D9DF2F2F3F2F2F4F3F3F5F4F4F5F4F5F6F5F5F7F6F6F7FDFEFEFDFE
              FEFDFEFEFDFEFE9D9D9D00000000000000000000000000000000000000000000
              000000ACACACF2F2F4F3F3F5BAAAADB4A3A6F5F6F7F6F6F8AC989B9F90949F90
              94FDFEFEFDFEFE9FA1A300000000000000000000000000000000000000000000
              000000ADADADF3F3F5F4F4F5B4A3A6BBABAEF6F7F8F7F7F8F8F8F9F9F9FAFDFE
              FEFDFEFEFDFEFEB8B8B800000000000000000000000000000000000000000000
              000000B1B1B1F4F4F6F5F5F6F5F6F7F6F7F8F7F8F8F8F8F9F9F9FAF9FAFBFAFB
              FBFDFEFEFDFEFEB8B8B800000000000000000000000000000000000000000000
              000000B3B3B3F5F5F6F5F6F7764B518E6A6FF8F9F9F9F9FAAC999CAD999CAD9A
              9DFBFCFDFDFEFEB8B8B800000000000000000000000000000000000000000000
              000000B5B5B5F6F6F7F6F7F88E6A6F835C61F9F9FAFAFAFBFAFBFBFBFCFCFCFC
              FDFCFDFDFDFEFEB8B8B800000000000000000000000000000000000000000000
              000000B8B8B8F6F7F8F7F8F9F8F9F9F9F9FAFAFAFBFAFBFCFBFCFCFCFCFDFCFD
              FDFDFEFEFDFEFEB8B8B800000000000000000000000000000000000000000000
              000000BABABAF7F8F9F8F9FAF9FAFAFAFAFBFAFBFCFBFCFCFCFDFDFCFDFDFCFD
              FDFDFEFEFDFEFEB8B8B800000000000000000000000000000000000000000000
              000000BCBCBCF8F9FAF9FAFABCABAEBCACAEBCACAEBCACAEFCFDFDFDFEFEFDFE
              FEE5E5E6DFDFE0BABABA00000000000000000000000000000000000000000000
              000000BDBDBDF9FAFAFAFBFBFBFBFCFBFCFCFCFDFDFCFDFDFDFEFEFDFEFEBABA
              BAB8B8B8B8B8B8BABABA00000000000000000000000000000000000000000000
              000000BFBFBFFAFBFBFBFBFCFBFCFCFCFDFDFCFDFDFDFEFEFDFEFEFDFEFEC5C5
              C5F6F6F6BBBBBBF2F2F200000000000000000000000000000000000000000000
              000000C0C0C0FBFBFCFBFCFCFCFDFDFCFDFDFDFEFEFDFEFEFBFCFCFDFEFECACA
              CABABABAF3F4F300000000000000000000000000000000000000000000000000
              000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BFBF
              BFFAFAFA00000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = SpeedButton4Click
          end
          object eQuickFilter: TEdit
            Left = 131
            Top = 0
            Width = 172
            Height = 22
            TabOrder = 0
            Visible = False
            OnChange = eQuickFilterChange
          end
          object BFilter: TButton
            Left = 303
            Top = 0
            Width = 144
            Height = 22
            Caption = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100
            TabOrder = 1
            Visible = False
            OnClick = BFilterClick
          end
        end
        object Memo1: TMemo
          Left = 376
          Top = 248
          Width = 185
          Height = 89
          TabOrder = 2
          Visible = False
        end
      end
      object tsAttBRS: TTabSheet
        Caption = #1056#1091#1073#1077#1078#1085#1099#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
        ImageIndex = 2
        object dbgrdBRSAtt: TDBGridEh
          Left = 0
          Top = 81
          Width = 691
          Height = 467
          Align = alClient
          AllowedOperations = [alopUpdateEh, alopAppendEh]
          ColumnDefValues.ToolTips = True
          DataSource = dmUspevaemost.dsSelAttBRSGroup
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          SortLocal = True
          TabOrder = 3
          OnCellClick = dbgrdBRSAttCellClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'StudName'
              Footers = <>
              ReadOnly = True
              Width = 156
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Nn_zach'
              Footers = <>
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'KatZach'
              Footers = <>
              ReadOnly = True
              Width = 46
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'i_sumballs'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clDefault
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Footers = <>
              ReadOnly = True
              Width = 103
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ik_zach'
              Footers = <>
              Visible = False
            end
            item
              Color = clCream
              DynProps = <>
              EditButtons = <>
              FieldName = 'i_balls'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Footers = <>
              Width = 107
              OnUpdateData = dbgrdBRSAttColumns4UpdateData
            end
            item
              Color = clCream
              DynProps = <>
              EditButtons = <>
              FieldName = 'PropCount'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Footers = <>
            end
            item
              Color = clCream
              DynProps = <>
              EditButtons = <>
              FieldName = 'Uvag_propCount'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Footers = <>
              Width = 138
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object dbgrdBRSExam: TDBGridEh
          Left = 0
          Top = 81
          Width = 691
          Height = 467
          Align = alClient
          AllowedOperations = [alopUpdateEh, alopAppendEh]
          ColumnDefValues.ToolTips = True
          DataSource = dmUspevaemost.dsSelBRSExamGroup
          DynProps = <>
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentFont = False
          SortLocal = True
          TabOrder = 4
          Visible = False
          OnCellClick = dbgrdBRSAttCellClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'StudName'
              Footers = <>
              ReadOnly = True
              Width = 156
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Nn_zach'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1095#1077#1090#1085#1086#1081' '#1082#1085#1080#1078#1082#1080
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'KatZach'
              Footers = <>
              ReadOnly = True
              Width = 34
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'i_sumballs'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clDefault
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Footers = <>
              ReadOnly = True
              Title.Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1079#1072' '#1090#1088#1080' '#1084#1086#1076#1091#1083#1103
              Width = 130
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ik_zach'
              Footers = <>
              Visible = False
            end
            item
              Color = clCream
              DynProps = <>
              EditButtons = <>
              FieldName = 'i_balls'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Footers = <>
              Title.Caption = #1041#1072#1083#1083#1099' '#1079#1072' '#1101#1082#1079#1072#1084#1077#1085
              Width = 96
              OnUpdateData = dbgrdBRSExamColumns5UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'i_sumall'
              Footers = <>
              Width = 87
            end
            item
              Color = clCream
              DblClickNextVal = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'i_grade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Footers = <>
              KeyList.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5')
              PickList.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5')
              Width = 175
              OnUpdateData = dbgrdBRSExamColumns7UpdateData
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 691
          Height = 27
          ButtonWidth = 29
          Images = ilMain
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object TBCreateAtt: TToolButton
            Left = 0
            Top = 0
            Action = actCreateAtt
          end
          object TBPrintAtt: TToolButton
            Left = 29
            Top = 0
            Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1089#1087#1099#1090#1072#1085#1080#1103
            Action = actPrintAtt
          end
          object tbBRSLastPrint: TToolButton
            Left = 58
            Top = 0
            Action = actPrintBRSLastAtt
            Visible = False
          end
          object TBDelAtt: TToolButton
            Left = 87
            Top = 0
            Action = actDelAtt
          end
          object ToolButton24: TToolButton
            Left = 116
            Top = 0
            Hint = #1041#1072#1083#1083#1099' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
            Action = actPrintBRSRanks
          end
          object ToolButton25: TToolButton
            Left = 145
            Top = 0
            Hint = #1057#1088#1077#1076#1085#1080#1077' '#1073#1072#1083#1083#1099' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
            Action = actPrintBRSRankAverage
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 27
          Width = 691
          Height = 54
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            691
            54)
          object Label9: TLabel
            Left = 8
            Top = 5
            Width = 46
            Height = 13
            Caption = #1057#1077#1084#1077#1089#1090#1088':'
          end
          object Label11: TLabel
            Left = 112
            Top = 5
            Width = 42
            Height = 13
            Caption = #1052#1086#1076#1091#1083#1100':'
          end
          object Label2: TLabel
            Left = 266
            Top = 6
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
          end
          object cmbxSemAtt: TDBComboBoxEh
            Left = 59
            Top = 2
            Width = 47
            Height = 19
            DynProps = <>
            EditButtons = <>
            Flat = True
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            KeyItems.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnChange = cmbxSemAttChange
          end
          object dbcmbxDisc: TDBLookupComboboxEh
            Left = 337
            Top = 4
            Width = 348
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            DataField = ''
            EditButtons = <>
            Flat = True
            KeyField = 'Ik_ved'
            ListField = 'cName_disc'
            ListSource = dmUspevaemost.dsGetAllAtt
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnChange = dbcmbxDiscChange
          end
          object cmbxNumber: TDBComboBoxEh
            Left = 161
            Top = 2
            Width = 79
            Height = 19
            DynProps = <>
            EditButtons = <>
            Flat = True
            Items.Strings = (
              '1'
              '2'
              '3'
              #1069#1082#1079#1072#1084#1077#1085)
            KeyItems.Strings = (
              '1'
              '2'
              '3'
              '10')
            ShowHint = True
            TabOrder = 2
            Visible = True
            OnChange = cmbxNumberChange
          end
          object pnlBRS: TPanel
            Left = 3
            Top = 25
            Width = 729
            Height = 32
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 3
            DesignSize = (
              729
              32)
            object Label16: TLabel
              Left = 244
              Top = 7
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100':'
            end
            object Label17: TLabel
              Left = 6
              Top = 7
              Width = 145
              Height = 13
              Caption = #1044#1072#1090#1072' '#1088#1091#1073#1077#1078#1085#1086#1075#1086' '#1080#1089#1087#1099#1090#1072#1085#1080#1103':'
            end
            object dbcbeExaminer: TDBLookupComboboxEh
              Left = 334
              Top = 4
              Width = 348
              Height = 19
              Anchors = [akLeft, akTop, akRight]
              DataField = ''
              EditButtons = <>
              Flat = True
              KeyField = 'itab_n'
              ListField = 'NamePrepod'
              ListSource = dmUspevaemost.dsPrepodVedFromUchPlan
              ShowHint = True
              TabOrder = 0
              Visible = True
            end
            object dbdteBRSExam: TDBDateTimeEditEh
              Left = 159
              Top = 4
              Width = 79
              Height = 19
              DynProps = <>
              EditButtons = <>
              Flat = True
              Kind = dtkDateEh
              ShowHint = True
              TabOrder = 1
              Visible = True
            end
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 548
          Width = 691
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            691
            30)
          object BtnCancelAtt: TBitBtn
            Left = 373
            Top = 5
            Width = 143
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93
              93FF0000AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF9393FF00008A0000AEFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF00008A00
              00DD0000AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF9393FF00008A0000DD0000DD00008A00008A00008A00008A5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF00008A0000DD4242FF00
              00DD4242FF5353FF4242FF5353FF5353FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF0000DD0000DD0000DD4242FF4242FF4242FF4242FF5353FF5353FF5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF0000DD0000DD4242FF53
              53FF5353FF5353FF5353FF5353FF5353FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF9393FF0000DD5353FF5353FF0000DD0000DD0000DD5353FF5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF0000DD53
              53FF0000DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF9393FF0000DD0000DDFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93
              93FF4242FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 0
            OnClick = BtnCancelAttClick
          end
          object BtnSaveAtt: TBitBtn
            Left = 521
            Top = 5
            Width = 159
            Height = 25
            Action = actSaveBRS
            Anchors = [akTop, akRight]
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
              927FD5D7D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF78927F1B221CBDC0BDFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
              927F43774E1B221CC2C6C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7C9884222B232B362C3340353A493C518D6043774E1B221CC2C6C2FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82A18CA9E9BE73B3866AAA7D62
              A0745A976A62AA7443774E1B221CBEC2BEFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF89AA93B1EFC693E2AD8BD8A381CD9876C18C6CB58062AA745692646076
              67FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90B49CB4F1C9AEEEC4AAEABFA4
              E4B9A3E0B676C18C6DB2807B9784D3E1D7FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF95BCA290B49C89AA9382A18C7C9884A8E5BB80C7967B9784D2E0D7FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82
              A18CA5E1B87B9784D2E0D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF89AA937B9784D2E0D7FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
              B49CE2EDE6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Layout = blGlyphRight
            TabOrder = 1
          end
          object dbcbxCloseAtt: TDBCheckBoxEh
            Left = 0
            Top = 6
            Width = 188
            Height = 17
            Caption = #1056#1091#1073#1077#1078#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1079#1072#1082#1088#1099#1090#1072
            DynProps = <>
            Flat = True
            TabOrder = 2
            Visible = False
            OnClick = dbcbxCloseAttClick
          end
        end
      end
      object tsAtt: TTabSheet
        Caption = #1040#1090#1090#1077#1089#1090#1072#1094#1080#1080
        ImageIndex = 6
        object dbgeAtt: TDBGridEh
          Left = 0
          Top = 84
          Width = 691
          Height = 464
          Align = alClient
          AllowedOperations = [alopUpdateEh, alopAppendEh]
          ColumnDefValues.ToolTips = True
          DataSource = dmUspevaemost.dsSelAttGroup
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          ImeMode = imDisable
          IndicatorOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          SortLocal = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'nCode'
              Footers = <>
              ReadOnly = True
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'StudName'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1085#1080#1094#1080#1072#1083#1099
              Width = 154
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'KatZach'
              Footers = <>
              ReadOnly = True
              Title.Caption = ' '
              Title.ToolTips = True
              Width = 42
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Nn_zach'
              Footers = <>
              ReadOnly = True
              Title.Caption = #8470' '#1079#1072#1095#1105#1090#1082#1080
              Visible = False
              Width = 58
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ik_zach'
              Footers = <>
              ReadOnly = True
              Visible = False
            end
            item
              AlwaysShowEditButton = True
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cosenca'
              Footers = <>
              Title.Caption = #1054#1094#1077#1085#1082#1072
              Width = 90
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Uvag_PropCount'
              Footers = <>
              Title.Caption = #1055#1086' '#1091#1074#1072#1078'. '#1087#1088#1080#1095#1080#1085#1077
              Width = 107
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'PropCount'
              Footers = <>
              Title.Caption = #1041#1077#1079' '#1091#1074#1072#1078'. '#1087#1088#1080#1095#1080#1085#1099
              Width = 107
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 548
          Width = 691
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            691
            30)
          object bCancelAtt: TBitBtn
            Left = 373
            Top = 5
            Width = 143
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93
              93FF0000AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF9393FF00008A0000AEFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF00008A00
              00DD0000AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF9393FF00008A0000DD0000DD00008A00008A00008A00008A5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF00008A0000DD4242FF00
              00DD4242FF5353FF4242FF5353FF5353FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF0000DD0000DD0000DD4242FF4242FF4242FF4242FF5353FF5353FF5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF0000DD0000DD4242FF53
              53FF5353FF5353FF5353FF5353FF5353FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF9393FF0000DD5353FF5353FF0000DD0000DD0000DD5353FF5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF0000DD53
              53FF0000DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF9393FF0000DD0000DDFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93
              93FF4242FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 0
            OnClick = BtnCancelAttClick
          end
          object bSaveAtt: TBitBtn
            Left = 521
            Top = 5
            Width = 159
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1072#1090#1090#1077#1089#1090#1072#1094#1080#1102
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
              927FD5D7D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF78927F1B221CBDC0BDFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
              927F43774E1B221CC2C6C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7C9884222B232B362C3340353A493C518D6043774E1B221CC2C6C2FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82A18CA9E9BE73B3866AAA7D62
              A0745A976A62AA7443774E1B221CBEC2BEFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF89AA93B1EFC693E2AD8BD8A381CD9876C18C6CB58062AA745692646076
              67FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90B49CB4F1C9AEEEC4AAEABFA4
              E4B9A3E0B676C18C6DB2807B9784D3E1D7FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF95BCA290B49C89AA9382A18C7C9884A8E5BB80C7967B9784D2E0D7FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82
              A18CA5E1B87B9784D2E0D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF89AA937B9784D2E0D7FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
              B49CE2EDE6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Layout = blGlyphRight
            TabOrder = 1
          end
          object cbAttClose: TDBCheckBoxEh
            Left = 0
            Top = 6
            Width = 188
            Height = 17
            Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1072#1090#1090#1077#1089#1090#1072#1094#1080#1080' '#1079#1072#1082#1088#1099#1090#1072
            DynProps = <>
            Flat = True
            TabOrder = 2
            OnClick = cbAttCloseClick
          end
        end
        object ToolBar7: TToolBar
          Left = 0
          Top = 0
          Width = 691
          Height = 22
          Images = ilMain
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          object ToolButton20: TToolButton
            Left = 0
            Top = 0
            Action = actCreateAttest
          end
          object ToolButton21: TToolButton
            Left = 23
            Top = 0
            Action = actPrintBlankAtt
          end
          object ToolButton22: TToolButton
            Left = 46
            Top = 0
            Action = actPrintAtt
          end
          object ToolButton23: TToolButton
            Left = 69
            Top = 0
            Action = actDelAtt
          end
        end
        object pAttTop: TPanel
          Left = 0
          Top = 22
          Width = 691
          Height = 62
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            691
            62)
          object Label19: TLabel
            Left = 149
            Top = 12
            Width = 76
            Height = 13
            Caption = #1040#1090#1090#1077#1089#1090#1072#1094#1080#1103' '#8470
          end
          object Label18: TLabel
            Left = 20
            Top = 13
            Width = 46
            Height = 13
            Caption = #1057#1077#1084#1077#1089#1090#1088':'
          end
          object Label20: TLabel
            Left = 314
            Top = 12
            Width = 65
            Height = 13
            Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
          end
          object Label22: TLabel
            Left = 295
            Top = 38
            Width = 84
            Height = 13
            Caption = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100':'
          end
          object Label21: TLabel
            Left = 2
            Top = 38
            Width = 64
            Height = 13
            Caption = #1053#1072#1095#1080#1085#1072#1077#1090#1089#1103':'
          end
          object Label15: TLabel
            Left = 144
            Top = 37
            Width = 81
            Height = 13
            Caption = #1047#1072#1082#1072#1085#1095#1080#1074#1072#1077#1090#1089#1103':'
          end
          object dbcbeDisc: TDBLookupComboboxEh
            Left = 382
            Top = 9
            Width = 305
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            DataField = ''
            EditButtons = <>
            Flat = True
            KeyField = 'Ik_ved'
            ListField = 'cName_disc'
            ListSource = dmUspevaemost.dsGetAllAtt
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnChange = dbcbeDiscChange
          end
          object dblcbPrepod: TDBLookupComboboxEh
            Left = 382
            Top = 35
            Width = 305
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            DataField = ''
            EditButtons = <>
            Flat = True
            KeyField = 'itab_n'
            ListField = 'NamePrepod'
            ListSource = dmUspevaemost.dsPrepodVedFromUchPlan
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnChange = dblcbPrepodChange
          end
          object dbdteAttEnd: TDBDateTimeEditEh
            Left = 227
            Top = 35
            Width = 61
            Height = 19
            DynProps = <>
            EditButtons = <>
            Flat = True
            Kind = dtkDateEh
            ReadOnly = True
            ShowHint = True
            TabOrder = 2
            Visible = True
          end
          object dbdteAttBegin: TDBDateTimeEditEh
            Left = 70
            Top = 35
            Width = 68
            Height = 19
            DynProps = <>
            EditButtons = <>
            Flat = True
            Kind = dtkDateEh
            ShowHint = True
            TabOrder = 3
            Visible = True
            OnChange = dbdteAttBeginChange
          end
          object nAtt: TDBComboBoxEh
            Left = 231
            Top = 10
            Width = 61
            Height = 19
            DynProps = <>
            EditButtons = <>
            Flat = True
            Items.Strings = (
              '1'
              '2'
              '3')
            KeyItems.Strings = (
              '1'
              '2'
              '3')
            ShowHint = True
            TabOrder = 4
            Visible = True
            OnChange = nAttChange
          end
          object dbcbeSemAtt: TDBComboBoxEh
            Left = 70
            Top = 9
            Width = 68
            Height = 19
            DynProps = <>
            EditButtons = <>
            Flat = True
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            KeyItems.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            ShowHint = True
            TabOrder = 5
            Visible = True
            OnChange = dbcbeSemAttChange
          end
        end
      end
      object tsVed: TTabSheet
        Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1080
        ImageIndex = 1
        object dbgrdVed: TDBGridEh
          Left = 0
          Top = 84
          Width = 691
          Height = 464
          Align = alClient
          AllowedOperations = [alopUpdateEh]
          ColumnDefValues.ToolTips = True
          DataSource = dmUspevaemost.dsSelVedGroup
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          ImeMode = imDisable
          IndicatorOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmVedomost
          SortLocal = True
          TabOrder = 0
          OnDrawColumnCell = dbgrdVedDrawColumnCell
          OnKeyPress = dbgrdVedKeyPress
          OnTitleClick = dbgrdVedTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'nCode'
              Footers = <>
              ReadOnly = True
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'StudName'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1085#1080#1094#1080#1072#1083#1099
              Width = 135
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'KatZach'
              Footers = <>
              ReadOnly = True
              Title.Caption = ' '
              Title.ToolTips = True
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Nn_zach'
              Footers = <>
              ReadOnly = True
              Title.Caption = #8470' '#1079#1072#1095#1105#1090#1082#1080
              Width = 58
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cTema'
              Footers = <>
              Title.Caption = #1058#1077#1084#1072
              Width = 2000
              OnUpdateData = dbgrdVedColumns4UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ik_zach'
              Footers = <>
              ReadOnly = True
              Visible = False
            end
            item
              Checkboxes = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'dopusc'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1044#1086#1087#1091#1089#1082
              Width = 80
            end
            item
              AlwaysShowEditButton = True
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cosenca'
              Footers = <>
              Title.Caption = #1054#1094#1077#1085#1082#1072
              OnUpdateData = dbgrdVedColumns7UpdateData
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 691
          Height = 29
          Images = ilMain
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object ToolButton1: TToolButton
            Left = 0
            Top = 0
            Action = actCreateAllVeds
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton2: TToolButton
            Left = 23
            Top = 0
            Action = actPrntAllBlnk
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton3: TToolButton
            Left = 46
            Top = 0
            Action = actPrntAllNotes
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton4: TToolButton
            Left = 69
            Top = 0
            Action = actPrntBlnk
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton5: TToolButton
            Left = 92
            Top = 0
            Action = actPrntNotes
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton6: TToolButton
            Left = 115
            Top = 0
            Action = actRaports
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton7: TToolButton
            Left = 138
            Top = 0
            Action = actMkVin
            ImageIndex = 7
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton8: TToolButton
            Left = 161
            Top = 0
            Action = actRefreshDopusk
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton26: TToolButton
            Left = 184
            Top = 0
            Action = actRefreshVedStuds
          end
          object ToolButton9: TToolButton
            Left = 207
            Top = 0
            Action = actDelVed
            ParentShowHint = False
            ShowHint = True
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 548
          Width = 691
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            691
            30)
          object lVinost: TLabel
            Left = 192
            Top = 8
            Width = 92
            Height = 13
            Caption = #1042#1099#1085#1086#1089#1085#1086#1081' '#1101#1082#1079#1072#1084#1077#1085
          end
          object dbcbxClosed: TDBCheckBoxEh
            Left = 0
            Top = 6
            Width = 156
            Height = 17
            Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1079#1072#1082#1088#1099#1090#1072
            DynProps = <>
            Flat = True
            TabOrder = 0
            OnClick = dbcbxClosedClick
          end
          object btnCancelVed: TBitBtn
            Left = 380
            Top = 5
            Width = 143
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93
              93FF0000AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF9393FF00008A0000AEFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF00008A00
              00DD0000AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF9393FF00008A0000DD0000DD00008A00008A00008A00008A5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF00008A0000DD4242FF00
              00DD4242FF5353FF4242FF5353FF5353FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF0000DD0000DD0000DD4242FF4242FF4242FF4242FF5353FF5353FF5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF0000DD0000DD4242FF53
              53FF5353FF5353FF5353FF5353FF5353FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF9393FF0000DD5353FF5353FF0000DD0000DD0000DD5353FF5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF0000DD53
              53FF0000DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF9393FF0000DD0000DDFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93
              93FF4242FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 1
            OnClick = btnCancelVedClick
          end
          object btnSaveVed: TBitBtn
            Left = 530
            Top = 5
            Width = 159
            Height = 25
            Action = actSaveVed
            Anchors = [akTop, akRight]
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
              927FD5D7D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF78927F1B221CBDC0BDFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
              927F43774E1B221CC2C6C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7C9884222B232B362C3340353A493C518D6043774E1B221CC2C6C2FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82A18CA9E9BE73B3866AAA7D62
              A0745A976A62AA7443774E1B221CBEC2BEFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF89AA93B1EFC693E2AD8BD8A381CD9876C18C6CB58062AA745692646076
              67FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90B49CB4F1C9AEEEC4AAEABFA4
              E4B9A3E0B676C18C6DB2807B9784D3E1D7FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF95BCA290B49C89AA9382A18C7C9884A8E5BB80C7967B9784D2E0D7FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82
              A18CA5E1B87B9784D2E0D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF89AA937B9784D2E0D7FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
              B49CE2EDE6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Layout = blGlyphRight
            TabOrder = 2
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 29
          Width = 691
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            691
            55)
          object Label1: TLabel
            Left = 150
            Top = 5
            Width = 65
            Height = 13
            Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
          end
          object Label3: TLabel
            Left = 5
            Top = 6
            Width = 46
            Height = 13
            Caption = #1057#1077#1084#1077#1089#1090#1088':'
          end
          object Label4: TLabel
            Left = 131
            Top = 33
            Width = 84
            Height = 13
            Caption = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100':'
          end
          object Label5: TLabel
            Left = 555
            Top = 33
            Width = 30
            Height = 13
            Anchors = [akTop, akRight]
            Caption = #1044#1072#1090#1072':'
            ExplicitLeft = 547
          end
          object Label6: TLabel
            Left = 34
            Top = 33
            Width = 13
            Height = 13
            Caption = #8470
          end
          object dbcmbxPrepodVed: TDBLookupComboboxEh
            Left = 221
            Top = 30
            Width = 327
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            DataField = ''
            EditButtons = <>
            Flat = True
            KeyField = 'itab_n'
            ListField = 'NamePrepod'
            ListSource = dmUspevaemost.dsPrepodVed
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnChange = dbcmbxPrepodVedChange
          end
          object dbdteEx: TDBDateTimeEditEh
            Left = 588
            Top = 30
            Width = 92
            Height = 19
            Anchors = [akTop, akRight]
            DynProps = <>
            EditButtons = <>
            Flat = True
            Kind = dtkDateEh
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnChange = dbdteExChange
          end
          object dbeNum: TDBEditEh
            Left = 53
            Top = 30
            Width = 68
            Height = 19
            DynProps = <>
            EditButtons = <>
            Flat = True
            MaxLength = 12
            ShowHint = True
            TabOrder = 2
            Visible = True
            OnChange = dbeNumChange
          end
          object dbcbVed: TDBLookupComboboxEh
            Left = 221
            Top = 5
            Width = 460
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            DataField = ''
            EditButtons = <>
            Flat = True
            KeyField = 'Ik_ved'
            ListField = 'COLUMN1'
            ListSource = dmUspevaemost.dsGetAllVeds4Group
            ShowHint = True
            TabOrder = 3
            Visible = True
            OnChange = dbcbVedChange
          end
          object cmbxSem: TDBComboBoxEh
            Left = 53
            Top = 3
            Width = 68
            Height = 19
            AutoSelect = False
            DynProps = <>
            EditButtons = <>
            Flat = True
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            KeyItems.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            ShowHint = True
            TabOrder = 4
            Visible = True
            OnChange = cmbxSemChange
          end
        end
      end
      object tsNapr: TTabSheet
        Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
        ImageIndex = 3
        object Panel6: TPanel
          Left = 0
          Top = 548
          Width = 691
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          DesignSize = (
            691
            30)
          object BitBtn1: TBitBtn
            Left = 413
            Top = 5
            Width = 143
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93
              93FF0000AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF9393FF00008A0000AEFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF00008A00
              00DD0000AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF9393FF00008A0000DD0000DD00008A00008A00008A00008A5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF00008A0000DD4242FF00
              00DD4242FF5353FF4242FF5353FF5353FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF0000DD0000DD0000DD4242FF4242FF4242FF4242FF5353FF5353FF5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF0000DD0000DD4242FF53
              53FF5353FF5353FF5353FF5353FF5353FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF9393FF0000DD5353FF5353FF0000DD0000DD0000DD5353FF5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF0000DD53
              53FF0000DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF9393FF0000DD0000DDFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93
              93FF4242FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 0
            OnClick = BtnCancelAttClick
          end
          object BitBtn2: TBitBtn
            Left = 561
            Top = 5
            Width = 159
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
              927FD5D7D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF78927F1B221CBDC0BDFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
              927F43774E1B221CC2C6C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7C9884222B232B362C3340353A493C518D6043774E1B221CC2C6C2FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82A18CA9E9BE73B3866AAA7D62
              A0745A976A62AA7443774E1B221CBEC2BEFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF89AA93B1EFC693E2AD8BD8A381CD9876C18C6CB58062AA745692646076
              67FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90B49CB4F1C9AEEEC4AAEABFA4
              E4B9A3E0B676C18C6DB2807B9784D3E1D7FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF95BCA290B49C89AA9382A18C7C9884A8E5BB80C7967B9784D2E0D7FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82
              A18CA5E1B87B9784D2E0D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF89AA937B9784D2E0D7FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
              B49CE2EDE6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Layout = blGlyphRight
            TabOrder = 1
          end
        end
        object dbgrdNapr: TDBGridEh
          Left = 0
          Top = 57
          Width = 691
          Height = 491
          Align = alClient
          AllowedOperations = [alopUpdateEh, alopAppendEh]
          ColumnDefValues.ToolTips = True
          DataSource = dmUspevaemost.dsGetAllVedNaprForDisc
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = ppmGroupNapr
          ReadOnly = True
          SortLocal = True
          TabOrder = 1
          OnTitleClick = dbgrdNaprTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'lClose'
              Footers = <>
              Title.Caption = #1047#1072#1082#1088#1099#1090#1086
              Width = 51
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Nn_zach'
              Footers = <>
              Title.Caption = #8470' '#1079#1072#1095#1105#1090#1082#1080
              Width = 79
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'StudName'
              Footers = <>
              Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1085#1080#1094#1080#1072#1083#1099
              Width = 131
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'dD_vydano'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
              Width = 72
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cName_vid_exam'
              Footers = <>
              Title.Caption = #1042#1080#1076' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Dd_exam'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
              Width = 82
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cosenca'
              Footers = <>
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Otsenca'
              Footers = <>
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Name_osenca'
              Footers = <>
              Title.Caption = #1054#1094#1077#1085#1082#1072
              Width = 119
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ctema'
              Footers = <>
              Title.Caption = #1058#1077#1084#1072' '#1076#1083#1103' '#1050#1055' ('#1050#1056')'
              Visible = False
              Width = 300
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar4: TToolBar
          Left = 0
          Top = 0
          Width = 691
          Height = 27
          Images = ilMain
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          object ToolButton16: TToolButton
            Left = 0
            Top = 0
            Action = actPrintEmptyNapr
          end
          object tbtPrintNapr: TToolButton
            Left = 23
            Top = 0
            Action = actPrintNapr
          end
          object tbtCloseNapr: TToolButton
            Left = 46
            Top = 0
            Action = actCloseNapr
          end
          object tbEditNapr: TToolButton
            Left = 69
            Top = 0
            Action = actEditNapr
          end
          object ToolButton10: TToolButton
            Left = 92
            Top = 0
            Action = actDelNapr
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 27
          Width = 691
          Height = 30
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            691
            30)
          object Label7: TLabel
            Left = 5
            Top = 9
            Width = 42
            Height = 13
            Caption = #1057#1077#1084#1077#1089#1090#1088
          end
          object Label10: TLabel
            Left = 127
            Top = 8
            Width = 61
            Height = 13
            Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
          end
          object cmbxSemNapr: TDBComboBoxEh
            Left = 53
            Top = 6
            Width = 68
            Height = 19
            DynProps = <>
            EditButtons = <>
            Flat = True
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            KeyItems.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnChange = cmbxSemNaprChange
          end
          object dbcbNapr: TDBLookupComboboxEh
            Left = 194
            Top = 5
            Width = 491
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            DataField = ''
            EditButtons = <>
            Flat = True
            KeyField = 'Name'
            ListField = 'Name'
            ListSource = dmUspevaemost.dsGetAllVedNaprForGrup
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnChange = dbcbNaprChange
          end
        end
      end
      object tshUspev: TTabSheet
        Caption = #1059#1089#1087#1077#1074#1072#1077#1084#1086#1089#1090#1100
        ImageIndex = 4
        object sgUspev: TStringGrid
          Left = 0
          Top = 27
          Width = 691
          Height = 521
          Align = alClient
          BevelKind = bkFlat
          BiDiMode = bdRightToLeftNoAlign
          BorderStyle = bsNone
          DefaultColWidth = 100
          DefaultRowHeight = 17
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goTabs]
          ParentBiDiMode = False
          TabOrder = 0
          OnDrawCell = sgUspevDrawCell
        end
        object ToolBar6: TToolBar
          Left = 0
          Top = 0
          Width = 691
          Height = 27
          Images = ilMain
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object Label8: TLabel
            Left = 0
            Top = 0
            Width = 57
            Height = 22
            Alignment = taRightJustify
            AutoSize = False
            Caption = '   '#1057#1077#1084#1077#1089#1090#1088'  '
            Layout = tlCenter
          end
          object cmbxUspSem: TDBComboBoxEh
            Left = 57
            Top = 0
            Width = 68
            Height = 22
            DynProps = <>
            EditButtons = <>
            Flat = True
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            KeyItems.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnChange = cmbxUspSemChange
          end
          object ToolButton11: TToolButton
            Left = 125
            Top = 0
            Width = 8
            Caption = 'ToolButton10'
            ImageIndex = 10
            Style = tbsSeparator
          end
          object ToolButton12: TToolButton
            Left = 133
            Top = 0
            Action = actUspevToExcel
            DropdownMenu = pmUspevOtchet
            Style = tbsDropDown
          end
          object ToolButton13: TToolButton
            Left = 171
            Top = 0
            Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
            ImageIndex = 6
            OnClick = ToolButton13Click
          end
        end
        object sguspev_dop: TStringGrid
          Left = 21
          Top = 54
          Width = 349
          Height = 201
          Align = alCustom
          BevelKind = bkFlat
          BiDiMode = bdRightToLeftNoAlign
          BorderStyle = bsNone
          ColCount = 2
          DefaultColWidth = 100
          DefaultRowHeight = 17
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goTabs]
          ParentBiDiMode = False
          TabOrder = 2
          Visible = False
        end
        object Panel9: TPanel
          Left = 0
          Top = 548
          Width = 691
          Height = 30
          Align = alBottom
          TabOrder = 3
          object Image1: TImage
            Left = 1
            Top = 5
            Width = 21
            Height = 25
            Picture.Data = {
              07544269746D6170E6040000424DE60400000000000036000000280000001400
              0000140000000100180000000000B00400000000000000000000000000000000
              00007BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDD
              BD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7B
              DDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD
              7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD7BDDBD}
          end
          object Image2: TImage
            Left = 159
            Top = 5
            Width = 21
            Height = 25
            Picture.Data = {
              07544269746D6170E6040000424DE60400000000000036000000280000001400
              0000140000000100180000000000B00400000000000000000000000000000000
              000063F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5
              E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363
              F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E363F5E3
              63F5E363F5E363F5E363F5E363F5E363F5E3}
          end
          object Image3: TImage
            Left = 396
            Top = 5
            Width = 21
            Height = 25
            Picture.Data = {
              07544269746D6170E6040000424DE60400000000000036000000280000001400
              0000140000000100180000000000B00400000000000000000000000000000000
              0000C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6
              FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6
              C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF
              C6C6FFC6C6FFC6C6FFC6C6FFC6C6FFC6C6FF}
          end
          object Label12: TLabel
            Left = 24
            Top = 6
            Width = 131
            Height = 13
            Caption = '- '#1054#1090#1083#1080#1095#1085#1080#1082#1080' '#1080' '#1093#1086#1088#1086#1096#1080#1089#1090#1099
          end
          object Label13: TLabel
            Left = 182
            Top = 6
            Width = 210
            Height = 13
            Caption = '- '#1045#1089#1090#1100' '#1090#1088#1086#1081#1082#1080' '#1080#1083#1080' '#1085#1077' '#1091#1083#1086#1078#1080#1083#1080#1089#1100' '#1074' '#1089#1077#1089#1089#1080#1102
          end
          object Label14: TLabel
            Left = 419
            Top = 6
            Width = 138
            Height = 13
            Caption = '- '#1045#1089#1090#1100' '#1085#1077' '#1089#1076#1072#1085#1085#1099#1081' '#1087#1088#1077#1076#1084#1077#1090
          end
        end
      end
      object tsDiplom: TTabSheet
        Caption = #1044#1080#1087#1083#1086#1084
        ImageIndex = 5
        object ToolBar5: TToolBar
          Left = 0
          Top = 0
          Width = 691
          Height = 26
          ButtonWidth = 29
          Caption = 'ToolBar1'
          Images = ilMain
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object ToolButton17: TToolButton
            Left = 0
            Top = 0
            Action = actCreateDiploms
          end
          object ToolButton19: TToolButton
            Left = 29
            Top = 0
            Action = actUpdateDiploms
          end
          object ToolButton18: TToolButton
            Left = 58
            Top = 0
            Action = actPrintDipl
          end
        end
        object dbgDiplom: TDBGridEh
          Left = 0
          Top = 26
          Width = 691
          Height = 522
          Hint = #1044#1072#1085#1085#1099#1077' '#1076#1080#1087#1083#1086#1084#1072
          Align = alClient
          AutoFitColWidths = True
          DataSource = dmDiplom.dsDiplomList
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnCellClick = dbgDiplomCellClick
          OnKeyPress = dbgDiplomKeyPress
          OnMouseDown = dbgDiplomMouseDown
          OnMouseMove = dbgDiplomMouseMove
          OnMouseUp = dbgDiplomMouseUp
          OnTitleClick = dbgDiplomTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'StudName'
              Footers = <>
              Title.Caption = #1060#1048#1054' '#1089#1090#1091#1076#1077#1085#1090#1072
              Width = 80
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'RegNumber'
              Footers = <>
              MaxWidth = 300
              ReadOnly = True
              Title.Caption = #1056#1077#1075'. '#1085#1086#1084#1077#1088
              Width = 45
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'VipNumber'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088' '#1074#1099#1087#1080#1089#1082#1080
              Visible = False
              OnUpdateData = dbgDiplomColumns2UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cTema'
              Footers = <>
              Title.Caption = #1058#1077#1084#1072' '#1076#1080#1087#1083#1086#1084#1072
              Width = 180
              OnUpdateData = dbgDiplomColumns2UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cTeacher'
              Footers = <>
              Title.Caption = #1060#1048#1054' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
              Width = 150
              OnUpdateData = dbgDiplomColumns2UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cosenca'
              Footers = <>
              Title.Caption = #1054#1094#1077#1085#1082#1072
              Width = 50
              OnUpdateData = dbgDiplomColumns5UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Dd_dipl'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1044#1072#1090#1072' '#1079#1072#1097#1080#1090#1099
              Visible = False
              Width = 80
              OnUpdateData = dbgDiplomColumns2UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Dd_VidDipl'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1074#1088#1091#1095#1077#1085#1080#1103
              Visible = False
              Width = 80
              OnUpdateData = dbgDiplomColumns2UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'PredprName'
              Footers = <>
              Title.Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077'-'#1079#1072#1082#1072#1079#1095#1080#1082
              Visible = False
              OnUpdateData = dbgDiplomColumns2UpdateData
            end
            item
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'IsExcellent'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1057' '#1086#1090#1083#1080#1095#1080#1077#1084
              Width = 54
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'TypeTemaName'
              Footers = <>
              Title.Caption = #1058#1080#1087' '#1090#1077#1084#1099
              Visible = False
              OnUpdateData = dbgDiplomColumns2UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'OverVUZ'
              Footers = <>
              Title.Caption = #1048#1079' '#1076#1088#1091#1075#1086#1075#1086' '#1042#1059#1047#1072
              Visible = False
              Width = 66
              OnUpdateData = dbgDiplomColumns2UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'OverVWeekCount'
              Footers = <>
              Title.Caption = #1050#1086#1083'-'#1074#1086' '#1085#1077#1076#1077#1083#1100' '#1074' '#1076#1088'. '#1042#1059#1047#1077
              Width = 60
              OnUpdateData = dbgDiplomColumns2UpdateData
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'OverVUZName'
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1088'. '#1042#1059#1047#1072
              Width = 100
              OnUpdateData = dbgDiplomColumns2UpdateData
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 548
          Width = 691
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            691
            30)
          object btnCancelDiplom: TBitBtn
            Left = 372
            Top = 5
            Width = 143
            Height = 25
            Action = actCancelDipl
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93
              93FF0000AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF9393FF00008A0000AEFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF00008A00
              00DD0000AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF9393FF00008A0000DD0000DD00008A00008A00008A00008A5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF00008A0000DD4242FF00
              00DD4242FF5353FF4242FF5353FF5353FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF0000DD0000DD0000DD4242FF4242FF4242FF4242FF5353FF5353FF5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF0000DD0000DD4242FF53
              53FF5353FF5353FF5353FF5353FF5353FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF9393FF0000DD5353FF5353FF0000DD0000DD0000DD5353FF5353
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9393FF0000DD53
              53FF0000DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF9393FF0000DD0000DDFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93
              93FF4242FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 0
          end
          object btnSaveDiplom: TBitBtn
            Left = 521
            Top = 5
            Width = 159
            Height = 25
            Action = actSaveDipl
            Anchors = [akTop, akRight]
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
              927FD5D7D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF78927F1B221CBDC0BDFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
              927F43774E1B221CC2C6C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7C9884222B232B362C3340353A493C518D6043774E1B221CC2C6C2FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82A18CA9E9BE73B3866AAA7D62
              A0745A976A62AA7443774E1B221CBEC2BEFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF89AA93B1EFC693E2AD8BD8A381CD9876C18C6CB58062AA745692646076
              67FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90B49CB4F1C9AEEEC4AAEABFA4
              E4B9A3E0B676C18C6DB2807B9784D3E1D7FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF95BCA290B49C89AA9382A18C7C9884A8E5BB80C7967B9784D2E0D7FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82
              A18CA5E1B87B9784D2E0D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF89AA937B9784D2E0D7FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
              B49CE2EDE6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Layout = blGlyphRight
            TabOrder = 1
          end
        end
      end
      object tsAverageBalls: TTabSheet
        Caption = #1057#1088#1077#1076#1085#1080#1077' '#1073#1072#1083#1083#1099
        ImageIndex = 7
        inline fmAverageBallsGroup: TfmAverageBalls
          Left = 0
          Top = 0
          Width = 691
          Height = 578
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 691
          ExplicitHeight = 578
          inherited Panel1: TPanel
            Width = 691
            Height = 541
            ExplicitWidth = 691
            ExplicitHeight = 541
            inherited tbAcadem: TToolBar
              Width = 687
              ExplicitWidth = 687
            end
            inherited lvBalls: TListView
              Width = 687
              Height = 482
              ExplicitWidth = 687
              ExplicitHeight = 482
            end
            inherited pnlFilters: TPanel
              Width = 687
              ExplicitWidth = 687
            end
          end
          inherited pnlSave: TPanel
            Top = 541
            Width = 691
            ExplicitTop = 541
            ExplicitWidth = 691
            inherited bbSave: TBitBtn
              Left = 514
              ExplicitLeft = 514
            end
            inherited bbUndo: TBitBtn
              Left = 346
              ExplicitLeft = 346
            end
          end
          inherited ilBalls: TImageList
            Bitmap = {
              494C010102000400E80010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
              0000000000000000000000000000000000000000000000000000D6CFC6006349
              3100634931006349310063493100634931006349310063493100634931006349
              3100D6CFC6000000000000000000000000000000000000000000D6CFC6006349
              3100634931006349310063493100634931006349310063493100634931006349
              3100D6CFC6000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BDA69400F7E3
              DE00E7CFC600DEC7B500DEBEAD00DEBEAD00D6BAA500D6BAA500D6B6A500D6B6
              A500634931000000000000000000000000000000000000000000BDA69400F7E3
              DE00F7DFD600F7DBCE00F7D7CE00EFD3C600EFD3BD00EFCFBD00EFCBBD00EFCB
              B500634931000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BDA69400F7EB
              E700F7E3DE00F7DFD600F7DBCE00F7D7CE00EFD3C600EFD3BD00EFCFBD00D6B6
              A500634931000000000000000000000000000000000000000000BDA69400F7EB
              E700F7E3DE00F7DFD600F7DBCE00F7D7CE00EFD3C600EFD3BD00EFCFBD00EFCB
              BD00634931000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BDA69400FFEF
              E700F7EBE700F7E3DE00F7DFD60063493100F7D7CE00EFD3C600EFD3BD00D6BA
              A500634931000000000000000000000000000000000000000000BDA69400FFEF
              E700F7EBE700F7E3DE00F7DFD600F7DBCE00F7D7CE00EFD3C600EFD3BD00EFCF
              BD00634931000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BDA69400FFF3
              EF00FFEFE700F7EBE700F7E3DE0063493100F7DBCE00F7D7CE00EFD3C600D6BA
              A500634931000000000000000000000000000000000000000000BDA69400FFF3
              EF00FFEFE700F7EBE700F7E3DE00F7DFD600F7DBCE00F7D7CE00EFD3C600EFD3
              BD00634931000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BDA69400FFF7
              F700FFF3EF006349310063493100634931006349310063493100F7D7CE00DEBE
              AD00634931000000000000000000000000000000000000000000BDA69400FFF7
              F700FFF3EF006349310063493100634931006349310063493100F7D7CE00EFD3
              C600634931000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BDAA9C00FFF7
              F700FFF7F700FFF3EF00FFEFE70063493100F7E3DE00F7DFD600F7DBCE00DEBE
              AD00634931000000000000000000000000000000000000000000BDAA9C00FFF7
              F700FFF7F700FFF3EF00FFEFE700F7EBE700F7E3DE00F7DFD600F7DBCE00F7D7
              CE00634931000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000C6AA9C00FFFB
              FF00FFF7F700FFF7F700FFF3EF0063493100F7EBE700F7E3DE00F7DFD600DEC3
              AD00634931000000000000000000000000000000000000000000C6AA9C00FFFB
              FF00FFF7F700FFF7F700FFF3EF00FFEFE700F7EBE700F7E3DE00F7DFD600F7DB
              CE00634931000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000C6AE9C00FFFF
              FF00FFFBFF00FFF7F700FFF7F700FFF3EF00FFEFE700F7EBE700F7E3DE00E7CF
              C600634931000000000000000000000000000000000000000000C6AE9C00FFFF
              FF00FFFBFF00FFF7F700FFF7F700FFF3EF00FFEFE700F7EBE700F7E3DE00F7DF
              D600634931000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000C6AE9C00FFFF
              FF00FFFFFF00FFFBFF00FFF7F700FFF7F700FFF3EF00FFEFE700F7EBE700F7E3
              DE00634931000000000000000000000000000000000000000000C6AE9C00FFFF
              FF00FFFFFF00FFFBFF00FFF7F700FFF7F700FFF3EF00FFEFE700F7EBE700F7E3
              DE00634931000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000EFEBE700C6AE
              9C00C6AE9C00C6AA9C00BDAA9C00BDA69C00BDA69400BDA29400BDA29400BDA2
              9400D6CFC6000000000000000000000000000000000000000000EFEBE700C6AE
              9C00C6AE9C00C6AA9C00BDAA9C00BDA69C00BDA69400BDA29400BDA29400BDA2
              9400D6CFC6000000000000000000000000000000000000000000000000000000
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
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 613
    Width = 703
    Height = 33
    Visible = False
    ExplicitTop = 613
    ExplicitWidth = 703
    ExplicitHeight = 33
    inherited bbSave: TBitBtn
      Left = 536
      Top = 2
      ExplicitLeft = 536
      ExplicitTop = 2
    end
    inherited bbUndo: TBitBtn
      Left = 210
      Top = 2
      ExplicitLeft = 210
      ExplicitTop = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = dmStudentData.adodsSmallGroup
    Left = 148
    Top = 183
  end
  object ilMain: TImageList
    Left = 174
    Top = 152
    Bitmap = {
      494C010111004000E40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
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
      000000000000000000000000000000000000B5A294007B614A0073594200634D
      3900634931006349310063493100634931006349310063493100634931006349
      3100634931006349310063493100634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5A29400EFDBD600EFDBD600EFCF
      BD00EFCFBD00DEBAA500DEBAA500DEBAA500DEBAA500DEBAA50000820000DEB6
      9C00DEB69C00E7AE9400E7AE9400634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDA69400FFF3EF00ADBAD6000859
      CE001855AD0000419400294D9400ADA6A500FFE3D6000082000000FF00000082
      0000F7D7C600F7D7C600DEB69C00634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDAA9C00EFEFF7001855C60063A2
      F7004286DE000049A5001065D600004194000082000000FF000000FF000000FF
      000000820000BD968400DEB69C00634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDAA9C00EFEFF700296DD60063A2
      F7001855AD00296DD6000851B5000082000000FF000000FF00000082000000FF
      000000FF000000820000DEBAA500634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6B2A500FFFBF700DEDFDE00294D
      94009C9A9400848A9C000082000000FF000000FF000000820000BD9684000082
      000000FF000000FF000000820000634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6B6A500FFFFFF00636563002928
      2900B5B6B5007B797B00636563000082000000820000FFF3EF00FFEFE700FFEB
      E7000082000000FF000000FF0000008200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEB6AD00FFFBFF004A494A004A49
      4A00E7E7E700C6C7C6007B797300DEDFDE00FFF7F700F7C7A500F7B28C00F7AE
      8400FFA67B000082000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEBAAD00FFFFFF006B696B007375
      730094969C0094969C007B797300E7DFDE00FFFFFF00FFFBF700FFFBF700FFFB
      F700FFF7EF00FFF7EF000082000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6BEB50000000000E7E3E7007375
      73008482840073757300C6C7C600FFFBFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFFBF700CECBC600008200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6C3B50000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFBFF00FFFBFF00FFFFFF007B614A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6C3B500D6C3B500D6BEB500CEBA
      AD00CEBAAD00CEB6AD00C6B6A500C6B2A500C6AEA500BDAA9C00BDA69400BDA6
      9400B5A29400B5A29400B5A29400B5A294000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000C8B2A300C8B2
      A300B7A29300B7A29300B9A49500BDA79800C1AB9C00C5AFA000C8B2A300C9B4
      A500C8B2A300C8B2A3000000000000000000F7F3EF00E7DFDE0094796B008C75
      630084715A00E7DFDE007B6552007B614A00735D4A00E7DFDE006B5542006B51
      3900634D3900E7DFDE000000000000000000F7F3EF00E7DFDE0094796B008C75
      630084715A00E7DFDE007B6552007B614A00735D4A00E7DFDE006B5542006B51
      3900634D3900E7DFDE000000000000000000F7F3EF00E7DFDE0094796B008C75
      630084715A00E7DFDE007B6552007B614A00735D4A00E7DFDE006B5542006B51
      3900634D3900E7DFDE0000000000000000000000000000000000CAB4A500FFFF
      FF00FDFCFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CAB4A5000000000000000000E7DFDE00AD9A8C00EFE3DE00F7E7
      E700EFDFD60084695A00B59A8C00DEBEAD00DEB6A50073594200AD8A7300D6A6
      9400CE9E840063493900E7DFDE0000000000E7DFDE00AD9A8C00EFE3DE00F7E7
      E700EFDFD60084695A00B59A8C00DEBEAD00DEB6A50073594200AD8A7300D6A6
      9400CE9E840063493900E7DFDE0000000000E7DFDE00AD9A8C00EFE3DE00F7E7
      E700EFDFD60084695A00B59A8C00DEBEAD00DEB6A50073594200AD8A7300D6A6
      9400CE9E840063493900E7DFDE00000000000000000000000000BFAA9B00FEFC
      FB00DECDC000EBD9D100EEDFD800F2E5DF00F4EAE600F7EFEC00F9F5F20066A2
      6400FEFCFB00BFAA9B000000000000000000B5A29400FFFBF700FFF7F700F7F3
      EF00F7EBE700F7E7DE007B6552007B614A00735D4A00735942006B5542006B51
      3900634D3900634939006349310000000000B5A29400FFFBF700FFF7F700F7F3
      EF00F7EBE700F7E7DE007B6552007B614A00735D4A00735942006B5542006B51
      3900634D3900634939006349310000000000B5A29400FFFBF700FFF7F700F7F3
      EF00F7EBE700F7E7DE007B6552007B614A00735D4A00735942006B5542006B51
      3900634D39006349390063493100000000000000000000000000B7A29300FDFC
      FB00FBF9F700FAF5F200F7EFED00F4EAE600F2E5DF00DDDCD700DFD7CE00DECD
      C000FDFCFB00B7A293000000000000000000B5A29400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DED7CE00DECFC600DEC7B500DEBE
      AD00DEBAA500DEB6A5006349310000000000B5A29400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBAA500DEB6A5006349310000000000B5A29400FFFFFF00FFFBF700FFF7
      F700F7EFEF00F7EBE700F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBAA500DEB6A50063493100000000000000000000000000B7A29300FFFF
      FF00B47F6500B47F6400EDDDD500B37E6300F4EBE600F1E5DF00EFDFD700EBD9
      D100FFFFFF00B7A293000000000000000000B5A29400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFDFD600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6B2A5006349310000000000B5A29400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFDFD600EFDBD600EFD3CE00E7CF
      C600E7C7BD00D6B2A5006349310000000000B5A29400FFFFFF00B57D6300B57D
      6300EFDFD600B57D6300F7EBE700F7E7DE00EFDFD600EFDBD600EFD3CE00E7CF
      C600E7C7BD00D6B2A50063493100000000000000000000000000B9A49500FFFF
      FF00FFFFFF00FDFCFC00FCF9F700FAF4F200F6F0EC00F4EBE500F2E5DF00EEDF
      D800FFFFFF00B9A495000000000000000000BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEBEAD006349310000000000BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7E7DE00EFDFDE00EFDBD600EFD3
      CE00E7CFC600DEBEAD006349310000000000BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFF7F700F7F3EF00F7EBE700F7E7DE00EFDFDE00EFDBD600EFD3
      CE00E7CFC600DEBEAD0063493100000000000000000000000000BDA79800FFFF
      FF00968E8800EEDED700968E8700EDDDD600968D8600958C8500F4EBE600F2E5
      DF00FFFFFF00BDA798000000000000000000BDA69C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7C7BD006349310000000000BDA69C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7EBE700F7E7DE00EFDFDE00EFDB
      D600EFD3CE00E7C7BD006349310000000000BDA69C00FFFFFF00948E8C00EFDF
      D600948E8400EFDFD600948E8400948E84000000000084828400ADB6B500EFDB
      D600EFD3CE00E7C7BD0063493100000000000000000000000000C1AB9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFCFC00FBF8F700FAF4F200F7F0EC00F4EA
      E600FFFFFF00C1AB9C000000000000000000C6AA9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7D3C6006349310000000000C6AA9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7E7DE00EFDF
      D600EFDBD600E7D3C6006349310000000000C6AA9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBF700FFF7F7008482840073716B00525552000000
      0000EFDBD600E7D3C60063493100000000000000000000000000C5AFA000FFFF
      FF00B4806500B4806500968E8800C2B0A300968E8700968E8600F9F4F200F7EF
      EC00FFFFFF00C5AFA0000000000000000000C6AEA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFDBD6006349310000000000C6AEA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7EBE700F7E7
      DE00EFDFDE00EFDBD6006349310000000000C6AEA500FFFFFF00B5826300B582
      6300948E8C00C6B2A500948E8400948E840000619400A59E9C00FFFFFF005292
      AD0008101000EFDBD60063493100000000000000000000000000C8B2A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFCFC00FCF8F700F9F5
      F200FFFFFF00C8B2A3000000000000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFE3DE006349310000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F3EF00F7EB
      E700F7E7DE00EFE3DE006349310000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000619400A59E9C008CB6C60073CF
      E7004A9AB5000810100063493100000000000000000000000000C9B4A500FFFF
      FF00FFFFFF0066A3650066A3650066A36500C0B4AD0066A3650066A3650066A2
      6400FFFFFF00C9B4A5000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFE3DE006349310000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F3
      EF00F7EBE700EFE3DE006349310000000000CEB6A500FFFFFF00FFFFFF0063A2
      630063A2630063A26300C6B6AD0063A2630063A26300006194004A9EB5008CE3
      EF0063BED6004A9AB50008101000000000000000000000000000C8B2A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFC
      FB00FFFFFF00C8B2A3000000000000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7
      F700F7F3EF00F7EBE7006349310000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7
      F700F7F3EF00F7EBE7006349310000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF70052A2
      B5008CE3EF006BC7DE007B868400313494000000000000000000C8B2A300CAB4
      A500CBB5A600CAB4A500C9B3A400C7B2A300C6B0A100C3AE9F00C1AC9D00BFAA
      9B00CAB4A500C8B2A3000000000000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      9400BDA69400BDA29400B5A2940000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      9400BDA69400BDA29400B5A2940000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      94007BB2BD00CEBAAD007386D6005A6DAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A6DAD00849EEF005A75D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000510000005100000051000000510000005100000051
      0000005100000051000000510000002000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000525152004A494A004A49
      4A004A494A005A595200FF00FF0052514A004A4942005251520094969400FF00
      FF004A4942004A4942004A494A005A595A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086000000860000007900000079
      0000008600000086000000860000008600000086000000860000008600000086
      00000086000000790000008E0000003800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000949E8C00FFFFFF00FFFFFF00FFFF
      F700FFFFFF005A59520084867B00FFFFFF00FFFFF700BDBEB500424139008486
      7B00F7EFDE00EFE7D600FFF7EF0094968400F7F7EF00E7DFDE0094796B008C71
      630084715A00E7DFDE007B6152007B614A0073594A00E7DFDE006B5142006B51
      390063493900E7DFDE00000000000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700008600000038000000000000B5B6B5006B696B009C9E
      9C0000000000000000000000000000000000000000000000000000000000E7E7
      E700A5A6A50094969400000000000000000094968C00FFFFFF00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B00E7DFDE00AD9E8C00EFE7DE00F7E7
      E700EFDFD60084695A00B59E8C00DEBEAD00DEB6A50073594200AD8E7300D6A6
      9400CE9E840063493900E7DFDE000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000860000003800009479EF002900DE003928A5006361
      6300CECFCE000000000000000000000000000000000000000000D6D7D6006351
      B5002900DE00A5A6A500000000000000000094968400FFFFFF00EFDFD600D6BE
      AD00C6B6A500C6B6A500CEBEAD00E7DFD600F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B00B5A69400FFFFF700FFF7F700F7F7
      EF00F7EFE700F7E7DE007B6152007B614A0073594A00735942006B5142006B51
      39006349390063493900634931000000000000860000F7EFF70031A63100299E
      2900299629002996290029962900299629002996290021962100299629000086
      000000860000D6E7D6000079000000380000BDAEF7002900DE003108DE005249
      6B007B797B00DEDFDE00000000000000000000000000CEC7D6004228C6002900
      DE007B69CE0000000000000000000000000094968C00FFFFFF00C6AE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D6BEB500F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8E7B00B5A69400FFFFFF00FFFFF700FFF7
      F700F7EFEF00F7EFE700F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBEA500DEB6A500634931000000000000860000F7EFF700008600000086
      0000008E0000008E0000008E0000008E00000086000094BE9400008600000086
      00009CA69C00F7EFF7000079000000380000000000008471EF002900DE003918
      D6005A595A0094969400E7E7E70000000000CEC7D6003918CE002900DE00A59E
      C6000000000000000000000000000000000094968C00FFF7F700C6AE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC7BD00F7EFE700C6B6A500C6B6A500C6B6
      A500C6B6A500C6B6A500F7EFE7008C8E7B00B5A69400FFFFFF00B5796300B579
      6300EFDFD600B5796300F7EFE700F7E7DE00EFDFD600EFDFD600EFD7CE00E7CF
      C600E7C7BD00D6B6A500634931000000000000860000F7EFF700FFF7FF000086
      0000008E0000008E0000008E000000860000A5C7A50000860000008E0000088E
      0800F7EFF700F7EFF700007900000038000000000000000000007B61EF002900
      DE005238C6006361630094969400B5B6C6003918CE002900DE00A59EC6000000
      00000000000000000000000000000000000094968C00FFF7F700CEBEA500FFFF
      FF00D6F7FF00FFFFFF00FFFFFF00DEC7BD00F7EFE700D6C7B500D6C7BD00D6C7
      BD00D6C7BD00D6C7B500F7EFE7008C8E7B00BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700F7F7EF00F7EFE700F7E7DE00EFDFDE00EFDFD600EFD7
      CE00E7CFC600DEBEAD00634931000000000000860000F7EFF700F7EFF700FFFF
      FF00088E08000086000000860000B5CFB5000086000000860000008600000086
      000042A64200F7EFF70000790000003800000000000000000000000000007B61
      EF002900DE005230C60052515A003110C6002900D600A59EC600000000000000
      00000000000000000000000000000000000094968C00FFFFF700CEC7B500EFFF
      FF0052AEEF00EFFFFF00FFFFFF00D6C7BD00F7EFE700D6C7B500D6C7B500D6C7
      B500D6C7B500D6C7B500FFF7EF008C8E7B00BDA69C00FFFFFF00948E8C00EFDF
      D600948E8400EFDFD600948E8400948E8400F7EFE700F7E7DE0000860000EFDF
      D600EFD7CE00E7C7BD00634931000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF70000860000B5CFB50000860000008600007BAE7B00F7EFF700F7EF
      F700F7EFF700F7EFF70000790000003800000000000000000000000000000000
      00007B59EF002900DE002900D6002900D6006B618C00DEDFDE00000000000000
      00000000000000000000000000000000000094968C008CC7EF007BBEEF008CC7
      D6003196D6008CC7D60073B6DE0084B6DE00F7EFE700C6B6A500C6B6A500C6B6
      A500C6B6A500C6B6A500FFF7EF008C8E7B00C6AE9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7F700F7F7EF00F7EFE70000860000EFDF
      D600EFDFD600E7D7C600634931000000000000860000F7EFF700F7EFF700EFEF
      EF009CC79C00B5C7B50000860000008E0000008E000000860000BDBEBD00F7EF
      F700F7EFF700F7EFF70000790000003800000000000000000000000000000000
      0000CEC7D6002908DE002900DE004228C6007371730094969400D6D7D6000000
      0000000000000000000000000000000000009496840094CFF70018B6FF00299E
      DE0021D7F700299EDE0018B6FF008CBEE700FFFFFF00FFFFF700FFF7F700F7F7
      F700F7F7EF00F7EFE700FFFFF70094968C00C6AEA500FFFFFF00B5866300B586
      6300948E8C00C6B6A500948E8400948E8400FFF7F70000860000F7EFE7000086
      0000EFDFDE00EFDFD600634931000000000000860000F7EFF700F7EFF700ADCF
      AD00B5CFB50000860000008600000086000000860000008E000000860000A5A6
      A500F7EFF700F7EFF7000079000000380000000000000000000000000000CEC7
      D6003918CE002900DE007359CE003108E7005A38D6007B798C0084868400C6C7
      C600000000000000000000000000000000008CA6AD009CD7EF00299EDE008CE7
      F700ADF7FF008CE7F700299EDE009CD7EF00A5C7C600B5B6AD00ADAEA500ADAE
      A500ADAEA500ADAEA500BDBEB50000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF70000860000F7F7EF000086
      0000F7E7DE00EFE7DE00634931000000000000860000F7EFF700B5CFB500BDCF
      BD0000860000008600005AAE5A00F7EFF700299E290000860000008E00000086
      0000D6CFD600F7EFF70000790000003800000000000000000000CEC7D6003918
      CE002900DE008C86BD0000000000000000004218E7004A28DE007B719C007B79
      7B00B5B6B5000000000000000000000000004AA6DE00398ECE0021D7EF009CF7
      FF00EFFFFF009CF7FF0021D7EF00318ECE00429EE700FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB6A500FFFFFF00FFFFFF0063A6
      630063A6630063A66300C6B6AD0063A663000086000063A66300FFF7F700F7F7
      EF0000860000EFE7DE00634931000000000000860000F7EFF7004AAE4A0052AE
      520052B6520073BE7300F7EFF700F7EFF700FFF7FF0063B6630052AE52003996
      390039A63900F7EFF700007900000038000000000000BDBEC6003910CE002900
      DE007361B500000000000000000000000000000000005A41E7003108DE007B69
      B5008C8E8C00DEDFDE000000000000000000F7FFFF00BDE7F700319EDE007BDF
      F7008CF7FF007BDFF70039A6DE0094CFF700C6E7FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000860000FFFFFF00FFFFF700FFF7
      F70000860000F7EFE700634931000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000086000000380000C6BEEF003910CE002900DE005A41
      B5000000000000000000000000000000000000000000000000009479EF002900
      DE00CECFE700000000000000000000000000FF00FF0084BEEF0021B6FF00399E
      DE0021CFEF00399EDE0021BEFF007BB6F700FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB6A500CEB6A500CEB6A500CEB6
      A500CEB6A500C6B6A500C6B6A500C6AE9C00C6AE9C00BDAE9C00BDAE9C00BDA6
      9400BDA6940000860000B5A694000000000000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000860000003800004218E7002900DE004228C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF009CCFEF0094C7F700BDDF
      F7003996D600BDDFF70094C7F7009CCFEF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000086000000000000000000000086000000860000008600000086
      000000860000008600000086000000860000008600000086000000860000008E
      0000008E000000860000008600004AAE4A003110E7004A28E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF00FF00FF00FF00EFF7
      FF005AAEEF00EFF7FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000E7DFDE00AD9A8C00B5A29400FFFFFF00FFFBF700FFF7F700F7EFEF00F7EB
      E700F7E7DE00DEDFD600DED7CE00DECFC600A5756B00A5756B00A5756B00A575
      6B00A5756B00A5756B00A5756B00A5716B009C7163009C6D63009C6D63009C69
      63009C6963009465630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F3EF00E7DF
      DE00B5A29400FFFBF700B5A29400FFFFFF00B57D6300B57D6300EFDFD600B57D
      6300F7EBE700F7E7DE00EFDFD600EFDBD600AD7D6B00FFDFBD00DEDBD600DEDB
      D600DED7CE00DECFC600DECFC600DECBBD00DEC3B500DEC3B500DEBEB500DEBE
      AD00DEBEAD009C69630000000000000000000000000000000000AD968400735D
      4A00735D4A00735D4A00735D4A00735D4A00735D4A00735D4A00735D4A00735D
      4A00735D4A00735D4A00735D4A00000000000000000000000000000000000000
      00009C8E84006349310063493100634931006349310063493100634931006349
      3100634931006349310000000000000000000000000000000000E7DFDE00AD9A
      8C00B5A29400FFFFFF00BDA69400FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7
      F700F7F3EF00F7EBE700F7E7DE00EFDFDE00AD7D6B00FFDFBD00FFDFBD00FFDF
      BD00FFDFBD00FFDFBD00FFDFBD00FFDBB500FFDBB500FFDBB500FFD7AD00FFD7
      AD00DEBEAD009C69630000000000000000000000000000000000AD968400DECB
      C600DECBC600DECBC600DECBC600DECBC600DECBC600DECBC600DECBC600DECB
      C600DECBC600DECBC600735D4A00000000000000000000000000000000000000
      00009C8A7B00FFFBFF00DEC3AD00D6BEAD00CEB6A500CEB2A500C6AA9C00BDA6
      9400B5A29400634931000000000000000000F7F3EF00E7DFDE00B5A29400FFFB
      F700B5A29400FFFFFF00BDA69C00FFFFFF00948E8C00EFDFD600948E8400EFDF
      D600948E8400948E8400F7EBE700F7E7DE00B5827300FFE3C600FFE3C600D6A6
      8400D6A68400D6A68400D6A68400D6A68400D6A68400D6A68400D6A68400FFD7
      B500DEBEAD009C6D630000000000000000000000000000000000AD968400FFEB
      E700F7E7DE00F7E3DE00F7DFD60000925A00F7DBCE00F7D7CE00F7D3C600F7D3
      C600F7CFBD00DECBC600735D4A00000000000000000000000000000000000000
      00009C8A7B00FFFFFF00FFFBF700F7F3EF00F7EBE700EFDFD600E7D7CE00E7CF
      BD00BDA69400634931000000000000000000E7DFDE00AD9A8C00B5A29400FFFF
      FF00BDA69400FFFFFF00C6AA9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFF7F700F7F3EF00F7EBE700B5867300FFE7CE00FFE7CE00FFE7
      CE00FFE3CE00FFE7C600FFE3C600FFE3C600FFDFBD00FFDFBD00FFDBBD00FFDB
      B500DEBEB500A571630000000000000000000000000000000000AD968400FFEB
      E700FFEBE700F7E7DE0000925A00008E5A008CDBB5008CDBB500EFD7C600F7D3
      C600F7D3C600DECBC600735D4A00000000000000000000000000000000000000
      00009C8E8400FFFFFF00FFFFFF00FFF7F700F7EFEF00F7E7DE00EFDFD600E7D7
      C600C6AA9C00634931000000000000000000B5A29400FFFBF700B5A29400FFFF
      FF00BDA69C00FFFFFF00C6AEA500FFFFFF00B5826300B5826300948E8C00C6B2
      A500948E8400948E8400FFF7F700F7EFEF00BD8E7300FFEBD600FFEBD600D6A6
      8400D6A68400D6A68400D6A68400D6A68400D6A68400D6A68400D6A68400FFDF
      BD00DEC3B500A5756B0000000000000000000000000000000000AD9A8C00FFEF
      EF00FFEFE70000925A0000925A0000925A0000925A0000925A0000925A00B5DF
      BD00F7D7C600DECBC600735D4A00000000000000000000000000000000000000
      0000A5928400FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7DE00EFDB
      D600CEB2A500634931000000000000000000B5A29400FFFFFF00BDA69400FFFF
      FF00C6AA9C00FFFFFF00CEB2A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBF700FFF7F700C6927B00FFEBDE00FFEBDE00D6A6
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6A68400FFDF
      BD00DEC3B500A5796B0000000000000000000000000000000000B59E8C00FFF3
      EF00FFF3EF00FFEFE70000925A0000925A00D6EFDE00F7E3D600D6EBD6000092
      5A00F7D7CE00DECBC600735D4A00000000000000000000000000000000000000
      0000A5968C00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFF7F700F7EFE700EFE3
      DE00CEB6A500634931000000000000000000B5A29400FFFFFF00BDA69C00FFFF
      FF00C6AEA500FFFFFF00CEB6A500FFFFFF00FFFFFF0063A2630063A2630063A2
      6300C6B6AD0063A2630063A2630063A26300CE9A7B00FFEFDE00FFEFDE00D6A6
      8400FFFFFF009C9A9C000030CE009C9EFF0039518C00FFFFFF00D6A68400FFE3
      C600DECBBD00AD796B0000000000000000000000000000000000B59E8C00FFF7
      F700FFF3EF0073DFB500FFEFE70000925A00FFE7DE0000925A00F7E3D60073D7
      AD00F7DBCE00DECBC600735D4A0000000000000000000000000000000000E79E
      7300C6694200AD593100FFFFFF00FFFFFF00FFFFFF00FFFBFF00F7F3EF00F7EB
      E700D6BEAD00634931000000000000000000BDA69400FFFFFF00C6AA9C00FFFF
      FF00CEB2A500FFFFFF00CEB2A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE9E8400FFF3E700FFF3E700D6A6
      8400FFFFFF00FFFFFF00CEEFFF00CEEFFF009C9EFF0039518C00D6A68400FFE3
      C600DECFC600AD7D6B0000000000000000000000000000000000BDA29400FFFB
      F700FFF7F70000925A00ADEBD600FFEFEF00D6F3E70000925A0000925A00F7E3
      DE00F7DFD600DECBC600735D4A0000000000000000000000000000000000E79E
      7300CE714200AD593100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700F7F3
      EF00DEC3AD00634931000000000000000000BDA69C00FFFFFF00C6AEA500FFFF
      FF00CEB6A500FFFFFF00CEB2A500CEB6A500CEB6A500CEB6A500CEB2A500C6B2
      A500C6B2A500C6AE9C00C6AE9C00BDAA9C00D6A28400FFF7EF00FFF7EF00D6A6
      8400FF303100FF303100CEEFFF007B7DFF004A5DFF002151FF0039518C00FFE7
      CE00DECFC600B582730000000000000000000000000000000000BDA69400FFFB
      FF00FFFBF700D6F7E70000925A0000925A0000925A0000925A00009663000092
      5A00F7E3DE00DECBC600735D4A0000000000000000000000000000000000EFA6
      7B00DE794A00CE714200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AE
      9C00C6AA9C00634931000000000000000000C6AA9C00FFFFFF00CEB2A500FFFF
      FF00CEB2A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBF700FFF7F700D6A68400FFFBF700FFFBF700D6A6
      8400D6A68400D6A68400D6A684009C9EFF007B7DFF004A5DFF002151FF003951
      8C00DED7CE00B586730000000000000000000000000000000000BDAA9C00FFFF
      FF00FFFBFF00FFFBF700D6F7E700ADEBD6008CE3C60000925A0000925A00FFEB
      E700F7E3DE00DECBC600735D4A0000000000000000000000000000000000FFAE
      7B00EF865200DE794A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD9A8C006349
      310063493100634931000000000000000000C6AEA500FFFFFF00CEB6A500FFFF
      FF00CEB2A500CEB6A500CEB6A500CEB6A500CEB2A500C6B2A500C6B2A500C6AE
      9C00C6AE9C00BDAA9C00BDAA9C00BDA69400DEAE8C00FFFBF700FFFBF700FFFB
      F700FFFBF700FFFBF700FFF7EF00FFF7EF009C9EFF007B7DFF004A5DFF002151
      FF0039518C00B586730000000000000000000000000000000000C6AE9C00FFFF
      FF00FFFFFF00FFFBFF00FFFBF700FFF7F700FFF7F70000925A00FFEFEF00FFEF
      E700DECBC600DECBC600735D4A000000000000000000DED7CE00E79E7300FFB6
      8C00FF9E6B00F78E5A009C492900CECFC600FFFFFF00FFFFFF00AD9E8C00D6C7
      BD0063493100D6CBC6000000000000000000CEB2A500FFFFFF00CEB2A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFF7F700F7F3EF00F7EBE700E7AE8C00FFFFFF00FFFFFF00D6A6
      8400D6A68400D6A68400D6A68400D6A68400D6A684009C9EFF007B7DFF004A5D
      FF002151FF0039518C0000000000000000000000000000000000C6B2A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFFBF700FFF7F700FFF3EF00FFF3
      EF00735D4A00735D4A00735D4A00000000000000000000000000DED7CE00FFC7
      A500FFB68C00E7865A00CECFC600FFFFFF00FFFFFF00FFFFFF00B5A294006349
      3100D6CFC600000000000000000000000000CEB6A500FFFFFF00CEB2A500CEB6
      A500CEB6A500CEB6A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA
      9C00BDAA9C00BDA69400BDA69400BDA29400E7B28C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFBF700FFFBF700FFF7EF00FFF3E700FFEFDE009C9EFF007B7D
      FF004A5DFF002151FF0039518C00000000000000000000000000CEB2A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFFBF700FFF7F700947D
      6B00F7DBCE00D6BAAD00735D4A0000000000000000000000000000000000DED7
      C600E7966B00CECFC600B5A69400B5A69400B5A69400B5A69400B5A29400D6CF
      C60000000000000000000000000000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7
      F700F7F3EF00F7EBE7006349310000000000E7B68C00E7B68C00E7B68C00E7B6
      8C00E7B28C00DEAE8C00DEAA8400D6A68400CE9E8400CE9A7B00C6927B009C9E
      FF007B7DFF000030CE000030CE00000000000000000000000000CEB6AD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFFBF700947D
      6B00D6BAAD00AD96840000000000000000000000000000000000000000000000
      0000DED7C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      9400BDA69400BDA29400B5A29400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004DFF00004DFF000030CE00000000000000000000000000CEB6AD00CEB6
      A500C6B2A500C6B2A500C6AE9C00BDAA9C00BDA69400BDA29400B59E8C00B59E
      8C00B59A8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDC7CE0021303900B5BEC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A2
      9400FFFFFF00B5A29400FFFFFF00BDA69400FFFFFF00FFFFFF00FFFFFF009C96
      8C00EFEBE700FFF7F700FFEFEF00FFE7DE000000000000000000000000000000
      00009C8E84006349310063493100634931006349310063493100634931006349
      31006349310063493100000000000000000000000000B5A29400634931006349
      3100634931006349310063493100634931006349310063493100634931005249
      4200314D63003975BD0029496300BDC7CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5A2940063493100B5A2
      9400FFFFFF00B5A29400FFFFFF00BDAA9C00FFFFFF00FFFFFF00FFFFFF00A59E
      9400EFEBE700FFFFFF00FFF7F700FFF3EF000000000000000000000000000000
      00009C8A7B00FFFBFF00DEC3AD00D6BEAD00CEB6A500CEB2A500C6AA9C00BDA6
      9400B5A2940063493100000000000000000000000000B5A29400FFFFFF00B5A2
      9400B5A29400B5A29400B5A29400B5A29400B5A29400B5A294008C868400314D
      6B00317DD600429AE70052B2EF004A657300F7F3EF00E7DFDE0094796B008C75
      630084715A00E7DFDE007B6552007B614A00735D4A00E7DFDE006B5542006B51
      3900634D3900E7DFDE00000000000000000000000000B5A29400FFFFFF00B5A2
      9400FFFFFF00BDA69400FFFFFF00C6AE9C00FFFFFF00FFFFFF00FFFFFF00C6C7
      BD00C6BEBD00FFFFFF00FFFFFF00FFF7F7000000000000000000000000000000
      00009C8A7B00FFFFFF00FFFBF700F7F3EF00F7EBE700EFDFD600E7D7CE00E7CF
      BD00BDA6940063493100000000000000000000000000B5A29400FFFFFF00FFFF
      FF00FFFBFF00F7F3EF00D6D7D600949694006B6963006365630052555A004271
      940042A2E70063C7FF00738EA500D6DBDE00E7DFDE00AD9A8C00EFE3DE00F7E7
      E700EFDFD60084695A00B59A8C00DEBEAD00DEB6A50073594200AD8A7300D6A6
      9400CE9E840063493900E7DFDE000000000000000000B5A29400FFFFFF00B5A2
      9400FFFFFF00BDAA9C00FFFFFF00CEB2A500FFFFFF00FFFFFF00FFFFFF00F7FB
      FF00BDBAB500C6C3BD00EFEBE700EFEBE7000000000000000000000000000000
      00009C8E8400FFFFFF00FFFFFF00FFF7F700F7EFEF00F7E7DE00EFDFD600E7D7
      C600C6AA9C0063493100000000000000000000000000B5A29400FFFFFF00FFFF
      FF00FFFFFF00DEDFDE00948E8C00B5AA9C00D6C3B500CEAE9C007B756B005259
      52005A92AD00739AB500BDC3C60000000000B5A29400FFFBF700FFF7F700F7F3
      EF00F7EBE700F7E7DE007B6552007B614A00735D4A00735942006B5542006B51
      3900634D390063493900634931000000000000000000B5A29400FFFFFF00BDA6
      9400FFFFFF00C6AE9C00FFFFFF00CEB6A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7FBFF00C6C7C600A59E9400948E84000000000000000000000000000000
      0000A5928400FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7DE00EFDB
      D600CEB2A50063493100000000000000000000000000B5A29400FFFFFF00FFFF
      FF00FFFFFF00B5B2AD00BDBAB500FFEFE700FFE7DE00F7DBC600F7CFB5007B75
      6B009C9E9C00BDC3C6000000000000000000B5A29400FFFFFF00FFFBF700FFF7
      F700F7EFEF00F7EBE700F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBAA500DEB6A500634931000000000000000000B5A29400FFFFFF00BDAA
      9C00FFFFFF00CEB2A500FFFFFF00D6BAAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5A29400634931000000000000000000000000000000
      0000A5968C00FFFFFF00FFFFFF00FFFFFF00FFFBFF00FFF7F700F7EFE700EFE3
      DE00CEB6A50063493100000000000000000000000000BDA69400FFFFFF00FFFF
      FF00FFFFFF009C968C00EFEBE700FFF7F700FFEFEF00FFE7DE00F7DBCE00CEAE
      9C006B6D6B00000000000000000000000000B5A29400FFFFFF00B57D6300B57D
      6300EFDFD600B57D6300F7EBE700F7E7DE00EFDFD600EFDBD600EFD3CE00E7CF
      C600E7C7BD00D6B2A500634931000000000000000000BDA69400FFFFFF00C6AE
      9C00FFFFFF00CEB6A500FFFFFF00D6BEAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BDA69400D6C7BD000000000000000000000000000000
      0000AD9A8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00F7F3EF00F7EB
      E700D6BEAD0063493100000000000000000000000000BDAA9C00FFFFFF00FFFF
      FF00FFFFFF00A59E9400EFEBE700FFFFFF00FFF7F700FFF3EF00FFE7DE00DEC3
      B50073716B00000000000000000000000000BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFF7F700F7F3EF00F7EBE700F7E7DE00EFDFDE00EFDBD600EFD3
      CE00E7CFC600DEBEAD00634931000000000000000000BDAA9C00FFFFFF00CEB2
      A500FFFFFF00D6BAAD00FFFFFF00DEC3B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6AA9C00634931000000000000000000000000000000
      0000B59E9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700F7F3
      EF00DEC3AD0063493100000000000000000000000000C6AE9C00FFFFFF00FFFF
      FF00FFFFFF00C6C7BD00C6BEBD00FFFFFF00FFFFFF00FFF7F700FFEFE700AD9E
      9400ADAAA500000000000000000000000000BDA69C00FFFFFF00948E8C00EFDF
      D600948E8400EFDFD600948E8400948E8400F7EBE700F7E7DE00EFDFDE00EFDB
      D600EFD3CE00E7C7BD00634931000000000000000000C6AE9C00FFFFFF00CEB6
      A500FFFFFF00D6BEAD00FFFFFF00DEC3B500DEC3B500DEC3B500DEC3B500DEC3
      B500D6BEAD00CEBAAD00CEB2A500E7D7CE000000000073C7E70084DBEF0084E7
      FF0039BEE7009CDBDE0094E3F70084D3EF00FFFFFF00FFFFFF00FFFFFF00C6AE
      9C00C6AA9C0063493100000000000000000000000000CEB2A500FFFFFF00FFFF
      FF00FFFFFF00F7FBFF00BDBAB500C6C3BD00EFEBE700EFEBE700B5AEA500736D
      6300F7F7F700000000000000000000000000C6AA9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBF700FFF7F700F7F3EF00F7EBE700F7E7DE00EFDF
      D600EFDBD600E7D3C600634931000000000000000000CEB2A500FFFFFF00D6BA
      AD00FFFFFF00DEC3B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6AA9C0063493100E7D7CE0000000000000000009CE3F70031B6DE007BEB
      FF005AC7E70094F3FF0029B6DE00A5EBFF00FFFFFF00FFFFFF00AD9A8C006349
      31006349310063493100000000000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7FBFF00C6C7C600A59E9400948E840094928C00634D
      390000000000000000000000000000000000C6AEA500FFFFFF00B5826300B582
      6300948E8C00C6B2A500948E8400948E8400FFF7F700F7EFEF00F7EBE700F7E7
      DE00EFDFDE00EFDBD600634931000000000000000000CEB6A500FFFFFF00D6BE
      AD00FFFFFF00DEC3B500DEC3B500DEC3B500DEC3B500DEC3B500D6BEAD00CEBA
      AD00CEB2A500E7D7CE0000000000000000000000000094EBFF0094F3FF00BDFB
      FF00ADEBF700C6FBFF0094F3FF009CF3FF00FFFFFF00FFFFFF00AD9E8C00D6C7
      BD0063493100D6CBC600000000000000000000000000D6BAAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A2940063493100634931006349
      310000000000000000000000000000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7F700F7F3EF00F7EB
      E700F7E7DE00EFE3DE00634931000000000000000000D6BAAD00FFFFFF00DEC3
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AA9C006349
      3100E7D7CE000000000000000000000000000000000021AADE0052BEE700ADEB
      F700F7FFFF00B5EBF70052BEE70031BAE700FFFFFF00FFFFFF00B5A294006349
      3100D6CFC60000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA69400D6C7BD0063493100E7D7
      CE0000000000000000000000000000000000CEB6A500FFFFFF00FFFFFF0063A2
      630063A2630063A26300C6B6AD0063A2630063A2630063A26300FFF7F700F7F3
      EF00F7EBE700EFE3DE00634931000000000000000000D6BEAD00FFFFFF00DEC3
      B500DEC3B500DEC3B500DEC3B500DEC3B500D6BEAD00CEBAAD00CEB2A500E7D7
      CE00000000000000000000000000000000000000000094EBFF0094F3FF00C6FB
      FF00ADE7F700C6FBFF0094F3FF008CD7E700B5A69400B5A69400B5A29400D6CF
      C6000000000000000000000000000000000000000000DEC3B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AA9C0063493100E7D7CE000000
      000000000000000000000000000000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFF7
      F700F7F3EF00F7EBE700634931000000000000000000DEC3B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AA9C0063493100E7D7CE000000
      0000000000000000000000000000000000000000000094E3F70031BAE7008CF3
      FF005AC3E70094F3FF0029B6DE008CDFF7000000000000000000000000000000
      00000000000000000000000000000000000000000000DEC3B500DEC3B500DEC3
      B500DEC3B500DEC3B500D6BEAD00CEBAAD00CEB2A500E7D7CE00000000000000
      000000000000000000000000000000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      9400BDA69400BDA29400B5A294000000000000000000DEC3B500DEC3B500DEC3
      B500DEC3B500DEC3B500D6BEAD00CEBAAD00CEB2A500E7D7CE00000000000000
      0000000000000000000000000000000000000000000063C3E70084DBEF0094EB
      FF0021AEDE008CEBFF008CDFF70084CFE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000040800000000000007FC00000000000000000000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFC003
      000300030003C003000100010001C003000100010001C003000100010001C003
      000100010001C003000100010001C003000100010001C003000100010001C003
      000100010001C003000100010001C003000100010001C003000100010000C003
      000100010000FFFFFFFFFFFFFFF8FFFFFFFFFC00FFFF8000FFFF0000FFFF0000
      000300008FE300000001000007C30000000100000387000000010000810F0000
      00010000C01F000000010000E03F000000010000F03F000000010000F01F0000
      00010000E00F000100010000C30700000001000087830000000100000FC70000
      000100001FFF0000FFFB00003FFF0000F0000000FFFFFFFFC0000000C001F003
      C0000000C001F00300000000C001F00300000000C001F00300000000C001F003
      00000000C001F00300000000C001E00300000000C001E00300000000C001E003
      00000000C001E00300000000C001800300000000C001C00700000000C001E00F
      00010000C003F7FF00010000C007FFFFFFFFFFF1FFFFE000F0038000FFFF8000
      F003800000038000F003800000018000F003800100018000F003800300018000
      F003800700018000F003800700018000F0038007000180008003800700018001
      8003800F000180038003800F000180078007800F0001800F800F801F0001801F
      80FF803F0001803F80FFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ilDisabled: TImageList
    Left = 201
    Top = 152
    Bitmap = {
      494C010105000800E40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEDFDE008C8A8C0094969400FFFBFF00F7F7F700F7F3F700EFEFEF00E7E7
      E700E7E3E700DEDBDE00CECFCE00C6C3C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00DEDF
      DE0094969400F7F7F70094969400000000006365630063656300D6D7D6006361
      6300E7E7E700E7E3E700DEDBDE00D6D3D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDFDE008C8A
      8C0094969400FFFBFF00949694000000000000000000FFFFFF00F7F7F700F7F3
      F700EFEFEF00E7E7E700E7E3E700DEDBDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00DEDFDE0094969400F7F7
      F70094969400000000009C9A9C00000000008C8A8C00DEDBDE008C8A8C00D6D7
      D6008486840084868400E7E7E700E7E3E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDFDE008C8A8C0094969400FFFB
      FF0094969400000000009C9E9C0000000000000000000000000000000000FFFF
      FF00F7F7F700F7F3F700EFEFEF00E7E7E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094969400F7F7F700949694000000
      00009C9A9C0000000000A5A2A5000000000063656300636563008C8A8C00A5A6
      A5008C8A8C008C8A8C00F7F3F700EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094969400FFFFFF00949694000000
      00009C9E9C0000000000A5A6A500000000000000000000000000000000000000
      000000000000FFFFFF00F7F7F700F7F3F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094969400000000009C9A9C000000
      0000A5A2A50000000000A5A6A500000000000000000063656300636563006365
      6300ADAEAD006365630063656300636563000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094969400000000009C9E9C000000
      0000A5A6A50000000000A5A6A500000000000000000000000000000000000000
      0000000000000000000000000000FFFBFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9A9C0000000000A5A2A5000000
      0000A5A6A50000000000A5A6A500A5A6A500A5A6A500A5A6A500A5A6A500A5A6
      A500A5A2A500A5A2A5009C9E9C009C9E9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9E9C0000000000A5A6A5000000
      0000A5A6A5000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00F7F7F700F7F3F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A2A50000000000A5A6A5000000
      0000A5A6A500A5A6A500A5A6A500A5A6A500A5A6A500A5A6A500A5A2A500A5A2
      A5009C9E9C009C9E9C009C9A9C009C9A9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A6A50000000000A5A6A5000000
      000000000000000000000000000000000000000000000000000000000000FFFB
      FF00F7F7F700F7F3F700EFEFEF00E7E7E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A6A50000000000A5A6A500A5A6
      A500ADAAAD00A5A6A500A5A6A500A5A6A500A5A2A500A5A2A5009C9E9C009C9E
      9C009C9A9C009C9A9C0094969400949694000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A6A50000000000000000000000
      00000000000000000000000000000000000000000000FFFBFF00F7F7F700F7F3
      F700EFEFEF00E7E7E70031303100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A6A500A5A6A500A5A6A500A5A6
      A500A5A6A500A5A6A500A5A2A500A5A2A5009C9E9C009C9E9C009C9A9C009C9A
      9C00949694009496940094969400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECFCE00393C3900C6C3C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009492
      9400000000009492940000000000949694000000000000000000000000008C8E
      8C00E7E7E700F7F3F700EFEBEF00DEDBDE000000000000000000000000000000
      0000848284003134310031343100313431003134310031343100313431003134
      3100313431003134310000000000000000000000000094929400313431003134
      3100313431003134310031343100313431003134310031343100313431004245
      420063656300BDBEBD0063656300CECBCE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094929400313431009492
      94000000000094929400000000009C9A9C000000000000000000000000009496
      9400E7E7E700FFFBFF00F7F3F700EFEBEF000000000000000000000000000000
      00007B7D7B00FFFBFF00ADAEAD00ADAAAD00A5A6A500A5A2A5009C9A9C009496
      9400949294003134310000000000000000000000000094929400000000009492
      9400949294009492940094929400949294009492940094929400848684006B69
      6B00D6D3D600E7E7E700EFEFEF0073757300EFEFEF00DEDBDE006B696B006361
      63005A5D5A00DEDBDE00525552004A4D4A004A494A00DEDBDE0042414200393C
      390039383900DEDBDE0000000000000000000000000094929400000000009492
      94000000000094969400000000009C9E9C00000000000000000000000000BDBE
      BD00BDBABD0000000000FFFBFF00F7F3F7000000000000000000000000000000
      00007B7D7B00FFFFFF00F7F7F700EFEFEF00E7E3E700D6D7D600CECBCE00BDBE
      BD00949694003134310000000000000000000000000094929400000000000000
      0000FFFBFF00EFEFEF00D6D7D6009492940063656300636163005A595A009492
      9400E7E7E700FFFFFF00A5A2A500DEDFDE00DEDBDE008C8A8C00DEDFDE00E7E3
      E700D6D7D6005A595A008C8A8C00ADAEAD00A5A6A50042454200737573009492
      94008486840039383900DEDBDE00000000000000000094929400000000009492
      9400000000009C9A9C0000000000A5A2A500000000000000000000000000FFFB
      FF00B5B2B500BDBEBD00E7E7E700E7E3E7000000000000000000000000000000
      00008482840000000000FFFFFF00F7F7F700EFEBEF00DEDFDE00D6D3D600C6C7
      C6009C9A9C003134310000000000000000000000000094929400000000000000
      0000FFFFFF00DEDFDE008C8A8C009C9E9C00B5B2B5009C9A9C006B6D6B005255
      5200ADAAAD00B5B2B500C6C7C6000000000094929400F7F7F700F7F3F700EFEF
      EF00E7E7E700DEDFDE00525552004A4D4A004A494A004245420042414200393C
      3900393839003938390031343100000000000000000094929400000000009496
      9400000000009C9E9C0000000000A5A6A5000000000000000000000000000000
      0000FFFBFF00C6C3C60094969400848684000000000000000000000000000000
      0000848684000000000000000000FFFBFF00F7F3F700EFEBEF00DEDFDE00D6D3
      D600A5A2A5003134310000000000000000000000000094929400000000000000
      000000000000ADAEAD00B5B2B500E7E7E700DEDBDE00C6C7C600B5B6B5006B6D
      6B009C9E9C00C6C7C600000000000000000094929400FFFBFF00F7F7F700F7F3
      F700EFEFEF00E7E7E700DEDFDE00D6D7D600CECFCE00C6C3C600B5B6B500ADAE
      AD00A5A6A500A5A2A50031343100000000000000000094929400000000009C9A
      9C0000000000A5A2A50000000000ADAAAD000000000000000000000000000000
      0000000000000000000094929400313431000000000000000000000000000000
      00008C8A8C00000000000000000000000000FFFBFF00F7F3F700E7E7E700DEDB
      DE00A5A6A5003134310000000000000000000000000094969400000000000000
      0000000000008C8E8C00E7E7E700F7F3F700EFEBEF00DEDBDE00CECBCE009C9A
      9C006B696B000000000000000000000000009492940000000000636563006365
      6300D6D7D60063616300E7E7E700DEDFDE00D6D7D600D6D3D600CECBCE00C6C3
      C600BDBABD00A5A2A50031343100000000000000000094969400000000009C9E
      9C0000000000A5A6A50000000000ADAEAD000000000000000000000000000000
      0000000000000000000094969400BDBABD000000000000000000000000000000
      00008C8E8C0000000000000000000000000000000000FFFBFF00EFEFEF00E7E7
      E700ADAAAD00313431000000000000000000000000009C9A9C00000000000000
      00000000000094969400E7E7E700FFFBFF00F7F3F700EFEBEF00DEDBDE00B5B2
      B5006B6D6B00000000000000000000000000949694000000000000000000FFFF
      FF00F7F7F700F7F3F700EFEFEF00E7E7E700DEDFDE00DEDBDE00D6D3D600CECB
      CE00C6C3C600ADAEAD003134310000000000000000009C9A9C0000000000A5A2
      A50000000000ADAAAD0000000000B5B2B5000000000000000000000000000000
      000000000000000000009C9E9C00313431000000000000000000000000000000
      00009492940000000000000000000000000000000000FFFFFF00F7F7F700EFEF
      EF00ADAEAD00313431000000000000000000000000009C9E9C00000000000000
      000000000000BDBEBD00BDBABD0000000000FFFBFF00F7F3F700E7E7E7009492
      9400A5A6A5000000000000000000000000009C9A9C00000000008C8A8C00D6D7
      D60084868400D6D7D6008486840084868400E7E7E700DEDFDE00DEDBDE00D6D3
      D600CECBCE00BDBABD003134310000000000000000009C9E9C0000000000A5A6
      A50000000000ADAEAD0000000000B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500ADAEAD00ADAAAD00A5A6A500CECFCE0000000000E7E3E700EFEFEF00FFFB
      FF00E7E7E700DEDFDE00F7F7F700EFEBEF000000000000000000FFFFFF009C9E
      9C009C9E9C0031343100000000000000000000000000A5A2A500000000000000
      000000000000FFFBFF00B5B2B500BDBEBD00E7E7E700E7E3E700A5A6A5006361
      6300F7F7F7000000000000000000000000009C9E9C0000000000000000000000
      000000000000FFFFFF00F7F7F700F7F3F700EFEFEF00E7E7E700DEDFDE00D6D7
      D600D6D3D600C6C7C600313431000000000000000000A5A2A50000000000ADAA
      AD0000000000B5B2B50000000000000000000000000000000000000000000000
      00009C9E9C0031343100CECFCE000000000000000000F7F3F700DEDFDE00FFFF
      FF00E7E7E70000000000DEDFDE00FFFBFF0000000000000000008C8A8C003134
      31003134310031343100000000000000000000000000A5A6A500000000000000
      00000000000000000000FFFBFF00C6C3C60094969400848684008C8A8C00393C
      390000000000000000000000000000000000A5A2A50000000000636563006365
      63008C8A8C00A5A2A5008486840084868400F7F3F700EFEFEF00E7E7E700DEDF
      DE00DEDBDE00D6D3D600313431000000000000000000A5A6A50000000000ADAE
      AD0000000000B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500ADAEAD00ADAA
      AD00A5A6A500CECFCE00000000000000000000000000FFFBFF00000000000000
      0000F7F7F70000000000000000000000000000000000000000008C8E8C00BDBA
      BD0031343100C6C7C600000000000000000000000000ADAAAD00000000000000
      0000000000000000000000000000000000009492940031343100313431003134
      310000000000000000000000000000000000A5A2A50000000000000000000000
      0000000000000000000000000000FFFFFF00F7F7F700F7F3F700EFEFEF00E7E7
      E700DEDFDE00DEDBDE00313431000000000000000000ADAAAD0000000000B5B2
      B5000000000000000000000000000000000000000000000000009C9E9C003134
      3100CECFCE0000000000000000000000000000000000DEDBDE00E7E3E700F7F7
      F700FFFFFF00F7F7F700E7E3E700E7E7E7000000000000000000949294003134
      3100C6C7C60000000000000000000000000000000000ADAEAD00000000000000
      00000000000000000000000000000000000094969400BDBABD0031343100CECF
      CE0000000000000000000000000000000000A5A6A50000000000000000006365
      63006365630063656300ADAEAD00636563006365630063656300F7F3F700EFEF
      EF00E7E7E700DEDBDE00313431000000000000000000ADAEAD0000000000B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500ADAEAD00ADAAAD00A5A6A500CECF
      CE000000000000000000000000000000000000000000FFFBFF00000000000000
      0000F7F3F7000000000000000000E7E3E700949694009496940094969400C6C7
      C6000000000000000000000000000000000000000000B5B2B500000000000000
      0000000000000000000000000000000000009C9E9C0031343100CECFCE000000
      000000000000000000000000000000000000A5A2A50000000000000000000000
      00000000000000000000000000000000000000000000FFFBFF00F7F7F700F7F3
      F700EFEFEF00E7E7E700313431000000000000000000B5B2B500000000000000
      0000000000000000000000000000000000009C9E9C0031343100CECFCE000000
      00000000000000000000000000000000000000000000F7F3F700E7E3E7000000
      0000E7E3E70000000000DEDFDE00F7F3F7000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500ADAEAD00ADAAAD00A5A6A500CECFCE00000000000000
      000000000000000000000000000000000000A5A2A500A5A6A500A5A6A500A5A6
      A500A5A6A500A5A2A500A5A2A5009C9E9C009C9E9C009C9A9C009C9A9C009496
      94009496940094969400949294000000000000000000B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500ADAEAD00ADAAAD00A5A6A500CECFCE00000000000000
      00000000000000000000000000000000000000000000E7E3E700EFEFEF00FFFB
      FF00DEDBDE00FFFBFF00F7F3F700E7E3E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00F000000000000000C100000000000000
      C180000000000000050000000000000005E00000000000001500000000000000
      15F8000000000000558000000000000055FE0000000000005400000000000000
      57F800000000000050000000000000005FE00000000000004000000000000000
      7F810000000000000001000000000000FFFFFFF1FFFFEAE0F0038000FFFF8AE0
      F003A0000003AAE4F003B0000001AAE0F403B0010001AAF0F603B8030001AAFC
      F703B8074001AAFCF783B8076001AAFCF783B9074001AA0080C3B8077801ABF1
      84C3BC0F4001A803B7C3BF0F7E01AFC780C7BF0F6001A00FB60FBF1F7F81BF1F
      94FF803F0001803F80FFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ilMain
    Left = 145
    Top = 153
    object actCreateAllVeds: TAction
      Category = 'vedomost'
      Enabled = False
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      ImageIndex = 0
      OnExecute = actCreateAllVedsExecute
      OnUpdate = actCreateAllVedsUpdate
    end
    object actPrntBlnk: TAction
      Category = 'vedomost'
      Enabled = False
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1073#1083#1072#1085#1082' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      ImageIndex = 2
      OnExecute = sbPrntBlnkClick
      OnUpdate = actPrntNotesUpdate
    end
    object actPrntNotes: TAction
      Category = 'vedomost'
      Enabled = False
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1089' '#1086#1094#1077#1085#1082#1072#1084#1080
      ImageIndex = 8
      OnExecute = sbPrntNotesClick
      OnUpdate = actPrntNotesUpdate
    end
    object actPrntAllBlnk: TAction
      Category = 'vedomost'
      Enabled = False
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1073#1083#1072#1085#1082#1080' '#1076#1083#1103' '#1074#1089#1077#1093' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081
      ImageIndex = 3
      OnExecute = sbPrntAllBlnkClick
      OnUpdate = actPrntAllBlnkUpdate
    end
    object actPrntAllNotes: TAction
      Category = 'vedomost'
      Enabled = False
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1074#1089#1077' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1089' '#1086#1094#1077#1085#1082#1072#1084#1080
      ImageIndex = 4
      OnExecute = sbPrntAllNotesClick
      OnUpdate = actPrntAllBlnkUpdate
    end
    object actPrntGroup: TAction
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1074' Excel'
      OnExecute = actPrntGroupExecute
    end
    object actRaports: TAction
      Category = 'vedomost'
      Enabled = False
      Hint = #1056#1072#1087#1086#1088#1090#1099' '#1086' '#1085#1077#1076#1086#1087#1091#1089#1082#1077
      ImageIndex = 5
      OnExecute = actRaportsExecute
      OnUpdate = actRaportsUpdate
    end
    object actPrintBRSRankAverage: TAction
      Category = 'Att'
      Caption = #1057#1088#1077#1076#1085#1080#1077' '#1073#1072#1083#1083#1099' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      ImageIndex = 4
      OnExecute = actPrintBRSRankAverageExecute
      OnUpdate = actPrintBRSRankAverageUpdate
    end
    object actEdtGroup: TAction
      Category = 'Group'
      Caption = #1055#1088#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      Hint = #1055#1088#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      OnExecute = actEdtGroupExecute
    end
    object actDelGroup: TAction
      Category = 'Group'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      OnExecute = actDelGroupExecute
    end
    object actMkVin: TAction
      Category = 'vedomost'
      Hint = #1057#1076#1077#1083#1072#1090#1100' '#1074#1099#1085#1086#1089#1085#1086#1081' '#1101#1082#1079#1072#1084#1077#1085
      OnExecute = actMkVinExecute
      OnUpdate = actMkVinUpdate
    end
    object actRefreshDopusk: TAction
      Category = 'vedomost'
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1076#1086#1087#1091#1089#1082#1072#1093
      ImageIndex = 6
      OnExecute = actRefreshDopuskExecute
      OnUpdate = actRefreshDopuskUpdate
    end
    object actCreateAtt: TAction
      Category = 'Att'
      Caption = 'actCreateAtt'
      Enabled = False
      Hint = #1057#1086#1079#1076#1072#1090#1100'  '#1072#1090#1090#1077#1089#1090#1072#1094#1080#1086#1085#1085#1091#1102' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      ImageIndex = 0
      OnExecute = actCreateAttExecute
    end
    object actPrintBlankAtt: TAction
      Category = 'Att'
      Caption = 'actPrintBlankAtt'
      Enabled = False
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1073#1083#1072#1085#1082
      ImageIndex = 1
      OnExecute = actPrintBlankAttExecute
    end
    object actPrintAtt: TAction
      Category = 'Att'
      Caption = 'actPrintAtt'
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1072#1090#1090#1077#1089#1090#1072#1094#1080#1080
      ImageIndex = 2
      OnExecute = actPrintAttExecute
      OnUpdate = actPrintAttUpdate
    end
    object actCloseNapr: TAction
      Category = 'Napr'
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 8
      OnExecute = actCloseNaprExecute
      OnUpdate = actDelNaprUpdate
    end
    object actPrintNapr: TAction
      Category = 'Napr'
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100'  '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100'  '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 2
      OnExecute = actPrintNaprExecute
      OnUpdate = actDelNaprUpdate
    end
    object actUspevToExcel: TAction
      Category = 'Uspev'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1091#1089#1087#1077#1074#1072#1077#1084#1086#1089#1090#1080' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1091#1089#1087#1077#1074#1072#1077#1084#1086#1089#1090#1080' '#1074' Excel'
      ImageIndex = 9
      OnExecute = actUspevToExcelExecute
      OnUpdate = actUspevToExcelUpdate
    end
    object actSaveVed: TAction
      Category = 'vedomost'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      OnExecute = actSaveVedExecute
      OnUpdate = actSaveVedUpdate
    end
    object actDelVed: TAction
      Category = 'vedomost'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      ImageIndex = 10
      OnExecute = actDelVedExecute
      OnUpdate = actDelVedUpdate
    end
    object actDelNapr: TAction
      Category = 'Napr'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 10
      OnExecute = actDelNaprExecute
      OnUpdate = actDelNaprUpdate
    end
    object actDelAtt: TAction
      Category = 'Att'
      Caption = 'actDelAtt'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1080#1079' '#1072#1090#1090#1077#1089#1090#1072#1094#1080#1080
      ImageIndex = 10
      OnExecute = actDelAttExecute
    end
    object actNaprRegister: TAction
      Category = 'Napr'
      Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      OnExecute = actNaprRegisterExecute
    end
    object actPrintEmptyNapr: TAction
      Category = 'Napr'
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1087#1091#1089#1090#1086#1084' '#1073#1083#1072#1085#1082#1077
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1087#1091#1089#1090#1086#1084' '#1073#1083#1072#1085#1082#1077
      ImageIndex = 13
      OnExecute = actPrintEmptyNaprExecute
      OnUpdate = actDelNaprUpdate
    end
    object actCreateDiploms: TAction
      Category = 'Diplom'
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1076#1080#1087#1083#1086#1084#1099
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1076#1080#1087#1083#1086#1084#1099' '#1076#1083#1103' '#1075#1088#1091#1087#1087#1099
      ImageIndex = 0
      OnExecute = actCreateDiplomsExecute
      OnUpdate = actCreateDiplomsUpdate
    end
    object actPrintDipl: TAction
      Category = 'Diplom'
      Caption = #1055#1077#1095#1072#1090#1100' '#1074#1099#1087#1080#1089#1086#1082' '#1082' '#1076#1080#1087#1083#1086#1084#1091
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1087#1080#1089#1082#1080' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1089#1090#1091#1076#1077#1085#1090#1086#1074' '#1074' MS Excel'
      ImageIndex = 9
      OnExecute = actPrintDiplExecute
      OnUpdate = actPrintDiplUpdate
    end
    object actSaveDipl: TAction
      Category = 'Diplom'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100'  '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1076#1080#1087#1083#1086#1084#1072#1093
      OnExecute = actSaveDiplExecute
      OnUpdate = actSaveDiplUpdate
    end
    object actCancelDipl: TAction
      Category = 'Diplom'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1076#1080#1087#1083#1086#1084#1072#1093
      OnExecute = actCancelDiplExecute
      OnUpdate = actSaveDiplUpdate
    end
    object actUpdateDiploms: TAction
      Category = 'Diplom'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 6
      OnExecute = actUpdateDiplomsExecute
      OnUpdate = actUpdateDiplomsUpdate
    end
    object actUspevforStipend: TAction
      Category = 'Uspev'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1091#1089#1087#1077#1074#1072#1077#1084#1086#1089#1090#1080' '#1076#1083#1103' '#1089#1090#1080#1087#1077#1085#1076#1080#1080' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1091#1089#1087#1077#1074#1072#1077#1084#1086#1089#1090#1080' '#1076#1083#1103' '#1089#1090#1080#1087#1077#1085#1076#1080#1080' '#1074' Excel'
      ImageIndex = 9
      OnExecute = actUspevforStipendExecute
    end
    object actEditNapr: TAction
      Category = 'Napr'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 14
      OnExecute = actEditNaprExecute
      OnUpdate = actDelNaprUpdate
    end
    object actPrintBRSLastAtt: TAction
      Category = 'Att'
      Caption = 'actPrintBRSLastAtt'
      ImageIndex = 14
      OnExecute = actPrintBRSLastAttExecute
    end
    object actCreateAttest: TAction
      Category = 'Att'
      Caption = 'actCreateAttest'
      Enabled = False
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1072#1090#1090#1077#1089#1090#1072#1094#1080#1102
      ImageIndex = 0
      OnExecute = actCreateAttestExecute
    end
    object actSaveBRS: TAction
      Category = 'Att'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      OnExecute = actSaveBRSExecute
      OnUpdate = actSaveBRSUpdate
    end
    object actPrintBRSRanks: TAction
      Category = 'Att'
      Caption = #1041#1072#1083#1083#1099' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
      ImageIndex = 15
      OnExecute = actPrintBRSRanksExecute
      OnUpdate = actPrintBRSRanksUpdate
    end
    object actRefreshVedStuds: TAction
      Category = 'vedomost'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1086#1074' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1090#1091#1076#1077#1085#1090#1086#1074' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      ImageIndex = 16
      OnExecute = actRefreshVedStudsExecute
      OnUpdate = actRefreshVedStudsUpdate
    end
  end
  object pmVedomost: TPopupMenu
    Images = ilMain
    OnPopup = pmVedomostPopup
    Left = 176
    Top = 184
    object N1: TMenuItem
      Action = actNaprRegister
    end
  end
  object ppmGroupNapr: TPopupMenu
    Images = ilMain
    Left = 208
    Top = 184
    object N2: TMenuItem
      Action = actPrintEmptyNapr
    end
    object N3: TMenuItem
      Action = actPrintNapr
    end
    object N4: TMenuItem
      Action = actCloseNapr
    end
    object N5: TMenuItem
      Action = actDelNapr
    end
  end
  object pmUspevOtchet: TPopupMenu
    Images = ilMain
    Left = 240
    Top = 184
    object Excel1: TMenuItem
      Action = actUspevToExcel
    end
    object Excel2: TMenuItem
      Action = actUspevforStipend
    end
  end
  object ppmBRSRankReports: TPopupMenu
    Images = ilMain
    OnPopup = pmVedomostPopup
    Left = 184
    Top = 240
    object N6: TMenuItem
      Action = actPrintBRSRanks
    end
    object N7: TMenuItem
      Caption = #1057#1088#1077#1076#1085#1080#1077' '#1073#1072#1083#1083#1099' '#1089#1090#1091#1076#1077#1085#1090#1086#1074' '#1075#1088#1091#1087#1087#1099
    end
  end
end
