USE [UGTU]
GO

GO



--select * from [Spec_stud]
/*

ALTER VIEW [dbo].[Spec_stud]
AS
SELECT Cname_spec, ik_spec, Cshort_spec, Sh_spec, EducationBranch.ik_direction, Ik_vip_dep, dDate_spec, nN_prikaz, spDateExit, Cname_qualif,  
                  QualifShortName, EducationBranch.ik_FB, ik_main_spec, 
				  isnull([SpecCategory]+'-','') + isnull(Sh_spec + ' - ','') + Cname_spec + ' ('+Direction.cShort_name_direction + ')' as FullName, YearNormObuch,
				  isnull([SpecCategory]+'-','') + Cname_spec + ' ('+Direction.cShort_name_direction + ')' as Name,
				  EducationBranch.[ik_FinancingSource]--, [FinancingSource].SpecCategory, [FinancingSource].FinancingSourceName
				  --,Direction.[cName_direction],[cShort_name_direction], Direction.SortOrder
FROM     dbo.EducationBranch
left join Direction on Direction.ik_direction = EducationBranch.ik_direction
left join [dbo].[FinancingSource] on EducationBranch.[ik_FinancingSource]=[FinancingSource].[ik_FinancingSource]
Where id_type_branch = 1
go
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[ABIT_Diapazon_spec_fac_MainInf]
AS
SELECT DISTINCT 
                      dbo.ABIT_Diapazon_spec_fac.ik_spec_fac, dbo.Relation_spec_fac.ik_fac, dbo.ABIT_Diapazon_spec_fac.NNyear, 
                      dbo.Relation_spec_fac.YearObuch, dbo.Spec_stud.Sh_spec, dbo.Spec_stud.Cshort_spec, 
                      dbo.ABIT_Diapazon_spec_fac.NNrecord, dbo.Fac.Cshort_name_fac, 
					  dbo.Relation_spec_fac.ik_spec, dbo.Form_ed.Cname_form_ed, dbo.Form_ed.Ik_form_ed,
					  ABIT_Diapazon_spec_fac.BeginDiapazon, ABIT_Diapazon_spec_fac.EndDiapazon,
					  [MestCKP], [MestBudjet], [MestKontrakt], [MestLgot], [ik_profile], [lRussian]
FROM         dbo.ABIT_Diapazon_spec_fac INNER JOIN
                      dbo.Relation_spec_fac ON dbo.ABIT_Diapazon_spec_fac.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac INNER JOIN
                      dbo.Spec_stud ON dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec INNER JOIN
                      dbo.Fac ON dbo.Relation_spec_fac.ik_fac = dbo.Fac.Ik_fac INNER JOIN
                      dbo.Form_ed ON dbo.Relation_spec_fac.Ik_form_ed = dbo.Form_ed.Ik_form_ed LEFT JOIN
						[dbo].[EducationBranch] [profile] ON ABIT_Diapazon_spec_fac.ik_profile=[profile].ik_spec 
WHERE     (dbo.Relation_spec_fac.ik_spec_fac IN
                          (SELECT     ik_spec_fac
                            FROM          dbo.GetSpecAbitPermissionsFromRelTable() AS GetSpecAbitPermissionsFromRelTable_1))












SET QUOTED_IDENTIFIER ON
GO





/*
select *
from [dbo].[TREE_ABIT_Specialties] where NNyear=2015
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





*/


GO

update [dbo].[EducationBranch]
set [ik_direction]=12
where [ik_FinancingSource]=2

select *
from [dbo].[EducationBranch]
where [ik_FinancingSource]=2
