inherited fmNagruzkaSemester: TfmNagruzkaSemester
  inherited Panel1: TPanel
    Height = 511
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 741
      Height = 507
      ActivePage = TabSheet1
      Align = alClient
      Images = ImageList1
      Style = tsFlatButtons
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1057#1087#1080#1089#1086#1082' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1086#1074
        ExplicitTop = 27
        ExplicitHeight = 476
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 733
          Height = 475
          Align = alClient
          AutoFitColWidths = True
          DataSource = dsFaculties
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          RowHeight = 16
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGridEh1DblClick
          OnKeyDown = DBGridEh1KeyDown
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ik_fac'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'cName_fac'
              Footers = <>
            end>
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 674
    Align = alNone
    Visible = False
    ExplicitTop = 674
  end
  object dsFaculties: TDataSource
    Left = 96
    Top = 168
  end
  object ImageList1: TImageList
    Left = 296
    Top = 81
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000B0B1AF00BDBDBC00BDBDBC00BDBD
      BC00BDBDBC00BCBCBB00BCBCBB00BCBCBB00BBBBBB00BBBBBA00BBBBBA00BABA
      B900BABAB900B9B9B800BAB9B800ABABAA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBC00FFFFFF00FFF8F000FFF8
      EF00FFF7EE00FFF7EE00FFF7ED00FFF7EC00FFF7EC00FFF6EB00FFF6EB00FFF5
      E800FFF5E700FFF4E700FFF4E600BBBBBA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBCBA00FFFFFF008487E0007478
      DC006669D7005A5CD3004F52CF00F2EBE500F1EAE200F0E9E100F0E8DF00EEE6
      DD00E4DCD200BA4B3600FFF4E700BABAB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBCBB00FFFFFF00F9F5F200F7F4
      F000F7F2EE00F6F1EC00F5EFEA00F4EFE800F3EDE600F2EBE400F1EAE200D3CA
      C300C7543F00CD655200FCEBDE00BCB7B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBCBB00FFFFFF00F1A07800EA9B
      7400F0A07800E99B7300E1956F00D98F6B00D18A6700F3EEE800F3ECE500D378
      6700CD655200CD655200CD655200CB604C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBDBB00FFFFFF00FCFAF800FBF8
      F600FAF7F400F9F6F200F8F4F000F8F3EF00F7F1ED00F5F0EB00F5EEE900F4EE
      E700D57E6E00CD655200FFF5E900BBBBB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFC0BF00FFFFFF00657D9300657D
      9300657C9200647C9200647C9200647C9100637B9100637B9000F6F2EC00F5F0
      EA00F1E4DD00D6817100FFF7EC00BFBFBE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0BF00FFFFFF00FEFDFD00FDFD
      FC00FDFCFA00FCFBF800FBFAF700FAF8F600FAF7F300F9F5F100F8F4EF00F7F2
      EE00F6F1EC00F5EFEA00FFF7EE00BFC0BF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0BF00FFFFFF00C9868200C785
      8000C37F7900C9868200C7847F00C27E7800C17C7600C07A7400BE787200BD76
      6F00F7F4EF00F7F2ED00FFF9F100C0C0BF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0BF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFE00FEFEFD00FDFDFB00FDFCFA00FCFBF900FBF9F800FBF8F600FAF7
      F400F9F6F200F8F4F000FFFAF400C0C0BF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0BF00FFFFFF005AAC71005AAD
      720059AD71005AAC72005AAD71005AAD710059AC700059AB700059AC700059AB
      6F0059AB6E00F9F7F400FFFDFB00C1C1BF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C2C2C100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
      FD00FFFEFD00FFFEFC00FFFEFC00C3C2C2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B400C2C2C100C2C2C100C2C2
      C100C2C2C100C2C2C100C2C2C100C2C2C100C2C2C100C2C2C100C2C1C100C1C0
      BF00C0C1BF00C0C0BF00C0C0BF00B1B1B0000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000}
  end
end
