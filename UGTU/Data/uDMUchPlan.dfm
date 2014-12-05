object dmUchPlan: TdmUchPlan
  OldCreateOrder = False
  Height = 344
  Width = 636
  object dsUchPlan: TDataSource
    DataSet = adodsUchPlan
    Left = 41
    Top = 4
  end
  object adodsUchPlan: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from UchPl'
    Parameters = <>
    Left = 367
    Top = 175
  end
  object qCanRemoveBRS: TADOQuery
    Connection = dm.DBConnect
    Parameters = <>
    Left = 40
    Top = 64
  end
  object aspSetBRS: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'SetBRS;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_pl'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@BRS'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 40
    Top = 120
  end
  object adsGetHours: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select GetHoursForDisc()'
    Parameters = <>
    Left = 151
    Top = 175
  end
  object ADOQContentForDiscVC: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'Select cshort_name_kaf, n_sem, '#13#10'(select top 1 tasks_count from'#13 +
      #10'(select tasks_count '#13#10'From Vid_zanyat_with_several_tasks vzst '#13 +
      #10'where ik_upContent = cup.ik_upContent '#13#10'union'#13#10'select 1'#13#10') as t' +
      'erm'#13#10') as tasks_count, n_module, i_balls '#13#10'From Content_UchPl cu' +
      'p '#13#10'LEFT JOIN Vid_zanyat_with_several_tasks vzst ON cup.ik_upCon' +
      'tent = vzst.ik_upContent '#13#10'left join kafedra k on k.ik_kaf=cup.i' +
      'k_kaf'#13#10'Where ((ik_disc_uch_plan = 34352) '#13#10'and (ik_vid_zanyat = ' +
      '7))'
    Parameters = <>
    Left = 39
    Top = 175
  end
  object ADOQContentForDiscAZ: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT cName_vid_zanyat, cshort_name_kaf, i_hour_per_week, '#13#10'(se' +
      'lect top 1 week_count from'#13#10'(select week_count from UchPlan_Week' +
      'Count_Exception '#13#10'where ik_upContent in (select ik_upContent fro' +
      'm Content_UchPl where'#13#10'ik_upContent = cup.ik_upContent)'#13#10'union'#13#10 +
      'select kol_ned from sem_uch_pl where n_sem=cup.n_sem and '#13#10'ik_uc' +
      'h_plan=(select ik_uch_plan from sv_disc '#13#10'where ik_disc_uch_plan' +
      ' = (select ik_disc_uch_plan from Content_UchPl where'#13#10'ik_upConte' +
      'nt = cup.ik_upContent))) as term'#13#10') as week_count '#13#10'FROM Content' +
      '_UchPl cup'#13#10'left join kafedra k on k.ik_kaf=cup.ik_kaf'#13#10'left joi' +
      'n vid_zaniat vz on vz.iK_vid_zanyat=cup.iK_vid_zanyat'#13#10'WHERE (vz' +
      '.ik_vid_zanyat in (3,4,5)) '#13#10'and (ik_disc_uch_plan = 34352) '#13#10'an' +
      'd (n_sem = 2)'
    Parameters = <>
    Left = 255
    Top = 175
  end
end
