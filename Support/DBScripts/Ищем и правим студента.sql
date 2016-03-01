
select * from Person where Clastname like 'Лысенк%' 

and [Cfirstname] like 'Борис' and [Cotch] like 'Владимирович'

select ABIT_postup.NN_abit,Person.Clastname, Person.Cfirstname, Person.Cotch,  fac.Cshort_name_fac, 
EducationBranch.Cname_spec, EducationBranch.ik_direction,
ABIT_postup.ik_zach, ABIT_postup.ik_kat_zach, Relation_spec_fac.Ik_form_ed,
ABIT_Diapazon_spec_fac.ik_spec_fac, ABIT_postup.ik_prikaz_zach
from Person inner join ABIT_postup on ABIT_postup.nCode = Person.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
inner join  Relation_spec_fac on Relation_spec_fac.ik_spec_fac = ABIT_Diapazon_spec_fac.ik_spec_fac
inner join fac on fac.Ik_fac = Relation_spec_fac.ik_fac
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
where Person.nCode=114928

select * from ABIT_postup where nCode=115488

select * from ABIT_Diapazon_spec_fac where NNrecord=750 
select * from Relation_spec_fac where ik_spec_fac = 274
select * from Spec_stud where ik_spec=354607

select * from Doc_stud where nCode = 15966

select * from Zach where ncode in (45383)
select * from Zach where Ik_zach in (14369)


select StudGrup.*, Cname_grup from StudGrup, Grup 
where StudGrup.Ik_grup = Grup.Ik_grup
and ik_zach in (24736)

select * from Prikaz where k

select * from StudGrup where ik_pricZach=13

update Uspev set ik_zach = 18621 where ik_zach = 26406
and Ik_ved not in (select Ik_ved from Uspev where ik_zach = 18621)

select * from Uspev where Ik_ved in (select Ik_ved from Uspev where ik_zach = 26406 )
and Ik_ved in (select Ik_ved from Vedomost where lPriznak_napr = 1)

SELECT        * FROM            Uspev WHERE        (Ik_zach = 26406)
and Ik_ved in (select Ik_ved from Vedomost where lPriznak_napr = 1)

select * from Grup where Ik_grup in (6234)

--если 2 раза в одной группе
select * from
(
select ik_zach,count(Ik_studGrup) cou_stud
from StudGrup
Where  [Ik_prikazOtch] is null
group by ik_zach) st
where st.cou_stud>1
--order by cou_stud

select * from StudGrup where Ik_zach=22877

delete from StudGrup where Ik_studGrup=41728

select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region,dbo.PersonAddress.ik_AddressType
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana
		   and nCode = 38242