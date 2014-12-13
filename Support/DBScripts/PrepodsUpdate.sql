--снять внешний ключ с ведомости
--убрать индекс

alter table Vedomost add new_Itab_n varchar(50) null

update Vedomost set new_Itab_n = Import.KafTeachers.itab_n
from Import.KafTeachers, Person
where Person.itab_n = Vedomost.Itab_n
and Person.Clastname = Import.KafTeachers.LastName
and Person.Cfirstname = Import.KafTeachers.FirstName
and Person.Cotch = Import.KafTeachers.Otch

update Vedomost set new_Itab_n = null
where Ik_ved in (select ik_ved from Vedomost, Person p, Prepod
				 where Vedomost.Itab_n = Prepod.itab_n and Prepod.nCode = p.nCode
				 and (select count(idFactStaffHistory) from Import.KafTeachers where LastName = p.Clastname and FirstName = p.Cfirstname and Otch = p.Cotch)=0)


alter table Vedomost drop column Itab_n

--переименовать new_Itab_n в Itab_n

--добавить индекс обратно

ALTER     PROCEDURE [dbo].[SelPrepodForVedom]
@Ik_grup INT = NULL,
@iK_vid_zanyat INT = NULL,
@n_sem INT = NULL
AS


 -- SELECT p.itab_n, RTRIM(Person.Clastname)+' '+RTRIM(Person.Cfirstname)+' '+RTRIM(Person.Cotch)  + 
	--' (таб. № ' + CONVERT(nvarchar, p.itab_n) + ')' as NamePrepod
 -- FROM Prepod p, Person
 -- WHERE p.nCode=Person.nCode 
 -- ORDER BY NamePrepod

  select distinct itab_n,[LastName] + ' ' + [FirstName] + ' ' + isnull([Otch],'') + 
  ' (таб. № ' + CONVERT(nvarchar, isnull(itab_n,'отсутствует')) + ')' as NamePrepod
  from Import.KafTeachers where isPPS=1
  ORDER BY NamePrepod


GO

--процедура редактирвоания и удаления ведомости 
--вставка - через процедуру InsertVedomost
ALTER           PROCEDURE [dbo].[AppendVedomost]
@flag INT, 			
@cNumber_ved varchar(12) = NULL,--номер (обозначение) ведомости
@Ik_grup INT,			--код группы
@ik_vid_zanyat INT,		--код вида занятий
@n_sem INT,			--№ семестра
@ik_disc INT,			--код дисциплины
@Itab_n varchar(50),			--код препода
@Ik_vid_exam INT,		--вид экзамена (первичный, вторичный)
@Dd_exam DATETIME,		--дата экзамена
@dD_vydano DATETIME,   		--дата выдачи
@lClose BIT=0,
@lPriznak_napr BIT,		--признак направления
@Ik_ved INT = NULL,		--код ведомости (только для обновления)
@lVnosn BIT=0,
@ik_upContent INT=null
AS
  IF @flag=-1
  BEGIN
  IF (@Ik_ved IS NOT NULL)
	DELETE FROM Vedomost
	WHERE Ik_ved = @Ik_ved
  END

IF (@Ik_grup IS NULL) OR (@n_sem IS NULL) OR (@ik_disc IS NULL) OR (@ik_vid_zanyat IS NULL)
BEGIN
	RAISERROR('Не указаны группа, дисциплина, вид занятий и номер семестра ведомости. Операция отменена.',16,1)
	ROLLBACK TRAN
