inherited frmNagruzkaCalcUnits: TfrmNagruzkaCalcUnits
  Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1077#1076#1080#1085#1080#1094#1072
  ClientHeight = 355
  ClientWidth = 432
  ExplicitWidth = 438
  ExplicitHeight = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 99
    Width = 432
    Height = 215
    ExplicitTop = 81
    ExplicitWidth = 432
    ExplicitHeight = 233
  end
  inherited Panel1: TPanel
    Top = 314
    Width = 432
    ExplicitTop = 314
    ExplicitWidth = 432
    inherited bbOK: TBitBtn
      Left = 175
      ExplicitLeft = 175
    end
    inherited bbApply: TBitBtn
      Left = 343
      ExplicitLeft = 343
    end
    inherited bbCancel: TBitBtn
      Left = 259
      ExplicitLeft = 259
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 432
    Height = 99
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 103
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1077#1076#1080#1085#1080#1094#1099' :'
    end
    object Label2: TLabel
      Left = 171
      Top = 48
      Width = 40
      Height = 13
      Caption = #1041#1102#1076#1078#1077#1090
    end
    object Label3: TLabel
      Left = 302
      Top = 48
      Width = 47
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1072#1082#1090
    end
    object lblError: TLabel
      Left = 8
      Top = 77
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
    object dbeName: TDBEditEh
      Tag = -1
      Left = 128
      Top = 15
      Width = 284
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 0
      Visible = True
      OnChange = dbeNameChange
    end
    object dbeContract: TDBEditEh
      Tag = -1
      Left = 355
      Top = 45
      Width = 57
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 1
      Text = '0'
      Visible = True
      OnChange = dbeContractChange
      OnKeyPress = dbeContractKeyPress
    end
    object dbeBudget: TDBEditEh
      Tag = -1
      Left = 217
      Top = 45
      Width = 57
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 2
      Text = '0'
      Visible = True
      OnChange = dbeBudgetChange
      OnKeyPress = dbeBudgetKeyPress
    end
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 99
    Width = 432
    Height = 215
    Align = alClient
    TabOrder = 2
    DesignSize = (
      432
      215)
    object Label4: TLabel
      Left = 8
      Top = 6
      Width = 90
      Height = 13
      Caption = #1042#1093#1086#1076#1103#1097#1080#1077' '#1075#1088#1091#1087#1087#1099
    end
    object dbgGroups: TDBGridEh
      Left = 8
      Top = 24
      Width = 418
      Height = 185
      Anchors = [akLeft, akTop, akBottom]
      AutoFitColWidths = True
      DataSource = dsGroups
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      Columns = <
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'inCalc'
          Footers = <>
          OnUpdateData = dbgGroupsColumns0UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'Cname_grup'
          Footers = <>
          ReadOnly = True
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
  object dsGroups: TDataSource
    Left = 64
    Top = 221
  end
end
