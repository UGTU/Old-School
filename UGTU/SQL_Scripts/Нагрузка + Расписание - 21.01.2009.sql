CREATE TABLE [dbo].[SheduleBookmarks](
	[iBookmark_type] [tinyint] NULL,
	[ik_shedule] [int] NULL,
	[ik_object] [int] NULL
) ON [PRIMARY]
GO

CREATE PROCEDURE UpdateSheduleBookmarks
	@i_type	tinyint,
	@ik_bookmark	int,
	@i_bookmark_type	tinyint,
	@ik_shedule	int = NULL,
	@ik_object	int	= NULL
AS
	DECLARE @ik_inserted_bookmark	int

	IF (@i_type = 1)
	BEGIN
		INSERT INTO dbo.SheduleBookmarks(i_bookmark_type, ik_shedule, ik_object)
		VALUES (@i_bookmark_type, @ik_shedule, @ik_object)
		SELECT @ik_inserted_bookmark = IDENT_CURRENT('SheduleBookmarks') 
	END

	IF (@i_type = 2)
	BEGIN
		UPDATE dbo.SheduleBookmarks
		SET
			i_bookmark_type = @i_bookmark_type, 
			ik_shedule = @ik_shedule, 
			ik_object = @ik_object
		WHERE ik_bookmark = @ik_bookmark

		SELECT @ik_inserted_bookmark = @ik_bookmark
	END

	IF (@i_type = 3)
	BEGIN
		DELETE FROM dbo.SheduleBookmarks
		WHERE ik_bookmark = @ik_bookmark

		SELECT @ik_inserted_bookmark = -1
	END

	SELECT @ik_inserted_bookmark as ReturnValue
GO

DROP PROCEDURE dbo.GetDistributedNagr
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


ALTER PROCEDURE [dbo].[GetTakeFactNagr]
	@i_type				tinyint,
	@ik_plan_nagr		int = NULL,
	@ik_disc			int = NULL,
	@ik_potok			int = NULL,
	@fact_ik_id_prepod	int = NULL,
	@plan_ik_id_prepod	int = NULL,
	@ik_vid_zanyat		int = NULL,
	@ik_vid_nagruzki	int = NULL
AS
-- процедура возвращает всю фактическую нагрузку по указанной дисциплине (параметры @ik_disc и @ik_potok) для указанного преподавателя (параметр @fact_ik_id_prepod), которая была запланирована за преподавателем @plan_ik_id_prepod.
-- параметр @i_type определяет масштаб выборки: выборка факта по всем видам занятий дисциплины (значение 1), выборка факта по всем расчетным единицам для вида занятий (значение 2), выборка видов занятий для просмотра на форме (параметр 3)

	IF (@i_type = 1)
	BEGIN
		SELECT ik_content_plan_nagr, fs.ik_vid_zanyat, cName_vid_zanyat, iK_type_vz, ikTypeZanyat, fs.ik_vid_nagruzki, Cname_vid_nagruzki, cur_fact_hour
		FROM
		(Select Prepod_plan_nagr.ik_content_plan_nagr, Content_plan_nagr.ik_vid_zanyat, Content_plan_nagr.ik_vid_nagruzki, Sum(Prepod_fact_nagr.f_all_fact_hour) as cur_fact_hour
		From Prepod_fact_nagr INNER JOIN Prepod_plan_nagr ON Prepod_fact_nagr.ik_prepod_plan = Prepod_plan_nagr.ik_prepod_plan
		INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr 
		Where (Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) and (Content_plan_nagr.ik_disc = @ik_disc)
		and (Content_plan_nagr.ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok = @ik_potok))
		and (Prepod_fact_nagr.ik_id_prepod = @fact_ik_id_prepod) and (Prepod_plan_nagr.ik_id_prepod = @plan_ik_id_prepod)
		Group By  Prepod_plan_nagr.ik_content_plan_nagr, Content_plan_nagr.ik_vid_zanyat, Content_plan_nagr.ik_vid_nagruzki
		) fs INNER JOIN vid_zaniat ON fs.ik_vid_zanyat = vid_zaniat.ik_vid_zanyat INNER JOIN Vid_nagruzki ON fs.ik_vid_nagruzki = Vid_nagruzki.ik_vid_nagruzki
	END

	IF (@i_type = 2)
	BEGIN
		SELECT ik_prepod_plan, ppn.ik_calc_unit, Calc_unit.ik_uch_plan, cName_calc_unit, by_plan_number, f_hour_per_unit, i_student_count, fact_hour
		FROM
		(SELECT Prepod_fact_nagr.ik_prepod_plan, Prepod_plan_nagr.ik_calc_unit, by_plan_number, f_hour_per_unit, i_student_count, sum(f_all_fact_hour) as fact_hour 
		FROM Prepod_fact_nagr INNER JOIN Prepod_plan_nagr ON Prepod_fact_nagr.ik_prepod_plan = Prepod_plan_nagr.ik_prepod_plan
		WHERE (Prepod_plan_nagr.ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Content_plan_nagr Where (ik_plan_nagr = @ik_plan_nagr) and (ik_disc = @ik_disc) and (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok = @ik_potok)) and (ik_vid_zanyat = @ik_vid_zanyat) and (ik_vid_nagruzki = @ik_vid_nagruzki))) 
		and (Prepod_fact_nagr.ik_id_prepod = @fact_ik_id_prepod)
		GROUP BY Prepod_fact_nagr.ik_prepod_plan, Prepod_plan_nagr.ik_calc_unit, by_plan_number, f_hour_per_unit, i_student_count) ppn
		INNER JOIN Calc_unit ON ppn.ik_calc_unit = Calc_unit.ik_calc_unit 
	END

	IF (@i_type = 3)
	BEGIN
		SELECT ik_content_plan_nagr, fs.ik_vid_zanyat, cName_vid_zanyat, iK_type_vz, ikTypeZanyat, fs.ik_vid_nagruzki, Cname_vid_nagruzki, f_hour_per_unit
		FROM
		(Select Prepod_plan_nagr.ik_content_plan_nagr, Content_plan_nagr.ik_vid_zanyat, Content_plan_nagr.ik_vid_nagruzki, Prepod_plan_nagr.f_hour_per_unit
		From Prepod_fact_nagr INNER JOIN Prepod_plan_nagr ON Prepod_fact_nagr.ik_prepod_plan = Prepod_plan_nagr.ik_prepod_plan
		INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr 
		Where (Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) and (Content_plan_nagr.ik_disc = @ik_disc)
		and (Content_plan_nagr.ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok = @ik_potok))
		and (Prepod_fact_nagr.ik_id_prepod = @fact_ik_id_prepod) and (Prepod_plan_nagr.ik_id_prepod = @plan_ik_id_prepod)) fs 
		INNER JOIN vid_zaniat ON fs.ik_vid_zanyat = vid_zaniat.ik_vid_zanyat INNER JOIN Vid_nagruzki ON fs.ik_vid_nagruzki = Vid_nagruzki.ik_vid_nagruzki
	END
