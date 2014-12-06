select Cshort_name_fac,Cname_grup,fio,Dd_birth,YEAR(Dd_birth) Year_birth,ISNULL(ISNULL(VremAdres,FactAdres),ProdAdres) FactAdress
from
(select Allstud.*, PropStud.adres ProdAdres, factStud.adres FactAdres, VremStud.adres VremAdres from 
(Select distinct Person.nCode,Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  StudGrup.Ik_prikazOtch is null --не отчислен из группы
and (year(Grup.DateExit)>year(GETDATE()))
and Fac.Ik_fac not in (6,9,14,15,17,20,21,22)
) Allstud
left join
(Select distinct Person.nCode,Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth,
                ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','') adres
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where  StudGrup.Ik_prikazOtch is null --не отчислен из группы
and (year(Grup.DateExit)>year(GETDATE()))
and Fac.Ik_fac not in (6,9,14,15,17,20,21,22)
and ((Gorod.Ik_raion = 45)or(Gorod.Ik_gorod = 504))
  and ((PersonAddress.ik_AddressType = 2)or(PersonAddress.ik_AddressType is null))
) PropStud on Allstud.nCode = PropStud.nCode
left join
(Select distinct Person.nCode,Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth,
                ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','') adres
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where  StudGrup.Ik_prikazOtch is null --не отчислен из группы
and (year(Grup.DateExit)>year(GETDATE()))
and Fac.Ik_fac not in (6,9,13,14,15,17,20,21,22)
and ((Gorod.Ik_raion = 45)or(Gorod.Ik_gorod = 504))
  and ((PersonAddress.ik_AddressType = 1))
) FactStud on Allstud.nCode = FactStud.nCode
left join 
(Select distinct Person.nCode,Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth,
                ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','') adres
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where  StudGrup.Ik_prikazOtch is null --не отчислен из группы
and (year(Grup.DateExit)>year(GETDATE()))
and Fac.Ik_fac not in (6,9,14,15,17,20,21,22)
and ((Gorod.Ik_raion = 45)or(Gorod.Ik_gorod = 504))
  and ((PersonAddress.ik_AddressType = 3))
) VremStud on Allstud.nCode = VremStud.nCode
) AdresPull
order by Year_birth,FactAdress,fio
