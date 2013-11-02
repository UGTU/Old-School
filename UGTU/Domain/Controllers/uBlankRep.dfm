object frmRepPreview: TfrmRepPreview
  Left = 236
  Top = 438
  Width = 316
  Height = 98
  Caption = 'frmRepPreview'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 308
    Height = 64
    Align = alClient
    TabOrder = 0
  end
  object rvdsMain: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.adospSelVedEkz
    Left = 28
    Top = 1
  end
  object RvProject1: TRvProject
    ProjectFile = 'D:\4All\LAST(22)\Reports\Main.rav'
    Left = 1
    Top = 1
  end
  object rvdsTop: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.adospVedTop
    Left = 57
    Top = 1
  end
  object RvProject2: TRvProject
    ProjectFile = 'Reports\Napr.rav'
    Left = 2
    Top = 31
  end
  object rvNaprDSConn: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.aspNapr
    Left = 30
    Top = 31
  end
  object rvdsMainKP: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.adospSelVedKP
    Left = 83
  end
  object rvdsBottom: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.adospSelVedBottom
    Left = 110
  end
  object rvdsDiplTop: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.adospGetVipiscaForDiplom
    Left = 136
  end
  object dscSelUspevForVipisca: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.adospSelUspevForVipisca
    Left = 160
  end
  object rvdsSelKPForVipisca: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.adospSelKPForVipisca
    Left = 187
  end
  object rvdsSelKRForVipisca: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.adospSelKRForVipisca
    Left = 212
    Top = 65535
  end
end
