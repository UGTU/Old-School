inherited frmFgosEditCompetence: TfrmFgosEditCompetence
  Caption = 'frmFgosEditCompetence'
  ClientHeight = 266
  ClientWidth = 474
  ExplicitWidth = 480
  ExplicitHeight = 293
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 474
    Height = 225
    ExplicitWidth = 474
    ExplicitHeight = 225
  end
  inherited Panel1: TPanel
    Top = 225
    Width = 474
    ExplicitTop = 225
    ExplicitWidth = 474
    inherited bbOK: TBitBtn
      Left = 217
      ExplicitLeft = 217
    end
    inherited bbApply: TBitBtn
      Left = 385
      ExplicitLeft = 385
    end
    inherited bbCancel: TBitBtn
      Left = 301
      ExplicitLeft = 301
    end
  end
  object RichEdit1: TRichEdit [2]
    Left = 0
    Top = 0
    Width = 474
    Height = 225
    Align = alClient
    Lines.Strings = (
      'RichEdit1')
    TabOrder = 1
    OnChange = RichEdit1Change
  end
  inherited actBaseDialog: TActionList
    Left = 145
    Top = 232
  end
end
