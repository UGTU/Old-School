object LessonSheduleForm: TLessonSheduleForm
  Left = 0
  Top = 0
  Caption = 'LessonSheduleForm'
  ClientHeight = 542
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline fmLessonShedule1: TfmLessonShedule
    Left = 0
    Top = 0
    Width = 761
    Height = 542
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 761
    ExplicitHeight = 542
    inherited Panel4: TPanel
      Top = 517
      Width = 761
      ExplicitTop = 517
      ExplicitWidth = 761
      inherited Panel15: TPanel
        Left = 494
        ExplicitLeft = 494
      end
    end
    inherited Panel5: TPanel
      Width = 761
      Height = 517
      ExplicitWidth = 761
      ExplicitHeight = 517
      inherited Panel14: TPanel
        Width = 761
        ExplicitWidth = 761
      end
    end
    inherited Panel6: TPanel
      Left = 518
      Top = 88
      ExplicitLeft = 518
      ExplicitTop = 88
      inherited Panel9: TPanel
        inherited MonthCalendar1: TMonthCalendar
          Date = 39488.591432835640000000
        end
        inherited MonthCalendar2: TMonthCalendar
          Date = 39517.591432847220000000
        end
        inherited MonthCalendar3: TMonthCalendar
          Date = 39548.591432858800000000
        end
      end
    end
  end
end
