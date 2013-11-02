
DROP PROCEDURE dbo.GetDistributedNagr
GO

ALTER FUNCTION [dbo].[GetTeacherPlanNagr]
(	
	@i_type				int,
	@ik_plan_nagr		int,
	@ik_disc			int,
	@ik_potok			int,
	@ik_id_prepod		int = NULL
)
RETURNS @all_plan_nagr TABLE
(
	ik_content_plan_nagr	int,
	ik_vid_zanyat		int,
	ik_vid_nagruzki		int,
	ik_id_prepod		int,
	hour_unit			float,
	student_hour		float
)
AS
BEGIN    

--	функция возвращает запланированную нагрузку преподавателя (указывается параметром @ik_id_prepod), с разделением по видам занятий и видам нагрузки, по указанной дисциплине (параметры @ik_disc и @ik_potok) в указанном плане нагрузки (параметр @ik_plan_nagr)
--	параметр @i_type определяет масштаб выборки: выборка нагрузки для одного преподавателя (значение 1) или для всех преподавателей кафедры (значение 2)

DECLARE @teacher_plan_nagr TABLE
(
	ik_content_plan_nagr int,
	ik_prepod_plan		int,
	ik_vid_zanyat		int,
	ik_vid_nagruzki		int,
	ik_calc_unit		int,
	by_plan_number		int,
	member_number		tinyint,
	ik_id_prepod		int,
	hour_unit			float,
	student_hour		float,
	student_count		int,
	norm_per_student	float,
	max_norm_per_student	float,
	min_contingent		int,
	norm_per_student_for_min	float,
	in_plan_count		int
)

DECLARE @ik_disc_type	tinyint

SELECT @ik_disc_type = ik_type_disc FROM discpln WHERE ik_disc = @ik_disc

