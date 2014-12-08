--студенты
select Clastname, IMO, year(Dd_birth),1,Cname_grup,Cname_fac,Nn_prikaz,Dd_prikaz,cvid_doc,NULL,Cname_spec,cName_direction,csem_pol,Dd_birth, Cplacebirth,
	   pr.Cstrana + ', ' + pr.Cregion +
	   ', ' + pr.Cgorod + ', ' + pr.CStreet+', '+pr.BuildingNumber+' - '+pr.FlatNumber,
		fac.Cstrana + ', ' + fac.Cregion + ', ' + fac.Cgorod + ', ' + fac.CStreet+', '+fac.BuildingNumber+' - '+fac.FlatNumber, 
		vrem.Cstrana + ', ' + vrem.Cregion + ', ' + vrem.Cgorod + ', ' + vrem.CStreet+', '+vrem.BuildingNumber+' - '+vrem.FlatNumber,ctelefon,cSotTel, 
	Cvoen_zvanie,c_grazd
from
(

(Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec, cast((year(GETDATE())-Grup.nYear_post+1) as varchar(2)) + ' ' + 'курс' as Course, 
				 Cshort_name_fac,Grup.Cname_grup,Clastname, Cfirstname +' '+ Cotch IMO, Person.ctelefon,Person.cSotTel,Prikaz.Nn_prikaz,Dd_prikaz,cName_direction,
				 Voen_zvanie.Cvoen_zvanie,sem_pol.csem_pol, cast(Person.Dd_birth AS DATE) Dd_birth,Person.Cplacebirth,grazd.c_grazd, cvid_doc
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Prikaz on StudGrup.Ik_prikazZach = Prikaz.Ik_prikaz
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
inner join grazd on grazd.ik_grazd = Person.Ik_grazd
inner join Doc_stud on Doc_stud.nCode = Person.nCode
inner join documents on documents.ik_vid_doc = Doc_stud.Ik_vid_doc
inner join direction on direction.ik_direction = Spec_stud.ik_direction
left join Voen_zvanie on Voen_zvanie.Ik_voen_zvanie = Person.ik_voen_zvanie
left join sem_pol on Person.Ik_sem_pol = sem_pol.ik_sem_pol
where  StudGrup.Ik_prikazOtch is null --не отчислен из группы
and (year(Grup.DateExit)>year(GETDATE()))
and IsEducational = 1
and Person.lSex = 1
--and Fac.Ik_fac in (6)						--заочники
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
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on Allstud.nCode = vrem.nCode)
order by c_grazd,FIO
-------------------------------------------------------------------------------------------------------------------------------------
--абитуриенты
select Clastname, IMO, year(Dd_birth),1,Cname_grup,Cname_fac,Nn_prikaz,Dd_prikaz,cvid_doc,NULL,Cname_spec,cName_direction,csem_pol,cast(Dd_birth as date), Cplacebirth,
	   pr.Cstrana + ', ' + pr.Cregion +
	   ', ' + pr.Cgorod + ', ' + pr.CStreet+', '+pr.BuildingNumber+' - '+pr.FlatNumber,
		fac.Cstrana + ', ' + fac.Cregion + ', ' + fac.Cgorod + ', ' + fac.CStreet+', '+fac.BuildingNumber+' - '+fac.FlatNumber, 
		vrem.Cstrana + ', ' + vrem.Cregion + ', ' + vrem.Cgorod + ', ' + vrem.CStreet+', '+vrem.BuildingNumber+' - '+vrem.FlatNumber,
	Cvoen_zvanie,c_grazd
from
(

Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec,Grup.Cname_grup, Clastname, Cfirstname +' '+ Cotch IMO, Person.ctelefon,Person.cSotTel,Prikaz.Nn_prikaz,Dd_prikaz,cName_direction,
				 Voen_zvanie.Cvoen_zvanie,sem_pol.csem_pol, cast(Person.Dd_birth AS DATE) Dd_birth,Person.Cplacebirth,grazd.c_grazd, cvid_doc
from dbo.Person
inner join ABIT_postup on ABIT_postup.nCode = dbo.Person.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
inner join dbo.Student on dbo.Student.nCode = ABIT_postup.nCode
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
inner join grazd on Person.Ik_grazd = grazd.ik_grazd
inner join Form_ed on Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
inner join Kat_zach on ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
inner join TypeKatZach on Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
inner join Doc_stud on Doc_stud.nCode = Person.nCode
inner join documents on documents.ik_vid_doc = Doc_stud.Ik_vid_doc
inner join direction on direction.ik_direction = Spec_stud.ik_direction
left join Zach on Zach.nCode = Person.nCode
left join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
left join Grup on StudGrup.Ik_grup = Grup.Ik_grup
left join Prikaz on StudGrup.Ik_prikazZach = Prikaz.Ik_prikaz
left join Voen_zvanie on Voen_zvanie.Ik_voen_zvanie = Person.ik_voen_zvanie
left join sem_pol on Person.Ik_sem_pol = sem_pol.ik_sem_pol
where  Person.lSex = 1
and ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
--and Zach.Ik_zach not in (select ik_zach from StudGrup)
and IsEducational = 1
and direction.ik_direction = 5
--and Fac.Ik_fac in (6)									--заочники
and NNyear=year(GETDATE())
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
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on Allstud.nCode = vrem.nCode
order by c_grazd,Clastname, IMO