GO

ALTER PROCEDURE [dbo].[GetDepartmentPlanNagr] 
	@i_type		tinyint,	
	@ik_plan_nagr	int,
	@ik_potok		int = NULL
-- процедура используется либо при @i_type = 1 для получения плана нагрузки по кафедре (т.е. списка потоков и дисциплин, которые читаются на кафедере согласно плану @ik_plan_nagr),
-- либо при @i_type = 2 для получения информации о потоке @ik_potok

AS
	DECLARE @temp_table	TABLE
	(
		cName_disc	varchar(100),
		ik_type_disc	tinyint,
		bit_calc_as_practice	bit,
		n_sem	int,
		cName_potok	varchar(50),
		ik_disc	int,
		ik_potok	int,
		course_number	int,
		group_count		int,
		subgroup_count	int,
		sep_group_count	int,
		student_count	int
	)
	DECLARE @plan_type_ed tinyint
	DECLARE @plan_year_value int
	DECLARE @plan_year_ik int
	DECLARE @get_ik_potok int
	DECLARE @potok_course int
	DECLARE @potok_group_count	int
	DECLARE @potok_subgroup_count	int
	DECLARE @potok_sep_group_count	int
	DECLARE @potok_student_count	int

	IF (@i_type = 1)
	BEGIN
		INSERT INTO @temp_table
		SELECT cName_disc, disc.ik_type_disc, disc.bit_calc_as_practice, n_sem, cName_potok, cpn.*, 0, 0, 0, 0, 0
		FROM
		(SELECT DISTINCT Content_plan_nagr.ik_disc, Potok_shema.ik_potok
		FROM Content_plan_nagr INNER JOIN Potok_shema ON Content_plan_nagr.ik_shema_of_potok = Potok_shema.ik_shema_of_potok WHERE Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) cpn
		INNER JOIN
		(SELECT * FROM GetDisciplinesForPlanNagr(@ik_plan_nagr)) disc ON (cpn.ik_potok = disc.ik_potok) and (cpn.ik_disc = disc.ik_disc)
		ORDER BY cName_potok, cName_disc
	END

	IF (@i_type = 2)
	BEGIN
		INSERT INTO @temp_table
		SELECT '', 0, 0, 0, '', 0, ik_potok, 0, 0, 0, 0, 0
		FROM Potok WHERE ik_potok = @ik_potok
	END

	SELECT @plan_type_ed = ik_type_ed, @plan_year_value = year_value, @plan_year_ik = Plan_nagr.ik_year FROM Plan_nagr INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_plan_nagr = @ik_plan_nagr

	DECLARE processed_cursor CURSOR
	FOR
	SELECT DISTINCT ik_potok FROM @temp_table

	OPEN processed_cursor
	FETCH NEXT FROM processed_cursor INTO @get_ik_potok

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @potok_course = @plan_year_value - year_value + 1 FROM Potok INNER JOIN Year_uch_pl yp ON Potok.ik_year_enter = yp.ik_year_uch_pl WHERE ik_potok = @get_ik_potok
		
		SELECT @potok_group_count = sum(ISNULL(group_count, 0)), @potok_subgroup_count = sum(ISNULL(subgroup_count, 0)) From Relation_potok_spec rps INNER JOIN Plan_contingent ON rps.ik_spec_fac = Plan_contingent.ik_spec_fac 
		WHERE (rps.ik_potok = @get_ik_potok) and (Plan_contingent.ik_year = @plan_year_ik) and (course_number = @potok_course)

		SELECT @potok_sep_group_count = count(ik_grup) FROM Relation_potok_grup WHERE ik_potok = @get_ik_potok

		IF (@plan_type_ed = 1)
		BEGIN
			SELECT @potok_student_count = budget_count FROM
			(SELECT TOP 1 Potok_shema.ik_shema_of_potok, sum(ISNULL(cuc.budget_count, 0)) as budget_count FROM Potok_shema INNER JOIN Calc_unit ON Potok_shema.ik_shema_of_potok = Calc_unit.ik_shema_of_potok
			INNER JOIN Calc_unit_contingent cuc ON Calc_unit.ik_calc_unit = cuc.ik_calc_unit WHERE (cuc.ik_year = @plan_year_ik) and (ik_potok = @get_ik_potok) GROUP BY Potok_shema.ik_shema_of_potok) cu_contingent
		END
		ELSE
		BEGIN
			SELECT @potok_student_count = contract_count FROM
			(SELECT TOP 1 Potok_shema.ik_shema_of_potok, sum(ISNULL(cuc.contract_count, 0)) as contract_count FROM Potok_shema INNER JOIN Calc_unit ON Potok_shema.ik_shema_of_potok = Calc_unit.ik_shema_of_potok
			INNER JOIN Calc_unit_contingent cuc ON Calc_unit.ik_calc_unit = cuc.ik_calc_unit WHERE (cuc.ik_year = @plan_year_ik) and (ik_potok = @get_ik_potok) GROUP BY Potok_shema.ik_shema_of_potok) cu_contingent
		END
				
		UPDATE @temp_table
		SET 
			student_count = @potok_student_count,
			group_count = @potok_group_count,
			subgroup_count = @potok_subgroup_count,
			sep_group_count = @potok_sep_group_count,
			course_number = @potok_course
		WHERE (ik_potok = @get_ik_potok)

		FETCH NEXT FROM processed_cursor INTO @get_ik_potok
	END	

	CLOSE processed_cursor
	DEALLOCATE processed_cursor

	IF (@i_type = 1)
	BEGIN
		SELECT * FROM @temp_table
	END

	IF (@i_type = 2)
	BEGIN
		SELECT student_count, group_count, subgroup_count, sep_group_count, course_number FROM @temp_table
	END
