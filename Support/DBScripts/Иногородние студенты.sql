select FIO,Cshort_name_fac,/*Cshort_spec,*/Cname_grup,pr.Cstrana + ', ' + pr.Cregion +
	   ', ' + pr.Cgorod + ', ' + pr.CStreet+', '+pr.BuildingNumber+' - '+pr.FlatNumber,
		fac.Cstrana + ', ' + fac.Cregion + ', ' + fac.Cgorod + ', ' + fac.CStreet+', '+fac.BuildingNumber+' - '+fac.FlatNumber, 
vrem.Cstrana + ', ' + vrem.Cregion + ', ' + vrem.Cgorod + ', ' + vrem.CStreet+', '+vrem.BuildingNumber+' - '+vrem.FlatNumber,Lobchegit 
from
(

select distinct Fac.Cshort_name_fac,Spec_stud.Cshort_spec, Clastname + ' ' + Cfirstname + ' ' + Cotch FIO,
	   dbo.Person.nCode,Lobchegit,Grup.Cname_grup
from dbo.Person,Relation_spec_fac,Spec_stud,Fac,
     dbo.Zach, dbo.StudGrup,dbo.Grup
where dbo.Zach.nCode = dbo.Person.nCode
and dbo.StudGrup.Ik_zach = dbo.Zach.Ik_zach
and dbo.Grup.Ik_grup = dbo.StudGrup.Ik_grup
and dbo.Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ((dbo.StudGrup.Ik_prikazOtch is null)or(dbo.StudGrup.ik_pricOtch=3))
and dbo.Grup.DateExit > '2011-01-09' 
--and NNyear>=2009

) stud
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Gorod.Ik_gorod,Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on stud.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Gorod.Ik_gorod,Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fac
on stud.nCode = fac.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Gorod.Ik_gorod,Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on stud.nCode = vrem.nCode
where (pr.Ik_gorod in (508))or(fac.Ik_gorod in (508))or(vrem.Ik_gorod in (508))
order by FIO

