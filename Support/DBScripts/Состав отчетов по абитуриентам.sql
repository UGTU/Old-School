select ars.ID,Cshort_name_fac,Cname_spec,cName_direction,ReportName,ars.IDReport,rsf.ik_spec_fac,rsf.ik_spec
from ABIT_Report,ABIT_Report_spec ars,Relation_spec_fac rsf,Fac,Spec_stud,Direction
where ABIT_Report.IDReport = ars.IDReport
and ars.ik_spec_fac = rsf.ik_spec_fac
and rsf.ik_fac = Fac.Ik_fac and rsf.ik_spec = Spec_stud.ik_spec
and Spec_stud.ik_direction = Direction.ik_direction
order by ReportName
