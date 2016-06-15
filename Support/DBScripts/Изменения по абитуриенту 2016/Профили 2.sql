USE [UGTU]
GO

/****** Object:  View [dbo].[TREE_ABIT_Specialties]    Script Date: 04.05.2016 11:40:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




/*
select *
from [dbo].[TREE_ABIT_Specialties] where NNyear=2016
*/

ALTER VIEW [dbo].[TREE_ABIT_Specialties]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT dbo.ABIT_Diapazon_spec_fac.ik_spec_fac, dbo.Relation_spec_fac.ik_fac, dbo.ABIT_Diapazon_spec_fac.NNyear, 
                      dbo.Relation_spec_fac.YearObuch, dbo.Spec_stud.Sh_spec,dbo.Spec_stud.Cname_spec+ISNULL(' - '+[profile].Cshort_spec,'') Cname_spec, dbo.Spec_stud.Cshort_spec, 
                      dbo.ABIT_Diapazon_spec_fac.NNrecord, dbo.Fac.Cshort_name_fac, 
					  dbo.Spec_stud.Cname_spec+ISNULL(' - '+[profile].Cshort_spec,'') + ' (' + dbo.Fac.Cshort_name_fac + ')' AS Name, 
                      dbo.Direction.cName_direction, dbo.Relation_spec_fac.ik_spec, dbo.Form_ed.Cname_form_ed, dbo.Form_ed.Ik_form_ed,
					  ABIT_Diapazon_spec_fac.BeginDiapazon, ABIT_Diapazon_spec_fac.EndDiapazon,
					  dbo.Spec_stud.Name +ISNULL(' - '+[profile].Cshort_spec,'') + ' (' + dbo.Fac.Cshort_name_fac + ')' AS FullName,
						[MestCKP], [MestBudjet], [MestKontrakt], [MestLgot], [ik_profile], [lRussian]
FROM         dbo.ABIT_Diapazon_spec_fac INNER JOIN
                      dbo.Relation_spec_fac ON dbo.ABIT_Diapazon_spec_fac.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac INNER JOIN
                      dbo.Spec_stud ON dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec INNER JOIN
                      dbo.Fac ON dbo.Relation_spec_fac.ik_fac = dbo.Fac.Ik_fac INNER JOIN
                      dbo.Form_ed ON dbo.Relation_spec_fac.Ik_form_ed = dbo.Form_ed.Ik_form_ed LEFT OUTER JOIN
                      dbo.Direction ON dbo.Spec_stud.ik_direction = dbo.Direction.ik_direction LEFT JOIN
						[dbo].[EducationBranch] [profile] ON ABIT_Diapazon_spec_fac.ik_profile=[profile].ik_spec
WHERE     (dbo.Relation_spec_fac.ik_spec_fac IN
                          (SELECT     ik_spec_fac
                            FROM          dbo.GetSpecAbitPermissionsFromRelTable() AS GetSpecAbitPermissionsFromRelTable_1) and dbo.Relation_spec_fac.Ik_form_ed=1)

union
SELECT DISTINCT 
                      TOP (100) PERCENT dbo.ABIT_Diapazon_spec_fac.ik_spec_fac, dbo.Relation_spec_fac.ik_fac, dbo.ABIT_Diapazon_spec_fac.NNyear, 
                      dbo.Relation_spec_fac.YearObuch, dbo.Spec_stud.Sh_spec,dbo.Spec_stud.Cname_spec+ISNULL(' - '+[profile].Cshort_spec,'') Cname_spec, dbo.Spec_stud.Cshort_spec, 
                      dbo.ABIT_Diapazon_spec_fac.NNrecord, dbo.Fac.Cshort_name_fac, '(Ç) '+ dbo.Spec_stud.Cname_spec +ISNULL(' - '+[profile].Cshort_spec,'')+ ' (' + dbo.Fac.Cshort_name_fac + ')' AS Name, 
                      dbo.Direction.cName_direction, dbo.Relation_spec_fac.ik_spec, dbo.Form_ed.Cname_form_ed, dbo.Form_ed.Ik_form_ed,
					  ABIT_Diapazon_spec_fac.BeginDiapazon, ABIT_Diapazon_spec_fac.EndDiapazon,
					  '(Ç) '+ dbo.Spec_stud.Name +ISNULL(' - '+[profile].Cshort_spec,'')+ ' (' + dbo.Fac.Cshort_name_fac + ')' AS FullName,
						[MestCKP], [MestBudjet], [MestKontrakt], [MestLgot], [ik_profile], [lRussian]
