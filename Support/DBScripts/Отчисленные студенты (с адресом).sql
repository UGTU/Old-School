select distinct p.Clastname,p.Cfirstname +' '+p.Cotch ImOT,  --отчисленные
year(p.Dd_birth),Fac.Cshort_name_fac,Spec_stud.Cname_spec,Grup.Cname_grup,
cast(Prikaz.Dd_prikazVst as date), Pricina.Cname_pric,Allstud.adres, adrStud.adres,factStud.adres
from Person p inner join Zach Z on p.nCode = Z.nCode 
inner join StudGrup on Z.Ik_zach = StudGrup.ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join Relation_spec_fac rsf on Grup.ik_spec_fac = rsf.ik_spec_fac
inner join Fac on Fac.Ik_fac = rsf.ik_fac 
inner join Spec_stud on Spec_stud.ik_spec = rsf.ik_spec
inner join Prikaz on StudGrup.Ik_prikazOtch = Prikaz.Ik_prikaz
inner join Pricina on StudGrup.ik_pricOtch = Pricina.Ik_pric
left join
(Select distinct Person.nCode,
                ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','') adres
from dbo.Person
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where (PersonAddress.ik_AddressType = 1)
) Allstud on p.nCode = Allstud.nCode
left join
(Select distinct Person.nCode,
                ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','') adres
from dbo.Person
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where (PersonAddress.ik_AddressType = 2)
) adrStud on p.nCode = adrStud.nCode
left join
(Select distinct Person.nCode,
                ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','') adres
from dbo.Person
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where (PersonAddress.ik_AddressType = 3)
) factStud on p.nCode = factStud.nCode
where ik_pricOtch not in (3)  --не потому, что закончил обучение
and Dd_prikaz>'01.01.2009'
and (select COUNT(Ik_prikazZach) from StudGrup,Prikaz --
	 where ik_zach = Z.Ik_zach and StudGrup.Ik_prikazZach = Prikaz.Ik_prikaz
	 and Dd_prikaz>'01.01.2009')=0
and Fac.Ik_fac not in (13,21,22) --не колледжи
order by p.Clastname,ImOT

--pric зачисления = 13

select * from StudGrup,Prikaz --
	 where ik_zach = 6510 and StudGrup.Ik_prikazZach = Prikaz.Ik_prikaz
	 and Dd_prikaz>'01.01.2009'