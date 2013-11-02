object frmDiplomSelect: TfrmDiplomSelect
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1089#1090#1091#1076#1077#1085#1090#1086#1074' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080
  ClientHeight = 435
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    560
    435)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 560
    Height = 394
    Align = alClient
    Style = bsRaised
    ExplicitWidth = 431
    ExplicitHeight = 141
  end
  object Label3: TLabel
    Left = 21
    Top = 15
    Width = 73
    Height = 13
    Caption = #1042#1089#1077' '#1089#1090#1091#1076#1077#1085#1090#1099':'
  end
  object btnAddStud: TSpeedButton
    Left = 266
    Top = 129
    Width = 23
    Height = 22
    Caption = '>'
    Flat = True
    OnClick = btnAddStudClick
  end
  object btnAddAllStuds: TSpeedButton
    Left = 266
    Top = 157
    Width = 23
    Height = 22
    Caption = '>>'
    Flat = True
    OnClick = btnAddAllStudsClick
  end
  object btnDelStud: TSpeedButton
    Left = 266
    Top = 181
    Width = 23
    Height = 19
    Caption = '<'
    Flat = True
    OnClick = btnDelStudClick
  end
  object btnDeleteAllStud: TSpeedButton
    Left = 266
    Top = 202
    Width = 23
    Height = 22
    Caption = '<<'
    Flat = True
    OnClick = btnDeleteAllStudClick
  end
  object Label1: TLabel
    Left = 306
    Top = 15
    Width = 197
    Height = 13
    Anchors = [akLeft, akTop, akRight]
    Caption = #1057#1090#1091#1076#1077#1085#1090#1099', '#1082#1086#1090#1086#1088#1099#1084' '#1087#1077#1095#1072#1090#1072#1090#1100' '#1076#1080#1087#1083#1086#1084':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 394
    Width = 560
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      560
      41)
    object bbOK: TBitBtn
      Left = 383
      Top = 6
      Width = 81
      Height = 25
      Action = actOK
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
    end
    object bbCancel: TBitBtn
      Left = 467
      Top = 6
      Width = 81
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bbCancelClick
    end
  end
  object lbAllStud: TListBox
    Left = 21
    Top = 34
    Width = 228
    Height = 324
    Anchors = [akLeft, akTop, akBottom]
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = btnAddStudClick
  end
  object lbDiplomStud: TListBox
    Left = 306
    Top = 34
    Width = 229
    Height = 324
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    ItemHeight = 13
    TabOrder = 2
    OnDblClick = btnDelStudClick
  end
  object actBaseDialog: TActionList
    Left = 225
    Top = 8
    object actApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    end
    object actOK: TAction
      Caption = 'OK'
      OnExecute = actOKExecute
      OnUpdate = actOKUpdate
    end
    object actSprav: TAction
      Caption = #1057#1087#1088#1072#1074#1080#1095#1085#1080#1082#1080
    end
  end
end