IF (@i_type = 1)		-- выборка для одного препода
BEGIN 		
	INSERT INTO @teacher_plan_nagr
	SELECT cpn.ik_content_plan_nagr, cpn.ik_prepod_plan, cpn.ik_vid_zanyat, cpn.ik_vid_nagruzki, cpn.ik_calc_unit, cpn.by_plan_number,  cpn.commission_member, cpn.ik_id_prepod, cpn.f_hour_per_unit, 0, cpn.i_student_count, need_norm.f_norm_per_student, 
			need_norm.max_norm_per_student, need_norm.min_requed_student, need_norm.f_norm_per_student_for_min, oipc.in_plan_count 
	FROM 
			(SELECT Content_plan_nagr.ik_plan_nagr, Content_plan_nagr.ik_disc, Content_plan_nagr.ik_shema_of_potok, Content_plan_nagr.ik_vid_zanyat, Content_plan_nagr.ik_vid_nagruzki, Prepod_plan_nagr.* 
				FROM Content_plan_nagr INNER JOIN Prepod_plan_nagr 
					ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr 
					INNER JOIN Potok_shema ON Content_plan_nagr.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
					WHERE (Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) and (Potok_shema.ik_potok = @ik_potok) 
					and (Content_plan_nagr.ik_disc = @ik_disc) and (Prepod_plan_nagr.ik_id_prepod = @ik_id_prepod) 
					and (Content_plan_nagr.ik_vid_zanyat <> 32) and (Content_plan_nagr.ik_disc in (SELECT ik_disc FROM dbo.discpln WHERE ik_type_disc not in (2,3)))) cpn 
			INNER JOIN (SELECT * FROM Content_norma_of_time WHERE ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @ik_potok)) need_norm
			ON (cpn.ik_vid_zanyat = need_norm.ik_vid_zanyat) and (cpn.ik_vid_nagruzki = need_norm.ik_vid_nagruzki)
			LEFT JOIN (SELECT * FROM GetInUchPlanCount()) oipc ON (cpn.ik_plan_nagr = oipc.ik_plan_nagr) and (cpn.ik_disc = oipc.ik_disc) and (cpn.ik_shema_of_potok = oipc.ik_shema_of_potok) and (cpn.ik_vid_zanyat = oipc.ik_vid_zanyat)
	UNION
	SELECT cpn.ik_content_plan_nagr, cpn.ik_prepod_plan, cpn.ik_vid_zanyat, cpn.ik_vid_nagruzki, cpn.ik_calc_unit, cpn.by_plan_number, cpn.commission_member, cpn.ik_id_prepod, cpn.f_hour_per_unit, 0, cpn.i_student_count, need_norm.f_norm_per_student, 
			0, 0, 0, oipc.in_plan_count 
	FROM 
			(SELECT Content_plan_nagr.ik_plan_nagr, Content_plan_nagr.ik_disc, Content_plan_nagr.ik_shema_of_potok, Content_plan_nagr.ik_vid_zanyat, Content_plan_nagr.ik_vid_nagruzki, Prepod_plan_nagr.* 
				FROM Content_plan_nagr INNER JOIN Prepod_plan_nagr 
					ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr 
					INNER JOIN Potok_shema ON Content_plan_nagr.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
					WHERE (Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) and (Potok_shema.ik_potok = @ik_potok) 
					and (Content_plan_nagr.ik_disc = @ik_disc) and (Prepod_plan_nagr.ik_id_prepod = @ik_id_prepod) 
					and (Content_plan_nagr.ik_vid_zanyat <> 32) and (Content_plan_nagr.ik_disc in (SELECT ik_disc FROM dbo.discpln WHERE ik_type_disc in (2,3)))) cpn 
			INNER JOIN (SELECT * FROM Content_norm_of_time_practice WHERE ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @ik_potok)) need_norm
			ON (cpn.ik_disc = need_norm.ik_disc) and (cpn.ik_vid_nagruzki = need_norm.ik_vid_nagruzki)
			LEFT JOIN (SELECT * FROM GetInUchPlanCount()) oipc ON (cpn.ik_plan_nagr = oipc.ik_plan_nagr) and (cpn.ik_disc = oipc.ik_disc) and (cpn.ik_shema_of_potok = oipc.ik_shema_of_potok) and (cpn.ik_vid_zanyat = oipc.ik_vid_zanyat)
	UNION
	SELECT Content_plan_nagr.ik_content_plan_nagr, Prepod_plan_nagr.ik_prepod_plan, Content_plan_nagr.ik_vid_zanyat, Content_plan_nagr.ik_vid_nagruzki, Prepod_plan_nagr.ik_calc_unit, Prepod_plan_nagr.by_plan_number, Prepod_plan_nagr.commission_member, Prepod_plan_nagr.ik_id_prepod,
		Prepod_plan_nagr.f_hour_per_unit, 0, 0, 0, 0, 0, 0, 1
	FROM Content_plan_nagr INNER JOIN Prepod_plan_nagr 
			ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr 
			INNER JOIN Potok_shema ON Content_plan_nagr.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
	WHERE (Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) and (Potok_shema.ik_potok = @ik_potok) 
			and (Content_plan_nagr.ik_disc = @ik_disc) and (Prepod_plan_nagr.ik_id_prepod = @ik_id_prepod) and (Content_plan_nagr.ik_vid_zanyat = 32)
END

