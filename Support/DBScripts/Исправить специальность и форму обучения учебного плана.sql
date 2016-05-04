select Ik_uch_plan, count(grup.Ik_grup)
from grup
where Ik_uch_plan in
(Select grup.Cname_grup, Uch_pl.ik_spec, eb.Cname_spec, EducationBranch.ik_spec, EducationBranch.Cname_spec, Uch_pl.ik_uch_plan
from grup inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = grup.ik_spec_fac
inner join EducationBranch on Relation_spec_fac.ik_spec  = EducationBranch.ik_spec
inner join Uch_pl on grup.Ik_uch_plan = Uch_pl.ik_uch_plan
inner join EducationBranch eb on eb.ik_spec = Uch_pl.ik_spec
where Uch_pl.ik_spec <> EducationBranch.ik_spec
and DateExit > getdate())
group by Ik_uch_plan

select Ik_uch_plan, count(grup.Ik_grup)
from grup
where Ik_uch_plan in
(Select /*grup.Cname_grup, Uch_pl.ik_form_ed, Relation_spec_fac.Ik_form_ed, */Uch_pl.Ik_uch_plan
from grup inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = grup.ik_spec_fac
inner join Uch_pl on grup.Ik_uch_plan = Uch_pl.ik_uch_plan
where Uch_pl.ik_form_ed <> Relation_spec_fac.Ik_form_ed
and DateExit > getdate())
group by Ik_uch_plan





select * from Grup where Ik_uch_plan in (917,964)

update Uch_pl set ik_spec = (select ik_spec from 
							 grup inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = grup.ik_spec_fac
							 where grup.Ik_uch_plan = Uch_pl.ik_uch_plan)
where Ik_uch_plan in
(Select /*grup.Cname_grup, Uch_pl.ik_spec, eb.Cname_spec, EducationBranch.ik_spec, EducationBranch.Cname_spec, */Uch_pl.ik_uch_plan
from grup inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = grup.ik_spec_fac
inner join EducationBranch on Relation_spec_fac.ik_spec  = EducationBranch.ik_spec
inner join Uch_pl on grup.Ik_uch_plan = Uch_pl.ik_uch_plan
inner join EducationBranch eb on eb.ik_spec = Uch_pl.ik_spec
where Uch_pl.ik_spec <> EducationBranch.ik_spec
and DateExit > getdate())


update Uch_pl set ik_form_ed = (select ik_form_ed from 
							 grup inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = grup.ik_spec_fac
							 where grup.Ik_uch_plan = Uch_pl.ik_uch_plan)
where Ik_uch_plan in
(Select /*grup.Cname_grup, Uch_pl.ik_form_ed, Relation_spec_fac.Ik_form_ed, */Uch_pl.Ik_uch_plan
from grup inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = grup.ik_spec_fac
inner join Uch_pl on grup.Ik_uch_plan = Uch_pl.ik_uch_plan
where Uch_pl.ik_form_ed <> Relation_spec_fac.Ik_form_ed
and DateExit > getdate())