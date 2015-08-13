--�� �����
select count(distinct nCode), Cshort_name_fac
from (select Person.nCode,Clastname, Cfirstname, Cotch, Dd_birth, ctelefon, cSotTel, Grup.Cname_grup, Cname_spec, Cshort_name_fac,[Cplacebirth]
from person
left join ABIT_postup on person.nCode = ABIT_postup.nCode
left join Zach on Zach.nCode = person.nCode
left join StudGrup on StudGrup.Ik_zach = Zach.Ik_zach
left join Grup on StudGrup.Ik_grup = Grup.Ik_grup
left join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
left join Relation_spec_fac on Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
left join Fac on Fac.Ik_fac = Relation_spec_fac.ik_fac
left join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec

where ((Grup.DateExit>cast('2015-01-06' as datetime))or(Grup.DateExit is null))
--and(StudGrup.Ik_prikazOtch is null)
and Relation_spec_fac.Ik_form_ed = 1
and DATEADD(YEAR,18,Dd_birth)>cast('2015-01-06' as datetime) --DATEDIFF(yy, Dd_birth, GETDATE())>17 
--and Fac.ik_fac not in (15,17)
) Allstud
group by Cshort_name_fac
--order by Dd_birth

--�� �����������
select count(distinct nCode), Cshort_name_fac
from (select Person.nCode,Clastname, Cfirstname, Cotch, Dd_birth,Cshort_name_fac
from person
left join ABIT_postup on person.nCode = ABIT_postup.nCode
left join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
left join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
left join Fac on Fac.Ik_fac = Relation_spec_fac.ik_fac

where ABIT_postup.ik_zach = 6			--��������
and Relation_spec_fac.Ik_form_ed = 1
and DATEADD(YEAR,18,Dd_birth)>cast('2015-01-06' as datetime) --DATEDIFF(yy, Dd_birth, GETDATE())>17 
--and Fac.ik_fac not in (15,17)
) Allstud
group by Cshort_name_fac
--order by Dd_birth