END
ELSE
BEGIN

  IF @flag=0
  BEGIN
    IF (@Ik_ved IS NOT NULL)
    BEGIN
		if (@ik_upContent is null)
			set @ik_upContent=dbo.SelIkCont(@ik_vid_zanyat, @n_sem, @ik_grup, @ik_disc)

		UPDATE Vedomost 
		SET cNumber_ved = @cNumber_ved, Ik_grup = @Ik_grup, Itab_n = @Itab_n, 
			Ik_vid_exam = @Ik_vid_exam, ik_upContent = @ik_upContent, 
			Dd_exam = @Dd_exam, dD_vydano = @Dd_exam, lPriznak_napr = @lPriznak_napr, lClose=@lClose
		WHERE Ik_ved = @Ik_ved
    END
  END

  IF (@flag=1) AND (@lPriznak_napr=0) AND (@ik_upContent is NULL)
  BEGIN
	EXEC dbo.InsertVedomost 
		@cNumber_ved=@cNumber_ved, @Ik_grup=@Ik_grup, @ik_vid_zanyat=@ik_vid_zanyat,
		@n_sem=@n_sem, @ik_disc=@ik_disc, @Itab_n=@Itab_n, @Ik_vid_exam=@Ik_vid_exam,
		@Dd_exam=@Dd_exam, @dD_vydano=@dD_vydano, @lClose=@lClose, @lVnosn=@lVnosn	
  END
	
	IF (@flag=1) AND (@lPriznak_napr=0) AND (@ik_upContent is not NULL)
    BEGIN
	EXEC dbo.InsertVedomostWithContent 
		@cNumber_ved=@cNumber_ved, @Ik_grup=@Ik_grup, @ik_upContent=@ik_upContent, 
        @Itab_n=@Itab_n, @Ik_vid_exam=@Ik_vid_exam,
		@Dd_exam=@Dd_exam, @dD_vydano=@dD_vydano, @lClose=@lClose, @lVnosn=@lVnosn	
    END

IF @flag=2
  BEGIN
    IF (@Ik_ved IS NOT NULL)
    BEGIN
	UPDATE Vedomost 
	SET lClose=1
	WHERE Ik_ved = @Ik_ved
    END
  END

END

GO

ALTER        PROCEDURE [dbo].[SetAttributesVedomost]
@Ik_ved INT, 		--код ведомости 
@Dd_exam DATETIME=NULL,
@itab_n varchar(50)=NULL
AS
IF @itab_n IS NULL
BEGIN
	SELECT @itab_n=itab_n FROM dbo.Vedomost WHERE ik_ved=@Ik_ved
END

IF (@Ik_ved IS NOT NULL)
    BEGIN
	UPDATE Vedomost 
	SET  Dd_exam=@Dd_exam, itab_n=@itab_n
	WHERE Ik_ved = @Ik_ved
    END
GO

ALTER PROCEDURE [dbo].[Dek_CloseAtt]
	@Ik_ved     INT,
	@itab_n	    varchar(50)=null,
    @lclose     bit
	
as
if @itab_n=''
begin
update vedomost set lclose=@lclose
    where ik_ved = @Ik_ved
end
else
begin
update vedomost set itab_n=@itab_n, lclose=@lclose
    where ik_ved = @Ik_ved
end
GO

--------------------------------------------------------------------GetAllNaprStud-----------------------------------------------------------------------------
--Процедура выдает направления студента в определенном семестре:
--дисциплину, вид отчетности, отметку, дату сдачи, преподавателя
ALTER          PROCEDURE [dbo].[GetAllNaprStud]
@n_sem INT,
@ik_zach INT
AS

DECLARE @ResultTable Table
(
	cName_disc			VARCHAR(100),			--наименование
	cName_vid_zanyat	VARCHAR(50),
	ShortName			VARCHAR(20),			--оценка
	dD_vydano			DATETIME,
	cName_vid_exam		VARCHAR(20),
	Dd_exam				DATETIME,				--дата экзамена
	PrepName			VARCHAR(100),
	n_sem 				INT,
	iK_vid_zanyat 		INT,
	Osenca				INT
)


IF (@n_sem>0)
BEGIN
  INSERT INTO @ResultTable(cName_disc,cName_vid_zanyat,	ShortName,dD_vydano,cName_vid_exam,Dd_exam,
							PrepName,n_sem,iK_vid_zanyat, Osenca)
  SELECT cName_disc,				--название дисциплины 
	cName_vid_zanyat, 				--вид отчеиности
	ShortName,  					--оценка
	dD_vydano,
    cName_vid_exam,
	Dd_exam, 						--дата экзамена
	RTRIM(LastName)+' '+CONVERT(VARCHAR(1),FirstName)+'.'
		+CONVERT(VARCHAR(1),Otch)+'.' as PrepName,						--преподаватель
	@n_sem as n_sem,
	iK_vid_zanyat,
	vedUsp.Cosenca
	 FROM
	(SELECT Cosenca, Dd_exam, Ik_vid_exam, dD_vydano, itab_n, ik_upContent FROM 
		(SELECT Ik_ved, Cosenca FROM dbo.Uspev WHERE ik_zach=@ik_zach AND Cosenca>-1) u
		INNER JOIN
		(SELECT Ik_ved, ik_upContent, lPriznak_napr, Dd_exam, Ik_vid_exam, dD_vydano, itab_n FROM dbo.Vedomost WHERE Ik_grup IN (SELECT ik_grup FROM dbo.StudGrup WHERE ik_zach=@ik_zach)
		and lPriznak_napr = 1)v
		ON u.Ik_ved=v.Ik_ved)vedUsp
	INNER  JOIN 
	(SELECT Cosenca, ShortName FROM dbo.Osenca WHERE Cosenca>-1)os
		ON vedUsp.Cosenca=os.Cosenca
	INNER JOIN
	(select distinct itab_n,LastName, FirstName, Otch from Import.KafTeachers )p
		ON p.itab_n=vedUsp.itab_n

