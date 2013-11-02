inherited frmFgosException: TfrmFgosException
  Caption = ''
  ClientHeight = 110
  ClientWidth = 429
  ExplicitWidth = 435
  ExplicitHeight = 142
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 429
    Height = 69
    ExplicitWidth = 479
    ExplicitHeight = 103
  end
  object Label1: TLabel [1]
    Left = 98
    Top = 35
    Width = 66
    Height = 13
    Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 8
    Width = 156
    Height = 13
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' 1 '#1079#1072#1095#1077#1090#1085#1086#1081' '#1077#1076#1080#1085#1080#1094#1099':'
  end
  inherited Panel1: TPanel
    Top = 69
    Width = 429
    ExplicitTop = 69
    ExplicitWidth = 429
    inherited bbOK: TBitBtn
      Left = 172
      ExplicitLeft = 172
    end
    inherited bbApply: TBitBtn
      Left = 340
      ExplicitLeft = 340
    end
    inherited bbCancel: TBitBtn
      Left = 256
      ExplicitLeft = 256
    end
  end
  object eDiscZE: TEdit [4]
    Left = 170
    Top = 5
    Width = 251
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    Constraints.MaxHeight = 19
    Constraints.MinHeight = 19
    TabOrder = 1
    OnChange = eDiscZEChange
  end
  object dbcbdiscpl: TDBLookupComboboxEh [5]
    Left = 170
    Top = 32
    Width = 251
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    TabOrder = 2
    Visible = True
    OnChange = dbcbdiscplChange
  end
  inherited actBaseDialog: TActionList
    Left = 25
    Top = 48
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
  object dsGetException: TDataSource
    Left = 128
    Top = 72
  end
end
