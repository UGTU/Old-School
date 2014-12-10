select * from Potok,Relation_potok_kaf 
where Potok.ik_potok = Relation_potok_kaf.ik_potok
AND ik_kaf = 281
--and ik_potok in (3804)
order by Cname_potok


SELECT * FROM Potok_semestr where id_potok in (3804)

ik_potok_semestr in (14445)

select * from Potok_semestr_shema where ik_potok_semestr = 14445

select * from Content_plan_nagr where ik_shema in (3503,22339,36206)

delete from SheduleEvent where ik_event in (
select ik_event from Relation_event_plan_nagr where ik_prepod_plan in
(select ik_prepod_plan from Prepod_plan_nagr where ik_content_plan_nagr in (select ik_content_plan_nagr from Content_plan_nagr 
															  where ik_shema in (3503,22339,36206))))



select * from Relation_event_plan_nagr where 

select * from Plan_nagr where ik_plan_nagr = 1047

select * from discpln where iK_disc = 443
