inherited frmReviewNeusp: TfrmReviewNeusp
  Caption = 'frmReviewNeusp'
  ClientHeight = 513
  ClientWidth = 445
  Menu = MainMenu1
  ExplicitWidth = 451
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 445
    Height = 473
    ExplicitTop = 8
    ExplicitWidth = 445
    ExplicitHeight = 473
  end
  inherited Label3: TLabel
    Left = 21
    Top = 401
    ExplicitLeft = 21
    ExplicitTop = 401
  end
  inherited Label4: TLabel
    Left = 218
    Top = 401
    ExplicitLeft = 218
    ExplicitTop = 401
  end
  inherited Label5: TLabel
    Left = 19
    Top = 443
    ExplicitLeft = 19
    ExplicitTop = 443
  end
  object Label6: TLabel [6]
    Left = 20
    Top = 318
    Width = 58
    Height = 13
    Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077
  end
  object Label7: TLabel [7]
    Left = 20
    Top = 283
    Width = 87
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1090#1095#1077#1089#1083#1077#1085#1080#1103
  end
  inherited Panel1: TPanel
    Top = 473
    Width = 445
    ExplicitTop = 473
    ExplicitWidth = 445
    inherited bbOK: TBitBtn
      Left = 270
      ExplicitLeft = 270
    end
    inherited bbApply: TBitBtn
      Left = 22
      ExplicitLeft = 22
    end
    inherited bbCancel: TBitBtn
      Left = 357
      ExplicitLeft = 357
    end
    inherited BitBtn1: TBitBtn
      Left = 124
      ExplicitLeft = 124
    end
  end
  inherited eNum: TEdit
    Top = 398
    ExplicitTop = 398
  end
  inherited eInd: TEdit
    Left = 270
    Top = 398
    ExplicitLeft = 270
    ExplicitTop = 398
  end
  inherited dtGot: TDateTimePicker
    Top = 435
    ExplicitTop = 435
  end
  object dtOtch: TDateTimePicker [14]
    Left = 144
    Top = 275
    Width = 265
    Height = 21
    Date = 42208.579681250000000000
    Time = 42208.579681250000000000
    TabOrder = 6
  end
  object DBGridEh1: TDBGridEh [15]
    Left = 22
    Top = 99
    Width = 387
    Height = 158
    DataSource = dsNeusp
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 7
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'flag'
        Footers = <>
        Title.Caption = #1042#1099#1073#1086#1088
        Width = 44
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'cName_disc'
        Footers = <>
        Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
        Width = 165
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'cName_vid_zanyat'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1089#1076#1072#1095#1080
        Width = 79
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'n_sem'
        Footers = <>
        Title.Caption = #1057#1077#1084#1077#1089#1090#1088
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object mPric: TMemo [16]
    Left = 144
    Top = 315
    Width = 265
    Height = 77
    Lines.Strings = (
      'mPric')
    TabOrder = 8
  end
  inherited actBaseDialog: TActionList
    Left = 377
    Top = 360
  end
  object dsNeusp: TDataSource
    Left = 264
    Top = 192
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 352
  end
end
