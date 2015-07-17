inherited frmReviewNeusp: TfrmReviewNeusp
  Caption = 'frmReviewNeusp'
  ClientHeight = 487
  ClientWidth = 467
  OnActivate = FormActivate
  ExplicitWidth = 473
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 467
    Height = 447
    ExplicitLeft = -8
    ExplicitTop = 32
    ExplicitWidth = 453
    ExplicitHeight = 393
  end
  inherited Label1: TLabel
    Left = 29
    ExplicitLeft = 29
  end
  inherited Label2: TLabel
    Left = 30
    ExplicitLeft = 30
  end
  inherited Label3: TLabel
    Left = 29
    Top = 363
    ExplicitLeft = 29
    ExplicitTop = 363
  end
  inherited Label4: TLabel
    Left = 209
    Top = 363
    ExplicitLeft = 209
    ExplicitTop = 363
  end
  inherited Label5: TLabel
    Left = 27
    Top = 403
    ExplicitLeft = 27
    ExplicitTop = 403
  end
  object Label6: TLabel [6]
    Left = 27
    Top = 288
    Width = 60
    Height = 13
    Caption = #1054#1090#1095#1080#1089#1083#1077#1085#1080#1077
  end
  object Label7: TLabel [7]
    Left = 27
    Top = 323
    Width = 58
    Height = 13
    Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077
  end
  inherited Panel1: TPanel
    Top = 447
    Width = 467
    ExplicitTop = 447
    ExplicitWidth = 453
    inherited bbOK: TBitBtn
      Left = 292
      ExplicitLeft = 278
    end
    inherited bbApply: TBitBtn
      Left = 44
      ExplicitLeft = 30
    end
    inherited bbCancel: TBitBtn
      Left = 379
      ExplicitLeft = 365
    end
    inherited BitBtn1: TBitBtn
      Left = 146
      ExplicitLeft = 132
    end
  end
  inherited eDest: TEdit
    Left = 144
    Width = 289
    ExplicitLeft = 144
    ExplicitWidth = 289
  end
  inherited eNum: TEdit
    Left = 144
    Top = 360
    Width = 49
    ExplicitLeft = 144
    ExplicitTop = 360
    ExplicitWidth = 49
  end
  inherited eInd: TEdit
    Left = 253
    Top = 360
    ExplicitLeft = 253
    ExplicitTop = 360
  end
  inherited dtUtv: TDateTimePicker
    Left = 144
    Width = 289
    ExplicitLeft = 144
    ExplicitWidth = 289
  end
  inherited dtGot: TDateTimePicker
    Left = 144
    Top = 395
    Width = 289
    ExplicitLeft = 144
    ExplicitTop = 395
    ExplicitWidth = 289
  end
  object DBGridEh1: TDBGridEh [14]
    Left = 29
    Top = 83
    Width = 404
    Height = 177
    DataSource = dmDocs.dsNeusp
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 6
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'flag'
        Footers = <>
        KeyList.Strings = (
          '1;'
          '0')
        ReadOnly = False
        Title.Caption = #1042#1099#1073#1086#1088
        Width = 38
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'cName_disc'
        Footers = <>
        Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
        Width = 217
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'cName_vid_zanyat'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1103
        Width = 71
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'n_sem'
        Footers = <>
        Title.Caption = #1057#1077#1084#1077#1089#1090#1088
        Width = 50
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DateTimePicker1: TDateTimePicker [15]
    Left = 144
    Top = 280
    Width = 289
    Height = 21
    Date = 42157.496028958330000000
    Time = 42157.496028958330000000
    TabOrder = 7
  end
  object mNamePric: TMemo [16]
    Left = 144
    Top = 307
    Width = 289
    Height = 45
    Lines.Strings = (
      'mNamePric')
    TabOrder = 8
  end
  inherited actBaseDialog: TActionList
    Left = 409
    Top = 296
  end
end
