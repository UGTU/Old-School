inherited fmSprForGroup: TfmSprForGroup
  Left = 137
  Top = 154
  Caption = 'fmSprForGroup'
  ClientHeight = 658
  ClientWidth = 453
  Position = poDesigned
  ExplicitWidth = 459
  ExplicitHeight = 687
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 453
    Height = 618
    ExplicitLeft = 8
    ExplicitTop = -16
    ExplicitWidth = 827
    ExplicitHeight = 643
  end
  inherited Label3: TLabel
    Left = 45
    Top = 527
    ExplicitLeft = 45
    ExplicitTop = 527
  end
  inherited Label4: TLabel
    Left = 256
    Top = 523
    ExplicitLeft = 256
    ExplicitTop = 523
  end
  inherited Label5: TLabel
    Left = 41
    Top = 567
    ExplicitLeft = 41
    ExplicitTop = 567
  end
  inherited Bevel2: TBevel
    Width = 453
    Height = 618
    ExplicitLeft = 8
    ExplicitTop = -16
    ExplicitWidth = 827
    ExplicitHeight = 643
  end
  inherited Label13: TLabel
    Left = 465
    Top = 271
    Visible = False
    ExplicitLeft = 465
    ExplicitTop = 271
  end
  inherited Label14: TLabel
    Left = 464
    Top = 313
    Visible = False
    ExplicitLeft = 464
    ExplicitTop = 313
  end
  inherited Label15: TLabel
    Left = 488
    Top = 374
    ExplicitLeft = 488
    ExplicitTop = 374
  end
  inherited Label16: TLabel
    Left = 558
    Top = 271
    Visible = False
    ExplicitLeft = 558
    ExplicitTop = 271
  end
  inherited Label17: TLabel
    Left = 528
    Top = 313
    Visible = False
    ExplicitLeft = 528
    ExplicitTop = 313
  end
  inherited Panel1: TPanel
    Top = 618
    Width = 453
    ExplicitTop = 643
    ExplicitWidth = 448
    inherited bbOK: TBitBtn
      Left = 279
      ExplicitLeft = 279
    end
    inherited bbApply: TBitBtn
      Left = 30
      ExplicitLeft = 25
    end
    inherited bbCancel: TBitBtn
      Left = 365
      ExplicitLeft = 360
    end
    inherited BitBtn1: TBitBtn
      Left = 132
      ExplicitLeft = 127
    end
  end
  inherited eNum: TEdit
    Left = 168
    Top = 519
    ExplicitLeft = 168
    ExplicitTop = 519
  end
  inherited eInd: TEdit
    Left = 313
    Top = 519
    ExplicitLeft = 313
    ExplicitTop = 519
  end
  inherited dtGot: TDateTimePicker
    Left = 168
    Top = 563
    ExplicitLeft = 168
    ExplicitTop = 563
  end
  inherited cbeReason: TComboBoxEx
    Left = 448
    Top = 138
    Visible = False
    ExplicitLeft = 448
    ExplicitTop = 138
  end
  inherited rbP: TRadioButton
    Left = 528
    Visible = False
    ExplicitLeft = 528
  end
  inherited rbL: TRadioButton
    Left = 604
    Visible = False
    ExplicitLeft = 604
  end
  inherited cbexTransp: TDBLookupComboboxEh
    Left = 465
    Top = 347
    Visible = False
    ExplicitLeft = 465
    ExplicitTop = 347
  end
  object dbgAddr: TDBGridEh [34]
    Left = 22
    Top = 290
    Width = 407
    Height = 201
    DataSource = dmDocs.dsStudGrup
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 14
    OnColExit = dbgAddrColExit
    OnDrawColumnCell = dbgAddrDrawColumnCell
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PersonSmallName'
        Footers = <>
        Width = 136
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'AddressTypeName'
        Footers = <>
        Width = 131
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'StudAddr'
        Footers = <>
        Width = 307
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object cbePrich: TComboBoxEx [35]
    Left = 152
    Top = 138
    Width = 257
    Height = 22
    ItemsEx = <>
    TabOrder = 15
    OnChange = cbePrichChange
  end
  inherited actBaseDialog: TActionList
    Left = 41
    Top = 544
  end
end
