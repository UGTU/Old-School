--студе
select distinct c_grazd,FIO,Cname_grup,Cname_form_ed,Cname_fac,Cname_spec,Course

,pr.Cstrana + ', ' + pr.Cregion +
	   ', ' + pr.Cgorod + ', ' + pr.CStreet+', '+pr.BuildingNumber+' - '+pr.FlatNumber,
		fac.Cstrana + ', ' + fac.Cregion + ', ' + fac.Cgorod + ', ' + fac.CStreet+', '+fac.BuildingNumber+' - '+fac.FlatNumber, 
vrem.Cstrana + ', ' + vrem.Cregion + ', ' + vrem.Cgorod + ', ' + vrem.CStreet+', '+vrem.BuildingNumber+' - '+vrem.FlatNumber,ctelefon,cSotTel

,nYear_post, DateExit
from
(

(Select distinct Person.Ik_grazd,c_grazd,Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec,Form_ed.Cname_form_ed, cast((year(GETDATE())-Grup.nYear_post) as varchar(2)) + ' ' + 'курс' as Course,
				 Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ isnull(Cotch,'') fio, cast(Person.Dd_birth AS DATE) Dd_birth, Person.ctelefon,Person.cSotTel, Grup.nYear_post, Grup.DateExit
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
inner join Form_ed on Form_ed.Ik_form_ed = Relation_spec_fac.Ik_form_ed
inner join grazd on grazd.ik_grazd = Person.Ik_grazd
inner join dbo.Kat_zach ON StudGrup.ik_kat_zach=Kat_zach.Ik_kat_zach
where  StudGrup.Ik_prikazOtch is null
and StudGrup.Ik_prikazZach is not null
 --не отчислен из группы
and Grup.DateExit>GETDATE()
and Fac.Ik_fac not in (15,17,21,23,22,31) --order by c_grazd	 					--заочники 
and Form_ed.Ik_form_ed=1
and Cname_grup<>'АИС-09'
and Kat_zach.ik_type_kat=3
--and Lobchegit=1
) Allstud

left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region, Gorod.Ik_gorod
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on Allstud.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region, Gorod.Ik_gorod
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fac
on Allstud.nCode = fac.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region, Gorod.Ik_gorod
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on Allstud.nCode = vrem.nCode)
where --(pr.Ik_strana<>2)or(fac.Ik_strana <> 2)or(Ik_grazd<>2) 
(pr.Ik_gorod<>504)or(fac.Ik_gorod <> 504)or(vrem.Ik_gorod<>504)
order by nYear_post, Cname_grup --pr.Cstrana,fac.Cstrana
-------------------------------------------------------------------------------------------------------------------------------------