GO


ALTER PROCEDURE [dbo].[GetContentPlanNagr] 
	@ik_plan_nagr			int,	
	@ik_disc				int,
	@ik_potok				int
AS
	SELECT Content_plan_nagr.*, Cname_vid_nagruzki as name_vid_nagruzki, rasp_cont.busy_hour
	FROM Content_plan_nagr LEFT JOIN 
		(SELECT ik_vid_zanyat, ik_vid_nagruzki, sum(hour_unit + student_hour) as busy_hour
			FROM GetTeacherPlanNagr(2, @ik_plan_nagr, @ik_disc, @ik_potok, NULL)
		 GROUP BY ik_vid_zanyat, ik_vid_nagruzki) rasp_cont
	ON (Content_plan_nagr.ik_vid_zanyat = rasp_cont.ik_vid_zanyat) and (Content_plan_nagr.ik_vid_nagruzki = rasp_cont.ik_vid_nagruzki)
	INNER JOIN Vid_nagruzki ON Content_plan_nagr.ik_vid_nagruzki = Vid_nagruzki.ik_vid_nagruzki
	WHERE (ik_plan_nagr = @ik_plan_nagr) and (ik_shema_of_potok in (Select ik_shema_of_potok FROM Potok_shema WHERE ik_potok = @ik_potok)) and (ik_disc = @ik_disc)
	ORDER BY ik_vid_zanyat
GO

ALTER PROCEDURE [dbo].[GetCalcUnitsForPlanNagr]
	@ik_content_plan_nagr	int,
	@ik_uch_plan			int,	-- задает учебный план, который определяет список расчетных единиц которые по нему учатся и которые будут выбраны в результе вып-я данной процедуры
	@ik_id_prepod			int,
	@in_plan_count			tinyint
AS

DECLARE @temp_table		TABLE
(
	ik_calc_unit		int,	
	cName_calc_unit		varchar(30),
	budget_count		int,
	contract_count		int,
	by_plan_number		tinyint,
	member_number		tinyint,
	my_hour				float,
	my_student_count	int,
	busy_hour			float,
	busy_student_count	int	
)

DECLARE @plan_numbers	TABLE
(
	by_plan_number	tinyint
)

DECLARE @member_numbers	TABLE
(
	member_number	tinyint
)

DECLARE @commisson_count tinyint
DECLARE @i	tinyint

SELECT @commisson_count = ISNULL(i_commission_count, 1) FROM Content_plan_nagr WHERE ik_content_plan_nagr = @ik_content_plan_nagr

SET @i = 1

WHILE @i <= @in_plan_count
BEGIN
	INSERT INTO @plan_numbers
	VALUES (@i)
	SET @i = @i + 1
END

SET @i = 1

WHILE @i <= @commisson_count
BEGIN
	INSERT INTO @member_numbers
	VALUES (@i)
	SET @i = @i + 1
END

INSERT INTO @temp_table
SELECT units_table.*, my_units.unit_hour as my_hour, my_units.student_count as my_student_count, 
		busy_units.unit_hour as busy_hour, busy_units.student_count as busy_student_count 
