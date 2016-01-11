select count(distinct person.nCode), Gorod.Cgorod, Raion.Craion, [typ_zaved].ctyp_zaved,  [Zaved_stud].cName_zaved
from person inner join [dbo].[Student] on person.nCode = [dbo].[Student].nCode
inner join [dbo].[Zaved_stud] on [dbo].[Zaved_stud].ik_zaved = [dbo].[Student].Ik_zaved
inner join [dbo].[typ_zaved] on [typ_zaved].ik_typ_zaved = [dbo].[Zaved_stud].ik_typ_zaved
inner join Gorod on [dbo].[Zaved_stud].ik_gorod = Gorod.Ik_gorod
inner join Raion on Gorod.Ik_raion = Raion.Ik_raion
left join Zach on Zach.nCode = person.nCode
left join StudGrup on StudGrup.Ik_zach = Zach.Ik_zach
left join Grup on StudGrup.Ik_grup = Grup.Ik_grup
left join Relation_spec_fac on Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
left join Form_ed on Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
left join Fac on Fac.Ik_fac = Relation_spec_fac.ik_fac
left join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
where (Grup.DateExit>'2015-15-12')
and(StudGrup.Ik_prikazOtch is null)
and Relation_spec_fac.Ik_form_ed = 1 
and Relation_spec_fac.ik_fac not in (15,17, 31)
and Raion.Ik_raion = 45
group by Gorod.Cgorod, Raion.Craion, [typ_zaved].ctyp_zaved, [Zaved_stud].cName_zaved
order by Raion.Craion, Gorod.Cgorod, [Zaved_stud].cName_zaved