--выбираем виды отчетности в данном семестре
	  INNER JOIN
	(SELECT contup.iK_vid_zanyat, ik_upContent, cName_vid_zanyat,  cName_disc FROM 
 	      (SELECT distinct ik_upContent, iK_disc, ik_vid_zanyat From
		dbo.Content_UchPl INNER JOIN dbo.sv_disc ON dbo.Content_UchPl.ik_disc_uch_plan = dbo.sv_disc.ik_disc_uch_plan
		Where ((ik_uch_plan IN (Select ik_uch_plan From Grup Where ik_grup IN (SELECT ik_grup FROM dbo.StudGrup WHERE ik_zach=@ik_zach)))
		 and (n_sem = @n_sem) and (ik_vid_zanyat in (Select ik_vid_zanyat From vid_zaniat Where ikTypeZanyat in (SELECT ikTypeZanyat FROM dbo.TypeZanyat WHERE bitOtchetnost = 1)))))contup
	INNER JOIN 
	(SELECT iK_vid_zanyat, cName_vid_zanyat FROM dbo.vid_zaniat)vz
		ON vz.ik_vid_zanyat=contup.ik_vid_zanyat
	INNER  JOIN	  
	  (SELECT iK_disc, cName_disc FROM dbo.discpln) d
		ON d.iK_disc=contup.iK_disc) cont
		ON vedUsp.ik_upContent=cont.ik_upContent 
	INNER JOIN 
	  (SELECT ik_vid_exam, cName_vid_exam FROM Vid_exam) ve
		ON vedUsp.ik_vid_exam=ve.ik_vid_exam
END

--выбираем направления по всем семестрам	
ELSE
BEGIN
  INSERT INTO @ResultTable(cName_disc,cName_vid_zanyat,	ShortName,dD_vydano,cName_vid_exam,Dd_exam,
							PrepName,n_sem,iK_vid_zanyat, Osenca)
  SELECT cName_disc,				--название дисциплины 
	cName_vid_zanyat, 				--вид отчеиности
	ShortName,  					--оценка
	dD_vydano,
    cName_vid_exam,
	Dd_exam, 						--дата экзамена
	RTRIM(LastName)+' '+CONVERT(VARCHAR(1),FirstName)+'.'
		+CONVERT(VARCHAR(1),Otch)+'.' as PrepName,						--преподаватель
	n_sem,
	iK_vid_zanyat,
	vedUsp.Cosenca
	 FROM
	(SELECT Cosenca, Dd_exam, Ik_vid_exam, dD_vydano, itab_n, ik_upContent FROM 
		(SELECT Ik_ved, Cosenca FROM dbo.Uspev WHERE ik_zach=@ik_zach AND Cosenca>-1) u
		INNER JOIN
		(SELECT Ik_ved, ik_upContent, lPriznak_napr, Dd_exam, Ik_vid_exam, dD_vydano, itab_n FROM dbo.Vedomost WHERE Ik_grup IN (SELECT ik_grup FROM dbo.StudGrup WHERE ik_zach=@ik_zach)
		and lPriznak_napr = 1)v
		ON u.Ik_ved=v.Ik_ved)vedUsp
	INNER  JOIN 
	(SELECT Cosenca, ShortName FROM dbo.Osenca WHERE Cosenca>-1)os
		ON vedUsp.Cosenca=os.Cosenca
	INNER JOIN
	(select distinct itab_n,LastName, FirstName, Otch from Import.KafTeachers )p
		ON p.itab_n=vedUsp.itab_n

