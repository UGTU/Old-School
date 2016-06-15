/*WITH StudCountTable (Ik_fac, Cname_fac, CType_kat, Cname_spec,  Cname_form_ed, StudCount)
AS
-- Define the CTE query.
(
    SELECT Fac.Ik_fac, Fac.Cname_fac, TypeKatZach.CType_kat, EducationBranch.Cname_spec,  Form_ed.Cname_form_ed, COUNT([Ik_studGrup]) StudCount     
		FROM            dbo.Fac INNER JOIN
                         dbo.Relation_spec_fac ON dbo.Fac.Ik_fac = dbo.Relation_spec_fac.ik_fac INNER JOIN
                         dbo.EducationBranch ON dbo.Relation_spec_fac.ik_spec = dbo.EducationBranch.ik_spec INNER JOIN
                         dbo.Grup ON dbo.Relation_spec_fac.ik_spec_fac = dbo.Grup.ik_spec_fac INNER JOIN
                         dbo.StudGrup ON dbo.Grup.Ik_grup = dbo.StudGrup.Ik_grup 
							AND StudGrup.[Ik_prikazOtch] is null
						 
						 INNER JOIN
                         dbo.Zach ON dbo.StudGrup.Ik_zach = dbo.Zach.Ik_zach INNER JOIN
                         dbo.Student ON dbo.Zach.nCode = dbo.Student.nCode INNER JOIN
                         dbo.Person ON dbo.Student.nCode = dbo.Person.nCode INNER JOIN
                         dbo.Kat_zach ON dbo.StudGrup.ik_kat_zach = dbo.Kat_zach.Ik_kat_zach INNER JOIN
                         dbo.Form_ed ON dbo.Relation_spec_fac.Ik_form_ed = dbo.Form_ed.Ik_form_ed INNER JOIN
                         dbo.TypeKatZach ON dbo.Kat_zach.ik_type_kat = dbo.TypeKatZach.ik_type_kat
			WHERE  Grup.[DateExit] > GETDATE()

		GROUP BY Fac.Ik_fac, Fac.Cname_fac, TypeKatZach.CType_kat, EducationBranch.Cname_spec,  Form_ed.Cname_form_ed
)


select 'УГТУ' as DepName, CType_kat, Cname_form_ed, SUM(StudCount) StudCount
FROM StudCountTable
WHERE Ik_fac NOT IN (14,15,17)
GROUP BY CType_kat, Cname_form_ed

UNION
select 'Воркута' as DepName, CType_kat, Cname_form_ed, SUM(StudCount) StudCount
FROM StudCountTable
WHERE Ik_fac NOT IN (15)
GROUP BY CType_kat, Cname_form_ed

UNION
select 'Усинск' as DepName, CType_kat, Cname_form_ed, SUM(StudCount) StudCount
FROM StudCountTable
WHERE Ik_fac NOT IN (17)
GROUP BY CType_kat, Cname_form_ed
*/
go


SELECT DISTINCT Ik_fac, Cname_fac, Cname_spec, ik_spec,
	[1] AS [Очное], [2] AS [Заочное]
FROM 
(SELECT DISTINCT Fac.Ik_fac, Fac.Cname_fac, EducationBranch.Cname_spec
	, Form_ed.Ik_form_ed, Zach.Ik_zach, EducationBranch.ik_spec
		FROM            dbo.Fac INNER JOIN
                         dbo.Relation_spec_fac ON dbo.Fac.Ik_fac = dbo.Relation_spec_fac.ik_fac INNER JOIN
                         dbo.EducationBranch ON dbo.Relation_spec_fac.ik_spec = dbo.EducationBranch.ik_spec INNER JOIN
                         dbo.Grup ON dbo.Relation_spec_fac.ik_spec_fac = dbo.Grup.ik_spec_fac INNER JOIN
                         dbo.StudGrup ON dbo.Grup.Ik_grup = dbo.StudGrup.Ik_grup 
							AND StudGrup.[Ik_prikazOtch] is null
						 
						 INNER JOIN
                         dbo.Zach ON dbo.StudGrup.Ik_zach = dbo.Zach.Ik_zach INNER JOIN
                         dbo.Student ON dbo.Zach.nCode = dbo.Student.nCode INNER JOIN
                         dbo.Person ON dbo.Student.nCode = dbo.Person.nCode INNER JOIN
                        dbo.Form_ed ON dbo.Relation_spec_fac.Ik_form_ed = dbo.Form_ed.Ik_form_ed --INNER JOIN
			WHERE  Grup.[DateExit] > GETDATE())StudCount
PIVOT
(
COUNT (Ik_zach)
FOR Ik_form_ed IN
( [1],[2] )
) AS pvt
ORDER BY Cname_fac, Cname_spec