IF (@i_type = 2)		-- выборка для всех преподов
BEGIN
	INSERT INTO @teacher_plan_nagr
	SELECT cpn.ik_content_plan_nagr, cpn.ik_prepod_plan, cpn.ik_vid_zanyat, cpn.ik_vid_nagruzki, cpn.ik_calc_unit, cpn.by_plan_number, cpn.commission_member, cpn.ik_id_prepod, cpn.f_hour_per_unit, 0, cpn.i_student_count, need_norm.f_norm_per_student, 
			need_norm.max_norm_per_student, need_norm.min_requed_student, need_norm.f_norm_per_student_for_min, oipc.in_plan_count 
	FROM 
			(SELECT Content_plan_nagr.ik_plan_nagr, Content_plan_nagr.ik_disc, Content_plan_nagr.ik_shema_of_potok, Content_plan_nagr.ik_vid_zanyat, Content_plan_nagr.ik_vid_nagruzki, Prepod_plan_nagr.* 
				FROM Content_plan_nagr INNER JOIN Prepod_plan_nagr 
					ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr 
					INNER JOIN Potok_shema ON Content_plan_nagr.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
					WHERE (Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) and (Potok_shema.ik_potok = @ik_potok) 
					and (Content_plan_nagr.ik_disc = @ik_disc) and (Content_plan_nagr.ik_vid_zanyat <> 32)  and (Content_plan_nagr.ik_disc in (SELECT ik_disc FROM dbo.discpln WHERE ik_type_disc not in (2,3)))) cpn 
			INNER JOIN (SELECT * FROM Content_norma_of_time WHERE ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @ik_potok)) need_norm
			ON (cpn.ik_vid_zanyat = need_norm.ik_vid_zanyat) and (cpn.ik_vid_nagruzki = need_norm.ik_vid_nagruzki)
			LEFT JOIN (SELECT * FROM GetInUchPlanCount()) oipc ON (cpn.ik_plan_nagr = oipc.ik_plan_nagr) and (cpn.ik_disc = oipc.ik_disc) and (cpn.ik_shema_of_potok = oipc.ik_shema_of_potok) and (cpn.ik_vid_zanyat = oipc.ik_vid_zanyat)
	UNION
	SELECT cpn.ik_content_plan_nagr, cpn.ik_prepod_plan, cpn.ik_vid_zanyat, cpn.ik_vid_nagruzki, cpn.ik_calc_unit, cpn.by_plan_number, cpn.commission_member, cpn.ik_id_prepod, cpn.f_hour_per_unit, 0, cpn.i_student_count, need_norm.f_norm_per_student, 
			0, 0, 0, oipc.in_plan_count 
	FROM 
			(SELECT Content_plan_nagr.ik_plan_nagr, Content_plan_nagr.ik_disc, Content_plan_nagr.ik_shema_of_potok, Content_plan_nagr.ik_vid_zanyat, Content_plan_nagr.ik_vid_nagruzki, Prepod_plan_nagr.* 
				FROM Content_plan_nagr INNER JOIN Prepod_plan_nagr 
					ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr 
					INNER JOIN Potok_shema ON Content_plan_nagr.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
					WHERE (Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) and (Potok_shema.ik_potok = @ik_potok) 
					and (Content_plan_nagr.ik_disc = @ik_disc) and (Content_plan_nagr.ik_vid_zanyat <> 32)  and (Content_plan_nagr.ik_disc in (SELECT ik_disc FROM dbo.discpln WHERE ik_type_disc in (2,3)))) cpn 
			INNER JOIN (SELECT * FROM Content_norm_of_time_practice WHERE ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @ik_potok)) need_norm
			ON (cpn.ik_disc = need_norm.ik_disc) and (cpn.ik_vid_nagruzki = need_norm.ik_vid_nagruzki)
			LEFT JOIN (SELECT * FROM GetInUchPlanCount()) oipc ON (cpn.ik_plan_nagr = oipc.ik_plan_nagr) and (cpn.ik_disc = oipc.ik_disc) and (cpn.ik_shema_of_potok = oipc.ik_shema_of_potok) and (cpn.ik_vid_zanyat = oipc.ik_vid_zanyat)
	UNION
	SELECT Content_plan_nagr.ik_content_plan_nagr, Prepod_plan_nagr.ik_prepod_plan, Content_plan_nagr.ik_vid_zanyat, Content_plan_nagr.ik_vid_nagruzki, Prepod_plan_nagr.ik_calc_unit, Prepod_plan_nagr.by_plan_number, Prepod_plan_nagr.commission_member, Prepod_plan_nagr.ik_id_prepod,
		Prepod_plan_nagr.f_hour_per_unit, 0, 0, 0, 0, 0, 0, 1
	FROM Content_plan_nagr INNER JOIN Prepod_plan_nagr 
			ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr 
			INNER JOIN Potok_shema ON Content_plan_nagr.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
	WHERE (Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) and (Potok_shema.ik_potok = @ik_potok) 
			and (Content_plan_nagr.ik_disc = @ik_disc) and (Content_plan_nagr.ik_vid_zanyat = 32)
