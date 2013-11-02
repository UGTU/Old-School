object frmWaiting: TfrmWaiting
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #1054#1078#1080#1076#1072#1085#1080#1077
  ClientHeight = 77
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 320
    Height = 13
    Caption = #1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1076#1083#1080#1090#1077#1083#1100#1085#1072#1103' '#1086#1087#1077#1088#1072#1094#1080#1103'. '#1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1087#1086#1076#1086#1078#1076#1080#1090#1077':'
  end
  object lstep: TLabel
    Left = 408
    Top = 55
    Width = 17
    Height = 13
    Alignment = taRightJustify
  end
  object eStatus: TEdit
    Left = 8
    Top = 55
    Width = 313
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clBtnFace
    TabOrder = 0
    Text = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093'...'
  end
  object pbMain: TProgressBar
    Left = 8
    Top = 27
    Width = 427
    Height = 22
    Smooth = True
    TabOrder = 1
  end
  object ActionComponentUI1: TActionComponentUI
    QuitOnError = True
    ShowOnComplete = True
    Left = 288
    Top = 16
  end
  object WindowReportControlCollection1: TWindowReportControlCollection
    CompleteText = #1047#1072#1074#1077#1088#1096#1077#1085#1086
    OnProgressMessage = WindowReportControlCollection1ProgressMessage
    Left = 328
    Top = 16
  end
  object ProgressBarReportControl1: TProgressBarReportControl
    ProgressBar = pbMain
    Left = 368
    Top = 16
  end
end
