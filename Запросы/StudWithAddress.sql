select Cshort_name_fac,Cname_spec,cmedal,FIO,cast(Dd_birth as DATE), cSotTel,ctelefon,pr.Cstrana + ', ' + pr.Cregion +
	   ', ' + pr.Cgorod + ', ' + pr.CStreet+', '+pr.BuildingNumber+' - '+pr.FlatNumber,
		fac.Cstrana + ', ' + fac.Cregion + ', ' + fac.Cgorod + ', ' + fac.CStreet+', '+fac.BuildingNumber+' - '+fac.FlatNumber, 
vrem.Cstrana + ', ' + vrem.Cregion + ', ' + vrem.Cgorod + ', ' + vrem.CStreet+', '+vrem.BuildingNumber+' - '+vrem.FlatNumber from
(select Fac.Cshort_name_fac,Spec_stud.Cname_spec, Clastname + ' ' + Cfirstname + ' ' + Cotch FIO,Dd_birth,cSotTel,ctelefon,dbo.Person.nCode,cmedal
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,medal_abit,Relation_spec_fac,Spec_stud,Fac
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)
and dbo.Student.nCode = ABIT_postup.nCode
and Student.ik_medal = medal_abit.ik_medal
and medal_abit.ik_medal in (2,3,4)
and NNyear=2011) stud
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on stud.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fac
on stud.nCode = fac.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on stud.nCode = vrem.nCode
order by cmedal,FIO

