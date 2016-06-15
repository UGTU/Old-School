declare @YearMinDisp INT = 1995, @Step INT=3

select distinct c_grazd, Clastname +' '+ Cfirstname +' '+ isnull(Cotch,'') FIO, Cname_grup, Cshort_name_fac, year(Dd_birth), CONVERT(VARCHAR(10),Dd_birth,104) ,  Cname_spec, 
ISNULL(pr.Cstrana + ', ' + pr.Cregion +
	   ', ' + pr.Cgorod + ', ' + pr.CStreet+', '+pr.BuildingNumber+' - '+pr.FlatNumber,''),
		ISNULL(fac.Cstrana + ', ' + fac.Cregion + ', ' + fac.Cgorod + ', ' + fac.CStreet+', '+fac.BuildingNumber+' - '+fac.FlatNumber,''), 
		ISNULL(vrem.Cstrana + ', ' + vrem.Cregion + ', ' + vrem.Cgorod + ', ' + vrem.CStreet+', '+vrem.BuildingNumber+' - '+vrem.FlatNumber,'')
from (

select Person.nCode,Clastname, Cfirstname, Cotch, Dd_birth, ctelefon, cSotTel, Grup.Cname_grup, Cname_spec, Cshort_name_fac,[Cplacebirth],Person.ik_grazd, grazd.c_grazd
from person
left join grazd on grazd.ik_grazd = Person.Ik_grazd
left join Zach on Zach.nCode = person.nCode
left join StudGrup on StudGrup.Ik_zach = Zach.Ik_zach
left join Grup on StudGrup.Ik_grup = Grup.Ik_grup
left join Relation_spec_fac on Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
left join Fac on Fac.Ik_fac = Relation_spec_fac.ik_fac
left join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
where (Grup.DateExit>getdate())
and(StudGrup.Ik_prikazOtch is null)
and (Ik_form_ed = 1)
and Fac.ik_fac not in (15,17)
--and  YEAR(Grup.DateCreate)=2015

) Allstud
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on Allstud.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fac
on Allstud.nCode = fac.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion vremraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on Allstud.nCode = vrem.nCode
Where year(Dd_birth)
  in (@YearMinDisp, @YearMinDisp-@Step, @YearMinDisp-2*@Step, @YearMinDisp-3*@Step, 
  @YearMinDisp-4*@Step, @YearMinDisp-5*@Step, @YearMinDisp-6*@Step, 
  @YearMinDisp-7*@Step, @YearMinDisp-8*@Step, @YearMinDisp-9*@Step, 
  @YearMinDisp-10*@Step, @YearMinDisp-11*@Step, @YearMinDisp-12*@Step,
  @YearMinDisp-13*@Step, @YearMinDisp-14*@Step, @YearMinDisp-15*@Step,
  @YearMinDisp-16*@Step, @YearMinDisp-17*@Step, @YearMinDisp-18*@Step,
  @YearMinDisp-19*@Step, @YearMinDisp-20*@Step, @YearMinDisp-21*@Step)
  --and ((pr.Ik_raion=45)or(vrem.vremraion = 45))
  and ik_grazd = 2
order by FIO