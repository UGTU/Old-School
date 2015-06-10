object dmDocs: TdmDocs
  OldCreateOrder = False
  Height = 307
  Width = 419
  object dsDocs: TDataSource
    DataSet = adodsDocs
    Left = 15
    Top = 18
  end
  object adodsDocs: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = adodsDocsCalcFields
    CommandText = 'select * from MagazineDocs'
    Parameters = <>
    Left = 12
    Top = 83
    object adodsDocsDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object adodsDocsnCode: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
    end
    object adodsDocsIk_studGrup: TIntegerField
      FieldName = 'Ik_studGrup'
      ReadOnly = True
    end
    object adodsDocsFIO: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 92
    end
    object adodsDocsIk_grup: TIntegerField
      FieldName = 'Ik_grup'
    end
    object adodsDocsCname_grup: TStringField
      FieldName = 'Cname_grup'
      Size = 50
    end
    object adodsDocsIk_form_ed: TIntegerField
      FieldName = 'Ik_form_ed'
    end
    object adodsDocsCname_form_ed: TStringField
      FieldName = 'Cname_form_ed'
      Size = 50
    end
    object adodsDocsIk_fac: TIntegerField
      FieldName = 'Ik_fac'
    end
    object adodsDocsCname_fac: TStringField
      FieldName = 'Cname_fac'
      Size = 500
    end
    object adodsDocsik_spec: TIntegerField
      FieldName = 'ik_spec'
    end
    object adodsDocsCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 300
    end
    object adodsDocsik_direction: TIntegerField
      FieldName = 'ik_direction'
    end
    object adodsDocscNameDestination: TStringField
      FieldName = 'cNameDestination'
      Size = 50
    end
    object adodsDocsIk_Document: TIntegerField
      FieldName = 'Ik_Document'
    end
    object adodsDocsIk_destination: TIntegerField
      FieldName = 'Ik_destination'
    end
    object adodsDocscName_direction: TStringField
      FieldName = 'cName_direction'
      Size = 50
    end
    object adodsDocscNameTransfer: TStringField
      FieldName = 'cNameTransfer'
      Size = 50
    end
    object adodsDocscName_type_disc: TStringField
      FieldName = 'cName_type_disc'
      Size = 30
    end
    object adodsDocsDateStartCallSpr: TWideStringField
      FieldName = 'DateStartCallSpr'
      Size = 10
    end
    object adodsDocsDateEndCallSpr: TWideStringField
      FieldName = 'DateEndCallSpr'
      Size = 10
    end
    object adodsDocsIk_Transfer: TIntegerField
      FieldName = 'Ik_Transfer'
    end
    object adodsDocsik_type_disc: TWordField
      FieldName = 'ik_type_disc'
    end
    object adodsDocsNumberDoc: TIntegerField
      FieldName = 'NumberDoc'
    end
    object adodsDocsDateReady: TDateTimeField
      FieldName = 'DateReady'
    end
    object adodsDocsNum_podrazd: TStringField
      FieldName = 'Num_podrazd'
      Size = 10
    end
    object adodsDocsPersName: TStringField
      FieldName = 'PersName'
      ReadOnly = True
      Size = 92
    end
    object adodsDocsStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
  end
  object dsReviewDoc: TDataSource
    DataSet = adodsReviewDoc
    Left = 127
    Top = 18
  end
  object adodsReviewDoc: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select * from MagazineDocs'
    Parameters = <>
    Left = 124
    Top = 83
    object StringField2: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 92
    end
    object IntegerField8: TIntegerField
      FieldName = 'Ik_destination'
    end
    object adodsReviewDoccNameDestination: TStringField
      FieldName = 'cNameDestination'
      Size = 50
    end
    object adodsReviewDocIk_studGrup: TIntegerField
      FieldName = 'Ik_studGrup'
      ReadOnly = True
    end
    object adodsReviewDocIk_Document: TIntegerField
      FieldName = 'Ik_Document'
    end
  end
  object dsPricina: TDataSource
    DataSet = adodsPricina
    Left = 223
    Top = 18
  end
  object adodsPricina: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select * from ReasonForDestination'
    Parameters = <>
    Left = 228
    Top = 83
    object adodsPricinaIk_pric: TIntegerField
      FieldName = 'Ik_pric'
    end
    object adodsPricinaCname_pric: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object adodsPricinaShortCname_pric: TStringField
      FieldName = 'ShortCname_pric'
    end
    object adodsPricinaIk_reason_issuing: TIntegerField
      FieldName = 'Ik_reason_issuing'
    end
    object adodsPricinaIk_destination: TIntegerField
      FieldName = 'Ik_destination'
    end
    object adodsPricinacNameDestination: TStringField
      FieldName = 'cNameDestination'
      Size = 50
    end
  end
  object dsStudAddres: TDataSource
    DataSet = adodsStudAddres
    Left = 327
    Top = 18
  end
  object adodsStudAddres: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select * from StudAddress'
    Parameters = <>
    Left = 324
    Top = 83
    object adodsStudAddresik_AddressType: TIntegerField
      FieldName = 'ik_AddressType'
    end
    object adodsStudAddresAddressTypeName: TStringField
      FieldName = 'AddressTypeName'
      Size = 50
    end
    object adodsStudAddresik_personAddress: TIntegerField
      FieldName = 'ik_personAddress'
    end
    object adodsStudAddresBuildingNumber: TStringField
      FieldName = 'BuildingNumber'
      Size = 10
    end
    object adodsStudAddresStructNumber: TStringField
      FieldName = 'StructNumber'
      Size = 10
    end
    object adodsStudAddresCStreet: TStringField
      FieldName = 'CStreet'
      Size = 100
    end
    object adodsStudAddrescshort_type_street: TStringField
      FieldName = 'cshort_type_street'
      Size = 50
    end
    object adodsStudAddresCType_Street: TStringField
      FieldName = 'CType_Street'
      Size = 50
    end
    object adodsStudAddresCgorod: TStringField
      FieldName = 'Cgorod'
      Size = 50
    end
    object adodsStudAddresCIndex: TStringField
      FieldName = 'CIndex'
    end
    object adodsStudAddrescshort_type_gorod: TStringField
      FieldName = 'cshort_type_gorod'
      Size = 10
    end
    object adodsStudAddresctype_gorod: TStringField
      FieldName = 'ctype_gorod'
      Size = 50
    end
    object adodsStudAddresCraion: TStringField
      FieldName = 'Craion'
      Size = 50
    end
    object adodsStudAddresCregion: TStringField
      FieldName = 'Cregion'
      Size = 50
    end
    object adodsStudAddresCstrana: TStringField
      FieldName = 'Cstrana'
      Size = 50
    end
    object adodsStudAddresbit_SNG: TBooleanField
      FieldName = 'bit_SNG'
    end
    object adodsStudAddresIk_studGrup: TIntegerField
      FieldName = 'Ik_studGrup'
    end
    object adodsStudAddresFlatNumber: TStringField
      FieldName = 'FlatNumber'
      Size = 10
    end
  end
  object dsVisa: TDataSource
    DataSet = adodsVisa
    Left = 31
    Top = 162
  end
  object adodsVisa: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = adodsDocsCalcFields
    CommandText = 'select * from MagazineDocs'
    Parameters = <>
    Left = 28
    Top = 227
    object DateTimeField1: TDateTimeField
      FieldName = 'DateCreate'
    end
    object BCDField1: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
    end
    object IntegerField1: TIntegerField
      FieldName = 'Ik_studGrup'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 92
    end
    object IntegerField2: TIntegerField
      FieldName = 'Ik_grup'
    end
    object StringField3: TStringField
      FieldName = 'Cname_grup'
      Size = 50
    end
    object IntegerField3: TIntegerField
      FieldName = 'Ik_form_ed'
    end
    object StringField4: TStringField
      FieldName = 'Cname_form_ed'
      Size = 50
    end
    object IntegerField4: TIntegerField
      FieldName = 'Ik_fac'
    end
    object StringField5: TStringField
      FieldName = 'Cname_fac'
      Size = 500
    end
    object IntegerField5: TIntegerField
      FieldName = 'ik_spec'
    end
    object StringField6: TStringField
      FieldName = 'Cname_spec'
      Size = 300
    end
    object IntegerField6: TIntegerField
      FieldName = 'ik_direction'
    end
    object StringField7: TStringField
      FieldName = 'cNameDestination'
      Size = 50
    end
    object IntegerField7: TIntegerField
      FieldName = 'Ik_Document'
    end
    object IntegerField9: TIntegerField
      FieldName = 'Ik_destination'
    end
    object StringField8: TStringField
      FieldName = 'cName_direction'
      Size = 50
    end
    object StringField9: TStringField
      FieldName = 'cNameTransfer'
      Size = 50
    end
    object StringField10: TStringField
      FieldName = 'cName_type_disc'
      Size = 30
    end
    object WideStringField1: TWideStringField
      FieldName = 'DateStartCallSpr'
      Size = 10
    end
    object WideStringField2: TWideStringField
      FieldName = 'DateEndCallSpr'
      Size = 10
    end
    object IntegerField10: TIntegerField
      FieldName = 'Ik_Transfer'
    end
    object WordField1: TWordField
      FieldName = 'ik_type_disc'
    end
    object IntegerField11: TIntegerField
      FieldName = 'NumberDoc'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DateReady'
    end
    object StringField11: TStringField
      FieldName = 'Num_podrazd'
      Size = 10
    end
    object StringField12: TStringField
      FieldName = 'PersName'
      ReadOnly = True
      Size = 92
    end
    object StringField13: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
  end
  object dsOsn: TDataSource
    DataSet = spOsn
    Left = 184
    Top = 232
  end
  object spOsn: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'FindBaseDoc;1'
    Parameters = <>
    Left = 184
    Top = 176
  end
  object adodsNeusp: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = adodsDocsCalcFields
    CommandText = 'select * from SprAkadem'
    Parameters = <>
    Left = 260
    Top = 235
    object adodsNeuspIk_studGrup: TIntegerField
      FieldName = 'Ik_studGrup'
    end
    object adodsNeuspik_upContent: TIntegerField
      FieldName = 'ik_upContent'
    end
    object adodsNeuspcName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 500
    end
    object adodsNeuspcName_vid_zanyat: TStringField
      FieldName = 'cName_vid_zanyat'
      Size = 50
    end
    object adodsNeuspn_sem: TWordField
      FieldName = 'n_sem'
    end
    object adodsNeuspflag: TBooleanField
      FieldName = 'flag'
      ReadOnly = True
    end
  end
  object dsNeusp: TDataSource
    DataSet = adodsNeusp
    Left = 263
    Top = 178
  end
end
