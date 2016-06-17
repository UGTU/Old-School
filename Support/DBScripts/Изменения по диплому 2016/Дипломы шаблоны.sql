SELECT Relation_spec_fac.*,    EducationBranch.*    
FROM            dbo.Fac INNER JOIN
                         dbo.Relation_spec_fac ON dbo.Fac.Ik_fac = dbo.Relation_spec_fac.ik_fac INNER JOIN
                         dbo.EducationBranch ON dbo.Relation_spec_fac.ik_spec = dbo.EducationBranch.ik_spec

where EducationBranch.ik_direction in (1,9,10) and Relation_spec_fac.ik_fac in (14,15,17)


update Relation_spec_fac
set Relation_spec_fac.[DiplExcPatternName]='DiplomBak2015.XLT'
FROM  dbo.Fac INNER JOIN
        dbo.Relation_spec_fac ON dbo.Fac.Ik_fac = dbo.Relation_spec_fac.ik_fac INNER JOIN
        dbo.EducationBranch ON dbo.Relation_spec_fac.ik_spec = dbo.EducationBranch.ik_spec

where EducationBranch.ik_direction in (1,9,10) and Relation_spec_fac.ik_fac in (14,15,17)