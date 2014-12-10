update Relation_potok_kaf --обновить потоки
set ik_kaf=425
where ik_kaf in (267, 268)  --428

update Relation_kafedra_prep  --обновить преподавателей (делать вручную)
set ik_kaf=425
where ik_kaf in (267, 268)

delete from Prepod_plan_nagr 
where ik_content_plan_nagr in 
      (select ik_content_plan_nagr from Content_plan_nagr where ik_plan_nagr in 
 (select ik_plan_nagr from Plan_nagr where ik_kaf=428 and ik_year=18))
 
select * from Plan_nagr 
where ik_kaf=425 and ik_year=18


update sv_disc
set ik_default_kaf=427 where ik_default_kaf in (245)


update Content_UchPl
set ik_kaf=427
where ik_upContent in (
select cup.ik_upContent from Content_UchPl cup, Uch_pl,Year_uch_pl,sv_disc
where Uch_pl.ik_year_uch_pl = Year_uch_pl.ik_year_uch_pl
and Uch_pl.ik_uch_plan = sv_disc.ik_uch_plan
and sv_disc.ik_disc_uch_plan = cup.ik_disc_uch_plan
and cup.ik_kaf in (245)
and n_sem>(2011-year_value)*2)
