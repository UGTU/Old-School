--заполнение факультета
update [dbo].[DiplomGak]
set [ik_fac]=Maxik_fac
FROM
(select [ik_gakMember], MAX([Fac].ik_fac) Maxik_fac 
FROM [dbo].[DiplomGak]
INNER JOIN dbo.Relation_spec_fac ON [DiplomGak].ik_spec=Relation_spec_fac.ik_spec 
INNER JOIN [dbo].[Fac] ON [Fac].ik_fac=Relation_spec_fac.ik_fac 
WHERE [Fac].fDateExit > GETDATE() OR [Fac].fDateExit IS NULL
GROUP BY [ik_gakMember]) Fac
INNER JOIN [DiplomGak] ON [DiplomGak].[ik_gakMember]=Fac.[ik_gakMember]


--select * from [DiplomGak]

go
/*alter table [dbo].[DiplomGak]
alter column [ik_fac] int not null*/



--exec [OKADRGetGakMembers] @ik_year=23
ALTER PROC [dbo].[OKADRGetGakMembers] 
@ik_year int
AS

SELECT
  ik_GakMember, GakMemberName, DiplomGak.ik_spec ik_spec, 
  ik_year, ik_fac--,Spec_Profile.id_type_branch    
FROM         
  --[dbo].[EducationBranch] Spec_Profile
 --INNER JOIN 
 DiplomGak 
 --ON Spec_Profile.ik_spec=DiplomGak.ik_spec
 
WHERE
   DiplomGak.ik_year=@ik_year
ORDER BY /*id_type_branch,*/DiplomGak.ik_spec,GakMemberName


/*
--анализ уникальности названий специальностей
SELECT DISTINCT    dbo.Spec_stud.Cname_spec+' ('+ISNULL(Direction.cShort_name_direction,'')+')'+ ' - '+ISNULL(Spec_stud.Sh_spec,'') Cname_spec, 
	--ik_Gener_spec_fac нужен для определения уникальности специальности - ik_spec_fac не подходит, чтобы не дублировать одну и ту же специальность несколько раз
	Spec_stud.ik_spec+dbo.Relation_spec_fac.ik_fac*100000 ik_Gener_spec_fac, 
	dbo.Relation_spec_fac.ik_fac, dbo.Spec_stud.Cshort_spec, Spec_stud.ik_spec, Spec_stud.ik_spec ik_spec_fac
FROM        Spec_stud INNER JOIN Relation_spec_fac
	ON     Relation_spec_fac.ik_spec = Spec_stud.ik_spec
		AND Relation_spec_fac.ik_spec_fac IN
			(SELECT Realik_spec_fac FROM dbo.[OKADRGetExitGroup_inline]())
	INNER JOIN dbo.Direction ON Spec_stud.ik_direction=Direction.ik_direction
	WHERE dbo.Spec_stud.Cname_spec+' ('+ISNULL(Direction.cShort_name_direction,'')+')'+ ' - '+ISNULL(Spec_stud.Sh_spec,'') IN
(SELECT    Cname_spec
FROM        (SELECT DISTINCT    dbo.Spec_stud.Cname_spec+' ('+ISNULL(Direction.cShort_name_direction,'')+')'+ ' - '+ISNULL(Spec_stud.Sh_spec,'') Cname_spec, 
	--ik_Gener_spec_fac нужен для определения уникальности специальности - ik_spec_fac не подходит, чтобы не дублировать одну и ту же специальность несколько раз
	Spec_stud.ik_spec+dbo.Relation_spec_fac.ik_fac*100000 ik_Gener_spec_fac, 
	dbo.Relation_spec_fac.ik_fac, dbo.Spec_stud.Cshort_spec, Spec_stud.ik_spec, Spec_stud.ik_spec ik_spec_fac
FROM        Spec_stud INNER JOIN Relation_spec_fac
	ON     Relation_spec_fac.ik_spec = Spec_stud.ik_spec
		AND Relation_spec_fac.ik_spec_fac IN
			(SELECT Realik_spec_fac FROM dbo.[OKADRGetExitGroup_inline]())
	INNER JOIN dbo.Direction ON Spec_stud.ik_direction=Direction.ik_direction)spec
                       

GROUP BY  Cname_spec
HAVING COUNT(*)>1)
*/



go
--Выбираем список выпускных групп 
--Выбираем только те, в которых есть хотя бы 1 студент
--select * from [dbo].[OKADRGetExitGroup_inline](2015)
ALTER FUNCTION [dbo].[OKADRGetExitGroup_inline](@Year INT=2015)
RETURNS TABLE
AS
RETURN (
SELECT distinct
  StudGrup.ik_grup, Cname_grup, Relation_spec_fac.ik_spec, Relation_spec_fac.ik_spec_fac, Relation_spec_fac.ik_spec_fac as Realik_spec_fac, ik_fac,
  --ik_Gener_spec_fac нужен для определения уникальности специальности - используется для связки со специальностями   
  Relation_spec_fac.ik_spec+dbo.Relation_spec_fac.ik_fac*100000 ik_Gener_spec_fac , Grup.ik_spclz as ik_profile
FROM         
 Grup, Relation_spec_fac, StudGrup 
WHERE
 StudGrup.ik_grup=Grup.ik_grup AND
 Grup.ik_spec_fac=Relation_spec_fac.ik_spec_fac AND
 @Year=(Grup.nYear_post+Relation_spec_fac.YearObuch) 
AND Ik_prikazOtch IS NULL AND ik_pricOtch IS NULL)


