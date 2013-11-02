inherited frmNagruzkaCalcUnitsContingent: TfrmNagruzkaCalcUnitsContingent
  HelpKeyword = #1053#1072#1075#1088#1091#1079#1082#1072'\Add_PlanContingent.htm'
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1078#1080#1076#1072#1077#1084#1086#1075#1086' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090#1072' '#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1077#1076#1080#1085#1080#1094
  ClientHeight = 351
  ClientWidth = 451
  Constraints.MinWidth = 394
  ExplicitWidth = 457
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 312
    Width = 451
    Height = 4
    Align = alBottom
    Shape = bsBottomLine
    Style = bsLowered
    ExplicitTop = 241
    ExplicitWidth = 450
    ExplicitHeight = 4
  end
  inherited Panel1: TPanel
    Top = 316
    Width = 451
    Height = 35
    BevelOuter = bvNone
    OnMouseMove = Panel8MouseMove
    ExplicitTop = 316
    ExplicitWidth = 451
    ExplicitHeight = 35
    inherited bbOK: TBitBtn
      Left = 195
      Top = 5
      ExplicitLeft = 195
      ExplicitTop = 5
    end
    inherited bbApply: TBitBtn
      Left = 362
      Top = 5
      ExplicitLeft = 362
      ExplicitTop = 5
    end
    inherited bbCancel: TBitBtn
      Left = 278
      Top = 5
      ExplicitLeft = 278
      ExplicitTop = 5
    end
    inherited bbSprav: TBitBtn
      Left = 0
      Top = 40
      Width = 112
      Visible = False
      ExplicitLeft = 0
      ExplicitTop = 40
      ExplicitWidth = 112
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 0
    Width = 451
    Height = 312
    Align = alClient
    BevelEdges = [beBottom]
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      451
      312)
    object Bevel5: TBevel
      Left = 0
      Top = 28
      Width = 7
      Height = 258
      Align = alLeft
      Shape = bsSpacer
      ExplicitHeight = 188
    end
    object Bevel2: TBevel
      Left = 444
      Top = 28
      Width = 7
      Height = 258
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 442
      ExplicitHeight = 188
    end
    object Panel8: TPanel
      Left = 0
      Top = 286
      Width = 451
      Height = 26
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      OnMouseMove = Panel8MouseMove
      object Label4: TLabel
        Left = 114
        Top = 7
        Width = 33
        Height = 13
        Caption = #1048#1090#1086#1075#1086':'
      end
      object Label5: TLabel
        Left = 153
        Top = 7
        Width = 42
        Height = 13
        Caption = #1073#1102#1076#1078#1077#1090':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 201
        Top = 7
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 298
        Top = 7
        Width = 49
        Height = 13
        Caption = #1082#1086#1085#1090#1088#1072#1082#1090':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 353
        Top = 7
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ToolBar1: TToolBar
        Left = 7
        Top = 3
        Width = 105
        Height = 23
        Align = alNone
        ButtonWidth = 25
        Caption = 'ToolBar1'
        Images = ImageList1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1078#1080#1076#1072#1077#1084#1099#1081' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1077#1081' ...'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnMouseEnter = ToolButton1MouseEnter
          OnMouseLeave = ToolButton1MouseLeave
        end
        object ToolButton4: TToolButton
          Left = 25
          Top = 0
          Hint = 
            #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1078#1080#1076#1072#1077#1084#1099#1081' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1086#1090#1076#1077#1083#1100#1085#1099#1093' '#1075#1088#1091#1087#1087', '#1074#1082#1083#1102#1095#1077#1085#1085#1099#1093' '#1074' '#1087#1086#1090#1086 +
            #1082'...'
          ImageIndex = 1
          OnMouseEnter = ToolButton4MouseEnter
          OnMouseLeave = ToolButton4MouseLeave
        end
        object ToolButton3: TToolButton
          Left = 50
          Top = 0
          Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1078#1080#1076#1072#1077#1084#1099#1081' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1076#1088#1091#1075#1080#1093' '#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1077#1076#1080#1085#1080#1094' ...'
          Caption = 'ToolButton3'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnMouseEnter = ToolButton3MouseEnter
        end
        object ToolButton2: TToolButton
          Left = 75
          Top = 0
          Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1075#1088#1091#1087#1087' ...'
          Caption = 'ToolButton2'
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          OnMouseEnter = ToolButton2MouseEnter
          OnMouseLeave = ToolButton2MouseLeave
        end
      end
    end
    object DBGridEh2: TDBGridEh
      Left = 7
      Top = 28
      Width = 437
      Height = 258
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      AutoFitColWidths = True
      DataSource = dsCalcUnitsContent
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnMouseMove = Panel8MouseMove
      Columns = <
        item
          EditButtons = <>
          FieldName = 'cName_calc_unit'
          Footers = <>
          Title.Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1077#1076#1080#1085#1080#1094#1072
          Width = 227
        end
        item
          EditButtons = <>
          FieldName = 'budget_count'
          Footers = <>
          Title.Caption = #1041#1102#1076#1078#1077#1090
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'contract_count'
          Footers = <>
          Title.Caption = #1050#1086#1085#1090#1088#1072#1082#1090
          Width = 71
        end>
    end
    object Panel3: TPanel
      Left = 7
      Top = 86
      Width = 394
      Height = 200
      Anchors = [akLeft, akBottom]
      BevelEdges = [beTop, beRight]
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 2
      Visible = False
      DesignSize = (
        392
        198)
      object Label3: TLabel
        Left = 0
        Top = 4
        Width = 286
        Height = 13
        Caption = #1054#1078#1080#1076#1072#1077#1084#1099#1081' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1077#1081' ('#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1081'):'
      end
      object Label10: TLabel
        Left = 1
        Top = 178
        Width = 36
        Height = 13
        Caption = #1048#1090#1086#1075#1086': '
      end
      object Label11: TLabel
        Left = 43
        Top = 178
        Width = 42
        Height = 13
        Caption = #1073#1102#1076#1078#1077#1090':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 91
        Top = 178
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 167
        Top = 178
        Width = 49
        Height = 13
        Caption = #1082#1086#1085#1090#1088#1072#1082#1090':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 222
        Top = 178
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbgSpecContingent: TDBGridEh
        Left = 0
        Top = 24
        Width = 377
        Height = 144
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoFitColWidths = True
        DataSource = dsSpecContingent
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'full_name'
            Footers = <>
            Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
            Width = 94
          end
          item
            EditButtons = <>
            FieldName = 'group_count'
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1087
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'subgroup_count'
            Footers = <>
            Title.Caption = #1055#1086#1076#1075#1088#1091#1087#1087
          end
          item
            EditButtons = <>
            FieldName = 'budget_count'
            Footers = <>
            Title.Caption = #1041#1102#1076#1078#1077#1090
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'contract_count'
            Footers = <>
            Title.Caption = #1050#1086#1085#1090#1088#1072#1082#1090
            Width = 82
          end>
      end
    end
    object Panel10: TPanel
      Left = 0
      Top = 0
      Width = 451
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Label1: TLabel
        Left = 7
        Top = 8
        Width = 68
        Height = 13
        Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
      end
      object Label2: TLabel
        Left = 81
        Top = 8
        Width = 3
        Height = 13
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 7
      Top = 86
      Width = 346
      Height = 200
      Anchors = [akLeft, akBottom]
      BevelEdges = [beTop, beRight]
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 4
      Visible = False
      DesignSize = (
        344
        198)
      object Label9: TLabel
        Left = 0
        Top = 4
        Width = 139
        Height = 13
        Caption = #1058#1077#1082#1091#1097#1080#1081' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1075#1088#1091#1087#1087':'
      end
      object Label15: TLabel
        Left = 1
        Top = 178
        Width = 36
        Height = 13
        Caption = #1048#1090#1086#1075#1086': '
      end
      object Label16: TLabel
        Left = 43
        Top = 178
        Width = 42
        Height = 13
        Caption = #1073#1102#1076#1078#1077#1090':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 91
        Top = 178
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 167
        Top = 178
        Width = 49
        Height = 13
        Caption = #1082#1086#1085#1090#1088#1072#1082#1090':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 222
        Top = 178
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 24
        Width = 329
        Height = 145
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoFitColWidths = True
        DataSource = dsCurrentGroupContingent
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'cName_grup'
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1087#1072
            Width = 134
          end
          item
            EditButtons = <>
            FieldName = 'budget_count'
            Footers = <>
            Title.Caption = #1041#1102#1076#1078#1077#1090
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'contract_count'
            Footers = <>
            Title.Caption = #1050#1086#1085#1090#1088#1072#1082#1090
            Width = 82
          end>
      end
    end
  end
  object Panel5: TPanel [3]
    Left = 7
    Top = 86
    Width = 346
    Height = 200
    Anchors = [akLeft, akBottom]
    BevelEdges = [beTop, beRight]
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 2
    Visible = False
    DesignSize = (
      344
      198)
    object Label20: TLabel
      Left = 0
      Top = 28
      Width = 156
      Height = 13
      Caption = #1050#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1077#1076#1080#1085#1080#1094':'
    end
    object Label21: TLabel
      Left = 1
      Top = 178
      Width = 36
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1048#1090#1086#1075#1086': '
    end
    object Label22: TLabel
      Left = 42
      Top = 178
      Width = 42
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1073#1102#1076#1078#1077#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 90
      Top = 178
      Width = 6
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 166
      Top = 178
      Width = 49
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1082#1086#1085#1090#1088#1072#1082#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 221
      Top = 178
      Width = 6
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 0
      Top = 4
      Width = 80
      Height = 13
      Caption = #1057#1093#1077#1084#1072' '#1076#1077#1083#1077#1085#1080#1103':'
    end
    object DBGridEh3: TDBGridEh
      Left = 0
      Top = 47
      Width = 339
      Height = 123
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoFitColWidths = True
      DataSource = dsAnotherCalcUnitContingent
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'cName_calc_unit'
          Footers = <>
          Title.Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1077#1076#1080#1085#1080#1094#1072
          Width = 159
        end
        item
          EditButtons = <>
          FieldName = 'budget_count'
          Footers = <>
          Title.Caption = #1041#1102#1076#1078#1077#1090
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'contract_count'
          Footers = <>
          Title.Caption = #1050#1086#1085#1090#1088#1072#1082#1090
          Width = 82
        end>
    end
    object dbcbAnotherShema: TDBLookupComboboxEh
      Left = 86
      Top = 3
      Width = 251
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 1
      Visible = True
      OnKeyValueChanged = dbcbAnotherShemaKeyValueChanged
    end
  end
  object Panel6: TPanel [4]
    Left = 7
    Top = 86
    Width = 351
    Height = 200
    Anchors = [akLeft, akBottom]
    BevelEdges = [beTop, beRight]
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 3
    Visible = False
    DesignSize = (
      349
      198)
    object Label27: TLabel
      Left = 0
      Top = 4
      Width = 322
      Height = 13
      Caption = #1054#1078#1080#1076#1072#1077#1084#1099#1081' '#1082#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1086#1090#1076#1077#1083#1100#1085#1099#1093' '#1075#1088#1091#1087#1087', '#1074#1082#1083#1102#1095#1077#1085#1085#1099#1093' '#1074' '#1087#1086#1090#1086#1082':'
    end
    object Label28: TLabel
      Left = 1
      Top = 178
      Width = 36
      Height = 13
      Caption = #1048#1090#1086#1075#1086': '
    end
    object Label29: TLabel
      Left = 43
      Top = 178
      Width = 42
      Height = 13
      Caption = #1073#1102#1076#1078#1077#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 91
      Top = 178
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 167
      Top = 178
      Width = 49
      Height = 13
      Caption = #1082#1086#1085#1090#1088#1072#1082#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 222
      Top = 178
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBGridEh4: TDBGridEh
      Left = 0
      Top = 24
      Width = 334
      Height = 145
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoFitColWidths = True
      DataSource = dsSepGroupPlanContingent
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'cName_grup'
          Footers = <>
          Title.Caption = #1043#1088#1091#1087#1087#1072
          Width = 94
        end
        item
          EditButtons = <>
          FieldName = 'subgroup_count'
          Footers = <>
          Title.Caption = #1055#1086#1076#1075#1088#1091#1087#1087
        end
        item
          EditButtons = <>
          FieldName = 'budget_count'
          Footers = <>
          Title.Caption = #1041#1102#1076#1078#1077#1090
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'contract_count'
          Footers = <>
          Title.Caption = #1050#1086#1085#1090#1088#1072#1082#1090
          Width = 82
        end>
    end
  end
  inherited actBaseDialog: TActionList
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
  object ImageList1: TImageList
    Left = 432
    Top = 80
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F000000000000000000000000000000
      00000000000090777A009B8489009C8689009A8386009C8589009C8589009C85
      8900A0898D00967C7F00877477008C767A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009792
      8F00FEFEFE00F8F9F800F8F9F800F8F9F800F8F9F800F7F7F700F5F5F500F4F4
      F400F1F1F100F0F0F000F0F0F00097928F000000000000000000000000000000
      0000000000009D868900E3E0E700C0B3B600C0B3B600C0B3B600C0B3B600BCB1
      B300C0B3B6009C858900F2E3E4008C767A000000000000000000000000000000
      0000000000000000000000000000000000000D7C0F000D7C0F000D7C0F000D7C
      0F000D7C0F0032BA4D0032BA4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009792
      8F00FFFEFF00F8F9F800E7DDCC00B0843100D6C5A600F7F7F800F6F6F500F5F4
      F400F1F1F100F1F0F100F0F0F00097928F000000000000000000000000000000
      0000000000009C848800DCD6DD00C0B3B600FFFFFF00BCB1B300FFFFFF00BCB1
      B300FFFFFF009C8589009C8589008E74770000000000795B5A00795B5A00795B
      5A00795B5A00795B5A00795B5A00795B5A000D7C0F003ACA5B003ACA5B005ED5
      7900C0D9B80083CF8B0032BA4D000D7C0F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009792
      8F00FFFFFF00D2C4AD00B7832200B9840A00C0954700F6F4F200F6F7F600AB98
      9A00AA979900AA969900F0F0F00097928F000000000000000000000000000000
      0000000000009C858800DDD8DE00C0B3B600BCB1B300BCB1B300BCB1B300BCB1
      B300BCB1B300C0B3B600D3CBCF00AA979B00000000009B7E7E00DDB5B100E1B3
      AC00E0B2AA00DFB0A800DEAEA400DDACA200DCABA0000D7C0F003ACA5B0085B4
      9600BAC8D400A0C89E0065CD6E0032BA4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE009792
      8F00FFFFFF00CEB07A00BF903800F8F9F800B7830700DBC29500F8F7F800F6F7
      F600F2F2F300F2F1F100F0F0F10097928F000000000000000000000000000000
      0000000000009C858700DDD8DE00C0B3B600FFFFFF00BCB1B300FFFFFF00BCB1
      B300FFFFFF00C0B3B600DCD8DC00AA979B0097575A0097575A0097575A00FFEF
      DF00FFEEDD00FFEDDB00FFECD900FFEBD700FFEBD500FFD0BA002A72BD002886
      CB001E80CF002A72BD0032BA4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00E5BEBD009792
      8F00FFFFFF00F8F9F800F8F9F800FDFCFC00D6B77000C4962000F0EAD700F7F7
      F700F3F3F300F2F2F200F1F1F10097928F000000000000000000EFDBDB00AD8D
      7C00408B2F009C858900DED9E000C0B3B600B8ABAF00BCB1B300BCB1B300BCB1
      B300BCB1B300C0B3B600DAD5D900AA979B00000000009B7E7E00FFFFFF00FFF2
      E40099330000993300009933000099330000FED4A2002A72BD00449BE0003AAC
      F8003DB0F7002A72BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E1BCB900A73C21009792
      8F00FFFFFF00FEFFFE00FEFEFE00FDFDFD00F0E5D000D5B94C00D2B04E00F7F7
      F800F4F3F400F3F2F200F1F1F20097928F0000000000E1BDBD009E362800236E
      000012B500009C848800DFDAE000C0B3B600FFFFFF00BCB1B300FFFFFF00BCB1
      B300FFFFFF00C0B3B600D6D1D600AA979B0097575A0097575A0097575A00FFF4
      E800FFF2E400A43F0400A43F0400FFEEDD00FFEDDB002A72BD0050B4F80052B4
      FC0052B4FC002A72BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6EEEE00BD2D2600896222009792
      8F00FFFFFF00FEFFFE00FEFEFE00FFFFFF00FEFFFE00F2E9D200E2CB9200EDE4
      CD00F4F3F400F3F2F200F1F1F20097928F00EFDFDF00AB2E2800327100000AB4
      00002ECA00009D858900DEDADF00C0B3B600C0B3B600C0B3B600C0B3B600BCB1
      B300C0B3B600C0B3B600D5D1D400AA979B00000000009B7E7E00FFFFFF00FFF5
      EA00FED4A200B3510900B3510900FED4A200FED4A2002A72BD00449BE0004FA7
      E7004AA4E3002A72BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D7B4AB00B63D2700AC602B009792
      8F00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA0097928F00C88686009D0C00005964000030CA
      05004FCD2F009B828600ECEDF200ECEDF200ECEDF200ECEDF200ECEDF200ECED
      F200ECEDF200ECEDF200ECEDF200AA979B0097575A0097575A0097575A00FFF8
      F000FFF5EA00C4640F00C4640F00FFF2E400FFF1E2002A72BD0085C6E10099D9
      EF0092F8FF002A72BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B7B4D00B9582F00DC6334009792
      8F00E0D9D300E0D9D300E0D9D300E0D9D300E0D9D300E0D9D300E0D9D300E0D9
      D30091796800E0D9D3009179680097928F0089542F00A7320000AD4300009B5C
      00009F590100A1898C00A9A0A000A9A0A000A9A0A000A9A0A000A9A0A000A9A0
      A000A9A0A000A9A0A000A9A0A000AA979B00000000009B7E7E00FFFFFF00FFFA
      F400D4751500D4751500D4751500FED4A200FED4A200FFD7C8002A72BD002A72
      BD002A72BD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F825300AC5B2800C67E2E009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0085320600B1330000BA560000C471
      1500E6A81A006E605F0080737100807372008275750085797900847777008579
      79008375760081737500817373007466650097575A0097575A0097575A00FFFF
      FF00FFFAF400FFF8F000FFF6ED00FFF5EA00FFF4E800FFD7CA00795B5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCC1AC004E871A0068B22E00A8DC
      9F00EEE3D700FFE69000FFE05C00FFA85100B3BB740044FF920054C65900C4BC
      9E0000000000000000000000000000000000A6AB8B00377900005D9D1F00ACC1
      9B00DFB68100EAC12B00DFA02200C46E27001DDF620006D23A009A775C000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFFF
      FF00FED4A200D4751500D4751500FED4A200FED4A200FFCFC300795B5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F1EF005BA3290039EE3400B2FF
      DD00FFFFFF00FFEFC800FFE27500FFB55B00C6BE750071EE8C0080A06500F0E7
      E40000000000000000000000000000000000E4E0D90016B1000040F35600D5FF
      FF00EAE0E000E6CA5E00E3B03000CB7D320047D966003AA83F00D2B6B6000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFFF
      FF00FFFFFE00FFA62400FFA62400FFFAF400FFF8F100FFCFC300795B5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8D9CB0053B2340091EA
      8F00D7F6D800DED19800EFC46400F2B26000DCA66B00B5865B00DFCCC700FEFE
      FE0000000000000000000000000000000000F9F4F40088954A002CC62600ADE2
      B400C5CBA500CA9D3A00DAA33300C77A3300A07B3C00A9786400F8F6F6000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEEDC00795B5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00EAE1D2009196
      490089B86300A6BF6D00D0A55900E7915800C08B5100DACBC000FDFDFD000000
      00000000000000000000000000000000000000000000F6F0EC00A39A5E00718B
      280077B45300A78E3700C77B2A00BE682700A08B5E00F1EBEB00000000000000
      000000000000000000000000000000000000000000009B7E7E009B7E7E009B7E
      7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8F3
      F100DCD0BF00C7AC8500CDA07D00E0C5BB00F5F1EF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FBF9F800DBCA
      C000BFA58000B6855300C5967C00DDC8C600F9F7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00E000F800FFFF0000E000F800FF010000
      E000F80080000000E000F80080000000C000F800000100008000C00080030000
      8000800000030000000000008003000000000000000300000000000080070000
      00000000001F0000000F001F801F0000000F001F001F0000800F001F801F0000
      801F803F801F0000E07FC07FFFFF000000000000000000000000000000000000
      000000000000}
  end
  object dsCalcUnitsContent: TDataSource
    OnStateChange = dsCalcUnitsContentStateChange
    OnUpdateData = dsCalcUnitsContentUpdateData
    Left = 400
    Top = 77
  end
  object dsSpecContingent: TDataSource
    Left = 432
    Top = 45
  end
  object dsCurrentGroupContingent: TDataSource
    Left = 344
    Top = 45
  end
  object dsAnotherCalcUnitContingent: TDataSource
    Left = 344
    Top = 80
  end
  object dsSepGroupPlanContingent: TDataSource
    Left = 384
    Top = 48
  end
end
