object DetailsForm: TDetailsForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1073#1086#1088#1082#1077
  ClientHeight = 253
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 216
    Width = 428
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      428
      37)
    object Button1: TButton
      Left = 329
      Top = 6
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 1
      TabOrder = 0
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 428
    Height = 216
    Align = alClient
    Columns = <
      item
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088
        Width = 150
      end
      item
        Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Width = 250
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    Items.ItemData = {
      012C0100000500000000000000FFFFFFFFFFFFFFFF0000000000000000142304
      4104420430043D043E0432043B0435043D043D0430044F042000320435044004
      410438044F0400000000FFFFFFFFFFFFFFFF00000000000000001014043E0441
      04420443043F043D0430044F042000320435044004410438044F0400000000FF
      FFFFFFFFFFFFFF00000000000000001020002000200020002000140430044204
      30042000410431043E0440043A04380400000000FFFFFFFFFFFFFFFF00000000
      0000000017200020002000200020002004300437043C04350440042000410431
      043E0440043A043804200028001C043104290000000000FFFFFFFFFFFFFFFF00
      0000000000000014200020002000200020001E043F043804410430043D043804
      35042000410431043E0440043A043804}
    RowSelect = True
    ParentFont = False
    ShowWorkAreas = True
    TabOrder = 1
    ViewStyle = vsReport
    ExplicitHeight = 222
  end
end