FROM         dbo.ABIT_Diapazon_spec_fac INNER JOIN
                      dbo.Relation_spec_fac ON dbo.ABIT_Diapazon_spec_fac.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac INNER JOIN
                      dbo.Spec_stud ON dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec INNER JOIN
                      dbo.Fac ON dbo.Relation_spec_fac.ik_fac = dbo.Fac.Ik_fac INNER JOIN
                      dbo.Form_ed ON dbo.Relation_spec_fac.Ik_form_ed = dbo.Form_ed.Ik_form_ed LEFT OUTER JOIN
                      dbo.Direction ON dbo.Spec_stud.ik_direction = dbo.Direction.ik_direction LEFT JOIN
						[dbo].[EducationBranch] [profile] ON ABIT_Diapazon_spec_fac.ik_profile=[profile].ik_spec
WHERE     (dbo.Relation_spec_fac.ik_spec_fac IN
                          (SELECT     ik_spec_fac
                            FROM          dbo.GetSpecAbitPermissionsFromRelTable() AS GetSpecAbitPermissionsFromRelTable_1) and dbo.Relation_spec_fac.Ik_form_ed in (2, 6))
union
SELECT DISTINCT 
                      TOP (100) PERCENT dbo.ABIT_Diapazon_spec_fac.ik_spec_fac, dbo.Relation_spec_fac.ik_fac, dbo.ABIT_Diapazon_spec_fac.NNyear, 
                      dbo.Relation_spec_fac.YearObuch, dbo.Spec_stud.Sh_spec,dbo.Spec_stud.Cname_spec+ISNULL(' - '+[profile].Cshort_spec,'') Cname_spec, dbo.Spec_stud.Cshort_spec, 
                      dbo.ABIT_Diapazon_spec_fac.NNrecord, dbo.Fac.Cshort_name_fac, '(Î/Ç) '+ dbo.Spec_stud.Cname_spec +ISNULL(' - '+[profile].Cshort_spec,'')+ ' (' + dbo.Fac.Cshort_name_fac + ')' AS Name, 
                      dbo.Direction.cName_direction, dbo.Relation_spec_fac.ik_spec, dbo.Form_ed.Cname_form_ed, dbo.Form_ed.Ik_form_ed,
					  ABIT_Diapazon_spec_fac.BeginDiapazon, ABIT_Diapazon_spec_fac.EndDiapazon,
					  '(Î/Ç) '+ dbo.Spec_stud.Name +ISNULL(' - '+[profile].Cshort_spec,'')+ ' (' + dbo.Fac.Cshort_name_fac + ')' AS FullName,
						[MestCKP], [MestBudjet], [MestKontrakt], [MestLgot], [ik_profile], [lRussian]
FROM         dbo.ABIT_Diapazon_spec_fac INNER JOIN
                      dbo.Relation_spec_fac ON dbo.ABIT_Diapazon_spec_fac.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac INNER JOIN
                      dbo.Spec_stud ON dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec INNER JOIN
                      dbo.Fac ON dbo.Relation_spec_fac.ik_fac = dbo.Fac.Ik_fac INNER JOIN
                      dbo.Form_ed ON dbo.Relation_spec_fac.Ik_form_ed = dbo.Form_ed.Ik_form_ed LEFT OUTER JOIN
                      dbo.Direction ON dbo.Spec_stud.ik_direction = dbo.Direction.ik_direction LEFT JOIN
						[dbo].[EducationBranch] [profile] ON ABIT_Diapazon_spec_fac.ik_profile=[profile].ik_spec
WHERE     (dbo.Relation_spec_fac.ik_spec_fac IN
                          (SELECT     ik_spec_fac
                            FROM          dbo.GetSpecAbitPermissionsFromRelTable() AS GetSpecAbitPermissionsFromRelTable_1) and dbo.Relation_spec_fac.Ik_form_ed = 7)
--ORDER BY dbo.Spec_stud.Cname_spec







GO


