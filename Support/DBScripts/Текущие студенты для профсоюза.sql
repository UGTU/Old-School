select distinct Clastname +' '+ Cfirstname +' '+ isnull(Cotch,'') FIO, Cname_grup, Cshort_name_fac,  Cname_spec, CType_kat,
Cname_form_ed
from (
select Person.nCode,Clastname, Cfirstname, Cotch, Dd_birth, ctelefon, cSotTel, Grup.Cname_grup, Cname_spec, Cshort_name_fac,[Cplacebirth], TypeKatZach.CType_kat,
Form_ed.Cname_form_ed
from person
left join grazd on grazd.ik_grazd = Person.Ik_grazd
left join Zach on Zach.nCode = person.nCode
left join StudGrup on StudGrup.Ik_zach = Zach.Ik_zach
left join Kat_zach on StudGrup.ik_kat_zach = Kat_zach.Ik_kat_zach
left join TypeKatZach on Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
left join Grup on StudGrup.Ik_grup = Grup.Ik_grup
left join Relation_spec_fac on Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
left join Form_ed on Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
left join Fac on Fac.Ik_fac = Relation_spec_fac.ik_fac
left join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
where (Grup.DateExit>'2015-30-10')
and(StudGrup.Ik_prikazOtch is null)
) Allstud
order by Cshort_name_fac, Cname_spec, Cname_grup, FIO