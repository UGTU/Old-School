use ugtuugtu

alter table [dbo].[Grup]
add [StudyYearsExclusion] int null

go

--Выбираем список выпускных групп 
--Выбираем только те, в которых есть хотя бы 1 студент
--select * from [dbo].[OKADRGetExitGroup_inline](2016) where ik_fac=17
ALTER FUNCTION [dbo].[OKADRGetExitGroup_inline](@Year INT=2015)
RETURNS TABLE
AS
RETURN (
SELECT distinct
  StudGrup.ik_grup, Cname_grup, Relation_spec_fac.ik_spec, Relation_spec_fac.ik_spec_fac, Relation_spec_fac.ik_spec_fac as Realik_spec_fac, ik_fac,
  --ik_Gener_spec_fac нужен для определения уникальности специальности - используется для связки со специальностями   
  Relation_spec_fac.ik_spec+dbo.Relation_spec_fac.ik_fac*100000 ik_Gener_spec_fac , Grup.ik_spclz as ik_profile,
  Spec_stud.Cname_spec+ISNULL(' ('+Direction.cShort_name_direction+')','')+ ISNULL(' - '+Spec_stud.Sh_spec,'') Cname_spec,
  Spec_stud.Cshort_spec+' - '+ RTRIM([profile].Cname_spec)+ ISNULL(' - '+Spec_stud.Sh_spec,'') Cname_profile, Grup.nYear_post,
  IIF(Grup.ik_spclz IS NOT NULL, 2,1) id_type_branch
FROM         
 dbo.Grup
 INNER JOIN dbo.Relation_spec_fac ON Grup.ik_spec_fac=Relation_spec_fac.ik_spec_fac
 INNER JOIN dbo.StudGrup ON StudGrup.ik_grup=Grup.ik_grup
 INNER JOIN dbo.EducationBranch Spec_stud ON Spec_stud.ik_spec=Relation_spec_fac.ik_spec
 INNER JOIN 
		dbo.Direction ON Spec_stud.ik_direction=Direction.ik_direction
 LEFT JOIN dbo.EducationBranch [profile] ON [profile].ik_spec=Grup.ik_spclz
WHERE
	@Year<=(Grup.nYear_post+ISNULL([Grup].[StudyYearsExclusion], Relation_spec_fac.[YearObuch])) AND 
	(Grup.nYear_post+ISNULL([Grup].[StudyYearsExclusion], Relation_spec_fac.[YearObuch]))<=YEAR(GETDATE())
		AND ((Ik_prikazOtch IS NULL AND ik_pricOtch IS NULL) or (ik_pricOtch = 3)))


go
--представление, в котором выводится только продолжительность обучения
create VIEW [dbo].GrupMainData
AS
  SELECT  [Ik_grup],[Grup].[ik_spec_fac],[Cname_grup],[Ik_uch_plan],[nYear_post]
      ,[DateCreate],[DateExit],[ik_spclz],[ik_Kurator], ISNULL([Grup].[StudyYearsExclusion], Relation_spec_fac.[YearObuch]) [YearObuch]

  FROM [dbo].[Grup] INNER JOIN  
	dbo.Relation_spec_fac ON dbo.Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac 


go
--представление, в котором выводятся все данные для диплома (включая настройки по 
create VIEW [dbo].GrupMainData
AS
  SELECT  [Ik_grup],[Grup].[ik_spec_fac],[Cname_grup],[Ik_uch_plan],[nYear_post]
      ,[DateCreate],[DateExit],[ik_spclz],[ik_Kurator], ISNULL([Grup].[StudyYearsExclusion], Relation_spec_fac.[YearObuch]) [YearObuch]

  FROM [dbo].[Grup] INNER JOIN  
	dbo.Relation_spec_fac ON dbo.Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac