inherited frmGroupManager: TfrmGroupManager
  Left = 364
  Top = 346
  BorderStyle = bsSizeable
  Caption = #1054#1073#1098#1077#1076#1080#1085#1077#1085#1080#1077' '#1075#1088#1091#1087#1087
  ClientHeight = 442
  ClientWidth = 596
  Constraints.MinHeight = 400
  Constraints.MinWidth = 500
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 612
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 596
    Height = 401
    ExplicitTop = 2
    ExplicitWidth = 568
    ExplicitHeight = 360
  end
  object Label1: TLabel [1]
    Left = 11
    Top = 10
    Width = 118
    Height = 13
    Caption = #1058#1077#1082#1091#1097#1080#1077' '#1089#1087#1080#1089#1082#1080' '#1075#1088#1091#1087#1087':'
  end
  object Label2: TLabel [2]
    Left = 357
    Top = 10
    Width = 103
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1074' '#1075#1088#1091#1087#1087#1091':'
  end
  object Label3: TLabel [3]
    Left = 357
    Top = 55
    Width = 129
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1085#1099#1077' '#1089#1090#1091#1076#1077#1085#1090#1099':'
    ExplicitLeft = 329
  end
  object SpeedButton4: TSpeedButton [4]
    Left = 322
    Top = 157
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Caption = '>>'
    Enabled = False
    Flat = True
    OnClick = SpeedButton4Click
    ExplicitLeft = 294
  end
  object SpeedButton1: TSpeedButton [5]
    Left = 322
    Top = 133
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Caption = '>'
    Enabled = False
    Flat = True
    OnClick = SpeedButton1Click
    ExplicitLeft = 294
  end
  object SpeedButton2: TSpeedButton [6]
    Left = 322
    Top = 181
    Width = 23
    Height = 19
    Anchors = [akTop, akRight]
    Caption = '<'
    Enabled = False
    Flat = True
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton [7]
    Left = 322
    Top = 202
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Caption = '<<'
    Enabled = False
    Flat = True
    OnClick = SpeedButton3Click
  end
  object Label4: TLabel [8]
    Left = 11
    Top = 342
    Width = 92
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1082#1072#1079' '#1087#1077#1088#1077#1074#1086#1076#1072':'
  end
  object Label5: TLabel [9]
    Left = 104
    Top = 342
    Width = 4
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 401
    Width = 596
    ExplicitTop = 401
    ExplicitWidth = 596
    inherited bbOK: TBitBtn
      Left = 418
      Top = 6
      ExplicitLeft = 418
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 262
      Top = 6
      Visible = False
      ExplicitLeft = 262
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 501
      Top = 6
      ExplicitLeft = 501
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Top = 6
      Visible = False
      ExplicitTop = 6
    end
  end
  object DBDekTreeView_TEST1: TDBDekTreeView_TEST [11]
    Left = 11
    Top = 31
    Width = 300
    Height = 305
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    ChangeDelay = 300
    Images = frmMain.TreeIcons
    Indent = 19
    ReadOnly = True
    TabOrder = 1
    OnChange = DBDekTreeView_TEST1Change
    OnDblClick = DBDekTreeView_TEST1DblClick
  end
  object dbcbeNewGroup: TDBLookupComboboxEh [12]
    Left = 357
    Top = 31
    Width = 225
    Height = 19
    Anchors = [akTop, akRight]
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_grup'
    ListField = 'Cname_grup'
    ListSource = dmUgtuStructure.dsGroupsofSpec
    TabOrder = 2
    Visible = True
    OnChange = dbcbeNewGroupChange
  end
  object lbStud: TListBox [13]
    Left = 357
    Top = 74
    Width = 225
    Height = 262
    Anchors = [akTop, akRight, akBottom]
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    ItemHeight = 13
    TabOrder = 3
    OnClick = lbStudClick
    OnDblClick = lbStudDblClick
  end
  object dbcbeOrder: TDBLookupComboboxEh [14]
    Left = 11
    Top = 362
    Width = 300
    Height = 19
    Anchors = [akLeft, akRight, akBottom]
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_prikaz'
    ListField = 'NN_Date'
    ListSource = dmPrikaz.dsPrikaz
    TabOrder = 4
    Visible = True
    OnChange = dbcbeNewGroupChange
  end
  inherited actBaseDialog: TActionList
    Left = 210
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actApplyUpdate
    end
  end
end