FROM		
	(SELECT * FROM 
		(SELECT Calc_unit.ik_calc_unit, Calc_unit.cName_calc_unit, sum(Calc_unit_contingent.budget_count) as budget_count, sum(Calc_unit_contingent.contract_count) as contract_count
			FROM Calc_unit INNER JOIN Calc_unit_contingent ON Calc_unit.ik_calc_unit = Calc_unit_contingent.ik_calc_unit
			WHERE (Calc_unit.ik_uch_plan = @ik_uch_plan) and (Calc_unit.ik_shema_of_potok = (SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE ik_content_plan_nagr = @ik_content_plan_nagr)) and 
				(Calc_unit_contingent.ik_year =	(SELECT ik_year From Plan_nagr WHERE ik_plan_nagr = (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE ik_content_plan_nagr = @ik_content_plan_nagr))) 
			GROUP BY Calc_unit.ik_calc_unit, cName_calc_unit) gets_unit 
		CROSS JOIN @plan_numbers CROSS JOIN @member_numbers) units_table
	LEFT JOIN (SELECT * FROM GetCalcUnitHour(1, @ik_content_plan_nagr, @ik_id_prepod)) my_units
	ON (units_table.ik_calc_unit = my_units.ik_calc_unit) and (units_table.by_plan_number = my_units.by_plan_number)
		and (units_table.member_number = my_units.member_number)
	LEFT JOIN (SELECT * FROM GetCalcUnitHour(2, @ik_content_plan_nagr, @ik_id_prepod)) busy_units 
	ON (units_table.ik_calc_unit = busy_units.ik_calc_unit) and (units_table.by_plan_number = busy_units.by_plan_number)
		and (units_table.member_number = busy_units.member_number)

DECLARE @ik_type_ed int
SELECT @ik_type_ed = ik_type_ed From Plan_nagr 
WHERE ik_plan_nagr = (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE ik_content_plan_nagr = @ik_content_plan_nagr)

IF (@ik_type_ed = 2)
BEGIN
	SELECT ik_calc_unit, cName_calc_unit, by_plan_number, member_number, contract_count as student_count, 
			my_hour, my_student_count, busy_hour, busy_student_count
	FROM @temp_table ORDER BY cName_calc_unit, by_plan_number, member_number
END
ELSE
BEGIN
	SELECT ik_calc_unit, cName_calc_unit, by_plan_number, member_number, budget_count as student_count,
			my_hour, my_student_count, busy_hour, busy_student_count
	FROM @temp_table ORDER BY cName_calc_unit, by_plan_number, member_number
END
GO

CREATE FUNCTION [dbo].[GetPotokShemaInfo]
(	
	@ik_plan_nagr	int,
	@ik_potok		int,
	@ik_disc		int,
	@sem_number		int
)
RETURNS @shemes_table TABLE 
(
	ik_shema_of_potok	int,
	ik_uch_plan			int,
	calc_unit_count		int,
	student_count		int,
	consultation_hour	float,
	hour_by_gos			int
)
AS
BEGIN
	DECLARE @plan_type_ed	int
	DECLARE @plan_year	int

	SELECT @plan_type_ed = ik_type_ed FROM Plan_nagr WHERE ik_plan_nagr = @ik_plan_nagr
	SELECT @plan_year = ik_year FROM Plan_nagr WHERE ik_plan_nagr = @ik_plan_nagr

	IF (@plan_type_ed = 1)
	BEGIN
		INSERT INTO @shemes_table
		Select Calc_unit.ik_shema_of_potok, Calc_unit.ik_uch_plan, count(Calc_unit.ik_calc_unit), sum(ISNULL(budget_count, 0)), 0, 0
		FROM Calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
			LEFT JOIN Calc_unit_contingent ON Calc_unit.ik_calc_unit = Calc_unit_contingent.ik_calc_unit
		WHERE (ik_potok = @ik_potok) and (Calc_unit_contingent.ik_year = @plan_year)		
		GROUP BY Calc_unit.ik_shema_of_potok, Calc_unit.ik_uch_plan		
		ORDER BY Calc_unit.ik_shema_of_potok
		
		UPDATE @shemes_table
		SET
			consultation_hour = dbo.GetConsultationHour(1, @sem_number, ik_uch_plan, @ik_disc, @ik_plan_nagr)*CONVERT(float, calc_unit_count)
	END
	ELSE
	BEGIN
		INSERT INTO @shemes_table
		Select Calc_unit.ik_shema_of_potok, Calc_unit.ik_uch_plan, count(Calc_unit.ik_calc_unit), sum(ISNULL(contract_count, 0)), 0, 0
		FROM Calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
			LEFT JOIN Calc_unit_contingent ON Calc_unit.ik_calc_unit = Calc_unit_contingent.ik_calc_unit
		WHERE (ik_potok = @ik_potok) and (Calc_unit_contingent.ik_year = @plan_year)
		GROUP BY Calc_unit.ik_shema_of_potok, Calc_unit.ik_uch_plan
		ORDER BY Calc_unit.ik_shema_of_potok
	END

	DECLARE @get_uch_plan	int

	DECLARE cpn_cursor CURSOR
	FOR 
	SELECT DISTINCT ik_uch_plan FROM @shemes_table

	OPEN cpn_cursor
	FETCH NEXT FROM cpn_cursor INTO @get_uch_plan

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE @shemes_table 
		SET hour_by_gos = (SELECT iHour_gos FROM sv_disc WHERE (ik_uch_plan = @get_uch_plan) and (ik_disc = @ik_disc))
		WHERE (ik_uch_plan = @get_uch_plan)
		FETCH NEXT FROM cpn_cursor INTO @get_uch_plan
	END

	CLOSE cpn_cursor
	DEALLOCATE cpn_cursor
	
	RETURN
END
GO


