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
    CommandText = 'select * from MagazineDocs'
    Parameters = <>
    Left = 12
    Top = 83
    object adodsDocsDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object adodsDocsIk_studGrup: TIntegerField
      FieldName = 'Ik_studGrup'
      ReadOnly = True
    end
    object adodsDocsnCode: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
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
end
