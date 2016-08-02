object dmAbiturientAction: TdmAbiturientAction
  OldCreateOrder = False
  Height = 421
  Width = 473
  object aspAbitDelExam: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_Del_vstup_ekz;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 51
    Top = 146
  end
  object aspAppendAbit: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'AppendAbit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@flag'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Clastn'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@firstn'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@otch'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@birth'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@placebirth'
        Attributes = [paNullable]
        DataType = ftString
        Size = 300
        Value = Null
      end
      item
        Name = '@inval'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@deti'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@rab'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@sex'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@obchegit'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ik_medal'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_voen_zvanie'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SotTel'
        Attributes = [paNullable]
        DataType = ftString
        Size = 500
        Value = Null
      end
      item
        Name = '@telefon'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@Email'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Photo'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@pens'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@grazd'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@podg'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@nac'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ob_rab'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@sempol'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@spec_uch'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@zaved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@godokon'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ind_f'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@street_f'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Build_f'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4
        Value = Null
      end
      item
        Name = '@Stroen_f'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4
        Value = Null
      end
      item
        Name = '@Kvart_f'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4
        Value = Null
      end
      item
        Name = '@ind_pr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@Street_pr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Build_pr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4
        Value = Null
      end
      item
        Name = '@Stroen_pr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4
        Value = Null
      end
      item
        Name = '@Kvart_pr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4
        Value = Null
      end
      item
        Name = '@dopsved'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2000
        Value = Null
      end
      item
        Name = '@code'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@StazYear'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@StazMonth'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@cDolgnost'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@ik_pred'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CLgot'
        Attributes = [paNullable]
        DataType = ftString
        Size = 500
        Value = Null
      end>
    Left = 53
    Top = 17
  end
  object aspAddExam: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_add_vstup_exam;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@cosenka'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NN_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_sdach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NNvedom'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 54
    Top = 74
  end
  object aspDocsRetrieve: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_Docs_Retrieve;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@nn_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 160
    Top = 145
  end
  object aspAbitMove: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_Perevod;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@nn_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NewNNrecord'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NewRegNomer'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Newik_kat_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Newdd_pod_zayav'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 169
    Top = 21
  end
  object adospPrintZayavl: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_get_InfForZayavl;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@NN_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 164
    Top = 268
    object adospPrintZayavlRegNomer: TIntegerField
      FieldName = 'RegNomer'
    end
    object adospPrintZayavlClastname: TStringField
      FieldName = 'Clastname'
      Size = 30
    end
    object adospPrintZayavlCfirstname: TStringField
      FieldName = 'Cfirstname'
      Size = 30
    end
    object adospPrintZayavlCotch: TStringField
      FieldName = 'Cotch'
      Size = 30
    end
    object adospPrintZayavlDd_birth: TDateTimeField
      FieldName = 'Dd_birth'
    end
    object adospPrintZayavlCplacebirth: TStringField
      FieldName = 'Cplacebirth'
      Size = 100
    end
    object adospPrintZayavlc_grazd: TStringField
      FieldName = 'c_grazd'
      Size = 50
    end
    object adospPrintZayavludostover: TStringField
      FieldName = 'udostover'
      Size = 50
    end
    object adospPrintZayavlPCd_seria: TStringField
      FieldName = 'PCd_seria'
      Size = 10
    end
    object adospPrintZayavlPNp_number: TStringField
      FieldName = 'PNp_number'
      Size = 15
    end
    object adospPrintZayavlPDate: TIntegerField
      FieldName = 'PDate'
      ReadOnly = True
    end
    object adospPrintZayavlPMonth: TIntegerField
      FieldName = 'PMonth'
      ReadOnly = True
    end
    object adospPrintZayavlPYear: TIntegerField
      FieldName = 'PYear'
      ReadOnly = True
    end
    object adospPrintZayavlPCd_kem_vidan: TStringField
      FieldName = 'PCd_kem_vidan'
      Size = 50
    end
    object adospPrintZayavlcIndex_fact: TStringField
      FieldName = 'cIndex_fact'
      Size = 6
    end
    object adospPrintZayavlAddress1: TStringField
      FieldName = 'Address1'
      ReadOnly = True
      Size = 51
    end
    object adospPrintZayavlAddress2: TStringField
      FieldName = 'Address2'
      ReadOnly = True
      Size = 103
    end
    object adospPrintZayavlAddress3: TStringField
      FieldName = 'Address3'
      ReadOnly = True
      Size = 204
    end
    object adospPrintZayavlcSotTel: TStringField
      FieldName = 'cSotTel'
      Size = 50
    end
    object adospPrintZayavlctelefon: TStringField
      FieldName = 'ctelefon'
    end
    object adospPrintZayavlCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 80
    end
    object adospPrintZayavlCname_fac: TStringField
      FieldName = 'Cname_fac'
      Size = 100
    end
    object adospPrintZayavlik_fac: TIntegerField
      FieldName = 'ik_fac'
    end
    object adospPrintZayavlik_type_kat: TIntegerField
      FieldName = 'ik_type_kat'
    end
    object adospPrintZayavlNgodokon: TBCDField
      FieldName = 'Ngodokon'
      Precision = 18
      Size = 0
    end
    object adospPrintZayavlAIk_vid_doc: TIntegerField
      FieldName = 'AIk_vid_doc'
    end
    object adospPrintZayavlACd_seria: TStringField
      FieldName = 'ACd_seria'
      Size = 10
    end
    object adospPrintZayavlANp_number: TStringField
      FieldName = 'ANp_number'
      Size = 15
    end
    object adospPrintZayavlik_medal: TIntegerField
      FieldName = 'ik_medal'
    end
    object adospPrintZayavlStazYear: TIntegerField
      FieldName = 'StazYear'
    end
    object adospPrintZayavlStazMonth: TIntegerField
      FieldName = 'StazMonth'
    end
    object adospPrintZayavlLobchegit: TBooleanField
      FieldName = 'Lobchegit'
    end
    object adospPrintZayavlCdopsved: TStringField
      FieldName = 'Cdopsved'
      Size = 1000
    end
    object adospPrintZayavlFIO: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 35
    end
    object adospPrintZayavlCLgot: TStringField
      FieldName = 'CLgot'
      Size = 500
    end
    object adospPrintZayavlik_kat_zaved: TIntegerField
      FieldName = 'ik_kat_zaved'
    end
    object adospPrintZayavlckat_zaved: TStringField
      FieldName = 'ckat_zaved'
      Size = 150
    end
    object adospPrintZayavlZDate: TIntegerField
      FieldName = 'ZDate'
      ReadOnly = True
    end
    object adospPrintZayavlZMonth: TIntegerField
      FieldName = 'ZMonth'
      ReadOnly = True
    end
    object adospPrintZayavlZYear: TIntegerField
      FieldName = 'ZYear'
      ReadOnly = True
    end
    object adospPrintZayavlIsRussOlimpWinner: TBooleanField
      FieldName = 'IsRussOlimpWinner'
    end
    object adospPrintZayavlEducationLevelName: TStringField
      FieldName = 'EducationLevelName'
      Size = 500
    end
    object adospPrintZayavlIk_form_ed: TIntegerField
      FieldName = 'Ik_form_ed'
    end
    object adospPrintZayavlnCode: TBCDField
      FieldName = 'nCode'
      ReadOnly = True
      Precision = 18
      Size = 0
    end
    object adospPrintZayavlcurrentIK_kat_zaved: TAutoIncField
      FieldName = 'currentIK_kat_zaved'
      ReadOnly = True
    end
    object adospPrintZayavlIsNotFirstEducation: TBooleanField
      FieldName = 'IsNotFirstEducation'
      ReadOnly = True
    end
    object adospPrintZayavlcEmail: TStringField
      FieldName = 'cEmail'
      Size = 50
    end
    object adospPrintZayavlFullName: TStringField
      FieldName = 'FullName'
      Size = 92
    end
  end
  object adospAbit_docsForZayavl: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_get_DocsForZayavl;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NN_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 49
    Top = 261
    object adospAbit_docsForZayavlNp_number: TStringField
      FieldName = 'Np_number'
      ReadOnly = True
      Size = 50
    end
    object adospAbit_docsForZayavlCd_seria: TStringField
      FieldName = 'Cd_seria'
      ReadOnly = True
      Size = 50
    end
    object adospAbit_docsForZayavlIk_vid_doc: TIntegerField
      FieldName = 'Ik_vid_doc'
      ReadOnly = True
    end
    object adospAbit_docsForZayavlcvid_doc: TStringField
      FieldName = 'cvid_doc'
      ReadOnly = True
      Size = 50
    end
  end
  object aspAbitDelPostup: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_del_postup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@nn_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 39
    Top = 348
  end
  object aspEditPostup: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_edit_postup_341;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@RegNomer'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@nCode'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
        Value = Null
      end
      item
        Name = '@NNrecord'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_kat_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@dd_pod_zayav'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@nn_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Realy_postup'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@IsMain'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@SchoolAverMark'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@idTargetOrganization'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = '@NeedCheckEGE'
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@dateOriginal'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 143
    Top = 340
  end
  object aspAddPostup: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_add_postup_341;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@RegNomer'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@nCode'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
        Value = Null
      end
      item
        Name = '@NNrecord'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_kat_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@dd_pod_zayav'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Realy_postup'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@IsMain'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@SchoolAverMark'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@idTargetOrganization'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = '@NeedCheckEGE'
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@dateOriginal'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 355
    Top = 77
  end
  object adospInsertPredpr: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'InsertPredpr;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Cname_pred'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end>
    Left = 170
    Top = 74
  end
  object aspGetNewNum: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_GetNextRegNumber;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NNrecord'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 49
    Top = 205
  end
  object aspGetAdditionalspec: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_Get_AdditionalSpec;1'
    Parameters = <>
    Left = 153
    Top = 205
    object aspGetAdditionalspecSpecNumber: TIntegerField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'SpecNumber'
    end
    object aspGetAdditionalspecCname_spec: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
      FieldName = 'Cname_spec'
      Size = 150
    end
    object aspGetAdditionalspecik_spec: TIntegerField
      FieldName = 'ik_spec'
      Visible = False
    end
    object aspGetAdditionalspecCshort_spec: TStringField
      FieldName = 'Cshort_spec'
      Visible = False
      Size = 10
    end
    object aspGetAdditionalspecNN_abit: TIntegerField
      FieldName = 'NN_abit'
      Visible = False
    end
    object aspGetAdditionalspecNNrecord: TIntegerField
      FieldName = 'NNrecord'
      Visible = False
    end
    object aspGetAdditionalspecik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
      Visible = False
    end
  end
  object aspDelSpec: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_Del_abitSpec;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_specAbit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 262
    Top = 146
  end
  object aspAddSpec: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_Add_abitSpec;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NNrecord'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NN_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SpecNumber'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 262
    Top = 74
  end
  object dsAbitAdditionalSpec: TDataSource
    DataSet = aspGetAdditionalspec
    Left = 248
    Top = 208
  end
  object aspAbitReturn: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_Vosstan;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@nn_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NewNNrecord'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NewRegNomer'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Newik_kat_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Newdd_pod_zayav'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 257
    Top = 21
  end
  object aspGetOtherspec: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_Get_OtherSpec;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@NN_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 249
    Top = 269
    object aspGetOtherspecRegNomer: TIntegerField
      DisplayLabel = #8470
      FieldName = 'RegNomer'
    end
    object aspGetOtherspecik_kat_zach: TIntegerField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'ik_kat_zach'
      Visible = False
    end
    object aspGetOtherspecNaborName: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1085#1072#1073#1086#1088#1072
      FieldName = 'NaborName'
      ReadOnly = True
      Size = 173
    end
    object aspGetOtherspeccname_zach: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'cname_zach'
      FixedChar = True
      Size = 30
    end
    object aspGetOtherspecCname_kat_zach: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'Cname_kat_zach'
      Size = 50
    end
    object aspGetOtherspecdd_pod_zayav: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080
      FieldName = 'dd_pod_zayav'
    end
    object aspGetOtherspecIsMain: TBooleanField
      DisplayLabel = #1055
      FieldName = 'IsMain'
    end
    object aspGetOtherspecRealy_postup: TBooleanField
      DisplayLabel = #1044
      FieldName = 'Realy_postup'
    end
    object aspGetOtherspecdateOriginal: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1088#1080#1075#1080#1085#1072#1083#1072
      FieldName = 'dateOriginal'
    end
  end
  object dsAbitOtherlSpec: TDataSource
    DataSet = aspGetOtherspec
    Left = 240
    Top = 344
  end
  object aspAbitConfirmOnline: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_confirm_postup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@nn_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 361
    Top = 21
  end
  object aspAddExamByName: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_add_vstup_examByName;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@cosenka'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NN_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@'#1089'name_disc'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@ik_sdach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NNvedom'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 358
    Top = 210
  end
  object aspDoubles: TADODataSet
    Connection = dm.DBConnect
    CommandText = 'select dbo.DoublesCount'
    Parameters = <
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = '@LastName'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = '@Birthdate'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = '@year'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end
      item
        Name = '@Result'
        DataType = ftInteger
        Direction = pdReturnValue
        Value = Null
      end>
    Left = 352
    Top = 288
  end
end
