select distinct Grup.Cname_grup, Clastname +' '+ Cfirstname +' '+ isnull(Cotch,'') FIO, /*year(Dd_birth), Cname_grup,, Cname_spec, Cshort_name_fac,*/
		ctelefon, cSotTel,
		Grup.nYear_post, Grup.DateExit, EducationBranch.Cname_spec
from  person
inner join grazd on grazd.ik_grazd = Person.Ik_grazd
inner join Zach on Zach.nCode = person.nCode
inner join StudGrup on StudGrup.Ik_zach = Zach.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join Relation_spec_fac on Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Fac on Fac.Ik_fac = Relation_spec_fac.ik_fac
inner join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
where (Grup.DateExit>getdate())
and(StudGrup.Ik_prikazOtch is null) and StudGrup.Ik_prikazZach is not null
--and Grup.nYear_post = 2015
--and Cname_grup like '%ÝÒ%'
and EducationBranch.ik_direction in (1,2,3,4,5,12,9,10)  -- 2- специалисты , 1 -бакалавры, 3- магистратутра, 4-аспиратнтура, 5 спо спец-ти, 9 -сокр бакалавриат, 10 -прикладной бакалавриат, 12 - спо професесии, 14-сред полное, 15 - основное (начальное)общеее
--and Fac.ik_fac = 27
and (Ik_form_ed = 1)
--order by Cshort_name_fac, Grup.Cname_grup, Cfirstname
--and Fac.ik_fac not in (15,17)
and person.Dd_birth >= DATEADD(yy,-18, GETDATE())
order by Grup.Cname_grup, FIO