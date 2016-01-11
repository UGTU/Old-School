--статистика по наличию уч. планов
select t_no_uch.Cshort_name_fac, gr_all, gr_withoutplan
from
(select  [dbo].[Fac].Cshort_name_fac, count(GRup.[Cname_grup]) gr_all
from Grup inner join [dbo].[Relation_spec_fac] on GRup.ik_spec_fac = [dbo].[Relation_spec_fac].ik_spec_fac
inner join [dbo].[Fac] on [dbo].[Relation_spec_fac].ik_fac = [dbo].[Fac].Ik_fac
left join sv_disc on Grup.Ik_uch_plan = sv_disc.Ik_uch_plan
where [DateExit]>GetDate() and  [dbo].[Fac].Ik_fac not in (9)
group by [dbo].[Fac].Cshort_name_fac) t_no_uch
left join
(select  [dbo].[Fac].Cshort_name_fac, count(GRup.[Cname_grup]) gr_withoutplan
from Grup inner join [dbo].[Relation_spec_fac] on GRup.ik_spec_fac = [dbo].[Relation_spec_fac].ik_spec_fac
inner join [dbo].[Fac] on [dbo].[Relation_spec_fac].ik_fac = [dbo].[Fac].Ik_fac
left join sv_disc on Grup.Ik_uch_plan = sv_disc.Ik_uch_plan
where [DateExit]>GetDate() and  [dbo].[Fac].Ik_fac not in (9)
and sv_disc.Ik_uch_plan is null
group by [dbo].[Fac].Cshort_name_fac) t_all_gr on t_no_uch.Cshort_name_fac = t_all_gr.Cshort_name_fac
order by Cshort_name_fac