ALTER FUNCTION [dbo].[GetConsultationHour]
(
	@i_type	tinyint,
	@sem_number	tinyint,
	@first_ik	int,		-- ik_uch_plan
	@second_ik	int,		-- ik_disc or ik_content_plan_nagr
	@third_ik	int			-- ik_plan_nagr
)
RETURNS float
AS
BEGIN
	DECLARE	@cons	float
	DECLARE @cons_percent	float

	SELECT @cons_percent = CONVERT(float, ISNULL(constant_value, 5)) FROM Nagruzka_constant WHERE ik_constant = 1
	
	IF (@i_type = 1)
	BEGIN
		-- считаем сколько часов по дисциплине в 5% от аудиторных часов приходится на данную кафедру и данный семестр
		SELECT @cons = sum(ISNULL(Content_UchPl.i_hour_per_week, 0) * ISNULL(sem_uch_pl.kol_ned, 0))*@cons_percent/100.0 FROM Content_UchPl INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
		INNER JOIN sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem)
		WHERE (Content_UchPl.ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ik_type_vz = 3)) and (sv_disc.ik_uch_plan = @first_ik) and (sv_disc.ik_disc = @second_ik) and (Content_UchPl.n_sem = @sem_number) and
		(Content_UchPl.ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = @third_ik))

		-- считаем сколько часов по дисциплине в 5% от аудиторных часов приходится вообще на данную дисциплину и считаем процент данной кафедры и данного семестра в этом количестве
		SELECT @cons = @cons/(sum(ISNULL(Content_UchPl.i_hour_per_week, 0) * ISNULL(sem_uch_pl.kol_ned, 0))*@cons_percent/100.0) FROM Content_UchPl INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
		INNER JOIN sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem)
		WHERE (Content_UchPl.ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ik_type_vz = 3)) and (sv_disc.ik_uch_plan = @first_ik) and (sv_disc.ik_disc = @second_ik)
		
		-- считаем сколько реально в соответсвии с количеством индивидуальных часов придется на консультации
		SELECT @cons = @cons*iIndivid FROM sv_disc WHERE (sv_disc.ik_uch_plan = @first_ik) and (sv_disc.ik_disc = @second_ik)
	END

	IF (@i_type = 2)
	BEGIN
		SELECT @cons = sum(ISNULL(Content_UchPl.i_hour_per_week, 0) * ISNULL(sem_uch_pl.kol_ned, 0))*@cons_percent/100.0 FROM Content_UchPl INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
		INNER JOIN sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem)
		WHERE (Content_UchPl.ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ik_type_vz = 3)) and (sv_disc.ik_uch_plan = @first_ik) and (sv_disc.ik_disc = (SELECT ik_disc FROM Content_plan_nagr WHERE ik_content_plan_nagr = @second_ik)) and (Content_UchPl.n_sem = @sem_number) and
		(Content_UchPl.ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE ik_content_plan_nagr = @second_ik)))

		SELECT @cons = @cons/(sum(ISNULL(Content_UchPl.i_hour_per_week, 0) * ISNULL(sem_uch_pl.kol_ned, 0))*@cons_percent/100.0) FROM Content_UchPl INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
		INNER JOIN sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem)
		WHERE (Content_UchPl.ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ik_type_vz = 3)) and (sv_disc.ik_uch_plan = @first_ik) and (sv_disc.ik_disc = (SELECT ik_disc FROM Content_plan_nagr WHERE ik_content_plan_nagr = @second_ik))
  
		SELECT @cons = @cons*iIndivid FROM sv_disc WHERE (sv_disc.ik_uch_plan = @first_ik) and (sv_disc.ik_disc = (SELECT ik_disc FROM Content_plan_nagr WHERE ik_content_plan_nagr = @second_ik)) 
	END

	RETURN round(@cons, 0)
END
GO

ALTER PROCEDURE [dbo].[GetNeedPotokShemes] 
	@ik_plan_nagr		int,
	@ik_potok			int
AS
	DECLARE @potok_course int
	DECLARE @plan_year	int
	DECLARE @separated_groups_in_potok	int

	SELECT @potok_course = year_value FROM Year_uch_pl WHERE ik_year_uch_pl = (SELECT ik_year_enter FROM Potok WHERE ik_potok = @ik_potok)
	SELECT @potok_course = year_value - @potok_course + 1 FROM Year_uch_pl WHERE ik_year_uch_pl = (SELECT ik_year FROM Plan_nagr WHERE ik_plan_nagr = @ik_plan_nagr)
	SELECT @plan_year = ik_year FROM Plan_nagr WHERE ik_plan_nagr = @ik_plan_nagr
	SELECT @separated_groups_in_potok = count(ik_grup) FROM dbo.Relation_potok_grup WHERE ik_potok = @ik_potok
	
	SELECT Potok_shema.ik_shema_of_potok, cName_shema, ik_decompose_type FROM
	Potok_shema INNER JOIN
	(Select Calc_unit.ik_shema_of_potok
	FROM Calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
	WHERE (ik_decompose_type = 1)
	GROUP BY Calc_unit.ik_shema_of_potok
	HAVING count(Calc_unit.ik_calc_unit) = 1
	UNION 
	Select Calc_unit.ik_shema_of_potok
	FROM Calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
			LEFT JOIN Calc_unit_contingent ON Calc_unit.ik_calc_unit = Calc_unit_contingent.ik_calc_unit
	WHERE (ik_decompose_type = 2) and (ik_potok = @ik_potok) and (Calc_unit_contingent.ik_year = @plan_year)
	GROUP BY Calc_unit.ik_shema_of_potok
	HAVING count(Calc_unit.ik_calc_unit) = (SELECT sum(group_count) + @separated_groups_in_potok FROM Plan_contingent 
			WHERE (course_number = @potok_course) and (ik_year = @plan_year) and (ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = @ik_potok)))
	UNION
	Select Calc_unit.ik_shema_of_potok
	FROM Calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
	WHERE (ik_decompose_type = 3) and (ik_potok = @ik_potok)
	GROUP BY Calc_unit.ik_shema_of_potok
	) cu ON Potok_shema.ik_shema_of_potok = cu.ik_shema_of_potok  