--выбираем виды отчетности 
	  INNER JOIN
	(SELECT contup.iK_vid_zanyat, ik_upContent, cName_vid_zanyat,  cName_disc, n_sem FROM 
 	      (SELECT distinct ik_upContent, iK_disc, ik_vid_zanyat, n_sem From
		dbo.Content_UchPl INNER JOIN dbo.sv_disc ON dbo.Content_UchPl.ik_disc_uch_plan = dbo.sv_disc.ik_disc_uch_plan
		Where ((ik_uch_plan IN (Select ik_uch_plan From Grup Where ik_grup IN (SELECT ik_grup FROM dbo.StudGrup WHERE ik_zach=@ik_zach)))
		 and (ik_vid_zanyat in (Select ik_vid_zanyat From vid_zaniat Where ikTypeZanyat in (SELECT ikTypeZanyat FROM dbo.TypeZanyat WHERE bitOtchetnost = 1)))))contup
	INNER JOIN 
	(SELECT iK_vid_zanyat, cName_vid_zanyat FROM dbo.vid_zaniat)vz
		ON vz.ik_vid_zanyat=contup.ik_vid_zanyat
	INNER  JOIN	  
	  (SELECT iK_disc, cName_disc FROM dbo.discpln) d
		ON d.iK_disc=contup.iK_disc) cont
		ON vedUsp.ik_upContent=cont.ik_upContent
	INNER JOIN 
	  (SELECT ik_vid_exam, cName_vid_exam FROM Vid_exam) ve
		ON vedUsp.ik_vid_exam=ve.ik_vid_exam

END
SELECT cName_disc,cName_vid_zanyat,	ShortName,
		dD_vydano, cName_vid_exam, Dd_exam,	PrepName,n_sem
	 FROM @ResultTable

ORDER BY  Dd_exam

GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Процедура выдает успеваемость студента в определенном семестре:
--дисциплину, вид отчетности, отметку, дату сдачи, преподавателя
--[SelUspevForStud] 0, 18629
ALTER          PROCEDURE [dbo].[SelUspevForStud]
@n_sem INT,
@ik_zach INT
AS

DECLARE @ResultTable Table
(
	cName_disc			VARCHAR(500),			--наименование
	cName_vid_zanyat	VARCHAR(50),
	ShortName			VARCHAR(20),			--оценка
	Dd_exam				DATETIME,				--дата экзамена
	PrepName				VARCHAR(100),
	n_sem 				INT,
	iK_vid_zanyat 		INT,
	Osenca				INT,
	HourCount			FLOAT,
	[ViborGroup]		INT
)




insert into @ResultTable(cName_disc,cName_vid_zanyat,ShortName,Dd_exam,PrepName,n_sem,iK_vid_zanyat, Osenca, HourCount, [ViborGroup])
  SELECT cName_disc,				--название дисциплины 
	cName_vid_zanyat, 				--вид отчеиности
	'',  					--оценка
	Dd_exam, 						--дата экзамена
	RTRIM(LastName)+' '+CONVERT(VARCHAR(1),FirstName)+'.'
		+CONVERT(VARCHAR(1),Otch)+'.' as PrepName,						--преподаватель
	contup.n_sem,
	contup.iK_vid_zanyat,
	vedUsp.Cosenca,
	CONVERT(INT,(SemAuditHourCount+(contup.iHour_gos-AllAuditHourCount)*(SemWeekCount/AllWeekCount))) as HourCount,
