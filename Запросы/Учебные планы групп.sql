Select Cshort_name_fac,Cname_spec,Cname_grup,stud_count, grup.Ik_uch_plan, disc.disc_count
from grup inner join Relation_spec_fac on Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Spec_stud.ik_spec = Relation_spec_fac.ik_spec
inner join Fac on Fac.Ik_fac = Relation_spec_fac.ik_fac
left join (select COUNT(distinct ik_disc) disc_count,ik_uch_plan
			from sv_disc group by ik_uch_plan)
			 disc on disc.ik_uch_plan = grup.Ik_uch_plan
left join (select COUNT(ik_zach) stud_count,Ik_grup from StudGrup where Ik_prikazOtch is null
		   group by Ik_grup) stud on stud.Ik_grup = Grup.Ik_grup
where DateExit > '19.05.2012' or DateExit is null 
and YEAR(GETDATE())-Grup.nYear_post<=Relation_spec_fac.YearObuch 
order by Cshort_name_fac,Cname_spec,Cname_grup