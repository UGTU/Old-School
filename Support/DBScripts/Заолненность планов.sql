select Fac.Cname_fac tt,Spec_stud.Cname_spec,Grup.Cname_grup,max(count_disc), Fac.Cname_fac
from Grup inner join Relation_spec_fac rsf on Grup.ik_spec_fac = rsf.ik_spec_fac
inner join Fac on Fac.Ik_fac = rsf.ik_fac
inner join Spec_stud on Spec_stud.ik_spec = rsf.ik_spec
inner join Year_uch_pl on Year_uch_pl.year_value = Grup.nYear_post
left join
	(select count(distinct sv_disc.ik_disc_uch_plan) count_disc,  Uch_pl.ik_spec, Uch_pl.ik_year_uch_pl, Uch_pl.ik_uch_plan, ik_form_ed
	from sv_disc, Uch_pl
	where Uch_pl.ik_uch_plan = sv_disc.ik_uch_plan 
	group by Uch_pl.ik_spec, Uch_pl.ik_year_uch_pl, Uch_pl.ik_uch_plan, ik_form_ed) temp_table 
			on temp_table.ik_spec = Spec_stud.ik_spec and Year_uch_pl.ik_year_uch_pl = temp_table.ik_year_uch_pl and temp_table.ik_form_ed = rsf.Ik_form_ed
where Fac.Ik_fac not in (6,20)
and Grup.Ik_uch_plan is null
and Grup.DateExit>GETDATE()
group by Fac.Cname_fac,Spec_stud.Cname_spec,Grup.Cname_grup,Fac.Cname_fac

union

select fac_table.Cname_fac tt,Spec_stud.Cname_spec,Grup.Cname_grup,max(count_disc),Fac.Cname_fac
from Grup inner join Relation_spec_fac rsf on Grup.ik_spec_fac = rsf.ik_spec_fac
inner join Fac on Fac.Ik_fac = rsf.ik_fac
inner join Spec_stud on Spec_stud.ik_spec = rsf.ik_spec
inner join Year_uch_pl on Year_uch_pl.year_value = Grup.nYear_post
inner join (select Fac.Cname_fac, ik_spec from Relation_spec_fac, Fac where Fac.Ik_fac = Relation_spec_fac.ik_fac and Fac.ik_fac not in (6,20)) fac_table
  on fac_table.ik_spec = Spec_stud.ik_spec

left join
	(select count(distinct sv_disc.ik_disc_uch_plan) count_disc,  Uch_pl.ik_spec, Uch_pl.ik_year_uch_pl, Uch_pl.ik_uch_plan, ik_form_ed
	from sv_disc, Uch_pl
	where Uch_pl.ik_uch_plan = sv_disc.ik_uch_plan 
	group by Uch_pl.ik_spec, Uch_pl.ik_year_uch_pl, Uch_pl.ik_uch_plan, ik_form_ed) temp_table 
			on temp_table.ik_spec = Spec_stud.ik_spec and Year_uch_pl.ik_year_uch_pl = temp_table.ik_year_uch_pl and temp_table.ik_form_ed = rsf.Ik_form_ed
where Fac.Ik_fac in (6,20)
and Grup.Ik_uch_plan is null
and Grup.DateExit>GETDATE()
group by fac_table.Cname_fac, Spec_stud.Cname_spec,Grup.Cname_grup,Fac.Cname_fac

order by tt


