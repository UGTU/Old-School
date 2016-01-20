Select count(sv.ik_disc) kolichestvo, sv.Ik_uch_plan, Cname_grup, Cname_fac, Cname_spec

from 
Grup AS Gr  LEFT JOIN
  Sv_disc as sv on sv.Ik_uch_plan = Gr.Ik_uch_plan INNER JOIN 
   Relation_spec_fac as Rs on Rs.ik_spec_fac = Gr.ik_spec_fac   INNER JOIN 
    EducationBranch as Eb on eb.ik_spec = Rs.ik_spec INNER JOIN 
      Fac as Fa On fa.Ik_fac = Rs.ik_fac 
 WHERE DateExit >= '2016-01-12'
GROUP BY sv.Ik_uch_plan,Cname_grup,Cname_fac, Cname_spec, DateExit
order by  kolichestvo
