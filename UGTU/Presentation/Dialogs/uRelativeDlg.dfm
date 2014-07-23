inherited ftmAddRelative: TftmAddRelative
  Left = 446
  Top = 388
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1086#1076#1089#1090#1074#1077#1085#1085#1080#1082#1072
  ClientHeight = 262
  ClientWidth = 349
  Constraints.MinHeight = 262
  Constraints.MinWidth = 354
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 355
  ExplicitHeight = 291
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 349
    Height = 221
    ExplicitWidth = 353
    ExplicitHeight = 221
  end
  object Label1: TLabel [1]
    Left = 10
    Top = 11
    Width = 104
    Height = 13
    Caption = #1060#1048#1054' '#1088#1086#1076#1089#1090#1074#1077#1085#1085#1080#1082#1072':'
  end
  object Label2: TLabel [2]
    Left = 10
    Top = 55
    Width = 85
    Height = 13
    Caption = #1050#1077#1084' '#1087#1088#1080#1093#1086#1076#1080#1090#1089#1103':'
  end
  object Label3: TLabel [3]
    Left = 10
    Top = 96
    Width = 75
    Height = 13
    Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099':'
  end
  object Label4: TLabel [4]
    Left = 175
    Top = 96
    Width = 61
    Height = 13
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
  end
  object Label5: TLabel [5]
    Left = 175
    Top = 55
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
  end
  object Label6: TLabel [6]
    Left = 10
    Top = 136
    Width = 48
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085':'
  end
  object Label7: TLabel [7]
    Left = 10
    Top = 173
    Width = 34
    Height = 13
    Caption = #1040#1076#1088#1077#1089':'
  end
  object Label8: TLabel [8]
    Left = 114
    Top = 11
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
  object Label9: TLabel [9]
    Left = 95
    Top = 55
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
  object Label11: TLabel [10]
    Left = 175
    Top = 136
    Width = 91
    Height = 13
    Caption = #1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085':'
  end
  inherited Panel1: TPanel
    Top = 221
    Width = 349
    TabOrder = 6
    ExplicitTop = 221
    ExplicitWidth = 349
    inherited bbOK: TBitBtn
      Left = 117
      Top = 10
      Width = 70
      Height = 23
      Caption = #1054#1050
      Enabled = False
      TabOrder = 3
      Visible = False
      ExplicitLeft = 117
      ExplicitTop = 10
      ExplicitWidth = 70
      ExplicitHeight = 23
    end
    inherited bbApply: TBitBtn
      Left = 262
      Top = 10
      Width = 76
      Height = 23
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      TabOrder = 2
      ExplicitLeft = 262
      ExplicitTop = 10
      ExplicitWidth = 76
      ExplicitHeight = 23
    end
    inherited bbCancel: TBitBtn
      Left = 188
      Top = 10
      Width = 73
      Height = 23
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      ExplicitLeft = 188
      ExplicitTop = 10
      ExplicitWidth = 73
      ExplicitHeight = 23
    end
    inherited bbSprav: TBitBtn
      Left = 10
      Top = 10
      Height = 23
      TabOrder = 1
      ExplicitLeft = 10
      ExplicitTop = 10
      ExplicitHeight = 23
    end
  end
  object dbcbeKind: TDBLookupComboboxEh [12]
    Left = 10
    Top = 72
    Width = 157
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'ik_memb_fam'
    ListField = 'cmemb_fam'
    ListSource = dmStudentData.dsRel
    TabOrder = 1
    Visible = True
    OnChange = actCheckFieldsExecute
  end
  object dbcbePlace: TDBLookupComboboxEh [13]
    Left = 10
    Top = 113
    Width = 157
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_pred'
    ListField = 'Cname_pred'
    ListSource = dmStudentData.dsEnterprise
    TabOrder = 3
    Visible = True
  end
  object eFIO: TDBEditEh [14]
    Left = 10
    Top = 28
    Width = 328
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 0
    Visible = True
    OnChange = actCheckFieldsExecute
  end
  object ePost: TDBEditEh [15]
    Left = 175
    Top = 113
    Width = 163
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 4
    Visible = True
  end
  object dbdteBirth: TDBDateTimeEditEh [16]
    Left = 175
    Top = 72
    Width = 163
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 2
    Visible = True
    OnChange = actCheckFieldsExecute
  end
  object eAdress: TDBEditEh [17]
    Left = 10
    Top = 188
    Width = 328
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 5
    Visible = True
  end
  object ePhone: TDBEditEh [18]
    Left = 10
    Top = 151
    Width = 157
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 7
    Visible = True
  end
  object eWorkPhone: TDBEditEh [19]
    Left = 175
    Top = 151
    Width = 163
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 8
    Visible = True
  end
  inherited actBaseDialog: TActionList
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
    object actCheckFields: TAction
      Caption = 'actCheckFields'
      OnExecute = actCheckFieldsExecute
    end
  end
end