GO
--Выборка всех профилей и специальностей для ГАК определенного года
--SELECT * from [dbo].[OKADRGetEducBranch](2015) where  [id_type_branch]=2
ALTER FUNCTION [dbo].[OKADRGetEducBranch](@year INT)
RETURNS  TABLE
 
AS
RETURN
(
SELECT * FROM
(SELECT DISTINCT    Spec_stud.Cname_spec+ISNULL(' ('+Direction.cShort_name_direction+')','')+ ISNULL(' - '+Spec_stud.Sh_spec,'') Cname_spec, 
	/*Spec_stud.ik_spec+dbo.Relation_spec_fac.ik_fac*100000 ik_Gener_spec_fac,*/ dbo.Relation_spec_fac.ik_fac, Spec_stud.Cshort_spec, Spec_stud.ik_spec, [id_type_branch] 
FROM 
	--выбираем специальности   
	dbo.[OKADRGetExitGroup_inline](@year)ExitGrups INNER JOIN
	dbo.Relation_spec_fac ON ExitGrups.Realik_spec_fac=Relation_spec_fac.ik_spec_fac
	INNER JOIN [dbo].EducationBranch Spec_stud 
		ON (Relation_spec_fac.ik_spec = Spec_stud.ik_spec /*AND [id_type_branch]=1*/)	 
	INNER JOIN 
		dbo.Direction ON Spec_stud.ik_direction=Direction.ik_direction
	--выбираем профили
	UNION
SELECT DISTINCT   Spec_stud.Cshort_spec+' - '+ RTRIM(PProfile.Cname_spec)+ ISNULL(' - '+Spec_stud.Sh_spec,'') Cname_spec, 
	/*Spec_stud.ik_spec+dbo.Relation_spec_fac.ik_fac*100000 ik_Gener_spec_fac,*/ dbo.Relation_spec_fac.ik_fac, Spec_stud.Cshort_spec, PProfile.ik_spec, PProfile.[id_type_branch]
	FROM 
	dbo.[OKADRGetExitGroup_inline](@year)ExitGrups INNER JOIN
	dbo.Relation_spec_fac ON ExitGrups.Realik_spec_fac=Relation_spec_fac.ik_spec_fac
	INNER JOIN [dbo].EducationBranch Spec_stud 
		ON (Relation_spec_fac.ik_spec = Spec_stud.ik_spec /*AND [id_type_branch]=1*/)	 
	INNER JOIN [dbo].EducationBranch PProfile 
		ON PProfile.[id_parent] = Spec_stud.ik_spec /*AND [id_type_branch]=1*/)allData
) 
--DROP FUNCTION [dbo].[OKADRGetProfiles]


GO
--[dbo].[OKADRGetSpecialities] 
ALTER PROC [dbo].[OKADRGetSpecialities] 
AS
SELECT DISTINCT    dbo.Spec_stud.Cname_spec+' ('+ISNULL(Direction.cShort_name_direction,'')+')'+ ' - '+ISNULL(Spec_stud.Sh_spec,'') Cname_spec, 
	Spec_stud.ik_spec+dbo.Relation_spec_fac.ik_fac*100000 ik_Gener_spec_fac, dbo.Relation_spec_fac.ik_fac, dbo.Spec_stud.Cshort_spec, Spec_stud.ik_spec
FROM        Spec_stud INNER JOIN Relation_spec_fac
	ON     Relation_spec_fac.ik_spec = Spec_stud.ik_spec
		AND Relation_spec_fac.ik_spec_fac IN
			(SELECT Realik_spec_fac FROM dbo.[OKADRGetExitGroup_inline](YEAR(GETDATE())))
	INNER JOIN dbo.Direction ON Spec_stud.ik_direction=Direction.ik_direction
                       

ORDER BY dbo.Relation_spec_fac.ik_fac, Cname_spec 

GO
--[dbo].[OKADRGetQualifications] 
ALTER PROC [dbo].[OKADRGetQualifications] 
AS
SELECT distinct
  Spec_stud.ik_spec, Cname_spec, Cname_qualif, [Direction].cName_direction [Cshort_spec],  [Direction].cName_direction cName_direction,
	[SpecСategory], [QualifShortName], Sh_spec
