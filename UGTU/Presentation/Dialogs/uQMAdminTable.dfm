inherited frmQMAdminTable: TfrmQMAdminTable
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' '#1074' QM'
  ClientHeight = 140
  ClientWidth = 273
  ExplicitWidth = 279
  ExplicitHeight = 172
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 273
    Height = 99
    ExplicitWidth = 273
    ExplicitHeight = 130
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 8
    Width = 147
    Height = 13
    Caption = #1048#1084#1103' '#1090#1072#1073#1083#1080#1094#1099' '#1074' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093':'
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 50
    Width = 99
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099':'
  end
  inherited Panel1: TPanel
    Top = 99
    Width = 273
    ExplicitTop = 130
    ExplicitWidth = 273
    inherited bbOK: TBitBtn
      Left = 31
      Width = 74
      Enabled = False
      ExplicitLeft = 31
      ExplicitWidth = 74
    end
    inherited bbApply: TBitBtn
      Left = 183
      Width = 74
      Enabled = False
      ExplicitLeft = 183
      ExplicitWidth = 74
    end
    inherited bbCancel: TBitBtn
      Left = 107
      Width = 74
      ExplicitLeft = 107
      ExplicitWidth = 74
    end
    inherited bbSprav: TBitBtn
      Left = -53
      Top = 32
      Visible = False
      ExplicitLeft = -53
      ExplicitTop = 32
    end
  end
  object eName: TDBEditEh [4]
    Left = 8
    Top = 25
    Width = 249
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
    OnChange = eNameChange
  end
  object eCaption: TDBEditEh [5]
    Left = 8
    Top = 67
    Width = 249
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 2
    Visible = True
  end
end
