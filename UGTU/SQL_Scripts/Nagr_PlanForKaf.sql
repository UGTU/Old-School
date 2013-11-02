--select * from [dbo].[Nagr_PlanForKaf](30)
create FUNCTION [dbo].[Nagr_PlanForKaf]
(	
	@ik_plan_nagr	int
)
RETURNS @Result TABLE
(
	cName_disc		varchar(100),
	cName_potok		varchar(50),
	course			int,
	group_count		int,
	stud_count		int,
	v1				float,
	v2				float,
	v3				float,
	v4				float,
	v5				float,
	v6				float,
	v7				float,
	v8				float,
	v9				float,
	v10				float,
	v11				float,
	v12				float,
	v13				float,
	v14				float,
	v15				float,
	v16				float,
	v17				float,
	itog			float
)
AS
BEGIN

declare @ik_disc_plan_nagr		int
declare @ik_disc				int
declare @cName_disc				varchar(100)
declare @n_sem					int
declare @ik_potok				int
declare @cName_potok			varchar(50)
declare @busy_hour				float	
declare @course					int
declare @group_count			int

declare @ik_content_plan_nagr		int
declare @ik_vid_zanyat				int
declare @ik_shema_of_potok			int
declare @busyhour					float
declare @calc_unit_count			int
declare @uchPlanHour				float 
declare @inPlanCount				int    
DECLARE @potok_course				int
declare @consHour					float  --константа для консультаций
declare @f_norm_per_student			float
declare @f_norm_per_ed				float
declare @max_norm_per_student		float
declare @min_requed_student			int
declare @f_norm_per_student_for_min	float
declare @f_norm_per_ed_for_min		float
declare @budg						int
declare @contr						int
declare @studcount					int
declare @allStudHour				float
declare @allStudMaxHour				float
declare @allEdHour					float  
declare @allHour					float

declare @v1				float	
declare @v2				float
declare @v3				float
declare @v4				float
declare @v5				float
declare @v6				float
declare @v7				float
declare @v8				float
declare @v9				float
declare @v10			float
declare @v11			float
declare @v12			float
declare @v13			float
declare @v14			float
declare @v15			float
declare @v16			float
declare @v17			float

DECLARE Cursor1 CURSOR LOCAL FAST_FORWARD READ_ONLY FOR		--!!!
		SELECT ik_disc_uch_plan,ik_disc,cName_disc,ik_potok,cName_potok,n_sem
		FROM GetDisciplinesForPlanNagr(@ik_plan_nagr)
        Order by cName_potok, cName_disc
	    OPEN Cursor1