GO

ALTER FUNCTION [dbo].[temp_GetAllPlanNagr]
(	
	@ik_input_plan_nagr	int
)
RETURNS @all_plan_nagr TABLE
(
	ik_plan_nagr	int,
	ik_disc			int,
	cName_disc		varchar(100),
	ik_type_disc	tinyint,
	bit_calc_as_practice bit,
	n_sem			int,
	ik_potok		int,
	cName_potok		varchar(50),
	plan_hour		float,
	busy_hour		float	
) 
AS 
BEGIN
	DECLARE @get_ik_disc	int
	DECLARE @get_ik_potok	int
	DECLARE @get_n_sem	int
	DECLARE @get_disc_name	varchar(100)
	DECLARE @get_disc_type	tinyint
	DECLARE @get_disc_type_calc_mode	bit
	DECLARE @get_potok_name	varchar(100)
	DECLARE @get_ik_type_ed	tinyint
	DECLARE @get_student_count int
	DECLARE @ik_cpn_shema_of_potok int
	DECLARE @get_uch_plan int
	DECLARE @get_calc_unit_count int
	DECLARE @all_hour	float
	DECLARE @busy_hour	float
	DECLARE @uchPlanCount	int
	DECLARE @uchPlanHour float
	DECLARE @ed_hour	float
	DECLARE @stud_hour	float
	DECLARE @stud_max_hour	float

	DECLARE @temp_content_uch_plan	TABLE
	(
		n_sem	tinyint,
		ik_vid_zanyat	int,
		i_hour_per_week	int,
		kol_ned	int,
		ik_shema_of_potok	int,
		ik_uch_plan		int
	)

	DECLARE @ik_cpn_vid_zanyat	int
	DECLARE @ik_cpn_vid_nagruzki int
	DECLARE	@cpn_commission_count int	
	DECLARE @get_hour_by_gos	int
	DECLARE @calc_only_students bit
	
	SELECT @get_ik_type_ed = ik_type_ed FROM Plan_nagr WHERE ik_plan_nagr = @ik_input_plan_nagr
	SELECT @calc_only_students = bit_calc_only_student FROM Type_ed WHERE ik_type_ed = (SELECT ik_type_ed FROM Plan_nagr WHERE ik_plan_nagr = @ik_input_plan_nagr)
	
	DECLARE processed_cursor CURSOR
	FOR
	SELECT DISTINCT cpn.ik_disc, disc.ik_potok, n_sem
	FROM Content_plan_nagr cpn INNER JOIN Potok_shema ON cpn.ik_shema_of_potok = Potok_shema.ik_shema_of_potok INNER JOIN
	(SELECT * FROM GetDisciplinesForPlanNagr(@ik_input_plan_nagr)) disc ON (cpn.ik_disc = disc.ik_disc) and (Potok_shema.ik_potok = disc.ik_potok)
	WHERE ik_plan_nagr = @ik_input_plan_nagr
	
	OPEN processed_cursor
	FETCH NEXT FROM processed_cursor INTO @get_ik_disc, @get_ik_potok, @get_n_sem
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @all_hour = 0
		-- получаем количество студентов в потоке
	/*	IF (@get_ik_type_ed = 1)
		BEGIN
			Select @get_student_count = sum(Plan_contingent.budget_count) From Potok INNER JOIN Relation_potok_spec rps ON Potok.ik_potok = rps.ik_potok
				INNER JOIN Plan_contingent ON rps.ik_spec_fac = Plan_contingent.ik_spec_fac INNER JOIN Year_uch_pl yp ON Potok.ik_year_enter = yp.ik_year_uch_pl
				INNER JOIN Plan_nagr ON Plan_contingent.ik_year = Plan_nagr.ik_year INNER JOIN Year_uch_pl yc ON Plan_nagr.ik_year = yc.ik_year_uch_pl 
			Where (Potok.ik_potok = @get_ik_potok) and (Plan_nagr.ik_plan_nagr = @ik_input_plan_nagr) and (course_number = yc.year_value - yp.year_value + 1)
		END
		ELSE
		BEGIN
			Select @get_student_count = sum(Plan_contingent.contract_count) From Potok INNER JOIN Relation_potok_spec rps ON Potok.ik_potok = rps.ik_potok
				INNER JOIN Plan_contingent ON rps.ik_spec_fac = Plan_contingent.ik_spec_fac INNER JOIN Year_uch_pl yp ON Potok.ik_year_enter = yp.ik_year_uch_pl
				INNER JOIN Plan_nagr ON Plan_contingent.ik_year = Plan_nagr.ik_year INNER JOIN Year_uch_pl yc ON Plan_nagr.ik_year = yc.ik_year_uch_pl 
			Where (Potok.ik_potok = @get_ik_potok) and (Plan_nagr.ik_plan_nagr = @ik_input_plan_nagr) and (course_number = yc.year_value - yp.year_value + 1)
		END
		-- получили
	*/
		-- загружаем содержание учебного плана
		DELETE FROM @temp_content_uch_plan
	
		INSERT INTO @temp_content_uch_plan
		Select Content_UchPl.n_sem, ik_vid_zanyat, i_hour_per_week, sem_uch_pl.kol_ned, units_plans.ik_shema_of_potok, units_plans.ik_uch_plan From Content_UchPl INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan 
			INNER JOIN sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem) INNER JOIN (SELECT DISTINCT ik_potok, Potok_shema.ik_shema_of_potok, ik_uch_plan
				FROM Potok_shema INNER JOIN Calc_unit ON Potok_shema.ik_shema_of_potok = Calc_unit.ik_shema_of_potok) units_plans ON sv_disc.ik_uch_plan = units_plans.ik_uch_plan
		Where (units_plans.ik_potok = @get_ik_potok) and (sv_disc.ik_disc = @get_ik_disc) and (Content_UchPl.n_sem = @get_n_sem) and (Content_UchPl.ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = @ik_input_plan_nagr))

		-- загрузили
	
		SELECT @get_disc_type = ik_type_disc, @get_disc_type_calc_mode = bit_calc_as_practice FROM Type_disc WHERE ik_type_disc = (SELECT ik_type_disc FROM discpln WHERE ik_disc = @get_ik_disc)
		
		DECLARE cpn_cursor CURSOR
		FOR
		SELECT cpn.ik_vid_zanyat, cpn.ik_vid_nagruzki, ISNULL(cpn.i_commission_count, 1), cpn.ik_shema_of_potok
		FROM Content_plan_nagr cpn INNER JOIN Potok_shema ON cpn.ik_shema_of_potok = Potok_shema.ik_shema_of_potok
		WHERE (ik_plan_nagr = @ik_input_plan_nagr) and (Potok_shema.ik_potok = @get_ik_potok) and (ik_disc = @get_ik_disc)
		
		OPEN cpn_cursor
		FETCH NEXT FROM cpn_cursor INTO @ik_cpn_vid_zanyat, @ik_cpn_vid_nagruzki, @cpn_commission_count, @ik_cpn_shema_of_potok
		
		-- считаем нагрузку по каждому виду занятий/виду нагрузки для текущей дисциплины/потока
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF (@ik_cpn_vid_zanyat = 32)	-- если консультации, то их считаем по особому
			BEGIN
				SELECT @all_hour = ISNULL(@all_hour, 0) + sum(ISNULL(consultation_hour, 0)) FROM GetPotokShemaInfo(@ik_input_plan_nagr, @get_ik_potok, @get_ik_disc, @get_n_sem) WHERE ik_shema_of_potok = @ik_cpn_shema_of_potok
			END
			ELSE
			BEGIN
				-- грузим количество записей для данного вида занятий в уч. плане
				DECLARE uch_plans_cursor CURSOR
				FOR 
				SELECT ik_uch_plan, calc_unit_count, student_count, hour_by_gos FROM GetPotokShemaInfo(@ik_input_plan_nagr, @get_ik_potok, @get_ik_disc, @get_n_sem)
				WHERE ik_shema_of_potok = @ik_cpn_shema_of_potok

				OPEN uch_plans_cursor
				FETCH NEXT FROM uch_plans_cursor INTO @get_uch_plan, @get_calc_unit_count, @get_student_count, @get_hour_by_gos

				WHILE @@FETCH_STATUS = 0
				BEGIN
					SELECT @uchPlanCount = count(*) FROM @temp_content_uch_plan WHERE (ik_vid_zanyat = @ik_cpn_vid_zanyat) and (ik_uch_plan = @get_uch_plan) and (ik_shema_of_potok = @ik_cpn_shema_of_potok)
					IF (@uchPlanCount = 0)
					BEGIN					
						SET @uchPlanCount = 1
					END		
				
					IF (@get_disc_type_calc_mode = 1)
					BEGIN
						-- получим количество недель в практике
