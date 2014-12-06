select distinct p.Clastname,p.Cfirstname +' '+p.Cotch,year(p.Dd_birth),Fac.Cshort_name_fac,Spec_stud.Cname_spec
from Person p, ABIT_postup ap,ABIT_Diapazon_spec_fac adsf,ABIT_sost_zach asz,Relation_spec_fac rsf,Fac,Spec_stud
where p.nCode = ap.nCode
and ap.NNrecord = adsf.NNrecord
and adsf.ik_spec_fac=rsf.ik_spec_fac
and Fac.Ik_fac = rsf.ik_fac
and Spec_stud.ik_spec = rsf.ik_spec
and adsf.NNyear=2011
and ap.ik_zach=asz.ik_zach and ik_type_zach = 2
and p.lSex =1
and Fac.Ik_fac not in (6,20)
order by Fac.Cshort_name_fac,Spec_stud.Cname_spec,p.Clastname

select distinct p.Clastname,p.Cfirstname +' '+p.Cotch, ap.ik_kat_zach, ap.NN_abit,p.nCode
from Person p, ABIT_postup ap,ABIT_sost_zach asz
where p.nCode = ap.nCode
and p.Clastname='Торопова'
and p.nCode=19120

select * from Zach where nCode=19120