FROM         
 [dbo].[Direction] INNER JOIN
 dbo.Spec_stud
	ON Spec_stud.ik_direction=[Direction].ik_direction	
 INNER JOIN dbo.Relation_spec_fac 
	ON Spec_stud.ik_spec=Relation_spec_fac.ik_spec
		AND Relation_spec_fac.ik_spec_fac IN
			(SELECT Realik_spec_fac FROM dbo.[OKADRGetExitGroup_inline](YEAR(GETDATE())))
 INNER JOIN [dbo].[GetFacDiplomPermissionsFromRelTable]() perm
	ON Relation_spec_fac.ik_fac=perm.ik_fac
-- INNER JOIN dbo.Fac ON Relation_spec_fac.ik_fac=Fac.Ik_fac
WHERE
 spDateExit IS NULL OR spDateExit<GETDATE()
 ORDER BY Cname_spec, cName_direction




 --exec [OKADRGetGakMembers] 23,2
ALTER PROC [dbo].[OKADRGetGakMembers] 
@ik_year int,
@id_type_branch int
AS

SELECT
  ik_GakMember, GakMemberName, DiplomGak.ik_spec ik_spec, 
  ik_year, ik_fac--, IIF(Spec_Profile.id_type_branch =1, 1,2)   id_type_branch 
FROM         
  [dbo].[EducationBranch] Spec_Profile
 INNER JOIN 
 DiplomGak 
 ON Spec_Profile.ik_spec=DiplomGak.ik_spec
 
WHERE
   DiplomGak.ik_year=@ik_year
   AND Spec_Profile.id_type_branch=@id_type_branch
ORDER BY id_type_branch,DiplomGak.ik_spec,GakMemberName



GO

--exec [OKADRGetGakMemberForExcel] 290100,2015 
--exec [OKADRGetGakMemberForExcel] 354569, 2015,27,293
ALTER PROC [dbo].[OKADRGetGakMemberForExcel] 
@ik_spec int,
@year int,
@ik_fac int=null,
@ik_profile INT=null
AS
SELECT TOP 1
	[Direction].ik_direction, Spec_stud.Cname_qualif, Spec_stud.Cname_spec, ISNULL(ProfileDiplomGak.GakMemberName, DiplomGak.GakMemberName) GakMemberName, 
	ISNULL(Fac.[DiplExcPatternName], [Direction].[DiplExcPatternName]) [DiplExcPatternName],
	Spec_stud.[SpecСategory], Spec_stud.[QualifShortName],  @ik_fac Ik_fac, Spec_stud.Sh_spec, [DateDiplomDelivery]
FROM   
dbo.Spec_stud 
INNER JOIN dbo.Year_uch_pl ON year_value=@year	AND Spec_stud.ik_spec=@ik_spec
INNER join dbo.Fac ON Fac.Ik_fac=@ik_fac
left join 
 dbo.DiplomGak ON DiplomGak.ik_year=Year_uch_pl.ik_year_uch_pl
	AND  DiplomGak.ik_spec =@ik_spec
	AND DiplomGak.ik_fac=@ik_fac
LEFT JOIN dbo.EducationBranch AS [Profile] ON [Profile].ik_spec=@ik_profile
left join 
 dbo.DiplomGak as ProfileDiplomGak ON ProfileDiplomGak.ik_year=Year_uch_pl.ik_year_uch_pl
	AND  ProfileDiplomGak.ik_spec=@ik_profile
	AND ProfileDiplomGak.ik_fac=@ik_fac
left join [dbo].[Direction] on Spec_stud.ik_direction=[Direction].ik_direction





go

declare @year INT=2015,@ik_fac INT=27, @ik_spec INT=354569,@ik_profile INT=293

SELECT TOP 1
	[Direction].ik_direction, Spec_stud.Cname_qualif, Spec_stud.Cname_spec, ISNULL(ProfileDiplomGak.GakMemberName, DiplomGak.GakMemberName) GakMemberName, 
	ISNULL(Fac.[DiplExcPatternName], [Direction].[DiplExcPatternName]) [DiplExcPatternName],
	Spec_stud.[SpecСategory], Spec_stud.[QualifShortName],  @ik_fac Ik_fac, Spec_stud.Sh_spec, [DateDiplomDelivery]
FROM   
dbo.Spec_stud 
INNER JOIN dbo.Year_uch_pl ON year_value=@year	AND Spec_stud.ik_spec=@ik_spec
INNER join dbo.Fac ON Fac.Ik_fac=@ik_fac
left join 
 dbo.DiplomGak ON DiplomGak.ik_year=Year_uch_pl.ik_year_uch_pl
	AND  DiplomGak.ik_spec =@ik_spec
	AND DiplomGak.ik_fac=@ik_fac
LEFT JOIN dbo.EducationBranch AS [Profile] ON [Profile].ik_spec=@ik_profile
left join 
 dbo.DiplomGak as ProfileDiplomGak ON ProfileDiplomGak.ik_year=Year_uch_pl.ik_year_uch_pl
	AND  ProfileDiplomGak.ik_spec=@ik_profile
	AND ProfileDiplomGak.ik_fac=@ik_fac
left join [dbo].[Direction] on Spec_stud.ik_direction=[Direction].ik_direction


SELECT *
FROM   
dbo.Spec_stud 
where Spec_stud.ik_spec=@ik_spec