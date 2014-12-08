Select distinct Clastname +' '+Cfirstname +' '+ Cotch,Cshort_name_fac,Cname_grup,Gorod.Cgorod
from dbo.Person,dbo.Zach, dbo.StudGrup,dbo.Grup,dbo.Relation_spec_fac,dbo.Spec_stud,dbo.Fac,
dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod, dbo.Raion
where dbo.Zach.nCode = dbo.Person.nCode
and dbo.StudGrup.Ik_zach = dbo.Zach.Ik_zach
and dbo.Grup.Ik_grup = dbo.StudGrup.Ik_grup
and dbo.Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
and dbo.Relation_spec_fac.Ik_form_ed=1 --очная
and dbo.PersonAddress.nCode = dbo.Person.nCode
and dbo.Address.ik_address = dbo.PersonAddress.ik_address
and dbo.Street.Ik_street = dbo.Address.Ik_street
and dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
and dbo.Raion.Ik_raion = dbo.Gorod.Ik_raion
and dbo.Relation_spec_fac.ik_fac = dbo.Fac.Ik_fac
and dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec
--and dbo.Raion.Ik_region = 69 --Ненецкий
and ((dbo.StudGrup.Ik_prikazOtch is null)or(dbo.StudGrup.ik_pricOtch=3))
and dbo.Grup.DateExit > '2011-01-09' 
--and dbo.Gorod.Ik_raion =14 --не ухтинский район
and dbo.Gorod.Ik_gorod <> 504 --не ухта
--and Lobchegit=1
order by Cshort_name_fac



Select distinct Clastname +' '+Cfirstname +' '+ Cotch,Cshort_name_fac,Spec_stud.Cshort_spec, '1 курс',Gorod.Cgorod
from dbo.Person,dbo.Relation_spec_fac,dbo.Spec_stud,dbo.Fac,ABIT_postup,ABIT_Diapazon_spec_fac,
dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod, dbo.Raion
where ABIT_postup.nCode = dbo.Person.nCode
and ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
and NNyear=2011 and ik_zach IN (select ik_zach from ABIT_sost_zach where ik_type_zach=2)
and ABIT_Diapazon_spec_fac.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
and dbo.Relation_spec_fac.Ik_form_ed=1 --очная
and dbo.PersonAddress.nCode = dbo.Person.nCode
and dbo.Address.ik_address = dbo.PersonAddress.ik_address
and dbo.Street.Ik_street = dbo.Address.Ik_street
and dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
and dbo.Raion.Ik_raion = dbo.Gorod.Ik_raion
and dbo.Relation_spec_fac.ik_fac = dbo.Fac.Ik_fac
and dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec
--and dbo.Raion.Ik_region = 69 --Ненецкий
and dbo.Gorod.Ik_raion =14 --не ухтинский район
--and dbo.Gorod.Ik_gorod <> 504 --не ухта
--and Lobchegit=1
order by Cshort_name_fac

Select distinct Clastname +' '+Cfirstname +' '+ Cotch
from dbo.Person, dbo.Relation_spec_fac,dbo.Spec_stud,dbo.Fac,
dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod, dbo.Raion
where dbo.PersonAddress.nCode = dbo.Person.nCode
and dbo.Address.ik_address = dbo.PersonAddress.ik_address
and dbo.Street.Ik_street = dbo.Address.Ik_street
and dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
and dbo.Raion.Ik_raion = dbo.Gorod.Ik_raion
and dbo.Raion.Ik_region = 55 --Ненецкий
 