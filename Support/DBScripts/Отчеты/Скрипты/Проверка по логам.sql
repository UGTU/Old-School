/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [OperationTypeID]
      ,[ObjectID]
      ,[AuditDateTime]
      ,[UserName]
      ,[Description]
  FROM [UGTU].[dbo].[Audit_Event]
  where [Description] like '%34534%' or [Description] like '%Писаренко%'

  SELECT TOP 1000 [OperationTypeID]
      ,[ObjectID]
      ,[AuditDateTime]
      ,[UserName]
      ,[Description]
  FROM [UGTU].[dbo].[Audit_Event]
  where [Description] like '%34511%' or [Description] like '%Цуцоев%'


  select *
  from dbo.Person
  where ClastName like '%Писаренко%'