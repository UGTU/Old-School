select distinct cast(dd_pod_zayav as Date) dd_pod_zayav,Clastname, Cfirstname, Cotch,lSex+1 as lSex, cast(Dd_birth as DATE) Dd_birth, 
	            Cplacebirth, ctelefon, cSotTel,Fac.Cshort_name_fac,Spec_stud.Cname_spec,
				dbo.Person.nCode
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac,Zach
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ABIT_postup.nCode = Zach.nCode
and ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and Zach.Ik_zach not in (select ik_zach from StudGrup)
and NNyear=2014