--	(SemAuditHourCount+((contup.iHour_gos-AllAuditHourCount-contup.iIndivid)*SemWeekCount)/AllWeekCount
--			+contup.iIndivid/AllSemCount) as HourCount
	[ViborGroup]
	 FROM
	(SELECT iK_vid_zanyat, ik_upContent, sv_disc.ik_disc_uch_plan, n_sem, CONVERT(FLOAT,iHour_gos) iHour_gos, 
				CONVERT(FLOAT,iIndivid) iIndivid, ik_uch_plan, iK_disc, [ViborGroup] FROM 
		dbo.sv_disc, dbo.Content_UchPl 
		Where /* (sv_disc.ik_uch_plan IN (Select ik_uch_plan From Grup Where ik_grup IN (SELECT ik_grup FROM dbo.StudGrup WHERE ik_zach=@ik_zach)))
		   AND */((n_sem = @n_sem) or (@n_sem = 0)) and 
			(ik_vid_zanyat in (Select ik_vid_zanyat From vid_zaniat Where ikTypeZanyat in (SELECT ikTypeZanyat FROM dbo.TypeZanyat WHERE bitOtchetnost = 1)))
			AND Content_UchPl.ik_disc_uch_plan = dbo.sv_disc.ik_disc_uch_plan)contup 
	INNER JOIN 
	dbo.vid_zaniat
		ON vid_zaniat.ik_vid_zanyat=contup.ik_vid_zanyat
	INNER  JOIN	  
	  dbo.discpln
		ON discpln.iK_disc=contup.iK_disc
	LEFT JOIN
	(SELECT MAX(Cosenca) Cosenca,  MAX(Dd_exam) Dd_exam, MAX(itab_n) itab_n, ik_upContent FROM 
		dbo.Uspev  u
		INNER JOIN
		dbo.Vedomost v
		ON u.Ik_ved=v.Ik_ved
		WHERE ik_zach=@ik_zach AND Cosenca>-1
		GROUP BY ik_upContent)vedUsp
	on contup.ik_upContent=vedUsp.ik_upContent
	--LEFT  JOIN 
	--(SELECT Cosenca, ShortName FROM dbo.Osenca WHERE Cosenca>-1)os
	--	ON vedUsp.Cosenca=os.Cosenca
	LEFT JOIN
	(select distinct itab_n,LastName, FirstName, Otch from Import.KafTeachers )p
		ON p.itab_n=vedUsp.itab_n

	
	left JOIN

