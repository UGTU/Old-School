select * from Grup
order by [Cname_grup]

select * from sv_disc inner join discpln on sv_disc.ik_disc = discpln.iK_disc
where [ik_uch_plan] = 5115 order by [cName_disc]

select * from [dbo].[Content_UchPl] where ik_disc_uch_plan = 127735

select * from Vedomost where ik_upContent = 694889

------------------------------------------------------------------------------------
SELECT  [OperationTypeID]
      ,[ObjectID]
      ,[AuditDateTime]
      ,[UserName]
      ,[Description]
  FROM [UGTU].[dbo].[Audit_Event] where [Description] like '%5115%'
  order by   [AuditDateTime] desc

  select * from discpln where iK_disc in (2508,6444,2508,6338,10)