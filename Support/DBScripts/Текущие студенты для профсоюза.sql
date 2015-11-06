select distinct Clastname +' '+ Cfirstname +' '+ isnull(Cotch,'') FIO, cast(Dd_birth as date), Cshort_name_fac, Cname_grup,   Cname_spec, CType_kat,
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
and Relation_spec_fac.Ik_form_ed = 1 
and Relation_spec_fac.ik_fac not in (15,17)
) Allstud
order by Cshort_name_fac, Cname_spec, Cname_grup, FIO


select distinct  Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') FIO,cast(Dd_birth as DATE) Dd_birth,Fac.Cshort_name_fac, Spec_stud.Cname_spec, 
	   dbo.Person.nCode,NNyear,Cname_form_ed,CType_kat,cSotTel,ctelefon,Cname_kat_zach,
	    cEmail, Lrab
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,Form_ed,Kat_zach,TypeKatZach
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and dbo.Student.nCode = ABIT_postup.nCode
and Relation_spec_fac.Ik_form_ed = 1 
and Relation_spec_fac.ik_fac not in (15,17)
and ABIT_postup.nCode not in (select nCode from Zach, StudGrup
							  where Zach.ik_zach = StudGrup.Ik_zach
							  and StudGrup.Ik_grup is not null)
and NNyear=2015

