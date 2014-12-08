select Direction.cName_direction,count(distinct StudGrup.Ik_zach)
from StudGrup,Grup,Relation_spec_fac,Spec_stud,Direction
Where  StudGrup.Ik_grup = Grup.Ik_grup and Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec and Spec_stud.ik_direction = Direction.ik_direction
and year([DateExit]) >= 2014 and StudGrup.Ik_prikazOtch is null
group by Direction.cName_direction

-----------------------------------------------------------------------------------------все студенты
select strana,region, count(distinct nCode) from
(select isnull(isnull(pr_strana,fac_strana),vrem_strana) strana, isnull(isnull(pr_region,fac_region),vrem_region) region,Allstud.nCode
from
(
(Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec, cast((year(GETDATE())-Grup.nYear_post+1) as varchar(2)) + ' ' + 'курс' as Course,
				 Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth, Person.ctelefon,Person.cSotTel, Direction.cName_direction
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Direction on Spec_stud.ik_direction = Direction.ik_direction
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  StudGrup.Ik_prikazOtch is null --не отчислен из группы
and (year(Grup.DateExit)>=year(GETDATE()))
) Allstud

left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion pr_region,Cstrana pr_strana,Strana.Ik_strana,Raion.Ik_raion prraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on Allstud.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion fac_region,Cstrana fac_strana,Strana.Ik_strana,Raion.Ik_raion facraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fac
on Allstud.nCode = fac.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion vrem_region,Cstrana vrem_strana,Strana.Ik_strana,Raion.Ik_raion vremraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on Allstud.nCode = vrem.nCode)
where (isnull(isnull(prraion,facraion),vremraion) <> 45)or(isnull(isnull(prraion,facraion),vremraion) is null)
) temp
group by strana,region
order by strana,region

------------------------------------------------------------------------выпускники----------------------------------------------------------------------------------
select cName_direction,strana,region, count(distinct nCode) from
(select isnull(isnull(pr_strana,fac_strana),vrem_strana) strana, isnull(isnull(pr_region,fac_region),vrem_region) region,Allstud.nCode,cName_direction
from
(
(Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec, cast((year(GETDATE())-Grup.nYear_post+1) as varchar(2)) + ' ' + 'курс' as Course,
				 Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth, Person.ctelefon,Person.cSotTel, Direction.cName_direction
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Direction on Spec_stud.ik_direction = Direction.ik_direction
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  StudGrup.Ik_prikazOtch is null --не отчислен из группы
and (year(Grup.DateExit)=year(GETDATE()))
) Allstud

left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion pr_region,Cstrana pr_strana,Strana.Ik_strana,Raion.Ik_raion prraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on Allstud.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion fac_region,Cstrana fac_strana,Strana.Ik_strana,Raion.Ik_raion facraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fac
on Allstud.nCode = fac.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion vrem_region,Cstrana vrem_strana,Strana.Ik_strana,Raion.Ik_raion vremraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on Allstud.nCode = vrem.nCode)
where (isnull(isnull(prraion,facraion),vremraion) <> 45)or(isnull(isnull(prraion,facraion),vremraion) is null)
) temp
group by cName_direction,strana,region
order by cName_direction,strana,region


------------------------------------------------------------------------1-й курс---------------------------------------------------------------------------------------------------------------
select cName_direction,strana,region, count(distinct nCode) from
(select isnull(isnull(pr_strana,fac_strana),vrem_strana) strana, isnull(isnull(pr_region,fac_region),vrem_region) region,Allstud.nCode,cName_direction
from
(
(Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec, cast((year(GETDATE())-Grup.nYear_post+1) as varchar(2)) + ' ' + 'курс' as Course,
				 Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth, Person.ctelefon,Person.cSotTel, Direction.cName_direction
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Direction on Spec_stud.ik_direction = Direction.ik_direction
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  StudGrup.Ik_prikazOtch is null --не отчислен из группы
and (Grup.nYear_post=2013)
) Allstud

left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion pr_region,Cstrana pr_strana,Strana.Ik_strana,Raion.Ik_raion prraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on Allstud.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion fac_region,Cstrana fac_strana,Strana.Ik_strana,Raion.Ik_raion facraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fac
on Allstud.nCode = fac.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion vrem_region,Cstrana vrem_strana,Strana.Ik_strana,Raion.Ik_raion vremraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on Allstud.nCode = vrem.nCode)
where (isnull(isnull(prraion,facraion),vremraion) = 45)--or(isnull(isnull(prraion,facraion),vremraion) is null)
) temp
group by cName_direction,strana,region
order by cName_direction,strana,region