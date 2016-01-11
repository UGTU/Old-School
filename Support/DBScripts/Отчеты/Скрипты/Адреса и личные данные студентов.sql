select Allstud.*, ISNULL(adrStud.adres,'') prAddress, ISNULL(factStud.adres ,'') fcAddress

from 
(Select distinct Person.nCode,Cshort_name_fac,Spec_stud.Cshort_spec,Person.[PersonFullName] fio, cast(Person.Dd_birth AS DATE) Dd_birth/*,
                'Адрес прописки: ' + ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','')*/
				,Grup.[Cname_grup]
from dbo.Person inner join Zach on Person.nCode=Zach.nCode
inner join StudGrup on Zach.Ik_zach=StudGrup.ik_zach and StudGrup.Ik_prikazOtch is null
inner join dbo.Grup on StudGrup.ik_grup=Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where Spec_stud.[ik_direction] in (1,2,3,9,10)
and Relation_spec_fac.[Ik_form_ed]=1
and Fac.Ik_fac not between 13 and 18
) Allstud
left join
(Select distinct Person.nCode,Spec_stud.Cshort_spec,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth,
                'Адрес прописки: ' + ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','') adres
from dbo.Person inner join Zach on Person.nCode=Zach.nCode
inner join StudGrup on Zach.Ik_zach=StudGrup.ik_zach and StudGrup.Ik_prikazOtch is null
inner join dbo.Grup on StudGrup.ik_grup=Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where ((PersonAddress.ik_AddressType = 2)or(PersonAddress.ik_AddressType is null))
) adrStud on Allstud.nCode = adrStud.nCode
left join 
(Select distinct Person.nCode,Spec_stud.Cshort_spec,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth,
                'Адрес факт: ' + ISNULL(dbo.Gorod.Cgorod + ', ','') + ISNULL(Street.CStreet+ ', ','')  + 
                ISNULL(BuildingNumber+ ', ','')  + ISNULL('кв. '+FlatNumber+ ', ','') adres
from dbo.Person inner join Zach on Person.nCode=Zach.nCode
inner join StudGrup on Zach.Ik_zach=StudGrup.ik_zach and StudGrup.Ik_prikazOtch is null
inner join dbo.Grup on StudGrup.ik_grup=Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
left join PersonAddress on dbo.PersonAddress.nCode = dbo.Person.nCode
left join dbo.Address on dbo.Address.ik_address = dbo.PersonAddress.ik_address
left join dbo.Street on dbo.Street.Ik_street = dbo.Address.Ik_street
left join Gorod on dbo.Gorod.Ik_gorod = dbo.Street.ik_gorod
where ((PersonAddress.ik_AddressType = 1)or(PersonAddress.ik_AddressType is null))
) factStud on Allstud.nCode = factStud.nCode

order by   Allstud.Cshort_name_fac,Allstud.Cshort_spec, Allstud.[Cname_grup], fio