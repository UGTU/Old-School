inherited frmJoinGroup: TfrmJoinGroup
  Left = 173
  Top = 235
  Caption = #1047#1072#1095#1080#1089#1083#1077#1085#1080#1077' '#1074' '#1075#1088#1091#1087#1087#1091
  ClientHeight = 133
  ClientWidth = 310
  Constraints.MinHeight = 160
  Constraints.MinWidth = 304
  OldCreateOrder = True
  OnCloseQuery = nil
  OnShow = FormShow
  ExplicitWidth = 316
  ExplicitHeight = 162
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 310
    Height = 0
    ExplicitWidth = 310
    ExplicitHeight = 105
  end
  object Label2: TLabel [1]
    Left = 15
    Top = 50
    Width = 98
    Height = 13
    Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100' '#1074' '#1075#1088#1091#1087#1087#1091
  end
  object Label4: TLabel [2]
    Left = 15
    Top = 8
    Width = 105
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
  end
  object Label5: TLabel [3]
    Left = 123
    Top = 8
    Width = 4
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel [4]
    Left = 115
    Top = 50
    Width = 4
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 0
    Width = 310
    Height = 133
    ExplicitTop = 0
    ExplicitWidth = 310
    ExplicitHeight = 133
    object SpeedButton2: TSpeedButton [0]
      Left = 278
      Top = 63
      Width = 23
      Height = 22
      Anchors = [akLeft, akTop, akRight, akBottom]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCE6E8E7D4D4D4D4D4
        D4E5E8E7FBFDFCFFFFFFFCFBFBE3E3E3D4D4D4D3D3D3D3D3D3D3D3D3D3D3D3D4
        D4D4E1E1E1B5BDB931996E00AB6C00AB6C31996EB7BFBBFCFDFCCCC8C5AF7340
        C17634C27836C27836C27836C27836C17634AC734114A16A00CA8B3FD3A23FD3
        A200CA8B14A169DDE3E1A5907CE1A76EDF9D5CDE9C5BDE9B59DE9B59DE9C5BE0
        9D5D89985900C08100BF7E7FDCB97FDCB900BF7E00C08182A293AB9886EABA88
        E8AE6FE8AC6CECD0B2E8CDAFE8AC6DEAAE707F9A5B12C588FFFFFFFFFFFFFFFF
        FFFFFFFF14C589759A88AF9D8BF2D3B1F1BD80F5D1A6F7F8F7EEEEECEEC99EF3
        BE818EAF7A39C79600B7747FD8B47FD8B400B7743EC99891BDA9F7F3F0DFB285
        F2D4B6CEE4EF78ACC75E91ACA5B8C1F8D4B3BDA67228A67142CC9B42C69342C6
        9443CC9B3FAC7CF3F9F7FFFFFFFFFFFFD8CCBF93A2A369A2C0548AA8707E7B7C
        AB783AA77D33A17341AB7C4AB2814BB38331A7737F9991FFFFFFFFFFFFFEFEFE
        ADB4B977B9DD7BBADC6EACCE5B96BB5AB09A3CB1827AC9A8FEF6F77AC5A33FB2
        8475CCA9859C97FFFFFFFFFFFFF9F9F941638693D7F488CAEA79B8DA68A2C429
        547887DCB98EBFD76A9DB95C8AA188DABC7EBDADECF4F3FFFFFFFFFFFFF6F7F7
        184C7C3F79A3487CA470ACCE6298BA11336597ABA677AFCD6096B4406F8C9BAF
        ABFEFFFFFFFFFFFFFFFFFFFFFFF7F8F9154F7F327BAC4F8CB9426F9B26457015
        3A6B8995A08DCFEE77B5D769A5C88B98A5FCFDFDFFFFFFFFFFFFFFFFFFFEFEFF
        4D6E922473A53982B23773A21F46724F6A8A29558081C2E085C6E77BBCDD2140
        6BF6F8F8FFFFFFFFFFFFFFFFFFFFFFFFEAEFF3507497195688184F80507195E0
        E3E6184F7F30709F42729D3F698F173B6AF6F7F8FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFD2656842E7DAF4082B12A5583274B
        78FCFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC8D5E1285B881C5587275380C9D6E1FFFFFFFFFFFFFFFFFF}
      OnClick = AddGroupClick
    end
    inherited bbOK: TBitBtn
      Left = 131
      Top = 102
      Enabled = False
      ModalResult = 1
      ExplicitLeft = 131
      ExplicitTop = 102
    end
    inherited bbApply: TBitBtn
      Left = 221
      Top = 100
      Visible = False
      ExplicitLeft = 221
      ExplicitTop = 100
    end
    inherited bbCancel: TBitBtn
      Left = 218
      Top = 102
      ModalResult = 2
      ExplicitLeft = 218
      ExplicitTop = 102
    end
    inherited bbSprav: TBitBtn
      Left = -64
      Top = 102
      Visible = False
      ExplicitLeft = -64
      ExplicitTop = 102
    end
  end
  object DbcbeGroup: TDBLookupComboboxEh [6]
    Left = 15
    Top = 66
    Width = 257
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_grup'
    ListField = 'Cname_grup'
    TabOrder = 1
    Visible = True
    OnChange = DbcbeGroupChange
  end
  object dbcbeCause: TDBLookupComboboxEh [7]
    Left = 15
    Top = 24
    Width = 257
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_pric'
    ListField = 'Cname_pric'
    TabOrder = 2
    Visible = True
  end
  inherited actBaseDialog: TActionList
    Left = 233
    Top = 65528
    inherited actApply: TAction
      OnExecute = nil
    end
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
end
