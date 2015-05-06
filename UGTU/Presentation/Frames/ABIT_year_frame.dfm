inherited fmAbitYears: TfmAbitYears
  Width = 817
  Height = 546
  HelpKeyword = 'A_Year_frame.htm'
  ParentFont = False
  ExplicitWidth = 817
  ExplicitHeight = 546
  inherited Panel1: TPanel
    Width = 817
    Height = 509
    ExplicitWidth = 817
    ExplicitHeight = 509
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 813
      Height = 505
      ActivePage = statPage
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object statPage: TTabSheet
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
        object Chart2: TChart
          Left = 0
          Top = 339
          Width = 805
          Height = 138
          Hint = #1053#1072' '#1087#1072#1085#1077#1083#1100
          BackWall.Brush.Style = bsClear
          Legend.Alignment = laBottom
          Legend.Visible = False
          Title.Text.Strings = (
            #1055#1088#1080#1088#1086#1089#1090' '#1095#1080#1089#1083#1077#1085#1085#1086#1089#1090#1080' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074' '#1085#1072' '#1087#1077#1088#1080#1086#1076' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103)
          Title.Visible = False
          BottomAxis.DateTimeFormat = 'dd/mm/yyyy'
          BottomAxis.Increment = 1.000000000000000000
          BottomAxis.Labels = False
          BottomAxis.LabelsAngle = 90
          BottomAxis.LabelsFormat.Visible = False
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.MinorTickCount = 2
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelStyle = talValue
          LeftAxis.Title.Caption = #1087#1088#1080#1088#1086#1089#1090' '#1095#1080#1089#1083#1077#1085#1085#1086#1089#1090#1080' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074
          RightAxis.LabelsFormat.TextAlignment = taCenter
          TopAxis.LabelsFormat.TextAlignment = taCenter
          View3D = False
          Zoom.Pen.Mode = pmNotXor
          Align = alClient
          BevelOuter = bvNone
          ParentShowHint = False
          Enabled = False
          ShowHint = True
          TabOrder = 0
          DefaultCanvas = 'TGDIPlusCanvas'
          PrintMargins = (
            15
            36
            15
            36)
          ColorPaletteIndex = 13
          object LineSeries1: TLineSeries
            Marks.Visible = False
            SeriesColor = clBlue
            Title = #1055#1086#1076#1072#1085#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1081
            Brush.BackColor = clDefault
            LinePen.Width = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object LineSeries2: TLineSeries
            Marks.Visible = False
            Title = #1047#1072#1073#1088#1072#1083#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
            Brush.BackColor = clDefault
            LinePen.Width = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object LineSeries3: TLineSeries
            Marks.Visible = False
            Title = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1093' '#1079#1072#1103#1074#1083#1077#1085#1080#1081
            Brush.BackColor = clDefault
            LinePen.Width = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 805
          Height = 25
          Caption = 'ToolBar1'
          Images = frmMain.ImageList1
          TabOrder = 1
          object ToolButton3: TToolButton
            Left = 0
            Top = 0
            Action = frmMain.actPrintEgeOtch
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton4: TToolButton
            Left = 23
            Top = 0
            Action = frmMain.actPrintAllZhurnal
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton2: TToolButton
            Left = 46
            Top = 0
            Action = frmMain.actPrintAbitDopSpec
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton2: TSpeedButton
            Left = 69
            Top = 0
            Width = 23
            Height = 22
            Hint = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1085#1072#1073#1086#1088#1091
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000344D685427313CFF253A48540000000000000000B7A2
              93FF634935FF634935FF634935FF634935FF634935FF634935FF634935FF6349
              35FF634935FF544A46FF334C67FF3877BDFF2D4866FF374C595100000000B7A2
              93FFFFFFFFFFB7A293FFB7A293FFB7A293FFB7A293FFB7A293FFB7A293FFB7A2
              93FF8C8685FF344D68FF357FD0FF4198E4FF57B3EDFF4F6776FF00000000B7A2
              93FFFFFFFFFFFFFFFFFFFCFAF9FFF7F1EEFFD7D7D4FF979792FF6C6A67FF6664
              62FF51575BFF437393FF47A0E7FF61C6FDFF728EA1FE7585914E00000000B7A2
              93FFFFFFFFFFFFFFFFFFFEFEFEFFDFDFDEFF938F8BFFB4A89DFFD7C3B0FFC8AE
              98FF7F766DFF555957FF5D90A8FF6F98B2FE758591840000000000000000B7A2
              93FFFFFFFFFFFFFFFFFFFFFFFFFFB3B2AEFFBFB9B2FFFBEFE7FFFAE6D9FFF7DA
              C7FFF4CDB5FF7F776DFF5A5A589775859184000000000000000000000000BAA5
              96FFFFFFFFFFFFFFFFFFFFFFFFFF9A978FFFEDE9E4FFFDF7F3FFFCEFE8FFF9E5
              D9FFF7D9C8FFC8AD99FF565653DD00000000000000000000000000000000BEA9
              9AFFFFFFFFFFFFFFFFFFFFFFFFFFA19E96FFEBE9E5FFFFFCFBFFFDF7F3FFFBF0
              E8FFFAE5D9FFD8C3B3FF5C5C58DD00000000000000000000000000000000C3AE
              9EFFFFFFFFFFFFFFFFFFFFFFFFFFC3C4BFFFC2BFB9FFFFFFFFFFFFFCFBFFFDF7
              F3FFFCEEE6FFAA9E93FF6761598700000000000000000000000000000000C8B2
              A3FFFFFFFFFFFFFFFFFFFFFFFFFFF6F8F8FFB8B8B2FFC4C2BCFFECEBE7FFEBE8
              E2FFB2AEA4FF756C63FF7A6C5D1000000000000000000000000000000000CCB6
              A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FAFBFFC1C5C1FFA19F97FF918D
              84FF959188FF634D3CFF0000000000000000000000000000000000000000D1BB
              ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A293FF644A
              36FF644A36FF644A36FF0000000000000000000000000000000000000000D5BF
              AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A495FFD4C5
              BAFF644A36FFC9B3A48C0000000000000000000000000000000000000000D8C2
              B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0AB9CFF644A
              36FFC9B3A48B000000000000000000000000000000000000000000000000D8C2
              B2FFD8C2B2FFD8C2B2FFD8C2B2FFD8C2B2FFD4BEAEFFCFB9A9FFC9B3A4FFC9B3
              A48B000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = SpeedButton2Click
          end
          object SpeedButton1: TSpeedButton
            Left = 92
            Top = 0
            Width = 23
            Height = 22
            Hint = #1057#1090#1072#1090#1080#1089#1090#1080#1095#1077#1089#1082#1080#1081' '#1086#1090#1095#1077#1090
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFB9A39563493563493563493563493563493563
              4935634935634935634935634935634935634935634935FF00FFFF00FFB9A395
              FEFDF2DEDBD5DAD2CBD7CBC2D3C2B7CEBAADC7B0A3C1A99CBAA193B29789AB90
              81A5897A634935FF00FFFF00FFB9A395FFFFF6B3D0DD3370859DA7ABFADCC6F9
              D2B8F4C6AAEFBDA0E7B395DDA789D39C7DAB9081634935FF00FFFF00FFB9A395
              FFFFF600AFFCC1FDFF2D677FFBE4D2B7A399B49F92B69B8EAF9485AD8F7FDDA7
              89B29789634935FF00FFFF00FFBAA596FFFFF6B6DDEF00AFFCB2D2DCFCEDDDFB
              E2CEF9D7C0F8CDB2F4C3A6EFBDA0E7B395BAA193634935FF00FFFF00FFBCA698
              FFFFF6FFFFF6FFFFF6FEFCF2FEF5E8FCEAD9FBDFCBF9D4BCF8CCB0F4C3A6EFBD
              A0C1A99C634935FF00FFFF00FFBEA899FFFFF695A3FF2E3BA58F96CDFEFAF0FD
              F2E4FCE8D5FADCC6F9D2B8F8CAAEF4C3A6C7B0A3634935FF00FFFF00FFC0AA9C
              FFFFF64360FF95B3FF2F39ADFFFFF6B9A79EB6A297B49D91B2998BB09688F7C8
              ACCCB6A9634935FF00FFFF00FFC3AE9EFFFFF696A3FF4661FF94A1FFFFFFF6FF
              FEF5FEF7EAFCEDDDFBE2CEF9D7BFF8CDB2CEB8AB634935FF00FFFF00FFC5B0A0
              FFFFF6FFFFF6FFFFF6FFFFF6FFFFF6FFFFF6FFFDF3FEF4E7FCEAD9FADECAF9D4
              BCD0BBB0634935FF00FFFF00FFC7B1A2FFFFF6FF9B99B83030FF8D6AFFFFF6FF
              FFF6FFFFF6FEFAF0FDF1E4FCE7D5FADCC7D3C1B6634935FF00FFFF00FFC9B3A5
              FFFFF6FF837EFFC3C4B72525FFFFF6BAAAA1B8A69CB6A296B39D90B1988BFBE4
              D2D6C7BD634935FF00FFFF00FFCBB5A6FFFFF6FFA9A9FF827FFF9893FFFFF6FF
              FFF6FFFFF6FFFFF6FFFEF4FDF7EBFCEDDDD7CCC3634935FF00FFFF00FFCBB5A6
              FFFFF6FFFFF6FFFFF6FFFFF6FFFFF6FFFFF6FFFFF6FFFFF6FFFFF6FEFCF3FDF4
              E7FCEADA634935FF00FFFF00FFCCB6A7CCB6A7CAB5A6CAB3A4C8B2A3C5AFA1C3
              AD9EC0AB9CBEA99ABCA697BAA496B8A394B8A394B8A394FF00FF}
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            Visible = False
            OnClick = SpeedButton1Click
          end
          object ToolButton1: TToolButton
            Left = 115
            Top = 0
            Width = 7
            Caption = 'ToolButton1'
            Style = tbsSeparator
          end
          object dbcbIDReport: TDBLookupComboboxEh
            Left = 122
            Top = 0
            Width = 194
            Height = 22
            DataField = ''
            EditButtons = <>
            Flat = True
            KeyField = 'IDReport'
            ListField = 'ReportName'
            ListSource = dmAbiturientOtchety.dsAbitReport
            TabOrder = 0
            Visible = True
            OnChange = dbcbIDReportChange
          end
          object cmbxUspSem: TDBComboBoxEh
            Left = 316
            Top = 0
            Width = 193
            Height = 22
            DynProps = <>
            EditButtons = <>
            Flat = True
            Items.Strings = (
              #1047#1072#1103#1074#1083#1077#1085#1080#1103' '#1087#1086' '#1092#1086#1088#1084#1072#1084' '#1086#1073#1091#1095#1077#1085#1080#1103
              #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1081)
            KeyItems.Strings = (
              '0'
              '1')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnChange = cmbxUspSemChange
          end
          object SpeedButton3: TSpeedButton
            Left = 509
            Top = 0
            Width = 114
            Height = 22
            Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
            Flat = True
            Transparent = False
            OnClick = SpeedButton3Click
          end
        end
        object Chart1: TChart
          Left = 0
          Top = 25
          Width = 805
          Height = 314
          Hint = #1053#1072' '#1087#1072#1085#1077#1083#1100
          BackWall.Brush.Style = bsClear
          Legend.Alignment = laBottom
          Legend.Visible = False
          Title.Text.Strings = (
            #1044#1080#1085#1072#1084#1080#1082#1072' '#1095#1080#1089#1083#1077#1085#1085#1086#1089#1090#1080' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074' '#1085#1072' '#1087#1077#1088#1080#1086#1076' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103)
          BottomAxis.DateTimeFormat = 'dd/mm/yyyy'
          BottomAxis.Increment = 1.000000000000000000
          BottomAxis.LabelsAngle = 90
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.MinorTickCount = 2
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelStyle = talValue
          LeftAxis.Maximum = 50.000000000000000000
          LeftAxis.Title.Caption = #1095#1080#1089#1083#1077#1085#1085#1086#1089#1090#1100' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074
          RightAxis.LabelsFormat.TextAlignment = taCenter
          TopAxis.LabelsFormat.TextAlignment = taCenter
          View3D = False
          Zoom.Pen.Mode = pmNotXor
          Align = alTop
          ParentShowHint = False
          Enabled = False
          ShowHint = True
          TabOrder = 2
          DefaultCanvas = 'TGDIPlusCanvas'
          PrintMargins = (
            15
            18
            15
            18)
          ColorPaletteIndex = 13
          object Series1: TLineSeries
            Marks.Visible = False
            SeriesColor = clBlue
            Title = #1055#1086#1076#1072#1085#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1081
            Brush.BackColor = clDefault
            LinePen.Width = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series2: TLineSeries
            Marks.Visible = False
            Title = #1047#1072#1073#1088#1072#1083#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
            Brush.BackColor = clDefault
            LinePen.Width = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series3: TLineSeries
            Marks.Visible = False
            Title = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1093' '#1079#1072#1103#1074#1083#1077#1085#1080#1081
            Brush.BackColor = clDefault
            LinePen.Width = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
      object KatDocPage: TTabSheet
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        DesignSize = (
          805
          477)
        object Label1: TLabel
          Left = 10
          Top = 168
          Width = 451
          Height = 16
          Caption = 
            #1044#1086#1082#1091#1084#1077#1085#1090#1099', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1076#1083#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1091#1082#1072#1079#1072#1085#1085#1086#1081' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1079#1072#1095#1080#1089#1083#1077 +
            #1085#1080#1103' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbgrKatZach: TDBGridEh
          Left = 10
          Top = 16
          Width = 335
          Height = 137
          DataSource = dsKatZach
          DynProps = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          IndicatorOptions = [gioShowRowIndicatorEh]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          OnCellClick = dbgrKatZachCellClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_kat_zach'
              Footers = <>
              Width = 200
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CType_kat'
              Footers = <>
              Width = 100
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object dbgrDocs: TDBGridEh
          Left = 10
          Top = 190
          Width = 792
          Height = 284
          Anchors = [akLeft, akTop, akBottom]
          DataSource = dsDocuments
          DynProps = <>
          ImeMode = imDisable
          IndicatorOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ik_vid_doc'
              Footers = <>
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cvid_doc'
              Footers = <>
              Title.Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              Width = 700
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Ik_kat_zach'
              Footers = <>
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ik_kat_doc'
              Footers = <>
              Visible = False
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'isIncluded'
              Footers = <>
              TextEditing = True
              Title.Alignment = taCenter
              Title.Caption = #1042#1099#1073#1088#1072#1085
              Width = 65
              OnUpdateData = dbgrDocsColumns4UpdateData
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 509
    Width = 817
    ExplicitTop = 509
    ExplicitWidth = 817
    inherited bbSave: TBitBtn
      Left = 648
      Action = actApply
      ExplicitLeft = 648
    end
    inherited bbUndo: TBitBtn
      Left = 480
      Action = actUndo
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ExplicitLeft = 480
    end
  end
  object adoKatZach: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Ik_kat_zach, Cname_kat_zach, CType_kat from Kat_zach inne' +
        'r join TypeKatZach'
      'on Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat'
      'where (OutDate is null)'
      '')
    Left = 766
    Top = 34
    object adoKatZachCname_kat_zach: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'Cname_kat_zach'
      Size = 50
    end
    object adoKatZachCType_kat: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'CType_kat'
      Size = 50
    end
    object adoKatZachIk_kat_zach: TAutoIncField
      FieldName = 'Ik_kat_zach'
      ReadOnly = True
      Visible = False
    end
  end
  object dsKatZach: TDataSource
    DataSet = adoKatZach
    Left = 702
    Top = 34
  end
  object dsDocuments: TDataSource
    DataSet = adoDocuments
    Left = 686
    Top = 106
  end
  object adoDocuments: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from SelectDocKatZach(0)'
    Parameters = <
      item
        Name = '@year'
        DataType = ftInteger
        Size = 10
        Value = 0
      end>
    Left = 758
    Top = 106
    object adoDocumentsik_vid_doc: TIntegerField
      FieldName = 'ik_vid_doc'
    end
    object adoDocumentscvid_doc: TStringField
      FieldName = 'cvid_doc'
      Size = 500
    end
    object adoDocumentsIk_kat_zach: TIntegerField
      FieldName = 'Ik_kat_zach'
    end
    object adoDocumentsik_kat_doc: TIntegerField
      FieldName = 'ik_kat_doc'
    end
    object adoDocumentsisIncluded: TBooleanField
      FieldName = 'isIncluded'
    end
  end
  object ActionList1: TActionList
    Images = frmMain.ImageList1
    Left = 416
    Top = 40
    object actApply: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      OnExecute = actApplyExecute
    end
    object actUndo: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OnExecute = actUndoExecute
    end
  end
end
