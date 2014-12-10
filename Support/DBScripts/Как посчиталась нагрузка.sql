
114651	1587	2158	27	NULL	1	1	48,00	0,00	42931  -- контракт, заочники

select * from Plan_nagr where ik_plan_nagr = 1587

select Potok_semestr_shema.ik_potok_semestr from Potok_semestr_shema  --@ik_potok_semestr = 18193
	where Potok_semestr_shema.ik_shema = 42931

SELECT ik_norm_of_time FROM Potok_semestr  --@ik_potok_norm_of_time = 107
	WHERE Potok_semestr.ik_potok_semestr = 18193

SELECT ik_type_disc, bit_calc_as_practice --@get_disc_type = 2  @get_disc_type_calc_mode = 1
	FROM Type_disc WHERE ik_type_disc = (SELECT ik_type_disc FROM discpln 
										 WHERE ik_disc = 2158)

select ((select  dbo.Year_uch_pl.year_value from dbo.Plan_nagr,dbo.Year_uch_pl			--@n_sem = 4
					 where dbo.Plan_nagr.ik_year = dbo.Year_uch_pl.ik_year_uch_pl
					 and dbo.Plan_nagr.ik_plan_nagr = 1587)-
					(select  dbo.Year_uch_pl.year_value from dbo.Potok,dbo.Year_uch_pl,Potok_semestr ps,Uch_pl
					 where Uch_pl.ik_year_uch_pl = dbo.Year_uch_pl.ik_year_uch_pl and Uch_pl.ik_uch_plan = Potok.ik_uch_plan
					 and ps.id_potok = Potok.ik_potok
					 and ps.ik_potok_semestr = 18193))*2+
					 (select ik_sem_type from dbo.Plan_nagr where ik_plan_nagr = 1587)  

Select Content_UchPl.n_sem, ik_vid_zanyat, i_hour_per_week, ISNULL(vzst.tasks_count, 1), 
	ISNULL(upwce.week_count, sem_uch_pl.kol_ned), units_plans.ik_shema, 
	units_plans.ik_uch_plan 
	From Content_UchPl LEFT JOIN UchPlan_WeekCount_Exception upwce 
	ON Content_UchPl.ik_upContent = upwce.ik_upContent 
		LEFT JOIN Vid_zanyat_with_several_tasks vzst 
		ON Content_UchPl.ik_upContent = vzst.ik_upContent 
		INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan 
		INNER JOIN sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) 
		and (Content_UchPl.n_sem = sem_uch_pl.n_sem) 
		INNER JOIN (SELECT DISTINCT Potok_semestr.ik_potok_semestr, Potok_semestr_shema.ik_shema, ik_uch_plan 
		FROM Potok_semestr_shema INNER JOIN Potok_semestr 
		ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr inner join Potok
		On Potok.ik_potok = Potok_semestr.id_potok) units_plans 
		ON sv_disc.ik_uch_plan = units_plans.ik_uch_plan
	Where (units_plans.ik_potok_semestr = 18193) 
	and (sv_disc.ik_disc = 2158) 
	and (Content_UchPl.n_sem = 4) and (Content_UchPl.ik_kaf = 
	(SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = 1587))

SELECT ik_shema, ik_uch_plan, bit_calc_students_only, calc_unit_count,  --42931	1509	0	1	8	NULL	2    
	student_count, consultation_hour, hour_by_gos 
	FROM GetPotokShemaInfo(1587, 18193, 2158)
	WHERE (ik_uch_plan is not NULL)
	and ik_shema = 42931

SET @all_hour = 0

SELECT ik_uch_plan, bit_calc_students_only, calc_unit_count, student_count, hour_by_gos  ----42931	1509	0	1	8	NULL	2   
			FROM @potok_shemas_info
(@get_uch_plan = 1509, @calc_only_students = 0, @get_calc_unit_count = 1, 
							@get_student_count = 8, @get_hour_by_gos=2)

SELECT bit_must_be_in_uch_plan FROM dbo.vid_zaniat   --@vz_must_be_in_up = 1
			WHERE iK_vid_zanyat = 27


SET @ed_hour = 0
SET @stud_hour = 0
SET @stud_max_hour = 0
SET @uchPlanCount = 0
SET @uchPlanRecordsCount = 0

SELECT ISNULL(sum(tasks_count), 0), count(ik_vid_zanyat)  ---@uchPlanCount = 0  @uchPlanRecordsCount = 0
				FROM (Select Content_UchPl.n_sem, ik_vid_zanyat, i_hour_per_week, ISNULL(vzst.tasks_count, 1) tasks_count, 
	ISNULL(upwce.week_count, sem_uch_pl.kol_ned) kol_ned, units_plans.ik_shema, 
	units_plans.ik_uch_plan 
	From Content_UchPl LEFT JOIN UchPlan_WeekCount_Exception upwce 
	ON Content_UchPl.ik_upContent = upwce.ik_upContent 
		LEFT JOIN Vid_zanyat_with_several_tasks vzst 
		ON Content_UchPl.ik_upContent = vzst.ik_upContent 
		INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan 
		INNER JOIN sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) 
		and (Content_UchPl.n_sem = sem_uch_pl.n_sem) 
		INNER JOIN (SELECT DISTINCT Potok_semestr.ik_potok_semestr, Potok_semestr_shema.ik_shema, ik_uch_plan 
		FROM Potok_semestr_shema INNER JOIN Potok_semestr 
		ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr inner join Potok
		On Potok.ik_potok = Potok_semestr.id_potok) units_plans 
		ON sv_disc.ik_uch_plan = units_plans.ik_uch_plan
	Where (units_plans.ik_potok_semestr = 18193) 
	and (sv_disc.ik_disc = 2158) 
	and (Content_UchPl.n_sem = 4) and (Content_UchPl.ik_kaf = 
	(SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = 1587))) temp_tab
				WHERE (ik_vid_zanyat = 27) 
				     and (ik_uch_plan = 42931) and (ik_shema = 42931)	

@uchPlanCount = 1

SELECT ISNULL(CONVERT(float, iHour_gos), 0) FROM sv_disc WHERE (ik_uch_plan = 1509) and (ik_disc = 2158)  --@uchPlanHour	= 2

SELECT f_norm_per_student, f_norm_per_ed, 0, 0, 0, 0, ik_practice_norm_type    
					FROM Content_norm_of_time_practice
					WHERE (ik_disc = 2158) and (ik_vid_nagruzki = 1) 
					  and (ik_norm_of_time = 107)

--f_norm_per_student=0,5, f_norm_per_ed=0, max_norm_per_student=0, min_requed_student=0, f_norm_per_student_for_min=0, f_norm_per_ed_for_min=0, ik_practice_norm_type=2

SELECT 0 + ISNULL(0.5*8*CONVERT(float, ISNULL(2, 0))*6, 0)									--@stud_hour = 
					   