GO
--select * from [ABIT_GetNaborList](2016)
ALTER    FUNCTION [dbo].[ABIT_GetNaborList](@nnyear int)
RETURNS @Result TABLE
   (
	NNrecord		INT,
	ik_spec_fac		INT,
	ik_fac			INT,
	fac				VARCHAR(150), 
	SF				VARCHAR(150),
	[budj]			VARCHAR(100),
	[ckp]			VARCHAR(100),
	[lgot]			VARCHAR(100),
	[kont]			VARCHAR(100),
	MestBudjet		INT,
	MestCKP			INT,
	MestLgot		INT, 
	MestKontrakt	INT,
	nnyear			INT,
	lRussian		BIT,	
	factBudjet		INT,
	factCKP			INT,
	factLgot		INT,
	factKontrakt	INT,
	ik_spec			INT,
	ik_profile		INT
) 

AS

BEGIN
DECLARE @idreport int
SET @idreport=7

DECLARE @day datetime
SET @day=GETDATE()

declare @daysCount int
set @daysCount=1

declare @isreal int
set @isreal=2

	INSERT INTO @Result
	select 
	[TREE_ABIT_Specialties].NNrecord,
	ik_spec_fac,
	ik_fac,
	PostupCount.CShort_name_fac, 
	ShortNameFormEduc+Cname_spec+' ('+ cName_direction +')',
	LTRIM(STR(MestBudjet))+' / '+LTRIM(STR(PostupCount.[1])) +' / '+LTRIM(STR(UnicPostupCount.[1])),
	LTRIM(STR(MestCKP))+' / '+LTRIM(STR(PostupCount.[2])) +' / '+LTRIM(STR(UnicPostupCount.[2])),
	LTRIM(STR(MestLgot))+' / '+LTRIM(STR(PostupCount.[3])) +' / '+LTRIM(STR(UnicPostupCount.[3])),
	LTRIM(STR(MestKontrakt))+' / '+LTRIM(STR(PostupCount.[4])) +' / '+LTRIM(STR(UnicPostupCount.[4])),
	MestBudjet,
	MestCKP,
	MestLgot,
	MestKontrakt, 
	@nnyear,
	lRussian,
	PostupCount.[1],
	PostupCount.[2],
	PostupCount.[3],
	PostupCount.[4],
	ik_spec,
	ik_profile
	from 
		[dbo].[TREE_ABIT_Specialties],
		[dbo].[Abit_StatisticFact](@nnyear,@idreport,@day,@daysCount,@isreal) AS PostupCount,
		[dbo].[Abit_StatisticUniqFact](@nnyear,@idreport,@day,@daysCount,@isreal) AS UnicPostupCount,
		[dbo].[ABIT_GetFormEducInfo]() as FormEduc


		/*dbo.ABIT_Diapazon_spec_fac.ik_spec_fac, dbo.Relation_spec_fac.ik_fac, dbo.ABIT_Diapazon_spec_fac.NNyear, 
                      dbo.Relation_spec_fac.YearObuch, dbo.Spec_stud.Sh_spec,dbo.Spec_stud.Cname_spec+ISNULL(' - '+[profile].Cshort_spec,'') Cname_spec, dbo.Spec_stud.Cshort_spec, 
                      dbo.ABIT_Diapazon_spec_fac.NNrecord, dbo.Fac.Cshort_name_fac, 
					  dbo.Spec_stud.Cname_spec+ISNULL(' - '+[profile].Cshort_spec,'') + ' (' + dbo.Fac.Cshort_name_fac + ')' AS Name, 
                      dbo.Direction.cName_direction, dbo.Relation_spec_fac.ik_spec, dbo.Form_ed.Cname_form_ed, dbo.Form_ed.Ik_form_ed,
					  ABIT_Diapazon_spec_fac.BeginDiapazon, ABIT_Diapazon_spec_fac.EndDiapazon,
					  dbo.Spec_stud.Name +ISNULL(' - '+[profile].Cshort_spec,'') + ' (' + dbo.Fac.Cshort_name_fac + ')' AS FullName*/
WHERE [TREE_ABIT_Specialties].NNyear=@nnyear
	AND [TREE_ABIT_Specialties].NNrecord=PostupCount.NNrecord
	AND [TREE_ABIT_Specialties].NNrecord=UnicPostupCount.NNrecord
	AND [TREE_ABIT_Specialties].Ik_form_ed=FormEduc.Ik_form_ed
	
order by 	PostupCount.CShort_name_fac, PostupCount.cShort_spec
RETURN 
END




go