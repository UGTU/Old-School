
GO
GO






--select * from [dbo].[IsForeignStudDepartment]()
--функция возвращает 1, если сотрудник состоит в группе международный отдел (отображать только иностранных студентов)
alter   FUNCTION [dbo].[IsForeignStudDepartment]()
RETURNS  TABLE
AS
RETURN
(
	SELECT ISNULL(
	(SELECT 1 from [dbo].[GetUserGroups]()
		where idgroup = 75), 0) IsForeignStudDepartment

)

GO
SET QUOTED_IDENTIFIER ON
GO


--select * from [TREE_Stud_Search]

ALTER VIEW [dbo].[TREE_Stud_Search]
AS
SELECT     dbo.Stud.Clastname, dbo.Stud.Cfirstname, dbo.Stud.nCode, dbo.Stud.Cotch, dbo.Stud.Dd_birth, dbo.Stud.ctelefon, dbo.Zach.Ik_zach, 
                      dbo.Zach.Nn_zach, dbo.StudGrup.Ik_grup, dbo.Grup.ik_spec_fac, dbo.Grup.Cname_grup, dbo.Grup.nYear_post, 
                      dbo.Relation_spec_fac.ik_spec_fac AS Expr1, dbo.Fac.Ik_fac, dbo.Fac.Cname_fac, dbo.Spec_stud.ik_spec, dbo.Spec_stud.Cname_spec, 
                      Stud.FullStudName AS NameStud, StudGrup.Ik_studGrup
FROM         dbo.Relation_spec_fac INNER JOIN
                      dbo.Grup ON dbo.Relation_spec_fac.ik_spec_fac = dbo.Grup.ik_spec_fac INNER JOIN
                      dbo.Fac ON dbo.Relation_spec_fac.ik_fac = dbo.Fac.Ik_fac INNER JOIN
                      dbo.Spec_stud ON dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec INNER JOIN
                      dbo.StudGrup ON dbo.Grup.Ik_grup = dbo.StudGrup.Ik_grup INNER JOIN
                      dbo.Zach ON dbo.StudGrup.Ik_zach = dbo.Zach.Ik_zach INNER JOIN
                      dbo.Stud ON dbo.Zach.nCode = dbo.Stud.nCode CROSS JOIN
					  (select IsForeignStudDepartment from [dbo].[IsForeignStudDepartment]())IsForeignDep
WHERE     (dbo.Fac.Ik_fac IN
                          (SELECT     ik_fac
                            FROM          dbo.GetFacPermissionsFromRelTable() AS GetFacPermissions_1))
AND ((IsForeignStudDepartment = 0)	--либо не междун отдел
	OR ((IsForeignStudDepartment = 1) AND (Stud.[Ik_grazd] > 2)))	--либо межд отдел и иностранец



GO
GO






/*SELECT *
  FROM [UGTU].[dbo].[Stud]
   where ncode=32017*/
ALTER VIEW [dbo].[Stud]
AS
SELECT Student.* 
      ,Person.[Clastname]
      ,Person.[Cfirstname]
      ,Person.[Cotch]
      ,Person.[Dd_birth]
      ,Person.[Cplacebirth]
      ,Person.[Linval]
      ,Person.[Ldeti]
      ,Person.[Lrab]
      ,Person.[lSex]
      ,Person.[Lobchegit]
      ,Person.[cSotTel]
      ,Person.[ctelefon]
      ,Person.[cEmail]
      ,Person.ik_nac
      ,Person.[Photo]
      ,Person.[Ik_grazd]
      ,Person.[Ik_sem_pol]
      ,Person.[cInn]
      ,Person.[cStrax]
      ,Person.[ik_voen_zvanie]--ISNULL(FactAddress., PropAddress.)
      ,ISNULL(ISNULL(FactAddress.fIndex, PropAddress.fIndex), VrPropAddress.fIndex) as cIndex_fact,
      ISNULL(ISNULL(FactAddress.Ik_street, PropAddress.Ik_street),VrPropAddress.Ik_street) as Ik_Street_fact,
      ISNULL(ISNULL(FactAddress.BuildingNumber, PropAddress.BuildingNumber),VrPropAddress.BuildingNumber) as Build_fact,
      ISNULL(ISNULL(FactAddress.StructNumber, PropAddress.StructNumber),VrPropAddress.StructNumber) as Stroen_fact,
      ISNULL(ISNULL(FactAddress.FlatNumber, PropAddress.FlatNumber),VrPropAddress.FlatNumber) as Kvart_fact
      ,PropAddress.fIndex as cIndex_prop,PropAddress.Ik_street as Ik_Street_prop,
      PropAddress.BuildingNumber as Build_prop,PropAddress.StructNumber as Stroen_prop,PropAddress.FlatNumber as Kvart_prop,
	  Person.[PersonFullName] FullStudName, Person.[PersonSmallName] StudName  
          

FROM         dbo.Student, dbo.Person 
	LEFT JOIN PersonCurrentAddresses as FactAddress ON Person.nCode=FactAddress.nCode AND FactAddress.ik_AddressType=1
	LEFT JOIN PersonCurrentAddresses as PropAddress ON Person.nCode=PropAddress.nCode AND PropAddress.ik_AddressType=2
	LEFT JOIN PersonCurrentAddresses as VrPropAddress ON Person.nCode=VrPropAddress.nCode AND VrPropAddress.ik_AddressType=3
	CROSS JOIN
					  (select IsForeignStudDepartment from [dbo].[IsForeignStudDepartment]())IsForeignDep
where Student.nCode=Person.nCode
AND ((IsForeignStudDepartment = 0)	--либо не междун отдел
	OR ((IsForeignStudDepartment = 1) AND (Person.[Ik_grazd] > 2)))	--либо межд отдел и иностранец

