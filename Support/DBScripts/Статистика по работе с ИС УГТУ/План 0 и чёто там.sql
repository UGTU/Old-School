Select Ik_uch_plan, Cname_grup, nYear_post, Cname_grup, Cname_fac, Cname_spec
From Grup as gr INNER JOIN

 Relation_spec_fac as Rs on Rs.ik_spec_fac = Gr.ik_spec_fac   INNER JOIN 
 EducationBranch as Eb on eb.ik_spec = Rs.ik_spec INNER JOIN 
 Fac as Fa On fa.Ik_fac = Rs.ik_fac 

 WHERE DateExit >= '2016-01-12'
 and
Ik_uch_plan is null
 