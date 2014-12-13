select distinct p.Clastname +' ' +p.Cfirstname +' '+p.Cotch as FIO,cast(p.Dd_birth as DATE)
from Person p, Relation_spec_fac rsf,Spec_stud,StudGrup,Zach,Grup,Prikaz
where p.nCode = Zach.nCode
and Zach.Ik_zach = StudGrup.Ik_zach
and StudGrup.Ik_grup = Grup.Ik_grup
and Grup.DateCreate <'01.01.2009'
and Grup.DateExit>'01.01.2006'
and ((StudGrup.ik_pricOtch = Prikaz.Ik_prikaz
and Prikaz.Dd_prikazVst > '01.01.2009')or(StudGrup.ik_pricOtch is null))
and Grup.ik_spec_fac = rsf.ik_spec_fac
and Spec_stud.ik_spec = rsf.ik_spec
and ik_direction=2
and Spec_stud.ik_spec in (180400,354475,354453,354421)  --›¿œ
order by FIO


and ap.NNrecord = adsf.NNrecord
and adsf.ik_spec_fac=rsf.ik_spec_fac
and Fac.Ik_fac = rsf.ik_fac
and Spec_stud.ik_spec = rsf.ik_spec
and adsf.NNyear=2011
and ap.ik_zach=asz.ik_zach and ik_type_zach = 2
and p.lSex =1
and Fac.Ik_fac not in (6,20)
order by Fac.Cshort_name_fac,Spec_stud.Cname_spec,p.Clastname