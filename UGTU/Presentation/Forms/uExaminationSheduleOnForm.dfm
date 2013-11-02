object ExaminationSheduleOnForm: TExaminationSheduleOnForm
  Left = 0
  Top = 0
  Caption = 'ExaminationSheduleOnForm'
  ClientHeight = 553
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline fmExaminationShedule1: TfmExaminationShedule
    Left = 0
    Top = 0
    Width = 683
    Height = 553
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 683
    ExplicitHeight = 553
    inherited Panel5: TPanel
      Width = 683
      Height = 528
      ExplicitWidth = 683
      ExplicitHeight = 528
      inherited Panel14: TPanel
        Width = 683
        ExplicitWidth = 683
      end
    end
    inherited Panel4: TPanel
      Top = 528
      Width = 683
      ExplicitTop = 528
      ExplicitWidth = 683
      inherited Panel15: TPanel
        Left = 416
        ExplicitLeft = 416
      end
    end
  end
end
