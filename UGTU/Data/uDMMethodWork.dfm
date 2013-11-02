object dmMethodWork: TdmMethodWork
  OldCreateOrder = False
  Height = 391
  Width = 768
  object adsMethodWorkVidZan: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From MethodWork_VidZan'
    Parameters = <>
    Left = 56
    Top = 24
    object adsMethodWorkVidZaniK_vid_zanyat: TIntegerField
      FieldName = 'iK_vid_zanyat'
      Visible = False
    end
    object adsMethodWorkVidZanNameWork: TStringField
      DisplayLabel = #1054#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'NameWarrant'
      LookupDataSet = adsWarrant
      LookupKeyFields = 'IDWarrant'
      LookupResultField = 'NameWarrant'
      KeyFields = 'IDWarrant'
      Size = 50
      Lookup = True
    end
    object adsMethodWorkVidZanIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object adsMethodWorkVidZanik_kaf: TIntegerField
      FieldName = 'ik_kaf'
      Visible = False
    end
  end
  object adsMethodWork: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'Select M2.IDMethodWork, M2.BitEdition, M2.IDMethodWorkParent, (M' +
      '1.NameWork + '#39': '#39' + M2.NameWork) as NameW From MethodWork as M1 ' +
      #13#10'inner join MethodWork as M2'#13#10'ON M1.IDMethodWork = M2.IDMethodW' +
      'orkParent'#13#10'where M2.BitEdition is not NULL'
    Parameters = <>
    Left = 56
    Top = 88
  end
  object adsNormOfTime: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From MethodWork_NormOfTime'
    Parameters = <>
    Left = 57
    Top = 156
    object adsNormOfTimeNameWork: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'NameW'
      LookupDataSet = adsMethodWork
      LookupKeyFields = 'IDMethodWork'
      LookupResultField = 'NameW'
      KeyFields = 'IDMethodWork'
      Size = 200
      Lookup = True
    end
    object adsNormOfTimeBitEdition: TBooleanField
      DisplayLabel = #1048#1079#1076#1072#1077#1090#1089#1103
      FieldKind = fkLookup
      FieldName = 'BitEdition'
      LookupDataSet = adsMethodWork
      LookupKeyFields = 'IDMethodWork'
      LookupResultField = 'BitEdition'
      KeyFields = 'IDMethodWork'
      Visible = False
      Lookup = True
    end
    object adsNormOfTimeIDNormOfTime: TIntegerField
      FieldName = 'IDNormOfTime'
      Visible = False
    end
    object adsNormOfTimeNorma: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1072#1103' ('#1095#1072#1089')'
      DisplayWidth = 7
      FieldName = 'Norma'
    end
    object adsNormOfTimeIDMethodWork: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object adsNormOfTimeNormaExpert: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1101#1082#1089#1087#1077#1088#1090' ('#1095#1072#1089')'
      DisplayWidth = 5
      FieldName = 'NormaExpert'
    end
    object adsNormOfTimeIDUnit: TIntegerField
      FieldName = 'IDUnit'
      Visible = False
    end
    object adsNormOfTimeNameUnit: TStringField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      DisplayWidth = 8
      FieldKind = fkLookup
      FieldName = 'NameUnit'
      LookupDataSet = adsUnit
      LookupKeyFields = 'IDUnit'
      LookupResultField = 'NameUnit'
      KeyFields = 'IDUnit'
      Lookup = True
    end
    object adsNormOfTimeRemark: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 10
      FieldName = 'Remark'
      Size = 50
    end
  end
  object adsFactPrep: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'Select *, (Convert(nvarchar,year_value) + '#39' - '#39' + Convert(nvarch' +
      'ar,year_value+1)) as UchYear '#13#10'From MW_FactMW2 '#13#10' inner join MW_' +
      'EditionPrepods '#13#10'ON MW_FactMW2.IDMethodEdition = MW_EditionPrepo' +
      'ds.IDMethodEdition'#13#10' inner join MW_PlanMethodWork'#13#10'ON MW_FactMW2' +
      '.IDPlanMW = MW_PlanMethodWork.IDPlanMW'#13#10' inner join Year_uch_pl'#13 +
      #10'ON MW_PlanMethodWork.ik_year = Year_uch_pl.ik_year_uch_pl'#13#10' inn' +
      'er join MW_State '#13#10'ON MW_FactMW2.IDMethodEdition = MW_State.IDMe' +
      'thodEdition'
    Parameters = <>
    Left = 49
    Top = 292
    object adsFactPrepDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1092#1072#1082#1090#1091
      FieldName = 'DateTransitionInState'
    end
    object adsFactPrepNameWork: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 100
      FieldName = 'NameWork'
      Visible = False
      Size = 100
    end
    object adsFactPrepNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 40
      FieldName = 'NameWarrant'
      Size = 50
    end
    object adsFactPrepNameMethodEdition: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'NameMethodEdition'
      Size = 100
    end
    object adsFactPrepCode: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object adsFactPrepCharacteristic: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 30
      FieldName = 'Characteristic'
      Visible = False
      Size = 200
    end
    object adsFactPrepVolume: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object adsFactPrepDrawing: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object adsFactPrepPosition: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      DisplayWidth = 12
      FieldName = 'Position'
      Visible = False
    end
    object adsFactPrepMark: TIntegerField
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      FieldName = 'Mark'
      Visible = False
    end
    object adsFactPrepUchYear: TWideStringField
      DisplayLabel = #1055#1083#1072#1085' '#1059#1052#1056
      DisplayWidth = 20
      FieldName = 'UchYear'
      ReadOnly = True
      Visible = False
      Size = 63
    end
    object adsFactPrepIDMethodEdition: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object adsFactPrepIDContentNorm: TIntegerField
      FieldName = 'IDContentNorm'
      Visible = False
    end
    object adsFactPrepIDMethodWork: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object adsFactPrepNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsFactPrepNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
  end
  object adsPlanPrep: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from dbo.discpln '#13#10'  inner join dbo.MW_FactMW2 ON dbo.d' +
      'iscpln.iK_disc =dbo.MW_FactMW2.iK_disc'#13#10' inner join MW_EditionPr' +
      'epods '#13#10'ON dbo.MW_FactMW2.IDMethodEdition = MW_EditionPrepods.ID' +
      'MethodEdition'#13#10' inner join MW_State'#13#10'ON MW_FactMW2.IDMethodEditi' +
      'on = MW_State.IDMethodEdition'
    Parameters = <>
    Left = 129
    Top = 236
    object adsPlanPrepDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1087#1083#1072#1085#1091
      DisplayWidth = 15
      FieldName = 'DateTransitionInState'
    end
    object adsPlanPrepNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 17
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField1: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 100
      FieldName = 'NameWork'
      Size = 200
    end
    object StringField2: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NameMethodEdition'
      Size = 200
    end
    object adsPlanPrepCode: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField3: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 50
      FieldName = 'Characteristic'
      Visible = False
      Size = 500
    end
    object adsPlanPrepVolume: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField5: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object adsPlanPrepPosition: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      FieldName = 'Position'
      Visible = False
    end
    object adsPlanPrepIDMethodEdition: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object adsPlanPrepIDMethodWork: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object adsPlanPrepIDMethodEditionPlan: TIntegerField
      FieldName = 'IDMethodEditionPlan'
      Visible = False
    end
    object adsPlanPrepBit_coautor: TBooleanField
      FieldName = 'Bit_coautor'
      Visible = False
    end
    object adsPlanPrepIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object adsPlanPrepIDContentNorm: TIntegerField
      FieldName = 'IDContentNorm'
      Visible = False
    end
    object adsPlanPrepNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsPlanPrepNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
    object adsPlanPrepNameUnit: TStringField
      FieldName = 'NameUnit'
      Visible = False
      Size = 50
    end
    object adsPlanPrepBit_plan_fact: TBooleanField
      FieldName = 'Bit_plan_fact'
    end
    object adsPlanPrepcName_disc: TStringField
      FieldName = 'cName_disc'
      Visible = False
      Size = 100
    end
    object adsPlanPrepBitEdition: TBooleanField
      FieldName = 'BitEdition'
      Visible = False
    end
    object adsPlanPrepCurrentBitEdition: TBooleanField
      FieldName = 'CurrentBitEdition'
      Visible = False
    end
    object adsPlanPrepMark: TStringField
      FieldName = 'Mark'
      Visible = False
      Size = 15
    end
    object adsPlanPrepCountFactTime: TIntegerField
      FieldName = 'CountFactTime'
      Visible = False
    end
    object adsPlanPrepIDPlanMW: TIntegerField
      FieldName = 'IDPlanMW'
      Visible = False
    end
    object adsPlanPrepPercentCompletion: TIntegerField
      FieldName = 'PercentCompletion'
    end
  end
  object adsFactAllPrep: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from MW_AutorEdition()'#13#10' inner join dbo.MW_FactMW2'#13#10'ON ' +
      'MW_AutorEdition.ID = MW_FactMW2.IDMethodEdition'#13#10' inner join MW_' +
      'State '#13#10'ON MW_FactMW2.IDMethodEdition = MW_State.IDMethodEdition'
    Parameters = <>
    Left = 137
    Top = 292
    object adsFactAllPrepDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1092#1072#1082#1090#1091
      FieldName = 'DateTransitionInState'
    end
    object StringField6: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 100
      FieldName = 'NameWork'
      Visible = False
      Size = 100
    end
    object adsFactAllPrepNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 40
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField7: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'NameMethodEdition'
      Size = 100
    end
    object adsFactAllPrepCode: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField8: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 30
      FieldName = 'Characteristic'
      Visible = False
      Size = 200
    end
    object adsFactAllPrepVolume: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField10: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object adsFactAllPrepPosition: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      DisplayWidth = 12
      FieldName = 'Position'
      Visible = False
    end
    object IntegerField2: TIntegerField
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      FieldName = 'Mark'
      Visible = False
    end
    object adsFactAllPrepPr: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      DisplayWidth = 50
      FieldName = 'Pr'
      Size = 255
    end
    object adsFactAllPrepIDMethodEdition: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object adsFactAllPrepIDMethodWork: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object adsFactAllPrepIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object adsFactAllPrepIDContentNorm: TIntegerField
      FieldName = 'IDContentNorm'
      Visible = False
    end
    object adsFactAllPrepNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsFactAllPrepNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
  end
  object aspAutoPlanMWPrep: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'MW_Proc_PlanMW;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@TabN'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 4154
      end
      item
        Name = '@Kaf'
        DataType = ftInteger
        Size = 3
        Value = 365
      end
      item
        Name = '@YearPlanNagr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 13
      end>
    Left = 160
    Top = 176
    object aspAutoPlanMWPrepik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object aspAutoPlanMWPrepcName_disc: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 30
      FieldName = 'cName_disc'
      Size = 100
    end
    object aspAutoPlanMWPrepNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 15
      FieldName = 'NameWarrant'
      Size = 50
    end
    object aspAutoPlanMWPrepReason: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      DisplayWidth = 15
      FieldName = 'Reason'
      ReadOnly = True
    end
    object aspAutoPlanMWPrepKol: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      DisplayWidth = 8
      FieldName = 'Kol'
      ReadOnly = True
    end
    object aspAutoPlanMWPrepIDWarrant: TAutoIncField
      FieldName = 'IDWarrant'
      ReadOnly = True
      Visible = False
    end
  end
  object adsCoautor: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From MW_EditionPrepods'#13#10
    Parameters = <>
    Left = 169
    Top = 28
    object adsCoautorIDMethodEdition: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object adsCoautoritab_n: TIntegerField
      FieldName = 'itab_n'
      Visible = False
    end
    object adsCoautorBit_coautor: TBooleanField
      FieldName = 'Bit_coautor'
      Visible = False
    end
    object adsCoautorFIO: TStringField
      DisplayLabel = #1057#1086#1072#1074#1090#1086#1088
      FieldKind = fkLookup
      FieldName = 'FIO'
      LookupDataSet = adsPrepods
      LookupKeyFields = 'itab_n'
      LookupResultField = 'FIO'
      KeyFields = 'itab_n'
      Size = 50
      Lookup = True
    end
  end
  object adsPrepods: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'Select (clastname+'#39' '#39'+cfirstname+'#39' '#39'+cotch) as FIO, * From Prepo' +
      'ds'
    Parameters = <>
    Left = 240
    Top = 24
  end
  object adsDiscMW: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From MethodWork_Disc'#13#10
    Parameters = <>
    Left = 209
    Top = 108
    object adsDiscMWIDMethodEdition: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object adsDiscMWiK_disc: TIntegerField
      FieldName = 'iK_disc'
      Visible = False
    end
    object adsDiscMWNameDisc: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      FieldKind = fkLookup
      FieldName = 'cName_disc'
      LookupDataSet = adsDiscpln
      LookupKeyFields = 'iK_disc'
      LookupResultField = 'cName_disc'
      KeyFields = 'iK_disc'
      Size = 50
      Lookup = True
    end
    object adsDiscMWBit_MainDisc: TBooleanField
      FieldName = 'Bit_MainDisc'
      Visible = False
    end
  end
  object adsDiscpln: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Select * From discpln'
    Parameters = <>
    Left = 280
    Top = 104
  end
  object aspAutoPlanMWOffPrep: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'MW_Proc_PlanMWoffPrep;1'
    Parameters = <
      item
        Name = '@TabN'
        DataType = ftInteger
        Value = 4154
      end
      item
        Name = '@Kaf'
        DataType = ftInteger
        Value = 365
      end
      item
        Name = '@YearPlanNagr'
        DataType = ftInteger
        Value = 13
      end>
    Left = 280
    Top = 176
    object IntegerField1: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object StringField4: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 30
      FieldName = 'cName_disc'
      Size = 100
    end
    object aspAutoPlanMWOffPrepNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 15
      FieldName = 'NameWarrant'
      Size = 50
    end
    object aspAutoPlanMWOffPrepReason: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      DisplayWidth = 15
      FieldName = 'Reason'
      ReadOnly = True
    end
    object IntegerField3: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      DisplayWidth = 8
      FieldName = 'Kol'
      ReadOnly = True
    end
    object aspAutoPlanMWOffPrepIDWarrant: TAutoIncField
      FieldName = 'IDWarrant'
      ReadOnly = True
      Visible = False
    end
  end
  object adsPlanPrepForDisc: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select *  from MW_FactMW2'#13#10' inner join MW_State'#13#10'ON MW_FactMW2.I' +
      'DMethodEdition = MW_State.IDMethodEdition'#13#10' inner join MW_Editio' +
      'nPrepods '#13#10'ON MW_FactMW2.IDMethodEdition = MW_EditionPrepods.IDM' +
      'ethodEdition'#13#10
    Parameters = <>
    Left = 305
    Top = 236
    object adsPlanPrepForDiscDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1087#1083#1072#1085#1091
      DisplayWidth = 15
      FieldName = 'DateTransitionInState'
    end
    object adsPlanPrepForDiscNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 17
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField11: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 100
      FieldName = 'NameWork'
      Size = 200
    end
    object StringField12: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NameMethodEdition'
      Size = 50
    end
    object StringField13: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField14: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 100
      FieldName = 'Characteristic'
      Visible = False
      Size = 100
    end
    object IntegerField5: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField15: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object IntegerField6: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      FieldName = 'Position'
      Visible = False
    end
    object adsPlanPrepForDiscIDMethodEdition: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object adsPlanPrepForDiscIDMethodWork: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object adsPlanPrepForDiscIDMethodEditionPlan: TIntegerField
      FieldName = 'IDMethodEditionPlan'
      Visible = False
    end
    object adsPlanPrepForDiscBit_coautor: TBooleanField
      FieldName = 'Bit_coautor'
      Visible = False
    end
    object adsPlanPrepForDiscIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object adsPlanPrepForDiscIDContentNorm: TIntegerField
      FieldName = 'IDContentNorm'
      Visible = False
    end
    object adsPlanPrepForDiscNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsPlanPrepForDiscNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
  end
  object aspAutoPlanMWPrepConcrDisc: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'MW_Proc_PlanMWforDiscWithPrep;1'
    Parameters = <
      item
        Name = '@TabN'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = '@Kaf'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = '@YearPlanNagr'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = '@NormIK'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = '@DiscIK'
        DataType = ftInteger
        Value = Null
      end>
    Left = 528
    Top = 327
    object IntegerField7: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object StringField16: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 50
      FieldName = 'cName_disc'
      Size = 100
    end
    object IntegerField8: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      FieldName = 'Kol'
      ReadOnly = True
    end
    object StringField17: TStringField
      DisplayLabel = #1054#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'NameWork'
      Size = 50
    end
    object FloatField2: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1085#1072' '#1077#1076#1080#1085#1080#1094#1091' '#1086#1073#1098#1077#1084#1072
      DisplayWidth = 30
      FieldName = 'Norma'
    end
    object IntegerField9: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
  end
  object aspAutoPlanMWOffPrepConcrDisc: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'MW_Proc_PlanMWforDiscOffPrep;1'
    Parameters = <
      item
        Name = '@TabN'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Kaf'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@YearPlanNagr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NormIK'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DiscIK'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 592
    Top = 327
    object IntegerField10: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object StringField18: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 50
      FieldName = 'cName_disc'
      Size = 100
    end
    object IntegerField11: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      FieldName = 'Kol'
      ReadOnly = True
    end
    object StringField19: TStringField
      DisplayLabel = #1054#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'NameWork'
      Size = 50
    end
    object FloatField3: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1085#1072' '#1077#1076#1080#1085#1080#1094#1091' '#1086#1073#1098#1077#1084#1072
      DisplayWidth = 30
      FieldName = 'Norma'
    end
    object IntegerField12: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
  end
  object adsState: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From MW_State'#13#10
    Parameters = <>
    Left = 313
    Top = 28
    object adsStateIDMethodEdition: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object adsStateIDStatus: TIntegerField
      FieldName = 'IDStatus'
      Visible = False
    end
    object adsStateNameStatus: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'NameStatus'
      LookupDataSet = adsStatus
      LookupKeyFields = 'IDStatus'
      LookupResultField = 'NameStatus'
      KeyFields = 'IDStatus'
      Size = 50
      Lookup = True
    end
    object adsStateDateTransitionInState: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1077#1088#1077#1093#1086#1076#1072' '#1074' '#1089#1090#1072#1090#1091#1089
      DisplayWidth = 20
      FieldName = 'DateTransitionInState'
    end
  end
  object adsStatus: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Select * From MW_Status'
    Parameters = <>
    Left = 376
    Top = 32
  end
  object adsPlanEditionPrep: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from dbo.MW_DiscEdition()'#13#10' inner join dbo.MW_FactMW2'#13#10 +
      'ON dbo.MW_DiscEdition.ID = MW_FactMW2.IDMethodEdition'#13#10' inner jo' +
      'in MW_State'#13#10'ON MW_FactMW2.IDMethodEdition = MW_State.IDMethodEd' +
      'ition'
    Parameters = <>
    Left = 281
    Top = 293
    object adsPlanEditionPrepDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1087#1083#1072#1085#1091
      DisplayWidth = 15
      FieldName = 'DateTransitionInState'
    end
    object adsPlanEditionPrepNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 20
      FieldName = 'NameWarrant'
      Visible = False
      Size = 50
    end
    object StringField20: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 100
      FieldName = 'NameWork'
      ReadOnly = True
      Size = 200
    end
    object StringField21: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NameMethodEdition'
      ReadOnly = True
      Size = 50
    end
    object StringField22: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 12
      FieldName = 'Code'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object StringField23: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 30
      FieldName = 'Characteristic'
      ReadOnly = True
      Visible = False
      Size = 100
    end
    object IntegerField13: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1054#1073#1098#1077#1084
      DisplayWidth = 11
      FieldName = 'Volume'
      ReadOnly = True
      Visible = False
    end
    object StringField24: TStringField
      Alignment = taCenter
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 11
      FieldName = 'Drawing'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object IntegerField14: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      DisplayWidth = 12
      FieldName = 'Position'
      ReadOnly = True
      Visible = False
    end
    object StringField25: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 25
      FieldName = 'Discpl'
      ReadOnly = True
      Size = 255
    end
    object IntegerField15: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object BooleanField2: TBooleanField
      DisplayLabel = #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1080#1079#1076#1072#1085#1080#1103
      DisplayWidth = 16
      FieldName = 'BitEdition'
      ReadOnly = True
    end
    object BooleanField1: TBooleanField
      DisplayLabel = #1056#1077#1072#1083#1100#1085#1086#1089#1090#1100' '#1080#1079#1076#1072#1085#1080#1103
      DisplayWidth = 14
      FieldName = 'CurrentBitEdition'
    end
    object adsPlanEditionPrepIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object adsPlanEditionPrepNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsPlanEditionPrepNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
    object adsPlanEditionPrepIDMethodEditionPlan: TIntegerField
      FieldName = 'IDMethodEditionPlan'
      Visible = False
    end
  end
  object adsPlanPrepForDiscForDisc: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select *  from MW_FactMW2'#13#10' inner join MW_State'#13#10'ON MW_FactMW2.I' +
      'DMethodEdition = MW_State.IDMethodEdition'#13#10
    Parameters = <>
    Left = 281
    Top = 341
    object adsPlanPrepForDiscForDiscDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1087#1083#1072#1085#1091
      DisplayWidth = 15
      FieldName = 'DateTransitionInState'
    end
    object adsPlanPrepForDiscForDiscNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 20
      FieldName = 'NameWarrant'
      Visible = False
      Size = 50
    end
    object StringField26: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 100
      FieldName = 'NameWork'
      ReadOnly = True
      Size = 200
    end
    object StringField27: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NameMethodEdition'
      ReadOnly = True
      Size = 50
    end
    object StringField28: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object StringField29: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 50
      FieldName = 'Characteristic'
      ReadOnly = True
      Visible = False
      Size = 100
    end
    object IntegerField16: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      ReadOnly = True
      Visible = False
    end
    object StringField30: TStringField
      Alignment = taCenter
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object IntegerField17: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      DisplayWidth = 12
      FieldName = 'Position'
      ReadOnly = True
      Visible = False
    end
    object IntegerField18: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object BooleanField4: TBooleanField
      DisplayLabel = #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1080#1079#1076#1072#1085#1080#1103
      DisplayWidth = 15
      FieldName = 'BitEdition'
      ReadOnly = True
    end
    object BooleanField3: TBooleanField
      DisplayLabel = #1056#1077#1072#1083#1100#1085#1086#1089#1090#1100' '#1080#1079#1076#1072#1085#1080#1103
      DisplayWidth = 15
      FieldName = 'CurrentBitEdition'
    end
    object adsPlanPrepForDiscForDiscIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object adsPlanPrepForDiscForDiscNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsPlanPrepForDiscForDiscNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
  end
  object adsPlanDep: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from  dbo.discpln '#13#10'  inner join dbo.MW_FactMW2 '#13#10'ON db' +
      'o.discpln.iK_disc =dbo.MW_FactMW2.iK_disc'#13#10' inner join MW_AutorE' +
      'dition()'#13#10'ON MW_FactMW2.IDMethodEdition = MW_AutorEdition.ID '#13#10' ' +
      'inner join MW_EditionPrepods '#13#10'ON dbo.MW_FactMW2.IDMethodEdition' +
      ' = MW_EditionPrepods.IDMethodEdition'#13#10' inner join MW_State'#13#10'ON M' +
      'W_FactMW2.IDMethodEdition = MW_State.IDMethodEdition'
    Parameters = <>
    Left = 193
    Top = 236
    object adsPlanDepDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1087#1083#1072#1085#1091
      DisplayWidth = 25
      FieldName = 'DateTransitionInState'
    end
    object adsPlanDepNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 30
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField31: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 170
      FieldName = 'NameWork'
      Size = 200
    end
    object StringField32: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NameMethodEdition'
      Size = 50
    end
    object StringField33: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField34: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 50
      FieldName = 'Characteristic'
      Visible = False
      Size = 100
    end
    object IntegerField19: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField35: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object IntegerField20: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      FieldName = 'Position'
      Visible = False
    end
    object IntegerField21: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object IntegerField22: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object adsPlanDepIDMethodEditionPlan: TIntegerField
      FieldName = 'IDMethodEditionPlan'
      Visible = False
    end
    object adsPlanDepIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
    end
    object adsPlanDepIDContentNorm: TIntegerField
      FieldName = 'IDContentNorm'
    end
    object adsPlanDepNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsPlanDepNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
    object adsPlanDepNameUnit: TStringField
      FieldName = 'NameUnit'
      Visible = False
      Size = 50
    end
    object adsPlanDepBit_plan_fact: TBooleanField
      FieldName = 'Bit_plan_fact'
    end
    object adsPlanDepcName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 100
    end
    object adsPlanDepBitEdition: TBooleanField
      FieldName = 'BitEdition'
    end
    object adsPlanDepCurrentBitEdition: TBooleanField
      FieldName = 'CurrentBitEdition'
    end
    object adsPlanDepMark: TStringField
      FieldName = 'Mark'
      Size = 15
    end
    object adsPlanDepCountFactTime: TIntegerField
      FieldName = 'CountFactTime'
    end
    object adsPlanDepIDPlanMW: TIntegerField
      FieldName = 'IDPlanMW'
    end
    object adsPlanDepPr: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      DisplayWidth = 40
      FieldName = 'Pr'
      Size = 255
    end
    object adsPlanDepPercentCompletion: TIntegerField
      FieldName = 'PercentCompletion'
    end
  end
  object adsPlanDepForDisc: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select *  from MW_FactMW2'#13#10' inner join MW_AutorEdition()'#13#10'ON MW_' +
      'FactMW2.IDMethodEdition = MW_AutorEdition.ID'#13#10' inner join MW_Sta' +
      'te'#13#10'ON MW_FactMW2.IDMethodEdition = MW_State.IDMethodEdition'
    Parameters = <>
    Left = 577
    Top = 12
    object adsPlanDepForDiscDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1087#1083#1072#1085#1091
      DisplayWidth = 18
      FieldName = 'DateTransitionInState'
    end
    object adsPlanDepForDiscNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 22
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField37: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 120
      FieldName = 'NameWork'
      Size = 200
    end
    object StringField38: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NameMethodEdition'
      Size = 50
    end
    object StringField39: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField40: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 50
      FieldName = 'Characteristic'
      Visible = False
      Size = 100
    end
    object IntegerField23: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField41: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object IntegerField24: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      FieldName = 'Position'
      Visible = False
    end
    object IntegerField25: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object IntegerField26: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object adsPlanDepForDiscPr: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      DisplayWidth = 40
      FieldName = 'Pr'
      Size = 255
    end
    object adsPlanDepForDiscIDMethodEditionPlan: TIntegerField
      FieldName = 'IDMethodEditionPlan'
      Visible = False
    end
    object adsPlanDepForDiscNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsPlanDepForDiscNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
  end
  object aspAutoPlanDepAllDisc: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'MW_Proc_PlanMWDep;1'
    Parameters = <
      item
        Name = '@KafIK'
        DataType = ftInteger
        Value = 365
      end
      item
        Name = '@YearPlanNagrIK'
        DataType = ftInteger
        Value = 13
      end>
    Left = 480
    Top = 64
    object IntegerField27: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object StringField42: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 30
      FieldName = 'cName_disc'
      Size = 100
    end
    object aspAutoPlanDepAllDiscNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 15
      FieldName = 'NameWarrant'
      Size = 50
    end
    object aspAutoPlanDepAllDiscReason: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      DisplayWidth = 15
      FieldName = 'Reason'
      ReadOnly = True
    end
    object IntegerField28: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      DisplayWidth = 8
      FieldName = 'Kol'
      ReadOnly = True
    end
    object aspAutoPlanDepAllDiscIDMethodEdition: TIntegerField
      FieldName = 'IDMethodEdition'
      ReadOnly = True
      Visible = False
    end
    object aspAutoPlanDepAllDiscIDWarrant: TAutoIncField
      FieldName = 'IDWarrant'
      ReadOnly = True
      Visible = False
    end
  end
  object aspAutoPlanDepConcrDisc: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'MW_Proc_PlanMWDepConcrDisc;1'
    Parameters = <
      item
        Name = '@KafIK'
        DataType = ftInteger
        Value = 365
      end
      item
        Name = '@YearPlanNagrIK'
        DataType = ftInteger
        Value = 13
      end
      item
        Name = '@NormIK'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = '@DiscIK'
        DataType = ftInteger
        Value = 48
      end>
    Left = 648
    Top = 327
    object IntegerField30: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object StringField44: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 50
      FieldName = 'cName_disc'
      Size = 100
    end
    object IntegerField31: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      FieldName = 'Kol'
      ReadOnly = True
    end
    object StringField45: TStringField
      DisplayLabel = #1054#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'NameWork'
      Size = 50
    end
    object FloatField5: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1085#1072' '#1077#1076#1080#1085#1080#1094#1091' '#1086#1073#1098#1077#1084#1072
      DisplayWidth = 30
      FieldName = 'Norma'
    end
    object IntegerField32: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
  end
  object adsCurrentMW: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select *, cast(Norma as varchar) + '#39' '#1095'. '#39' + NameUnit as NormaUni' +
      't  from MW_FactMW2'#13#10' inner join MW_AutorEdition()'#13#10'ON MW_FactMW2' +
      '.IDMethodEdition = MW_AutorEdition.ID'#13#10' inner join MW_State '#13#10'ON' +
      ' MW_FactMW2.IDMethodEdition = MW_State.IDMethodEdition'
    Parameters = <>
    Left = 585
    Top = 68
    object adsCurrentMWDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1087#1083#1072#1085#1091
      DisplayWidth = 30
      FieldName = 'DateTransitionInState'
    end
    object StringField46: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 150
      FieldName = 'NameWork'
      Size = 200
    end
    object StringField47: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 70
      FieldName = 'NameMethodEdition'
      Size = 50
    end
    object adsCurrentMWNormaUnit: TStringField
      DisplayLabel = #1053#1086#1088#1084#1072
      DisplayWidth = 20
      FieldName = 'NormaUnit'
      ReadOnly = True
      Visible = False
      Size = 84
    end
    object StringField48: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField49: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 50
      FieldName = 'Characteristic'
      Visible = False
      Size = 100
    end
    object IntegerField33: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField50: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object IntegerField34: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      FieldName = 'Position'
      Visible = False
    end
    object IntegerField35: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object IntegerField36: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object StringField51: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      DisplayWidth = 50
      FieldName = 'Pr'
      Size = 255
    end
    object adsCurrentMWNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsCurrentMWNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
  end
  object adsFactPrepAllDisc: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'Select *, (Convert(nvarchar,year_value) + '#39' - '#39' + Convert(nvarch' +
      'ar,year_value+1)) as UchYear '#13#10'From MW_FactMW2 '#13#10' inner join MW_' +
      'EditionPrepods '#13#10'ON MW_FactMW2.IDMethodEdition = MW_EditionPrepo' +
      'ds.IDMethodEdition'#13#10' inner join MW_PlanMethodWork'#13#10'ON MW_FactMW2' +
      '.IDPlanMW = MW_PlanMethodWork.IDPlanMW'#13#10' inner join Year_uch_pl'#13 +
      #10'ON MW_PlanMethodWork.ik_year = Year_uch_pl.ik_year_uch_pl'#13#10'inne' +
      'r join MW_DiscEdition()'#13#10'ON MW_FactMW2.IDMethodEdition = MW_Disc' +
      'Edition.ID '#13#10' inner join MW_State '#13#10'ON MW_FactMW2.IDMethodEditio' +
      'n = MW_State.IDMethodEdition'
    Parameters = <>
    Left = 41
    Top = 340
    object adsFactPrepAllDiscDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1092#1072#1082#1090#1091
      FieldName = 'DateTransitionInState'
    end
    object StringField52: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 100
      FieldName = 'NameWork'
      Visible = False
      Size = 100
    end
    object adsFactPrepAllDiscNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 40
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField53: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'NameMethodEdition'
      Size = 100
    end
    object StringField54: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField55: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 30
      FieldName = 'Characteristic'
      Visible = False
      Size = 200
    end
    object IntegerField37: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField56: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object IntegerField38: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      DisplayWidth = 12
      FieldName = 'Position'
      Visible = False
    end
    object IntegerField39: TIntegerField
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      FieldName = 'Mark'
      Visible = False
    end
    object WideStringField1: TWideStringField
      DisplayLabel = #1055#1083#1072#1085' '#1059#1052#1056
      DisplayWidth = 20
      FieldName = 'UchYear'
      ReadOnly = True
      Visible = False
      Size = 63
    end
    object IntegerField40: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object adsFactPrepAllDiscDiscpl: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 50
      FieldName = 'Discpl'
      Size = 255
    end
    object adsFactPrepAllDiscIDMethodEditionPlan: TIntegerField
      FieldName = 'IDMethodEditionPlan'
      Visible = False
    end
    object adsFactPrepAllDiscIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object adsFactPrepAllDiscIDContentNorm: TIntegerField
      FieldName = 'IDContentNorm'
      Visible = False
    end
    object adsFactPrepAllDiscIDMethodWork: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object adsFactPrepAllDiscNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsFactPrepAllDiscNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
    object adsFactPrepAllDiscNameUnit: TStringField
      FieldName = 'NameUnit'
      Visible = False
      Size = 50
    end
  end
  object adsFactAllPrepAllDisc: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from MW_AutorEdition()'#13#10' inner join dbo.MW_FactMW2'#13#10'ON ' +
      'MW_AutorEdition.ID = MW_FactMW2.IDMethodEdition'#13#10'inner join MW_D' +
      'iscEdition()'#13#10'ON MW_FactMW2.IDMethodEdition = MW_DiscEdition.ID'#13 +
      #10' inner join MW_EditionPrepods '#13#10'ON MW_FactMW2.IDMethodEdition =' +
      ' MW_EditionPrepods.IDMethodEdition'#13#10' inner join MW_State '#13#10'ON MW' +
      '_FactMW2.IDMethodEdition = MW_State.IDMethodEdition'
    Parameters = <>
    Left = 153
    Top = 340
    object adsFactAllPrepAllDiscDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1092#1072#1082#1090#1091
      FieldName = 'DateTransitionInState'
    end
    object StringField57: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 100
      FieldName = 'NameWork'
      Visible = False
      Size = 100
    end
    object adsFactAllPrepAllDiscNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 40
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField58: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'NameMethodEdition'
      Size = 100
    end
    object StringField59: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField60: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 30
      FieldName = 'Characteristic'
      Visible = False
      Size = 200
    end
    object IntegerField42: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField61: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object IntegerField43: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      DisplayWidth = 12
      FieldName = 'Position'
      Visible = False
    end
    object IntegerField44: TIntegerField
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      FieldName = 'Mark'
      Visible = False
    end
    object StringField62: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      DisplayWidth = 50
      FieldName = 'Pr'
      Size = 255
    end
    object IntegerField45: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object IntegerField46: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object adsFactAllPrepAllDiscDiscpl: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 50
      FieldName = 'Discpl'
      Size = 255
    end
    object adsFactAllPrepAllDiscIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object adsFactAllPrepAllDiscIDContentNorm: TIntegerField
      FieldName = 'IDContentNorm'
      Visible = False
    end
    object adsFactAllPrepAllDiscNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsFactAllPrepAllDiscNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
  end
  object adsPlanEdDep: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from dbo.MW_DiscEdition()'#13#10' inner join dbo.MW_FactMW2'#13#10 +
      'ON dbo.MW_DiscEdition.ID = MW_FactMW2.IDMethodEdition'#13#10' inner jo' +
      'in MW_AutorEdition()'#13#10'ON MW_FactMW2.IDMethodEdition = MW_AutorEd' +
      'ition.ID'#13#10' inner join MW_State'#13#10'ON MW_FactMW2.IDMethodEdition = ' +
      'MW_State.IDMethodEdition'
    Parameters = <>
    Left = 481
    Top = 124
    object adsPlanEdDepDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1087#1083#1072#1085#1091
      DisplayWidth = 25
      FieldName = 'DateTransitionInState'
    end
    object adsPlanEdDepNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 30
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField63: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 170
      FieldName = 'NameWork'
      Size = 200
    end
    object StringField64: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NameMethodEdition'
      Size = 50
    end
    object StringField65: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField66: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 50
      FieldName = 'Characteristic'
      Visible = False
      Size = 100
    end
    object IntegerField47: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField67: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object IntegerField48: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      FieldName = 'Position'
      Visible = False
    end
    object StringField68: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 40
      FieldName = 'Discpl'
      Size = 255
    end
    object IntegerField49: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object IntegerField50: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object StringField69: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      DisplayWidth = 40
      FieldName = 'Pr'
      Size = 255
    end
    object adsPlanEdDepIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object adsPlanEdDepNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsPlanEdDepNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
    object adsPlanEdDepIDMethodEditionPlan: TIntegerField
      FieldName = 'IDMethodEditionPlan'
      Visible = False
    end
    object adsPlanEdDepNameUnit: TStringField
      FieldName = 'NameUnit'
      Visible = False
      Size = 50
    end
  end
  object adsPlanEdDepForDisc: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select *  from MW_FactMW2'#13#10' inner join MW_AutorEdition()'#13#10'ON MW_' +
      'FactMW2.IDMethodEdition = MW_AutorEdition.ID'#13#10' inner join MW_Sta' +
      'te'#13#10'ON MW_FactMW2.IDMethodEdition = MW_State.IDMethodEdition'
    Parameters = <>
    Left = 585
    Top = 124
    object adsPlanEdDepForDiscDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1087#1083#1072#1085#1091
      FieldName = 'DateTransitionInState'
    end
    object adsPlanEdDepForDiscNameWarrant: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 22
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField70: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 120
      FieldName = 'NameWork'
      Size = 100
    end
    object StringField71: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NameMethodEdition'
      Size = 50
    end
    object StringField72: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField73: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 50
      FieldName = 'Characteristic'
      Visible = False
      Size = 100
    end
    object IntegerField51: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField74: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object IntegerField52: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      FieldName = 'Position'
      Visible = False
    end
    object IntegerField53: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object IntegerField54: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object StringField75: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      DisplayWidth = 40
      FieldName = 'Pr'
      Size = 255
    end
    object adsPlanEdDepForDiscNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsPlanEdDepForDiscNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
  end
  object adsSrokMW: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From MethodWork_Status'
    Parameters = <>
    Left = 368
    Top = 96
    object adsSrokMWIDStatus: TIntegerField
      FieldName = 'IDStatus'
      Visible = False
    end
    object adsSrokMWNameStatus: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkLookup
      FieldName = 'NameStatus'
      LookupDataSet = adsStatus
      LookupKeyFields = 'IDStatus'
      LookupResultField = 'NameStatus'
      KeyFields = 'IDStatus'
      Size = 50
      Lookup = True
    end
    object adsSrokMWEffectiveDate: TIntegerField
      DisplayLabel = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103' ('#1084#1077#1089#1103#1094#1077#1074')'
      DisplayWidth = 30
      FieldName = 'EffectiveDate'
    end
    object adsSrokMWIDWarrant: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
  end
  object adsItemGos: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Select * From MW_ContentItemGos'
    Parameters = <>
    Left = 600
    Top = 272
    object adsItemGosIDContentItemGos: TAutoIncField
      FieldName = 'IDContentItemGos'
      ReadOnly = True
      Visible = False
    end
    object adsItemGosIDGos: TIntegerField
      FieldName = 'IDGos'
      Visible = False
    end
    object adsItemGosIDItemGos: TAutoIncField
      FieldName = 'IDItemGos'
      ReadOnly = True
      Visible = False
    end
    object adsItemGosContentItemGos: TWideMemoField
      FieldName = 'ContentItemGos'
      BlobType = ftWideMemo
    end
  end
  object adsDiscGos: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Select * From MW_ContentDiscOnGos'
    Parameters = <>
    Left = 672
    Top = 272
  end
  object adsUnit: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Select * From MW_Unit'
    FieldDefs = <
      item
        Name = 'IDUnit'
        Attributes = [faReadonly, faFixed]
        DataType = ftAutoInc
      end
      item
        Name = 'NameUnit'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ShortNameUnit'
        DataType = ftString
        Size = 20
      end>
    Parameters = <>
    StoreDefs = True
    Left = 112
    Top = 136
    object adsUnitIDUnit: TAutoIncField
      FieldName = 'IDUnit'
      ReadOnly = True
    end
    object adsUnitNameUnit: TStringField
      FieldName = 'NameUnit'
      Size = 50
    end
    object adsUnitShortNameUnit: TStringField
      FieldName = 'ShortNameUnit'
    end
  end
  object adsWarrant: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Select * from MW_Warrant'
    Parameters = <>
    Left = 136
    Top = 80
  end
  object adsDepFactAllPrepAllDisc: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from MW_AutorEdition()'#13#10' inner join dbo.MW_FactMW2'#13#10'ON ' +
      'MW_AutorEdition.ID = MW_FactMW2.IDMethodEdition'#13#10'inner join MW_D' +
      'iscEdition()'#13#10'ON MW_FactMW2.IDMethodEdition = MW_DiscEdition.ID'#13 +
      #10' inner join MW_EditionPrepods '#13#10'ON MW_FactMW2.IDMethodEdition =' +
      ' MW_EditionPrepods.IDMethodEdition'#13#10' inner join MW_State'#13#10'ON MW_' +
      'FactMW2.IDMethodEdition = MW_State.IDMethodEdition'
    Parameters = <>
    Left = 601
    Top = 188
    object adsDepFactAllPrepAllDiscDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1092#1072#1082#1090#1091
      DisplayWidth = 22
      FieldName = 'DateTransitionInState'
    end
    object StringField9: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 100
      FieldName = 'NameWork'
      Visible = False
      Size = 100
    end
    object StringField43: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 40
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField76: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'NameMethodEdition'
      Size = 100
    end
    object StringField77: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField78: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 30
      FieldName = 'Characteristic'
      Visible = False
      Size = 200
    end
    object IntegerField4: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField79: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object IntegerField29: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      DisplayWidth = 12
      FieldName = 'Position'
      Visible = False
    end
    object StringField80: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      DisplayWidth = 50
      FieldName = 'Pr'
      Size = 255
    end
    object IntegerField55: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object IntegerField56: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object StringField81: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 50
      FieldName = 'Discpl'
      Size = 255
    end
    object IntegerField57: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object IntegerField58: TIntegerField
      FieldName = 'IDContentNorm'
      Visible = False
    end
    object adsDepFactAllPrepAllDiscNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsDepFactAllPrepAllDiscNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
    object adsDepFactAllPrepAllDiscNameUnit: TStringField
      FieldName = 'NameUnit'
      Visible = False
      Size = 50
    end
    object adsDepFactAllPrepAllDiscIDMethodEditionPlan: TIntegerField
      FieldName = 'IDMethodEditionPlan'
      Visible = False
    end
    object adsDepFactAllPrepAllDiscCurrentBitEdition: TBooleanField
      FieldName = 'CurrentBitEdition'
      Visible = False
    end
    object adsDepFactAllPrepAllDiscMark: TStringField
      FieldName = 'Mark'
      Visible = False
      Size = 15
    end
  end
  object adsDepFactAllPrep: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from MW_AutorEdition()'#13#10' inner join dbo.MW_FactMW2'#13#10'ON ' +
      'MW_AutorEdition.ID = MW_FactMW2.IDMethodEdition'#13#10' inner join MW_' +
      'State'#13#10'ON MW_FactMW2.IDMethodEdition = MW_State.IDMethodEdition'
    Parameters = <>
    Left = 481
    Top = 188
    object adsDepFactAllPrepDateTransitionInState: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1087#1086' '#1092#1072#1082#1090#1091
      DisplayWidth = 20
      FieldName = 'DateTransitionInState'
    end
    object StringField82: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 100
      FieldName = 'NameWork'
      Visible = False
      Size = 100
    end
    object StringField83: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 40
      FieldName = 'NameWarrant'
      Size = 50
    end
    object StringField84: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'NameMethodEdition'
      Size = 100
    end
    object StringField85: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Code'
      Visible = False
      Size = 50
    end
    object StringField86: TStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      DisplayWidth = 30
      FieldName = 'Characteristic'
      Visible = False
      Size = 200
    end
    object IntegerField59: TIntegerField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'Volume'
      Visible = False
    end
    object StringField87: TStringField
      DisplayLabel = #1058#1080#1088#1072#1078
      DisplayWidth = 10
      FieldName = 'Drawing'
      Visible = False
      Size = 50
    end
    object IntegerField60: TIntegerField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103
      DisplayWidth = 12
      FieldName = 'Position'
      Visible = False
    end
    object IntegerField61: TIntegerField
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      FieldName = 'Mark'
      Visible = False
    end
    object StringField88: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      DisplayWidth = 50
      FieldName = 'Pr'
      Size = 255
    end
    object IntegerField62: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object IntegerField63: TIntegerField
      FieldName = 'IDMethodWork'
      Visible = False
    end
    object IntegerField64: TIntegerField
      FieldName = 'IDWarrant'
      Visible = False
    end
    object IntegerField65: TIntegerField
      FieldName = 'IDContentNorm'
      Visible = False
    end
    object adsDepFactAllPrepNorma: TFloatField
      FieldName = 'Norma'
      Visible = False
    end
    object adsDepFactAllPrepNormaExpert: TFloatField
      FieldName = 'NormaExpert'
      Visible = False
    end
    object adsDepFactAllPrepIDMethodEditionPlan: TIntegerField
      FieldName = 'IDMethodEditionPlan'
      Visible = False
    end
    object adsDepFactAllPrepCurrentBitEdition: TBooleanField
      FieldName = 'CurrentBitEdition'
      Visible = False
    end
  end
  object adsPlanRatify: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'SELECT a.itab_n, FIO, KolFactPlan, KolFactPercent, CAST(ISNULL(K' +
      'olFactNorm,0) as varchar(10)) + '#39'/'#39' + CAST(KolPlanNorm as varcha' +
      'r(10)) as KolFactPlanNorm,'#13#10'    round(ISNULL(KolFactNorm,0)*100/' +
      'KolPlanNorm,2) as KolFactNormPercent'#13#10'    FROM '#13#10'    (select dis' +
      'tinct dbo.Prepods.itab_n, (clastname+'#39' '#39'+cfirstname+'#39' '#39'+cotch) a' +
      's FIO, '#13#10'      CAST(count(IDMethodEditionPlan) as varchar(10)) +' +
      ' '#39'/'#39' + cast(count(dbo.MW_EditionPrepods.IDMethodEdition) as varc' +
      'har(10)) as KolFactPlan,'#13#10'      round(CAST(count(IDMethodEdition' +
      'Plan)as float)*100/CAST(count(dbo.MW_EditionPrepods.IDMethodEdit' +
      'ion) as float),2) as KolFactPercent,'#13#10'      SUM(Norma*Volume) as' +
      ' KolPlanNorm  '#13#10'    from dbo.MW_PlanMethodWork '#13#10'    inner join ' +
      'dbo.MethodEdition ON dbo.MW_PlanMethodWork.IDPlanMW = dbo.Method' +
      'Edition.IDPlanMW '#13#10'    inner join dbo.MW_EditionPrepods ON dbo.M' +
      'ethodEdition.IDMethodEdition = dbo.MW_EditionPrepods.IDMethodEdi' +
      'tion '#13#10'    inner join dbo.Prepods ON dbo.MW_EditionPrepods.itab_' +
      'n = dbo.Prepods.itab_n '#13#10'    inner join dbo.MethodWork_NormOfTim' +
      'e ON dbo.MethodEdition.IDContentNorm = dbo.MethodWork_NormOfTime' +
      '.IDContentNorm'#13#10'    where (Bit_plan_fact = 1) and (dbo.MethodEdi' +
      'tion.IDPlanMW = 2) '#13#10'    Group by dbo.Prepods.itab_n, clastname,' +
      ' cfirstname, cotch)a'#13#10'    LEFT JOIN '#13#10'    (select distinct itab_' +
      'n, SUM(Norma*Volume) as KolFactNorm   '#13#10'    from dbo.MW_PlanMeth' +
      'odWork '#13#10'    inner join dbo.MethodEdition ON dbo.MW_PlanMethodWo' +
      'rk.IDPlanMW = dbo.MethodEdition.IDPlanMW '#13#10'    inner join dbo.MW' +
      '_EditionPrepods ON dbo.MethodEdition.IDMethodEdition = dbo.MW_Ed' +
      'itionPrepods.IDMethodEdition '#13#10'    inner join dbo.MethodWork_Nor' +
      'mOfTime ON dbo.MethodEdition.IDContentNorm = dbo.MethodWork_Norm' +
      'OfTime.IDContentNorm'#13#10'    where (Bit_plan_fact = 0) and (dbo.Met' +
      'hodEdition.IDPlanMW = 2) '#13#10'    Group by itab_n)b'#13#10'    ON a.itab_' +
      'n = b.itab_n '#13#10'    order by FIO'
    Parameters = <>
    Left = 665
    Top = 12
    object adsPlanRatifyitab_n: TAutoIncField
      FieldName = 'itab_n'
      ReadOnly = True
      Visible = False
    end
    object adsPlanRatifyFIO: TStringField
      DisplayLabel = #1060#1048#1054' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
      DisplayWidth = 50
      FieldName = 'FIO'
      Size = 90
    end
    object adsPlanRatifyKolFactPlan: TStringField
      Alignment = taRightJustify
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093'/'#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1088#1072#1073#1086#1090' ('#1096#1090')'
      DisplayWidth = 25
      FieldName = 'KolFactPlan'
      ReadOnly = True
      Size = 21
    end
    object adsPlanRatifyKolFactPercent: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090' (%)'
      DisplayWidth = 20
      FieldName = 'KolFactPercent'
      ReadOnly = True
    end
    object adsPlanRatifyKolFactPlanNorm: TStringField
      Alignment = taRightJustify
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093'/'#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1088#1072#1073#1086#1090' '#1087#1086' '#1085#1086#1088#1084#1072#1084' ('#1095#1072#1089')'
      DisplayWidth = 25
      FieldName = 'KolFactPlanNorm'
      ReadOnly = True
      Size = 21
    end
    object adsPlanRatifyKolFactNormPercent: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090' '#1087#1086' '#1085#1086#1088#1084#1072#1084' (%)'
      DisplayWidth = 20
      FieldName = 'KolFactNormPercent'
      ReadOnly = True
    end
  end
  object adsFile: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From MW_File'
    Parameters = <>
    Left = 377
    Top = 156
    object adsFileIDFile: TAutoIncField
      FieldName = 'IDFile'
      ReadOnly = True
      Visible = False
    end
    object adsFileBitFile: TBooleanField
      FieldName = 'BitFile'
      Visible = False
    end
    object adsFileFile: TBlobField
      FieldName = 'File'
      Visible = False
    end
    object adsFileNameFile: TStringField
      DisplayLabel = #1048#1084#1103' '#1092#1072#1081#1083#1072
      FieldName = 'NameFile'
      Size = 100
    end
    object adsFileTypeFile: TStringField
      DisplayLabel = #1058#1080#1087' '#1092#1072#1081#1083#1072
      DisplayWidth = 20
      FieldName = 'TypeFile'
      Size = 10
    end
  end
  object adsFileMW: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From MW_File_MethodEdition'#13#10
    Parameters = <>
    Left = 377
    Top = 220
    object adsFileMWIDFile: TIntegerField
      FieldName = 'IDFile'
      Visible = False
    end
    object adsFileMWIDMethodEdition: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
  end
  object adsUchPlanMW: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From MethodEdition_Uch_pl'#13#10
    Parameters = <>
    Left = 377
    Top = 276
    object adsUchPlanMWIDMethodEdition: TIntegerField
      FieldName = 'IDMethodEdition'
      Visible = False
    end
    object adsUchPlanMWik_uch_plan: TIntegerField
      FieldName = 'ik_uch_plan'
      Visible = False
    end
    object adsUchPlanMWNameUchPlan: TStringField
      DisplayLabel = #1059#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085
      FieldKind = fkLookup
      FieldName = 'full_name'
      LookupDataSet = adsUchPlan
      LookupKeyFields = 'ik_uch_plan'
      LookupResultField = 'full_name'
      KeyFields = 'ik_uch_plan'
      Size = 50
      Lookup = True
    end
  end
  object adsUchPlan: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'SELECT ik_uch_plan, (Cshort_spec + '#39' ('#39' + cName_spclz_short + '#39')' +
      ', '#39' + Cname_form_ed + '#39', '#39' + CAST(year_value as varchar(4))) as ' +
      'full_name'#13#10'from Uch_pl'#13#10'inner join Spec_stud ON Uch_pl.ik_spec =' +
      ' Spec_stud.ik_spec   '#13#10'inner join Year_uch_pl ON Uch_pl.ik_year_' +
      'uch_pl = Year_uch_pl.ik_year_uch_pl'#13#10'inner join spclz ON Uch_pl.' +
      'ik_spclz = spclz.ik_spclz'#13#10'inner join Form_ed ON Uch_pl.ik_form_' +
      'ed = Form_ed.ik_form_ed'#13#10'order by year_value desc, Cshort_spec, ' +
      'Cname_form_ed'
    Parameters = <>
    Left = 440
    Top = 272
  end
end
