inherited frmAppTweaks: TfrmAppTweaks
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 175
  ClientWidth = 485
  OnCreate = FormCreate
  ExplicitWidth = 491
  ExplicitHeight = 207
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 485
    Height = 134
    ExplicitWidth = 485
    ExplicitHeight = 134
  end
  inherited Panel1: TPanel
    Top = 134
    Width = 485
    ExplicitTop = 134
    ExplicitWidth = 485
    inherited bbOK: TBitBtn
      Left = 297
      ExplicitLeft = 297
    end
    inherited bbApply: TBitBtn
      Left = 108
      Top = 6
      Visible = False
      ExplicitLeft = 108
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 380
      ExplicitLeft = 380
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 0
    Width = 485
    Height = 134
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet3: TTabSheet
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lServ: TLabel
        Left = 4
        Top = 6
        Width = 73
        Height = 13
        Caption = #1048#1084#1103' '#1089#1077#1088#1074#1077#1088#1072': '
      end
      object Label2: TLabel
        Left = 4
        Top = 50
        Width = 97
        Height = 13
        Caption = #1048#1084#1103' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093': '
      end
      object eServ: TDBEditEh
        Left = 4
        Top = 25
        Width = 453
        Height = 19
        EditButtons = <>
        Flat = True
        TabOrder = 0
        Visible = True
      end
      object eDatabase: TDBEditEh
        Left = 4
        Top = 69
        Width = 453
        Height = 19
        EditButtons = <>
        Flat = True
        TabOrder = 1
        Visible = True
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1044#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072' '#1085#1077#1087#1086#1083#1072#1076#1086#1082
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 159
        Height = 13
        Caption = #1040#1076#1088#1077#1089' '#1090#1077#1093#1085#1080#1095#1077#1089#1082#1086#1081' '#1087#1086#1076#1076#1077#1088#1078#1082#1080':'
      end
      object eMail: TLabel
        Left = 4
        Top = 29
        Width = 3
        Height = 13
      end
      object cbAutoMail: TCheckBox
        Left = 3
        Top = 27
        Width = 289
        Height = 17
        Caption = #1054#1090#1087#1088#1072#1074#1083#1103#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1103' '#1086#1073' '#1086#1096#1080#1073#1082#1077' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
        TabOrder = 0
      end
      object cbLogToFile: TCheckBox
        Left = 3
        Top = 50
        Width = 289
        Height = 17
        Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1078#1091#1088#1085#1072#1083#1099' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
        TabOrder = 1
      end
    end
  end
end