END
	UPDATE @teacher_plan_nagr
	SET
		in_plan_count = 1
	WHERE in_plan_count is NULL

	UPDATE @teacher_plan_nagr
	SET 
		norm_per_student = norm_per_student_for_min
	WHERE student_count < min_contingent
	
	UPDATE @teacher_plan_nagr
	SET
		student_hour = (student_count*max_norm_per_student/in_plan_count)
	WHERE (student_count*norm_per_student*in_plan_count > student_count*max_norm_per_student) and (max_norm_per_student != 0)

	UPDATE @teacher_plan_nagr
	SET
		student_hour = student_count*norm_per_student
	WHERE (student_count*norm_per_student*in_plan_count <= student_count*max_norm_per_student) or (max_norm_per_student = 0)

	INSERT INTO @all_plan_nagr
	SELECT ik_content_plan_nagr, ik_vid_zanyat, ik_vid_nagruzki, ik_id_prepod, sum(hour_unit), sum(student_hour) FROM @teacher_plan_nagr
	GROUP BY ik_content_plan_nagr, ik_vid_zanyat, ik_vid_nagruzki, ik_id_prepod

	RETURN
END
GO

CREATE FUNCTION dbo.GetDistributedNagr 
(	
	@ik_plan_nagr	int,
	@ik_disc		int,
	@ik_potok		int
)
RETURNS @distributed_nagr TABLE 
(
	ik_content_plan_nagr int,
	ik_vid_zanyat		int,
	cName_vid_zanyat	varchar(50),
	ik_vid_nagruzki		int,
	Cname_vid_nagruzki	varchar(50),
	cList_calc_unit		varchar(100),
	ik_id_prepod		int,
	FIO					varchar(60),
	all_distr_hour		float
)
AS
BEGIN
	INSERT INTO @distributed_nagr(ik_content_plan_nagr, ik_vid_zanyat, cName_vid_zanyat, ik_vid_nagruzki, Cname_vid_nagruzki, cList_calc_unit, ik_id_prepod, FIO, all_distr_hour)
	SELECT all_distr_nagr.ik_content_plan_nagr, all_distr_nagr.ik_vid_zanyat, vid_zaniat.cName_vid_zanyat, all_distr_nagr.ik_vid_nagruzki, Vid_nagruzki.Cname_vid_nagruzki, '', all_distr_nagr.ik_id_prepod, 
		(clastname + ' ' + LEFT(cfirstname, 1) + '. ' + LEFT(cotch, 1) + '. (таб. № ' + Convert(nvarchar, Prepods.iTab_n) + ', ' + cName_work_type_short + ')') as FIO, all_distr_nagr.all_distr_hour
	FROM
		(SELECT ik_content_plan_nagr,ik_vid_zanyat, ik_vid_nagruzki, ik_id_prepod, sum(hour_unit + student_hour) as all_distr_hour 
		FROM GetTeacherPlanNagr(2, @ik_plan_nagr, @ik_disc, @ik_potok, NULL) GROUP BY ik_content_plan_nagr, ik_vid_zanyat, ik_vid_nagruzki, ik_id_prepod) all_distr_nagr
		INNER JOIN vid_zaniat ON all_distr_nagr.ik_vid_zanyat = vid_zaniat.ik_vid_zanyat	
		INNER JOIN Vid_nagruzki ON all_distr_nagr.ik_vid_nagruzki = Vid_nagruzki.ik_vid_nagruzki
		INNER JOIN Relation_kafedra_prep rkp ON all_distr_nagr.ik_id_prepod = rkp.ik_id_prepod INNER JOIN Prepods ON rkp.iTab_n = Prepods.iTab_n
		INNER JOIN PrepodWorkType pwt ON rkp.ik_work_type = pwt.ik_work_type

	RETURN 
END
GO