--						SELECT @uchPlanHour	= ISNULL(CONVERT(float, iHour_gos), 0) FROM sv_disc WHERE (ik_uch_plan = @get_uch_plan) and (ik_disc = @get_ik_disc)

						SELECT @stud_hour = ISNULL(sum(f_norm_per_student)*@get_student_count, 0) FROM Content_norm_of_time_practice
						WHERE (ik_disc = @get_ik_disc) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) and (ik_practice_norm_type = 1)
					
						SELECT @stud_hour = @stud_hour + ISNULL(sum(f_norm_per_student)*@get_student_count*CONVERT(float, ISNULL(@get_hour_by_gos, 0))*6, 0) FROM Content_norm_of_time_practice
						WHERE (ik_disc = @get_ik_disc) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) and (ik_practice_norm_type = 2)
					
						SELECT @stud_hour = @stud_hour + ISNULL(sum(f_norm_per_student)*@get_student_count*CONVERT(float, ISNULL(@get_hour_by_gos, 0)), 0) FROM Content_norm_of_time_practice
						WHERE (ik_disc = @get_ik_disc) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) and (ik_practice_norm_type = 3)					
				
						SET @stud_max_hour = 0
					
						IF (@calc_only_students = 1)
						BEGIN
							SET @ed_hour = 0
						END
						ELSE
						BEGIN
							SELECT @ed_hour = ISNULL(sum(f_norm_per_ed)*@get_calc_unit_count, 0) FROM Content_norm_of_time_practice
							WHERE (ik_disc = @get_ik_disc) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) and (ik_practice_norm_type = 1)
	
							SELECT @ed_hour = @ed_hour + ISNULL(sum(f_norm_per_ed)*@get_calc_unit_count*CONVERT(float, ISNULL(@get_hour_by_gos, 0))*6, 0) FROM Content_norm_of_time_practice
							WHERE (ik_disc = @get_ik_disc) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) and (ik_practice_norm_type = 2)
		
							SELECT @ed_hour = @ed_hour + ISNULL(sum(f_norm_per_ed)*@get_calc_unit_count*CONVERT(float, ISNULL(@get_hour_by_gos, 0)), 0) FROM Content_norm_of_time_practice
							WHERE (ik_disc = @get_ik_disc) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) and (ik_practice_norm_type = 3)
						END
					END
					ELSE
					BEGIN	-- для обычных дисциплин
						-- грузим количество часов в неделю для данного вида занятий 
						SELECT @uchPlanHour	= ISNULL(CONVERT(float, i_hour_per_week*kol_ned*@get_calc_unit_count), -1) FROM @temp_content_uch_plan WHERE (ik_vid_zanyat = @ik_cpn_vid_zanyat) and (ik_uch_plan = @get_uch_plan) and (ik_shema_of_potok = @ik_cpn_shema_of_potok)
						
						-- считаем норму на студентов
						SELECT @stud_hour = ISNULL(sum(f_norm_per_student)*@get_student_count, 0) FROM Content_norma_of_time
						WHERE (ik_vid_zanyat = @ik_cpn_vid_zanyat) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) 
							and (min_requed_student <= @get_student_count)
				
						SELECT @stud_hour = @stud_hour + ISNULL(sum(f_norm_per_student_for_min)*@get_student_count, 0) FROM Content_norma_of_time
						WHERE (ik_vid_zanyat = @ik_cpn_vid_zanyat) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) 
							and (min_requed_student > @get_student_count)
				
						-- считаем максимально допустимую норму на студентов
						SELECT @stud_max_hour = ISNULL(sum(max_norm_per_student)*@get_student_count, 0) FROM Content_norma_of_time
						WHERE (ik_vid_zanyat = @ik_cpn_vid_zanyat) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok))
					
						-- считаем норму на расч. единицу
						IF (@calc_only_students = 1)
						BEGIN
							SET @ed_hour = 0
						END
						ELSE
						BEGIN
							IF (@uchPlanHour = -1) -- если в уч. плане для даного ВЗ не указано количество часов в неделю, то ...
							BEGIN
								SELECT @ed_hour = ISNULL(sum(f_norm_per_ed)*@get_calc_unit_count, 0) FROM Content_norma_of_time
								WHERE (ik_vid_zanyat = @ik_cpn_vid_zanyat) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) 
									and (min_requed_student <= @get_student_count)
				
								SELECT @ed_hour = @ed_hour + ISNULL(sum(f_norm_per_ed_for_min)*@get_calc_unit_count, 0) FROM Content_norma_of_time
								WHERE (ik_vid_zanyat = @ik_cpn_vid_zanyat) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) 
									and (min_requed_student > @get_student_count)
							END
							ELSE
							BEGIN
								SELECT @ed_hour = ISNULL(sum(f_norm_per_ed)*@uchPlanHour, 0) FROM Content_norma_of_time
								WHERE (ik_vid_zanyat = @ik_cpn_vid_zanyat) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) 
									and (min_requed_student <= @get_student_count)
						
								SELECT @ed_hour = @ed_hour + ISNULL(sum(f_norm_per_ed_for_min)*@uchPlanHour, 0) FROM Content_norma_of_time
								WHERE (ik_vid_zanyat = @ik_cpn_vid_zanyat) and (ik_vid_nagruzki = @ik_cpn_vid_nagruzki) and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = @get_ik_potok)) 
									and (min_requed_student > @get_student_count)
							END
						END
					END
					
					IF ((@stud_hour*@uchPlanCount > @stud_max_hour) and (@stud_max_hour != 0))
					BEGIN
						SET @all_hour = ISNULL(@all_hour, 0) + (@ed_hour*@uchPlanCount + @stud_max_hour)*@cpn_commission_count
					END
					ELSE
					BEGIN
						SET @all_hour = ISNULL(@all_hour, 0) + (@stud_hour + @ed_hour)*@uchPlanCount*@cpn_commission_count
					END	

					FETCH NEXT FROM uch_plans_cursor INTO @get_uch_plan, @get_calc_unit_count, @get_student_count, @get_hour_by_gos
				END

				CLOSE uch_plans_cursor
				DEALLOCATE uch_plans_cursor							
			END	
		
			FETCH NEXT FROM cpn_cursor INTO @ik_cpn_vid_zanyat, @ik_cpn_vid_nagruzki, @cpn_commission_count, @ik_cpn_shema_of_potok	
		END

		CLOSE cpn_cursor
		DEALLOCATE cpn_cursor
	
		-- считаем количество распределенных часов
		SELECT @busy_hour = ISNULL(sum(hour_unit + student_hour), 0) FROM GetTeacherPlanNagr(2, @ik_input_plan_nagr, @get_ik_disc, @get_ik_potok, NULL)
		
		SELECT @get_disc_name = cName_disc FROM discpln WHERE ik_disc = @get_ik_disc		
		SELECT @get_potok_name = Cname_potok FROM Potok WHERE ik_potok = @get_ik_potok

		-- пишем результат в выходную таблицу
		INSERT INTO @all_plan_nagr
		SELECT @ik_input_plan_nagr, @get_ik_disc, @get_disc_name, @get_disc_type, @get_disc_type_calc_mode, @get_n_sem, @get_ik_potok, @get_potok_name, @all_hour, @busy_hour
		
		FETCH NEXT FROM processed_cursor INTO @get_ik_disc, @get_ik_potok, @get_n_sem
	END

	CLOSE processed_cursor
	DEALLOCATE processed_cursor

	RETURN
END
GO