--(SELECT (SemAuditHourCount+((contup.iHour_gos-AllAuditHourCount-contup.iIndivid)*SemWeekCount/AllWeekCount)
--			+sv_disc.iIndivid/AllSemCount) as HourCount, ik_disc_uch_plan    FROM 
		(SELECT  CONVERT(FLOAT,sum(i_hour_per_week * kol_ned)) AS AllAuditHourCount, 
					CONVERT(FLOAT,sum(kol_ned)) AS AllWeekCount, 
					CONVERT(FLOAT,count(kol_ned)) AS AllSemCount,ik_disc_uch_plan, ik_uch_plan 
				FROM 
				dbo.Content_UchPl, dbo.sem_uch_pl
					WHERE i_hour_per_week is not NULL 
--						AND ik_disc_uch_plan = contup.ik_disc_uch_plan
--						and ik_uch_plan = contup.ik_uch_plan
						and sem_uch_pl.n_sem=Content_UchPl.n_sem
				group by ik_disc_uch_plan, ik_uch_plan
				)AllCount
	on  AllCount.ik_disc_uch_plan=contup.ik_disc_uch_plan and AllCount.ik_uch_plan = contup.ik_uch_plan
	left join
		(SELECT  CONVERT(FLOAT,sum(i_hour_per_week * kol_ned)) AS SemAuditHourCount, 
					CONVERT(FLOAT,sum(kol_ned)) AS SemWeekCount, ik_disc_uch_plan, sem_uch_pl.n_sem, ik_uch_plan 
				FROM 
				dbo.Content_UchPl, dbo.sem_uch_pl
					WHERE i_hour_per_week is not NULL
						and sem_uch_pl.n_sem=Content_UchPl.n_sem 
--						AND ik_disc_uch_plan = contup.ik_disc_uch_plan
--						AND sem.n_sem=contup.n_sem
--						and ik_uch_plan = contup.ik_uch_plan 
			group by ik_disc_uch_plan, sem_uch_pl.n_sem, ik_uch_plan 
)SemCount 
		on SemCount.ik_disc_uch_plan=contup.ik_disc_uch_plan AND SemCount.n_sem=contup.n_sem
			and SemCount.ik_uch_plan = contup.ik_uch_plan
Where (contup.ik_uch_plan IN (Select ik_uch_plan From Grup Where ik_grup IN (SELECT ik_grup FROM dbo.StudGrup WHERE ik_zach=@ik_zach)))
		   OR Cosenca>-1
 

SELECT cName_disc,cName_vid_zanyat,	ShortName,Dd_exam,
							PrepName,n_sem, HourCount
FROM
	(SELECT cName_disc,cName_vid_zanyat,n_sem,	MAX(Dd_exam) Dd_exam,
								MAX(PrepName) PrepName, MAX(HourCount) HourCount, MAX(Osenca) Osenca
		 FROM @ResultTable
	WHERE [ViborGroup] =0 OR ShortName IS NOT NULL 
	GROUP BY cName_disc,cName_vid_zanyat, n_sem) Uspev
	LEFT JOIN
	dbo.Osenca ON Uspev.Osenca=Osenca.Cosenca
ORDER BY  n_sem, Dd_exam

GO
---------------------------------------------------------------------------------------------------------------------
ALTER VIEW [dbo].[Napr_View]
AS
SELECT     dbo.Vedomost.Ik_ved, dbo.Uspev.Cosenca, UspevKPTheme.KPTheme cTema, lastname as clastname, firstname as cfirstname, otch as cotch, 
                      dbo.vid_zaniat.cName_vid_zanyat, dbo.Vid_exam.cName_vid_exam, dbo.Uspev.Ik_zach, 
                      dbo.discpln.cName_disc + ', ' + dbo.Vid_exam.cName_vid_exam + ', ' + dbo.vid_zaniat.cName_vid_zanyat AS Outcolumn, dbo.Vedomost.Dd_exam, 
                      dbo.Vedomost.Itab_n, Vedomost.ik_upContent
FROM         dbo.Vid_exam INNER JOIN
                      dbo.Vedomost ON dbo.Vid_exam.ik_vid_exam = dbo.Vedomost.Ik_vid_exam INNER JOIN
                      dbo.Uspev ON dbo.Vedomost.Ik_ved = dbo.Uspev.Ik_ved  INNER JOIN
                      dbo.Content_UchPl ON dbo.Vedomost.ik_upContent = dbo.Content_UchPl.ik_upContent INNER JOIN
                      dbo.sv_disc INNER JOIN
                      dbo.discpln ON dbo.sv_disc.ik_disc = dbo.discpln.iK_disc ON dbo.Content_UchPl.ik_disc_uch_plan = dbo.sv_disc.ik_disc_uch_plan inner JOIN
                      dbo.vid_zaniat ON dbo.Content_UchPl.ik_vid_zanyat = dbo.vid_zaniat.iK_vid_zanyat left JOIN
                      (select distinct itab_n,lastname,firstname,otch from Import.KafTeachers) pr ON dbo.Vedomost.Itab_n = pr.itab_n/*dbo.Prepod.itab_n INNER JOIN
                      dbo.Person ON Prepod.nCode = Person.nCode*/
                      LEFT JOIN dbo.UspevDocument 
                      ON Uspev.ik_zach=UspevDocument.ik_zach AND Vedomost.ik_upContent=UspevDocument.ik_upContent
                      LEFT JOIN dbo.UspevKPTheme
                      ON UspevDocument.idUspevDocs=UspevKPTheme.idUspevDocs
WHERE     (dbo.Vedomost.lClose = 0) AND (dbo.Vedomost.lPriznak_napr = 1)
-----------------------------------------------------------------------------------------------------------------------
--закрытие ведомости
ALTER        PROCEDURE [dbo].[CloseVedomost]
@Ik_ved INT, 		--код ведомости 
@Dd_exam DATETIME=NULL,
@itab_n varchar(50)=NULL
AS
IF @itab_n IS NULL
BEGIN
	SELECT @itab_n=itab_n FROM dbo.Vedomost WHERE ik_ved=@Ik_ved
END

IF (@Ik_ved IS NOT NULL)
    BEGIN
	UPDATE Vedomost 
	SET lClose=1, Dd_exam=@Dd_exam, itab_n=@itab_n
	WHERE Ik_ved = @Ik_ved
    END
GO
--------------------------------------------------------
ALTER                PROCEDURE [dbo].[AppendNapravl]
@n_sem INT,					--0
@iK_disc INT,				--1 код дисциплины
@ik_vid_zanyat INT,			--2 код вида занятий
--@Itab_n INT=NULL,			--3 код препода
@Ik_zach INT,				--3
@Date DATETIME,				--4
@EndDate DATETIME,			--5
@Ik_vid_exam INT,			--6 код вида экзамена
@cNumber_napr VARCHAR(12)=NULL, --7
@dnev VARCHAR(12),			--8 линия дневного
@zaoch VARCHAR(12),			--9 линия заочного
@first VARCHAR(12),			--10 линия первичного
@second VARCHAR(12),		--11 линия повторного
@last VARCHAR(12),			--12 линия комиссия
@ecs VARCHAR(12),			--13 линия экзамена
@zach VARCHAR(12),			--14 линия зачета
@old_ved int=null			--15			

AS
BEGIN

IF @Date IS NULL
	SET @Date=GETDATE()

declare @ik_upContent int
DECLARE @Ik_grup INT

if (@old_ved is null)
begin 
  
  SELECT @Ik_grup=Ik_grup FROM dbo.StudGrup WHERE Ik_zach=@Ik_zach AND Ik_prikazOtch IS NULL AND Ik_pricOtch  IS NULL --SELECT Ik_grup FROM dbo.StudGrup WHERE Ik_zach=16287 AND Ik_prikazOtch IS NULL AND Ik_pricOtch  IS NULL 
  SELECT @ik_upContent=dbo.SelIkCont(@ik_vid_zanyat, @n_sem, @ik_grup, @ik_disc)
end else 
	  SELECT @ik_upContent = ik_upContent, @Ik_grup = Ik_grup from Vedomost where Ik_ved = @old_ved

DECLARE @Ik_ved INT
BEGIN TRAN

--добавляем направление
	INSERT INTO Vedomost(cNumber_ved, Ik_grup, Itab_n, Ik_vid_exam, 
			ik_upContent, Dd_exam, dD_vydano, lPriznak_napr, lClose)
	VALUES (@cNumber_napr, @Ik_grup, NULL, @Ik_vid_exam, 
			@ik_upContent, NULL, @Date, 1, 0)  --7  8
	SET @Ik_ved=@@IDENTITY
	IF @Ik_ved IS NOT NULL
	BEGIN
--добавляем соответствующие данные в успеваемость 
		INSERT INTO uspev(Ik_ved, Ik_zach, Cosenca)
		VALUES(@Ik_ved, @Ik_zach,-1)
	END
	ELSE
	BEGIN
		RAISERROR('При создании направление произошла ошибка. Операция отменена.',16,1)
		ROLLBACK TRAN
	END
COMMIT TRAN

DECLARE @kurs INT
IF @n_sem%2=1
	SET @kurs=(@n_sem/2)+1
ELSE 
	SET @kurs=(@n_sem/2)

   IF @Ik_ved IS NOT NULL
    BEGIN	
	SELECT Cshort_name_fac, Cname_grup, @kurs  AS kurs, NameStud, Nn_zach,
		@Date AS BegDate,
		@EndDate AS EndDate,
		@cNumber_napr AS cNumber_napr,
		@dnev AS lDnev,
		@zaoch AS lZaoch,
		@first AS lFirst,
		@second AS lSecond,
		@last AS lLast,
		cName_disc,
		--NamePrep,
		@ecs AS lEcs,
		@zach AS lZach,
		@Ik_ved AS ik_ved
		
	  FROM
	  (SELECT Cshort_name_fac, Cname_grup FROM 
  	    (SELECT Cname_grup, ik_spec_fac FROM  dbo.Grup WHERE Ik_grup=@Ik_grup) g
	    INNER JOIN 
	    (SELECT ik_fac, ik_spec_fac FROM dbo.Relation_spec_fac) rf
		ON  rf.ik_spec_fac=g.ik_spec_fac
	    INNER JOIN 
	    (SELECT ik_fac, Cshort_name_fac FROM dbo.Fac)f 
		ON f.ik_fac=rf.ik_fac) fg, 
	  (SELECT cName_disc FROM dbo.discpln WHERE iK_disc=@iK_disc) d,
	    (SELECT Nn_zach, nCode FROM zach WHERE Ik_zach=@Ik_zach) z 
	--	ON z.Ik_zach=@Ik_zach
	    INNER JOIN
	    (SELECT nCode, RTRIM(Clastname)+' '+CONVERT(VARCHAR(1),Cfirstname)+'.'
			+CONVERT(VARCHAR(1),Cotch)+'.' as NameStud
		FROM stud) s ON s.nCode=z.nCode/*,
	    (SELECT RTRIM(Clastname)+' '+CONVERT(VARCHAR(1),Cfirstname)+'.'
			+CONVERT(VARCHAR(1),Cotch)+'.' as NamePrep
	     FROM Prepods
	     WHERE itab_n=@itab_n) AS p*/
    END

   ELSE
    BEGIN
  	RAISERROR('Произошла ошибка. Операция добавления направления отменена.',16,1);
	ROLLBACK TRAN

    END
END
--  ON 
--exec AppendDocs 1,

GO
