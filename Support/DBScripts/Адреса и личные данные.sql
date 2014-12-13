select Allstud.*, adrStud.adres, factStud.adres from 
(Select distinct Person.nCode,Cshort_name_fac,Spec_stud.Cshort_spec,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth/*,
                'Адрес прописки: ' + ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','')*/
from dbo.Person inner join ABIT_postup on ABIT_postup.nCode = dbo.Person.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join dbo.Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where NNyear=2011 
  and ik_zach IN (select ik_zach from ABIT_sost_zach where ik_type_zach=2)
  and Person.Dd_birth>'01.09.1993'
 -- and ((PersonAddress.ik_AddressType = 2)or(PersonAddress.ik_AddressType is null))
) Allstud
left join
(Select distinct Person.nCode,Spec_stud.Cshort_spec,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth,
                'Адрес прописки: ' + ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','') adres
from dbo.Person inner join ABIT_postup on ABIT_postup.nCode = dbo.Person.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join dbo.Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where NNyear=2011 
  and ik_zach IN (select ik_zach from ABIT_sost_zach where ik_type_zach=2)
  and Person.Dd_birth>'01.09.1993'
  and ((PersonAddress.ik_AddressType = 2)or(PersonAddress.ik_AddressType is null))
) adrStud on Allstud.nCode = adrStud.nCode
left join 
(Select distinct Person.nCode,Spec_stud.Cshort_spec,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth,
                'Адрес факт: ' + ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','') adres
from dbo.Person inner join ABIT_postup on ABIT_postup.nCode = dbo.Person.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join dbo.Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where NNyear=2011 
  and ik_zach IN (select ik_zach from ABIT_sost_zach where ik_type_zach=2)
  and Person.Dd_birth>'01.09.1993'
  and ((PersonAddress.ik_AddressType = 1)or(PersonAddress.ik_AddressType is null))
) factStud on Allstud.nCode = factStud.nCode

order by Allstud.Cshort_name_fac,Allstud.Cshort_spec, fio