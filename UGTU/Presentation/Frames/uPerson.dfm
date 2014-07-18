inherited fmPerson: TfmPerson
  Width = 913
  Height = 598
  ExplicitWidth = 913
  ExplicitHeight = 598
  inherited Panel1: TPanel
    Width = 913
    Height = 561
    ExplicitWidth = 913
    ExplicitHeight = 561
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 909
      Height = 557
      ActivePage = TabLichnDan
      Align = alClient
      TabOrder = 0
      object TabLichnDan: TTabSheet
        Caption = #1051#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object PageLichDannie: TPageControl
          Left = 0
          Top = 0
          Width = 901
          Height = 529
          ActivePage = TabAdress
          Align = alClient
          Constraints.MinHeight = 165
          Constraints.MinWidth = 281
          Style = tsFlatButtons
          TabOrder = 0
          OnChange = PageLichDannieChange
          object TabObjie: TTabSheet
            Caption = #1054#1073#1097#1080#1077
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 893
              Height = 498
              Align = alClient
              TabOrder = 0
              object Panel7: TPanel
                Left = 1
                Top = 1
                Width = 891
                Height = 143
                Align = alTop
                TabOrder = 1
                object Bevel2: TBevel
                  Left = 432
                  Top = 23
                  Width = 97
                  Height = 101
                end
                object Label44: TLabel
                  Left = 466
                  Top = 65
                  Width = 30
                  Height = 13
                  Caption = #1060#1054#1058#1054
                end
                object Label3: TLabel
                  Left = 158
                  Top = 48
                  Width = 23
                  Height = 13
                  Caption = #1055#1086#1083':'
                end
                object Label4: TLabel
                  Left = 13
                  Top = 48
                  Width = 84
                  Height = 13
                  Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
                end
                object Label5: TLabel
                  Left = 13
                  Top = 7
                  Width = 48
                  Height = 13
                  Caption = #1060#1072#1084#1080#1083#1080#1103':'
                end
                object Label6: TLabel
                  Left = 158
                  Top = 7
                  Width = 23
                  Height = 13
                  Caption = #1048#1084#1103':'
                end
                object Label12: TLabel
                  Left = 300
                  Top = 7
                  Width = 53
                  Height = 13
                  Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
                end
                object Label13: TLabel
                  Left = 299
                  Top = 48
                  Width = 96
                  Height = 13
                  Caption = #1057#1086#1090#1086#1074#1099#1081' '#1090#1077#1083#1077#1092#1086#1085':'
                end
                object Label18: TLabel
                  Left = 13
                  Top = 89
                  Width = 32
                  Height = 13
                  Caption = 'E-mail:'
                end
                object Label33: TLabel
                  Left = 60
                  Top = 7
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
                object Label46: TLabel
                  Left = 181
                  Top = 7
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
                object Label48: TLabel
                  Left = 352
                  Top = 7
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
                object Label49: TLabel
                  Left = 96
                  Top = 48
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
                object Label50: TLabel
                  Left = 180
                  Top = 48
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
                object iPhoto: TImage
                  Left = 438
                  Top = 30
                  Width = 84
                  Height = 89
                  Cursor = crHandPoint
                  Stretch = True
                end
                object dbcbeSex: TDBComboBoxEh
                  Left = 158
                  Top = 64
                  Width = 135
                  Height = 19
                  DynProps = <>
                  EditButtons = <>
                  Flat = True
                  Items.Strings = (
                    #1052#1091#1078#1089#1082#1086#1081
                    #1046#1077#1085#1089#1082#1080#1081)
                  ReadOnly = True
                  TabOrder = 4
                  Visible = True
                end
                object dbdteBirthDate: TDBDateTimeEditEh
                  Left = 13
                  Top = 64
                  Width = 140
                  Height = 19
                  DynProps = <>
                  EditButtons = <>
                  Flat = True
                  Kind = dtkDateEh
                  TabOrder = 3
                  Visible = True
                end
                object eFam: TDBEditEh
                  Left = 13
                  Top = 23
                  Width = 138
                  Height = 19
                  DynProps = <>
                  EditButtons = <>
                  Flat = True
                  TabOrder = 0
                  Visible = True
                  EditMask = ''
                end
                object eName: TDBEditEh
                  Left = 158
                  Top = 23
                  Width = 134
                  Height = 19
                  DynProps = <>
                  EditButtons = <>
                  Flat = True
                  TabOrder = 1
                  Visible = True
                  EditMask = ''
                end
                object eMid: TDBEditEh
                  Left = 299
                  Top = 23
                  Width = 127
                  Height = 19
                  DynProps = <>
                  EditButtons = <>
                  Flat = True
                  TabOrder = 2
                  Visible = True
                  EditMask = ''
                end
                object eEmail: TDBEditEh
                  Left = 13
                  Top = 105
                  Width = 413
                  Height = 19
                  Alignment = taLeftJustify
                  DynProps = <>
                  EditButtons = <>
                  Flat = True
                  TabOrder = 5
                  Visible = True
                end
                object eCellphone: TDBEditEh
                  Left = 298
                  Top = 63
                  Width = 128
                  Height = 19
                  DynProps = <>
                  EditButtons = <>
                  Flat = True
                  TabOrder = 6
                  Visible = True
                end
              end
              object Panel6: TPanel
                Left = 1
                Top = 144
                Width = 891
                Height = 113
                Align = alTop
                TabOrder = 0
                object Label1: TLabel
                  Left = 17
                  Top = 6
                  Width = 72
                  Height = 13
                  Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086':'
                end
                object Label58: TLabel
                  Left = 89
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
                object Label28: TLabel
                  Left = 278
                  Top = 8
                  Width = 88
                  Height = 13
                  Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100':'
                end
                object Label27: TLabel
                  Left = 17
                  Top = 50
                  Width = 89
                  Height = 13
                  Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103':'
                end
                object dbcbeCitizenship: TDBLookupComboboxEh
                  Left = 13
                  Top = 27
                  Width = 244
                  Height = 19
                  Alignment = taLeftJustify
                  DataField = ''
                  EditButtons = <>
                  Flat = True
                  KeyField = 'ik_grazd'
                  ListField = 'c_grazd'
                  ListSource = dmStudentData.dsCitizen
                  TabOrder = 0
                  Visible = True
                end
                object dbcbeNationality: TDBLookupComboboxEh
                  Left = 278
                  Top = 28
                  Width = 203
                  Height = 19
                  Alignment = taLeftJustify
                  DataField = ''
                  EditButtons = <>
                  Flat = True
                  KeyField = 'Ik_nac'
                  ListField = 'Cname_nac'
                  ListSource = dmStudentData.dsNat
                  TabOrder = 1
                  Visible = True
                end
                object eBirthPlace: TDBEditEh
                  Left = 17
                  Top = 67
                  Width = 464
                  Height = 19
                  Alignment = taLeftJustify
                  DynProps = <>
                  EditButtons = <>
                  Flat = True
                  TabOrder = 2
                  Visible = True
                end
              end
              object Panel2: TPanel
                Left = 1
                Top = 257
                Width = 891
                Height = 240
                Align = alClient
                TabOrder = 2
                object Label43: TLabel
                  Left = 17
                  Top = 24
                  Width = 253
                  Height = 13
                  Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1074#1086#1077#1085#1085#1086#1081' '#1089#1083#1091#1078#1073#1077' / '#1074#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077': '
                end
                object Label54: TLabel
                  Left = 17
                  Top = 112
                  Width = 61
                  Height = 13
                  Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
                end
                object Label51: TLabel
                  Left = 17
                  Top = 68
                  Width = 76
                  Height = 13
                  Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099':'
                end
                object cbChildren: TCheckBox
                  Left = 294
                  Top = 75
                  Width = 97
                  Height = 17
                  Caption = #1053#1072#1083#1080#1095#1080#1077' '#1076#1077#1090#1077#1081
                  TabOrder = 0
                end
                object cbJob: TCheckBox
                  Left = 294
                  Top = 135
                  Width = 118
                  Height = 17
                  Caption = #1053#1072#1083#1080#1095#1080#1077' '#1088#1072#1073#1086#1090#1099
                  TabOrder = 1
                end
                object cbInvalid: TCheckBox
                  Left = 294
                  Top = 105
                  Width = 97
                  Height = 17
                  Caption = #1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100
                  TabOrder = 2
                end
                object cbAppNeed: TCheckBox
                  Left = 294
                  Top = 45
                  Width = 164
                  Height = 17
                  Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100' '#1074' '#1086#1073#1097#1077#1078#1080#1090#1080#1080
                  TabOrder = 3
                end
                object eDuty: TDBEditEh
                  Left = 17
                  Top = 131
                  Width = 253
                  Height = 19
                  Alignment = taLeftJustify
                  DynProps = <>
                  EditButtons = <>
                  Flat = True
                  TabOrder = 4
                  Visible = True
                end
                object dbcbeEnterprise: TDBLookupComboboxEh
                  Left = 17
                  Top = 87
                  Width = 253
                  Height = 19
                  Alignment = taLeftJustify
                  DataField = ''
                  EditButtons = <>
                  Flat = True
                  KeyField = 'Ik_pred'
                  ListField = 'Cname_pred'
                  ListSource = dmStudentData.dsEnterprise
                  TabOrder = 5
                  Visible = True
                end
                object dbcbeMilitaryState: TDBLookupComboboxEh
                  Left = 17
                  Top = 43
                  Width = 255
                  Height = 19
                  Alignment = taLeftJustify
                  DataField = ''
                  EditButtons = <>
                  Flat = True
                  KeyField = 'Ik_voen_zvanie'
                  ListField = 'Cvoen_zvanie'
                  ListSource = dmStudentData.dsMilSt
                  TabOrder = 6
                  Visible = True
                end
              end
            end
          end
          object TabAdress: TTabSheet
            Caption = #1040#1076#1088#1077#1089
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 893
              Height = 498
              Align = alClient
              TabOrder = 0
              object ToolBar1: TToolBar
                Left = 1
                Top = 1
                Width = 891
                Height = 28
                ButtonHeight = 23
                Caption = 'ToolBar1'
                Images = frmMain.ImageList1
                TabOrder = 0
                object BTAddAdr: TToolButton
                  Left = 0
                  Top = 0
                  Caption = 'BTAddAdr'
                  ImageIndex = 21
                  OnClick = BTAddAdrClick
                end
                object BTEditAdr: TToolButton
                  Left = 23
                  Top = 0
                  Caption = 'BTEditAdr'
                  ImageIndex = 20
                  OnClick = BTEditAdrClick
                end
                object BTDelAdr: TToolButton
                  Left = 46
                  Top = 0
                  Caption = 'BTDelAdr'
                  ImageIndex = 22
                  OnClick = BTDelAdrClick
                end
              end
              object DBGridAdress: TDBGridEh
                Left = 1
                Top = 29
                Width = 891
                Height = 468
                Align = alClient
                AutoFitColWidths = True
                DataSource = dmStudentSelectionProcs.dsGetPersonAddress
                DynProps = <>
                Flat = True
                FooterParams.Color = clWindow
                IndicatorOptions = [gioShowRowIndicatorEh]
                Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 1
                TitleParams.MultiTitle = True
                Columns = <
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'Cstrana'
                    Footers = <>
                    Width = 74
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'Cregion'
                    Footers = <>
                    Width = 106
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'fIndex'
                    Footers = <>
                    Width = 45
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'CStreet'
                    Footers = <>
                    Width = 100
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'BuildingNumber'
                    Footers = <>
                    Width = 31
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'StructNumber'
                    Footers = <>
                    Width = 42
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'FlatNumber'
                    Footers = <>
                    Width = 54
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'AddressTypeName'
                    Footers = <>
                    Width = 111
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'DateBegin'
                    Footers = <>
                    Width = 76
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'DateEnd'
                    Footers = <>
                  end
                  item
                    DynProps = <>
                    DropDownBox.Columns = <
                      item
                      end>
                    EditButtons = <>
                    FieldName = 'Craion'
                    Footers = <>
                  end
                  item
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'Cgorod'
                    Footers = <>
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
            end
          end
          object TabSheet5: TTabSheet
            Caption = #1057#1077#1084#1100#1103' '#1080' '#1092#1072#1084#1080#1083#1080#1103
            ImageIndex = 2
            TabVisible = False
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Splitter1: TSplitter
              Left = 0
              Top = 25
              Width = 893
              Height = 3
              Cursor = crVSplit
              Align = alTop
              ExplicitWidth = 575
            end
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 893
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label38: TLabel
                Left = 323
                Top = 6
                Width = 112
                Height = 13
                Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077':'
              end
              object dbcbeFamState: TDBLookupComboboxEh
                Left = 438
                Top = 1
                Width = 157
                Height = 19
                DataField = ''
                EditButtons = <>
                Flat = True
                KeyField = 'ik_sem_pol'
                ListField = 'csem_pol'
                ListSource = dmStudentData.dsSempol
                TabOrder = 0
                Visible = True
              end
            end
            object dbgeFam: TDBGridEh
              Left = 0
              Top = 28
              Width = 893
              Height = 346
              Align = alClient
              DataSource = dmStudentSelectionProcs.dsFamily
              DynProps = <>
              Flat = True
              FooterParams.Color = clWindow
              IndicatorOptions = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object dbgeChangeFam: TDBGridEh
              Left = 0
              Top = 374
              Width = 893
              Height = 124
              Align = alBottom
              AutoFitColWidths = True
              DataSource = dmStudentSelectionProcs.dsLastnames
              DynProps = <>
              Flat = True
              FooterParams.Color = clWindow
              IndicatorOptions = []
              Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 2
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object DBNavigator2: TDBNavigator
              Left = 2
              Top = 1
              Width = 315
              Height = 21
              DataSource = dmStudentSelectionProcs.dsFamily
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit]
              Flat = True
              Hints.Strings = (
                #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
                #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
                #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084'e'#1085#1077#1085#1080#1103
                #1054#1090#1084#1077#1085#1072
                #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1091#1092#1077#1088
                '')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object Panel5: TPanel
              Left = 0
              Top = 28
              Width = 893
              Height = 346
              Align = alClient
              TabOrder = 4
              DesignSize = (
                893
                346)
              object Label2: TLabel
                Left = 17
                Top = 24
                Width = 253
                Height = 13
                Caption = #1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1074#1086#1077#1085#1085#1086#1081' '#1089#1083#1091#1078#1073#1077' / '#1074#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077': '
              end
              object Label7: TLabel
                Left = 17
                Top = 112
                Width = 61
                Height = 13
                Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
              end
              object Label8: TLabel
                Left = 17
                Top = 68
                Width = 76
                Height = 13
                Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099':'
              end
              object CheckBox1: TCheckBox
                Left = 294
                Top = 75
                Width = 97
                Height = 17
                Caption = #1053#1072#1083#1080#1095#1080#1077' '#1076#1077#1090#1077#1081
                TabOrder = 0
              end
              object CheckBox2: TCheckBox
                Left = 294
                Top = 135
                Width = 118
                Height = 17
                Caption = #1053#1072#1083#1080#1095#1080#1077' '#1088#1072#1073#1086#1090#1099
                TabOrder = 1
              end
              object CheckBox3: TCheckBox
                Left = 294
                Top = 105
                Width = 97
                Height = 17
                Caption = #1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100
                TabOrder = 2
              end
              object CheckBox4: TCheckBox
                Left = 294
                Top = 45
                Width = 164
                Height = 17
                Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100' '#1074' '#1086#1073#1097#1077#1078#1080#1090#1080#1080
                TabOrder = 3
              end
              object DBEditEh1: TDBEditEh
                Left = 17
                Top = 131
                Width = 253
                Height = 19
                Alignment = taLeftJustify
                DynProps = <>
                EditButtons = <>
                Flat = True
                TabOrder = 4
                Visible = True
              end
              object DBLookupComboboxEh1: TDBLookupComboboxEh
                Left = 17
                Top = 87
                Width = 253
                Height = 19
                Alignment = taLeftJustify
                DataField = ''
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_pred'
                ListField = 'Cname_pred'
                ListSource = dmStudentData.dsEnterprise
                TabOrder = 5
                Visible = True
              end
              object DBLookupComboboxEh2: TDBLookupComboboxEh
                Left = 17
                Top = 43
                Width = 255
                Height = 19
                Alignment = taLeftJustify
                DataField = ''
                EditButtons = <>
                Flat = True
                KeyField = 'Ik_voen_zvanie'
                ListField = 'Cvoen_zvanie'
                ListSource = dmStudentData.dsMilSt
                TabOrder = 6
                Visible = True
              end
              object dbgeAddress: TDBGridEh
                Left = 13
                Top = 192
                Width = 860
                Height = 246
                Anchors = [akLeft, akTop, akRight, akBottom]
                AutoFitColWidths = True
                DataSource = dmStudentSelectionProcs.dsLanguages
                DynProps = <>
                Flat = True
                FooterParams.Color = clWindow
                IndicatorOptions = []
                Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 7
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
            end
          end
          object TabDoc: TTabSheet
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
            ImageIndex = 3
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            DesignSize = (
              893
              498)
            object dbgeDocuments: TDBGridEh
              Left = -1
              Top = 29
              Width = 1325
              Height = 824
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoFitColWidths = True
              DataSource = dmStudentSelectionProcs.dsDocuments
              DynProps = <>
              Flat = True
              FooterParams.Color = clWindow
              IndicatorOptions = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              Columns = <
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'doc_type'
                  Footers = <>
                  Width = 175
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'Cd_seria'
                  Footers = <>
                  Width = 95
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'Np_number'
                  Footers = <>
                  Width = 115
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'Dd_vidan'
                  Footers = <>
                  Width = 144
                end
                item
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'Cd_kem_vidan'
                  Footers = <>
                  Width = 192
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object DBNavigator3: TDBNavigator
              Left = -1
              Top = 2
              Width = 315
              Height = 21
              DataSource = dmStudentSelectionProcs.dsDocuments
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit]
              Flat = True
              Hints.Strings = (
                #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
                #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
                #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084'e'#1085#1077#1085#1080#1103
                #1054#1090#1084#1077#1085#1072
                #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1091#1092#1077#1088)
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 561
    Width = 913
    ExplicitTop = 561
    ExplicitWidth = 913
    DesignSize = (
      913
      37)
    inherited bbSave: TBitBtn
      Left = 744
      ExplicitLeft = 744
    end
    inherited bbUndo: TBitBtn
      Left = 576
      ExplicitLeft = 576
    end
  end
  object ilPages: TImageList
    Left = 594
    Top = 95
    Bitmap = {
      494C010106000900340010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000515200005152000051520000515200005152000051
      5200005152000051520000515200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7EF006B5142006349
      3900634931006B49390073614A006B5139006349310063493100634931006349
      310063493100B5B6B50000000000000000000000000000000000000000000000
      0000000000000051520000CFCE0000CFCE0000FFFF0000FFFF0000FFFF0000FF
      FF00009E9C00009E9C00009E9C00007173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA69C00F7EFEF00E7DF
      D600E7CFC600DEC7BD008C8EB500D6BEB500DEB6A500D6B6A500D6AE9C00D6AE
      9400CE9E8C006349310000000000000000000000000000000000000000000000
      00000051520000CFCE0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000CFCE00007173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFF7EF00F7EF
      EF00F7EFE7003151BD001038B5006B79C600E7D7CE00EFD7C600E7CFBD00E7C7
      B500D6AE94006349310000000000000000000000000000000000000000000000
      00000051520000CFCE0000FFFF0000FFFF0073FFFF0000C7C60000C7C60073FF
      FF0000FFFF0000FFFF0000CFCE00007173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFF7EF00D6D7
      E7002949C6002951EF002149E7001038B5009C96C600EFD7C600EFCFC600E7C7
      B500D6AE94006349310000000000000000000000000000000000000000000000
      00000051520000CFCE0000FFFF0073FFFF0000C7C600FFFFFF000000000000C7
      C60000FFFF0000FFFF0000CFCE00007173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AE9C00FFF7F7001841
      BD002951F7006386FF005271F7003961EF002138B500D6C7C600EFD7CE00E7CF
      BD00D6AE9C006349310000000000000000000000000000000000000000000000
      00000051520000CFCE0000CFCE0000FFFF0000C7C600FFFFFF00000000000000
      000000C7C60000CFCE0000515200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AEA500FFFFF70084A6
      FF007B96FF007B8EF700D6D7E7007B96F7004261E7003951AD00EFD7CE00EFD7
      CE00D6B6A5006349390000000000000000000000000000000000000000000000
      0000000000000051520000CFCE0000CFCE00006984001079C6001079C6000871
      AD00004939000051520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB6A500FFFFFF00E7E7
      FF00BDC7F700F7EFEF00F7EFE700E7DFE7007B96F7002951DE005261AD00EFDF
      D600DEC7B5007359420000000000000000000000000000000000000000000000
      000000000000000000000051520000598400298EEF00319EFF00319EFF00319E
      FF001079C6000051520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00F7EFE700EFE7E700738EF7002149D6008C96
      BD00E7CFC60084695A00000000000000000000000000000000007BAE73006396
      5A00528E4A0039863100000000001879C60039A6FF0042A6FF0042A6FF0039A6
      FF00319EFF000049730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEBEAD00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7F700F7EFEF00EFE7E700F7EFE7007B96EF002149
      D6009C96BD00A58E7B0000000000000000000000000052964A00FFF7FF00E7E7
      E700EFE7EF00F7E7F70039863100218ECE0042AEFF004AB6FF004AB6FF004AAE
      FF0042AEFF001879BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF007B9EAD00638E94006386940063798C005A7184006B868C0094A6AD008CA6
      EF002949D600AD968C000000000000000000428E390000000000000000000071
      0000DEEFDE00F7F7F700EFE7EF00218ECE0052B6FF0052BEFF0052BEFF0052B6
      FF004AB6FF00218ECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF0084AEB50094D7E70094E7F7007BD7EF0063C7DE00529EB5006B868C00F7E7
      DE00E7D7CE00A5968C000000000000000000CEE7C600FFFFFF00000000000079
      000000790000DEEFDE00E7E7EF005A9E5200319ED6002996C60039A6DE004AB6
      FF0042AEF7002186B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEC7B500FFFFFF00FFFF
      FF00F7FFFF0084A6B500A5AEA5009C8E84007BC7D6004A697B00F7EFEF00EFE7
      DE00F7E7DE00847163000000000000000000E7EFE700FFFFFF00000000000079
      000008790800EFF7EF00EFEFEF005A9E5200318EBD0052A6D60073B6DE005AA6
      C600398EB50008699C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700DEC7B500D6BE
      AD00D6BEAD0073A6B500A5E7EF009CE7F7008CD7E70042617300C6AE9C00BDAE
      9C00BDA69400E7E7EF000000000000000000428E390000000000000000000871
      0800FFFFFF00FFFFFF00FFF7FF00398631002186B50084C7E70094CFEF008CC7
      E700298EBD0000496B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084B6C6007BA6B5006B96A50000000000000000000000
      000000000000000000000000000000000000000000003986310000000000FFFF
      FF00000000000000000052964A0000000000006194001871A5004296BD001871
      A50000517B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000639E5A006BA6
      6300529652008CBE8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00EFEFEF00E7E7E700DEDFDE00DEDFDE00DEDFDE00EFEF
      EF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00D6D7
      D600D6D7D600D6D7D600D6D7D600D6D7D600D6D7D600D6D7D600D6D7D600D6D7
      D600D6D7D600D6D7D600F7F7F700000000000000000000000000FFFFFF00DEDF
      DE009C9E9C005269520029612900215921001059100010591000215921003959
      39007B797B00EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6D7D60073717300C6C7C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C6C7C600C6967B00C696
      7B00BD8E7B00BD8E7300B5867300B5867300AD797300AD796B00AD716B00A571
      6B009C696B009C696300D6D7D6000000000000000000000000009CB69C001086
      100042BE420052C752003186290052C7520052C7520042BE420039B6390021AE
      210008610800D6D7D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C7C6004A514A00318EB50042617300F7F7F700BDBEBD00A5A6A500A5A6
      A500A5A6A500ADAEAD00CECFCE00EFEFEF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000B5B6B50073718C00C6968C00FFEF
      D600FFE7CE00FFE7CE00FFE7C600FFDFBD00FFDFBD00FFDFB500FFD7AD00FFD7
      AD00FFD7A5009C696300D6D7D60000000000000000000000000029A629004AC7
      4A005AC75A0052BE5200FFFFE7002186210063CF63005AC75A004ABE4A0031B6
      310008710800DEDFDE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C7
      C6004A514A002996C60084DFEF006396A500BD512900D6492100EF593900FF61
      5200FF615200D6492100A538180063514A009C9E9C00949694007B797B007371
      7300737173007B797B00BDBEBD00FFFFFF00ADD7F700398EEF008479A500F7DF
      CE00FFEFD600FFE7CE00FFE7CE00FFE7C600FFDFBD00FFDFBD00FFDFB500FFD7
      AD00FFD7AD009C696300D6D7D60000000000000000000000000031AE310052C7
      520073D7730018861800FFFFF700EFF7E7006BCF6B006BD76B005AC75A0039BE
      390052795200FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C7C6004A51
      4A002996C60084DFEF006396A50000000000C6411000EF594200FF715A00FF79
      6300CE592900D6865200FF695A00EF59420042B642002996290052C752004ABE
      4A0039B6390021AE21005A615A00F7F7F700000000007BD7FF00398EE7008479
      A500F7DFCE00FFEFD600FFE7CE00FFE7CE00FFE7C600FFDFBD00FFDFBD00FFDF
      B500FFD7AD009C696300D6D7D6000000000000000000000000001886180063CF
      63007BD77B00428E3900FFFFFF00FFFFF70084AE73007BD77B0063CF63000871
      0800E7E7E700000000000000000000000000000000000000000000000000EFE7
      DE00CEBEAD0094796B0073594200735942009C796B00ADAEAD00293042002996
      C60084DFEF006396A5000000000000000000D6967B00FF695A00FF866B00EF86
      5A00FFDFA500FFDFA500FF866B00FF61520063CF6300BDDFAD00429E42006BCF
      6B0052C7520039B639006B796B00FFFFFF0000000000000000007BC7EF003986
      DE007B79A500FFEFDE00F7DFC600F7D7C600FFDFC600FFE7C600FFDFBD00FFDF
      BD00FFDFB5009C696B00D6D7D600000000000000000000000000EFF7EF00298E
      29008CDF8C0084A66300739EAD000069A500528EA5003179180008690800EFEF
      EF00000000000000000000000000000000000000000000000000DED7D6008469
      52009C866300BDA67B00D6AE8400B596730094715A006B5142004A86940084DF
      EF006396A50000000000000000000000000000000000CE613900FF8E6B00EF9E
      7B00BD8E8400FFBE9400FF8E7300BD49180084DF8400FFFFFF00FFFFFF0063C7
      63006BCF6B00299E2900DEDFDE00000000000000000000000000DEAE84007BCF
      FF009C9E9C00D6A68C00FFF7C600FFFFDE00FFFFDE00C69E9400FFE7C600FFDF
      BD00FFDFBD00A5716B00D6D7D600000000000000000000000000000000000000
      0000D6E7D6000069A500218EDE00218EDE00218EDE001079BD0052595A00DEDF
      DE000000000000000000000000000000000000000000F7F7F7008C695A00C6AE
      8C00EFD7AD00EFD7AD00EFCFA500E7C79C00DEB68C00A5866300735142006396
      A50000000000000000000000000000000000EFEFEF004A494A00000000000820
      7B001028940000107B0063595A00319E310094E79400DED7BD00428EAD009CB6
      A50042A64200D6D7D60000000000000000000000000000000000DEAE8C00FFF7
      EF00D6A69C00FFFFCE00FFFFCE00FFFFE700FFFFFF00FFFFFF00CEA69400FFE7
      C600FFDFBD00AD716B00D6D7D600000000000000000000000000000000000000
      00005A96B500319EFF00319EFF00399EFF00319EFF00319EFF001071BD008486
      8400FFFFFF0000000000000000000000000000000000C6B6AD00B59E8400F7DF
      BD00F7E7C600F7E7C600F7DFBD00EFDFB500E7CFA500D6AE8400947152006B61
      5A0000000000000000000000000000000000101010001010100008286B001849
      AD001849B5001849AD0008186B00BDBEBD0094B6C6002996F7002996F7002996
      EF0010598C00A5A6A500FFFFFF00000000000000000000000000E7AE8C00FFFF
      F700FFE7BD00FFDFAD00FFFFCE00FFFFE700FFFFF700FFFFE700CEB69C00FFE7
      CE00FFE7C600AD797300D6D7D600000000000000000000000000000000000000
      00001079BD0039A6FF0042A6FF0042AEFF0042A6FF0039A6FF0039A6FF003959
      6B00E7E7E70000000000000000000000000000000000B59E9400CEBEA500F7EF
      CE00F7EFD600F7EFDE00F7EFD600F7E7C600EFD7B500E7C79C00B59673008C69
      5A000000000000000000000000000000000018181800212021002161C6002169
      CE002169D6002161CE0010419C00A5A6A500298EDE0039A6FF0039A6FF0039A6
      FF00319EFF005A616300EFEFEF00000000000000000000000000E7B68C00FFFF
      FF00FFF7BD00FFDFAD00FFF7C600FFFFD600FFFFDE00FFFFD600D6B69400FFE7
      CE00FFE7CE00B5867300D6D7D600000000000000000000000000000000000000
      0000319EE70042AEFF004AB6FF004AB6FF004AB6FF0042AEFF0042AEFF000861
      9400CECFCE000000000000000000000000000000000094867300E7DFC600F7F7
      DE00FFF7EF00FFFFEF00FFF7E700F7EFD600EFDFBD00E7CFA500CEA684007351
      39000000000000000000000000000000000029282900313031002161B500298E
      F7003196FF00298EF7001861C600A5A6A50042AEFF004AB6FF004AB6FF004AAE
      FF0042AEFF0018598400DEDFDE00000000000000000000000000EFB68C00FFFF
      FF00E7C7A500FFFFEF00FFDFB500FFEFB500FFEFBD00FFF7C600B58E8400FFEF
      D600FFE7CE00BD867300D6D7D600000000000000000000000000000000000000
      000039A6EF0052BEFF0052BEFF0052BEFF0052BEFF004AB6FF004AB6FF001886
      C600BDBEBD0000000000000000000000000000000000BDB6A500CEC7B500FFF7
      EF00FFFFF700FFFFF700FFF7EF00F7EFDE00F7DFC600EFCFAD00C6A67B007B59
      4A00000000000000000000000000000000001818180042414200292829001041
      9C002169DE003196F7001059A500D6D7D60052B6FF0052BEFF0052BEFF0052BE
      FF004AB6FF001879BD00D6D7D600000000000000000000000000EFBE9400FFFF
      FF00F7EFEF00FFF7EF00FFFFE700FFEFBD00FFFFCE00E7AE8C00FFEFDE00FFEF
      D600FFEFD600C68E7B00D6D7D600000000000000000000000000000000000000
      00003196D6004AB6F7002996CE0042AEF70052B6FF0052B6FF004AB6FF000869
      9C00CECFCE0000000000000000000000000000000000E7DFD600C6B6AD00F7EF
      E700FFFFF700FFFFF700FFF7EF00F7EFD600F7DFBD00E7CFA5009C866B00B5A6
      9C0000000000000000000000000000000000DEDFDE0052515200636163009C9E
      9C00737173002928290039384200FFFFFF001886BD00298EBD00318EBD001886
      CE002186CE0010618C00EFEFEF00000000000000000000000000F7BE9400FFFF
      FF00FFFFFF00FFF7F700BD9E9400D6AE9C00DEB6B500FFF7EF00FFF7E700FFE7
      D600FFD7C600C6967B00D6D7D600000000000000000000000000000000000000
      00001871A5002186B500429ED60073B6DE0063AECE00318EB500318EB5001061
      8C00EFEFEF0000000000000000000000000000000000F7F7EF00C6B6AD00D6C7
      BD00F7F7EF00FFF7E700F7F7DE00F7EFCE00E7D7B500B59E84007B594A00EFE7
      E7000000000000000000000000000000000000000000BDBEBD00636163009496
      94006B696B0029282900F7F7F700000000007BAECE0063AEDE0084C7E7009CCF
      E7003996C600B5B6BD00FFFFFF00000000000000000000000000F7C79400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7EF009C69
      6B009C696B009C696B00E7E7E700000000000000000000000000000000000000
      000000000000318EBD0073B6DE0084C7E7009CCFEF005AAED6002186B500B5B6
      BD00FFFFFF000000000000000000000000000000000000000000E7E7DE00C6B6
      AD00CEBEB500D6CFBD00DED7BD00C6B69C00A59673008C715A00D6CFC6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BAECE005AA6C600398E
      BD00C6D7DE00FFFFFF0000000000000000000000000000000000FFC79400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFE7
      B500D69E8400D6D7D60000000000000000000000000000000000000000000000
      000000000000DEEFF7002179AD00BDDFEF0084BEE7001879AD00C6CFD600FFFF
      FF0000000000000000000000000000000000000000000000000000000000F7F7
      F700E7DFD600C6BEAD00B5A69C00A5968400BDAE9C00F7E7E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFCF9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7F700F7F7EF00DEA6
      8400D6D7D600000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFC01000000008003F80000000000
      8003F000000000008003F000000000008003F020000000008003F03100000000
      8003F803000000008003FC03000000008003C203000000008003800300000000
      8003600300000000800320030000000080032003000000008003600300000000
      FC7FAD0700000000FFFFC3FF00000000F807FFFFFFFFC001C003FFF8FFFF0001
      C003FFF0007F0001C003FFE000000001C003FFC100008001C007E0030000C001
      C00FC0078001C001F00F800F0003C001F007800F0001C001F007800F0001C001
      F007800F0001C001F007800F0001C001F007800F0001C001F007800F8101C001
      F807C01FFF83C003F80FE03FFFFFC00700000000000000000000000000000000
      000000000000}
  end
end