FETCH NEXT FROM Cursor1 INTO @ik_disc_plan_nagr,@ik_disc,@cName_disc,@ik_potok,@cName_potok,@n_sem
WHILE @@FETCH_STATUS = 0
 BEGIN 
    set @busy_hour=0
	set @allStudHour=0
	set @allStudMaxHour=0
	set @allHour=0

	set @v1=NULL set @v2=NULL set @v3=NULL
	set @v4=NULL set @v5=NULL set @v6=NULL
	set @v7=NULL set @v8=NULL set @v9=NULL
	set @v10=NULL set @v11=NULL set @v12=NULL
	set @v13=NULL set @v14=NULL set @v15=NULL
	set @v16=NULL

	DECLARE Cursor2 CURSOR LOCAL FAST_FORWARD READ_ONLY FOR		--!!!
			SELECT ik_content_plan_nagr,Content_plan_nagr.ik_vid_zanyat,ik_shema_of_potok,rasp_cont.busy_hour
			FROM Content_plan_nagr LEFT JOIN 
				(SELECT ik_vid_zanyat, sum(hour_unit + student_hour) as busy_hour
				 FROM GetTeacherPlanNagr(2, @ik_plan_nagr, @ik_disc, @ik_potok, NULL)
				 GROUP BY ik_vid_zanyat) rasp_cont
			ON Content_plan_nagr.ik_vid_zanyat = rasp_cont.ik_vid_zanyat
			WHERE ik_plan_nagr = @ik_plan_nagr 
			  and ik_shema_of_potok in (Select ik_shema_of_potok 
										 FROM Potok_shema 
										 WHERE ik_potok = @ik_potok)
			  and ik_disc = @ik_disc
	OPEN Cursor2
	FETCH NEXT FROM Cursor2 INTO @ik_content_plan_nagr,@ik_vid_zanyat,@ik_shema_of_potok,@busyhour
	WHILE @@FETCH_STATUS = 0
	BEGIN

	set @allStudHour=0
	set @allStudMaxHour=0
	set @allEdHour=0
 
	if (@busyhour is NULL) set @busyhour=0
    set @busy_hour=@busy_hour+@busyhour

	Select @calc_unit_count=calc_unit_count							--!!!
	from [dbo].[Nagr_GetNeedPotokShemes](@ik_plan_nagr,@ik_potok) 
	where ik_decompose_type = (select ik_decompose_type 
							   from dbo.Content_plan_nagr,dbo.Potok_shema
							   where dbo.Content_plan_nagr.ik_shema_of_potok = dbo.Potok_shema.ik_shema_of_potok
								and ik_plan_nagr=@ik_plan_nagr and ik_disc=@ik_disc
								and ik_vid_zanyat=@ik_vid_zanyat and ik_potok=@ik_potok
								and ik_vid_nagruzki=1) 

	Select @group_count=calc_unit_count							--!!!
	from [dbo].[Nagr_GetNeedPotokShemes](@ik_plan_nagr,@ik_potok) 
	where ik_decompose_type = 2
	
	Select @uchPlanHour=Content_UchPl.i_hour_per_week*sem_uch_pl.kol_ned   --!!!
	From Content_UchPl INNER JOIN sv_disc 
	ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan INNER JOIN sem_uch_pl 
	ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem) 
	Where (sv_disc.ik_uch_plan = (SELECT ik_uch_plan FROM Potok WHERE ik_potok = @ik_potok)) 
	and (sv_disc.ik_disc = @ik_disc) 
	and (Content_UchPl.n_sem = @n_sem)
	and (Content_UchPl.ik_vid_zanyat = @ik_vid_zanyat)
	and (Content_UchPl.ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = @ik_plan_nagr))

	if (@ik_vid_zanyat=32) 
	begin
		select @consHour=dbo.GetConsultationHour(1,@n_sem,@ik_potok,@ik_disc,@ik_plan_nagr)
		set @allEdHour=@consHour*@calc_unit_count
	end
	else
	begin
		SELECT @f_norm_per_student=f_norm_per_student,@f_norm_per_ed=f_norm_per_ed,@max_norm_per_student=max_norm_per_student,
			   @min_requed_student=min_requed_student,@f_norm_per_student_for_min=f_norm_per_student_for_min,
			   @f_norm_per_ed_for_min=f_norm_per_ed_for_min
		FROM Content_norma_of_time 
		WHERE Content_norma_of_time.ik_norm_of_time = (SELECT ik_norm_of_time 
													   FROM dbo.Potok
													   WHERE ik_potok=@ik_potok)
		and ik_vid_zanyat=@ik_vid_zanyat
		and ik_vid_nagruzki=1

		select @budg=Plan_contingent.budget_count,@course=course_number		--!!!
		From Potok INNER JOIN Relation_potok_spec rps 
		ON Potok.ik_potok = rps.ik_potok INNER JOIN Plan_contingent 
		ON rps.ik_spec_fac = Plan_contingent.ik_spec_fac INNER JOIN Year_uch_pl yp 
		ON Potok.ik_year_enter = yp.ik_year_uch_pl INNER JOIN Plan_nagr 
		ON Plan_contingent.ik_year = Plan_nagr.ik_year INNER JOIN Year_uch_pl yc 
		ON Plan_nagr.ik_year = yc.ik_year_uch_pl 
		Where (Potok.ik_potok = @ik_potok) and (Plan_nagr.ik_plan_nagr = @ik_plan_nagr) 
		and (course_number = yc.year_value - yp.year_value + 1) and Plan_nagr.ik_type_ed=1

		select @contr=Plan_contingent.contract_count		--!!!
		From Potok INNER JOIN Relation_potok_spec rps 
		ON Potok.ik_potok = rps.ik_potok INNER JOIN Plan_contingent 
		ON rps.ik_spec_fac = Plan_contingent.ik_spec_fac INNER JOIN Year_uch_pl yp 
		ON Potok.ik_year_enter = yp.ik_year_uch_pl INNER JOIN Plan_nagr 
		ON Plan_contingent.ik_year = Plan_nagr.ik_year INNER JOIN Year_uch_pl yc 
		ON Plan_nagr.ik_year = yc.ik_year_uch_pl 
		Where (Potok.ik_potok = @ik_potok) and (Plan_nagr.ik_plan_nagr = @ik_plan_nagr) 
		and (course_number = yc.year_value - yp.year_value + 1) and Plan_nagr.ik_type_ed=2

		if (@budg is NULL) set @budg=0
		if (@contr is NULL) set @contr=0
		set @studcount=@budg+@contr				--!!!

		if @studcount < @min_requed_student 
		begin
			set @allStudHour=@allStudHour+@f_norm_per_student_for_min*@studcount
			set @allStudMaxHour=@allStudMaxHour+@max_norm_per_student*@studcount
			if ((@uchPlanHour is NULL)or(@uchPlanHour=0)) set @allEdHour=@allEdHour+@f_norm_per_ed_for_min*@calc_unit_count
				else set @allEdHour=@allEdHour+@uchPlanHour*@f_norm_per_ed_for_min*@calc_unit_count
		end
			else
			begin
				set @allStudHour=@allStudHour+@f_norm_per_student*@studcount
				set @allStudMaxHour=@allStudMaxHour+@max_norm_per_student*@studcount
				if ((@uchPlanHour is NULL)or(@uchPlanHour=0)) set @allEdHour=@allEdHour+@f_norm_per_ed*@calc_unit_count
					else set @allEdHour=@allEdHour+@uchPlanHour*@f_norm_per_ed*@calc_unit_count
			end
		select @inPlanCount=count(ik_upContent)/*Content_UchPl.*, sem_uch_pl.kol_ned */
			From Content_UchPl INNER JOIN sv_disc 
			ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan INNER JOIN sem_uch_pl 
			ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem) 
			Where (sv_disc.ik_uch_plan = (SELECT ik_uch_plan FROM Potok WHERE ik_potok = @ik_potok)) 
			and (sv_disc.ik_disc = @ik_disc) and (Content_UchPl.n_sem = @n_sem) 
			and (Content_UchPl.ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = @ik_plan_nagr))
			and ik_vid_zanyat=@ik_vid_zanyat
			
			if (@inPlanCount=0) set @inPlanCount=1

			if @allStudHour*@inPlanCount > @allStudMaxHour set @allEdHour= @allEdHour*@inPlanCount + @allStudMaxHour
				else set @allEdHour=(@allEdHour + @allStudHour)*@inPlanCount
			
	end
	set @allHour=@allHour+@allEdHour
	if @ik_vid_zanyat=3 set @v1=@allEdHour --Лекция
	if @ik_vid_zanyat=4 set @v2=@allEdHour --Лабораторное занятие
	if @ik_vid_zanyat=5 set @v3=@allEdHour --Практическое занятие
	if @ik_vid_zanyat=6 set @v4=@allEdHour --Экзамен
	if @ik_vid_zanyat=7 set @v5=@allEdHour --Зачет
	if @ik_vid_zanyat=8 set @v6=@allEdHour --КП
	if @ik_vid_zanyat=9 set @v7=@allEdHour --КР
	if @ik_vid_zanyat=10 set @v8=@allEdHour --РГР
	if @ik_vid_zanyat=11 set @v9=@allEdHour --Реферат
	if @ik_vid_zanyat=12 set @v10=@allEdHour --Контрольные работы
	if @ik_vid_zanyat=27 set @v11=@allEdHour --Учебная практика
	if @ik_vid_zanyat=31 set @v12=@allEdHour --Дипломные проекты
	if @ik_vid_zanyat=32 set @v13=@allEdHour --Консультации
	if @ik_vid_zanyat=33 set @v14=@allEdHour --Аттестация
	if @ik_vid_zanyat=34 set @v15=@allEdHour --Аспиранты
	if @ik_vid_zanyat=48 set @v16=@allEdHour --ГЭК
	if @ik_vid_zanyat=49 set @v17=@allEdHour --Вступительный экзамен

	FETCH NEXT FROM Cursor2 INTO @ik_content_plan_nagr,@ik_vid_zanyat,@ik_shema_of_potok,@busyhour
	END    
	CLOSE Cursor2
	DEALLOCATE Cursor2

INSERT INTO @Result values(@cName_disc,@cName_potok,@course,@group_count,@studcount,@v1,@v2,@v3,@v4,@v5,@v6,
						   @v7,@v8,@v9,@v10,@v11,@v12,@v13,@v14,@v15,@v16,@v17,@allHour)
FETCH NEXT FROM Cursor1 INTO @ik_disc_plan_nagr,@ik_disc,@cName_disc,@ik_potok,@cName_potok,@n_sem
END    
CLOSE Cursor1
DEALLOCATE Cursor1

RETURN
END