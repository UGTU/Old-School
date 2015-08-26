select Allstud.*, PropStud.adres ProdAdres--, factStud.adres FactAdres, VremStud.adres VremAdres 
from 
(Select distinct Person.nCode,Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, 
cast(Person.Dd_birth AS DATE) Dd_birth
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  StudGrup.Ik_prikazOtch is null --не отчислен из группы
and (year(Grup.DateExit)>year(GETDATE()))
--and Fac.Ik_fac not in (6,9,14,15,17,20,21,22)
) Allstud
inner join
(Select distinct Person.nCode,Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, 
cast(Person.Dd_birth AS DATE) Dd_birth,
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
  and ((PersonAddress.ik_AddressType = 2)or(PersonAddress.ik_AddressType is null))

and 
(Gorod.Cgorod like '%Ухта%' and
/*or
(Street.CStreet like '%Ленина%' 
and (BuildingNumber='' or BuildingNumber='' or BuildingNumber='' or BuildingNumber='' or BuildingNumber='' or BuildingNumber='' or BuildingNumber='' or BuildingNumber='' or BuildingNumber='' or BuildingNumber=''))

((Street.CStreet like '%Ленина%' 
and (BuildingNumber='67' or BuildingNumber='69' or BuildingNumber='71' or BuildingNumber='73' or BuildingNumber='77' or BuildingNumber='79'))
or
(Street.CStreet like '%Нефтяников%' 
and (BuildingNumber='12' or BuildingNumber='13' or BuildingNumber='14' or BuildingNumber='15' or BuildingNumber='16' or BuildingNumber='17' or BuildingNumber='20' or BuildingNumber='21' or BuildingNumber='22' or BuildingNumber='23'))
or
(Street.CStreet like '%Строителей%' 
and (BuildingNumber='29' or BuildingNumber='31' or BuildingNumber='33' or BuildingNumber='35' or BuildingNumber='37' or BuildingNumber='39'))
))

((Street.CStreet like '%Севастопольская%' 
and (BuildingNumber='11а' or BuildingNumber='13' or BuildingNumber='13а'))
or
(Street.CStreet like '%Сенюкова%' 
and (BuildingNumber='1' or BuildingNumber='3' or BuildingNumber='7' or BuildingNumber='9' or BuildingNumber='11' or BuildingNumber like'25%'))
or
(Street.CStreet like '%лет Октября%' 
and (BuildingNumber='9' or BuildingNumber='10' or BuildingNumber='11' or BuildingNumber='13' or BuildingNumber='15' or BuildingNumber='17' 
	or BuildingNumber like '19%' or BuildingNumber='24' or BuildingNumber like '21%' or BuildingNumber like '22%' or BuildingNumber like '23%'))
or
(Street.CStreet like '%Космонавтов%' 
and (BuildingNumber='50'))
or
(Street.CStreet like '%Юбилейная%' 
and (BuildingNumber='8' or BuildingNumber='12' or BuildingNumber='16' or BuildingNumber='18' or BuildingNumber='20' or BuildingNumber='26'))
or
(Street.CStreet like '%Чибьюский%' 
and (BuildingNumber='3' or BuildingNumber='5' or BuildingNumber='7'))*/

((Street.CStreet like '%Ленина%' 
and (BuildingNumber='3' or BuildingNumber='5' or BuildingNumber='9'))
or
(Street.CStreet like '%40 лет Коми%' 
and (BuildingNumber='4' or BuildingNumber like '10%' or BuildingNumber like '12%' or BuildingNumber='14'))
or
(Street.CStreet like '%Дзержинского%' 
and (BuildingNumber='1' or BuildingNumber='3' or BuildingNumber='4' or BuildingNumber='5' or BuildingNumber='6' or BuildingNumber='7' or BuildingNumber='8' or BuildingNumber='9' or BuildingNumber='10' or BuildingNumber like '11%'
	 or BuildingNumber='12' or BuildingNumber='14' or BuildingNumber='20' or BuildingNumber='22'))
or
(Street.CStreet like '%Октябрьская%' 
and (BuildingNumber='23' or BuildingNumber='25' or BuildingNumber='27' or BuildingNumber='29'))
or
(Street.CStreet like '%Оплеснина%' 
and (BuildingNumber='1' or BuildingNumber='2' or BuildingNumber='3' or BuildingNumber='5' or BuildingNumber='6' or BuildingNumber='7' or BuildingNumber='8' or BuildingNumber='9' or BuildingNumber like '10%' or BuildingNumber='11'
or BuildingNumber='12' or BuildingNumber='13' or BuildingNumber like '15%'))

or
(Street.CStreet like '%Первомайская%' 
and (BuildingNumber='19' or BuildingNumber='21' or BuildingNumber='23' or BuildingNumber='25' or BuildingNumber='27' or BuildingNumber='29' or BuildingNumber='30' or BuildingNumber='31' or BuildingNumber='32' or BuildingNumber like '33%'
or BuildingNumber='34' or BuildingNumber='35' or BuildingNumber='36' or BuildingNumber='38' or BuildingNumber='40' or BuildingNumber='41' or BuildingNumber='42' or BuildingNumber='43' or BuildingNumber='46'))
))

  

/*

ул.Севастопольская: д.11а, 13, 13а; 
ул.Сенюкова: д. 1, 3, 7, 9, 11, 25/52;
ул. 30 лет Октября: д. 9, 10, 11, 13, 15, 17, 19, 19а, 21, 21а, 22, 22/12, 23/14, 24; 
пр-т Космонавтов: д.50; 
ул.Юбилейная: д. 8, 12, 16, 18, 20, 26; 
пер.Чибьюский: д. 3, 5, 7


Саид13:14
14 округ
Вот адреса:
проспект Ленина, дома №№ 67, 69, 71, 73, 77, 79;
улицы:
Набережная Нефтяников, дома №№ 12, 13, 14, 15, 16, 17, 20, 21, 22, 23;
проезд Строителей, дома №№ 29, 31, 33, 35, 37, 39.*/
) PropStud on Allstud.nCode = PropStud.nCode
/*left join
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
  and ((PersonAddress.ik_AddressType = 3))
) VremStud on Allstud.nCode = VremStud.nCode*/
order by PropStud.adres, Cshort_name_fac,Cname_grup,fio
