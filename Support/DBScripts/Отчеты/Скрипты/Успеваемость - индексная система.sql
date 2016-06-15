USE [UGTU]
GO
/****** Object:  StoredProcedure [dbo].[SelItogiExForKurs]    Script Date: 12.02.2016 17:00:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SelItogiExForKurs 7,0,2012

declare

@sem INT = 1, 
@year INT = 2015,
@SemDate DATE='02/02/2016'



--вот все экзамены, что должны быть сданы
--lVibor=1, если это дисц по выбору
SELECT DISTINCT Grup.Ik_grup, Grup.Cname_grup, Content_UchPl.ik_upContent, [discpln].[cName_disc],
	Content_UchPl.ik_vid_zanyat, Content_UchPl.n_sem, lVibor, sv_disc.ViborGroup FROM
--выбираем все группы, в которых есть студенты
	dbo.Grup, dbo.StudGrup, dbo.sv_disc, dbo.Content_UchPl, Vedomost, dbo.grp_disc,
	[dbo].[discpln]
WHERE
	(Grup.DateExit IS NULL or Grup.DateExit>@SemDate)
	AND Grup.Ik_grup=StudGrup.Ik_grup AND StudGrup.Ik_prikazOtch is null 
	AND Grup.ik_uch_plan=sv_disc.ik_uch_plan
	AND sv_disc.ik_disc_uch_plan=Content_UchPl.ik_disc_uch_plan
	AND (Content_UchPl.n_sem=(@year-Grup.nYear_post)*2-@sem)
	and sv_disc.ik_disc=[discpln].iK_disc
--¬»ƒ «јЌя“»… - Ё «јћ≈Ќ  и практики
	AND Content_UchPl.ik_vid_zanyat in (Select ik_vid_zanyat From vid_zaniat Where ikTypeZanyat in (SELECT ikTypeZanyat FROM dbo.TypeZanyat WHERE bitOtchetnost = 1 AND bitExam = 1))	--практики тоже учитываем
--фильтруем те дисциплины, по которым нет ведомостей
	AND Content_UchPl.ik_upContent = Vedomost.ik_upContent AND Grup.Ik_grup=Vedomost.Ik_grup AND  lPriznak_napr=0
	AND sv_disc.IK_grp_disc=grp_disc.IK_grp_disc 
order by Grup.Ik_grup, Content_UchPl.ik_upContent



--вот все, что было сдано
SELECT DISTINCT Grup.Ik_grup, Grup.Cname_grup,
Person.Clastname, Person.Cfirstname, Person.Cotch,
 [discpln].[cName_disc], [MaxUspev].Cosenca,lVibor, sv_disc.ViborGroup 
	FROM
--выбираем все группы, в которых есть студенты
	dbo.Grup, dbo.StudGrup, dbo.sv_disc, dbo.Content_UchPl, Vedomost, dbo.grp_disc,
	[dbo].[discpln], [dbo].[MaxUspev], dbo.Zach, dbo.Person
WHERE
	(Grup.DateExit IS NULL or Grup.DateExit>@SemDate)
	AND Grup.Ik_grup=StudGrup.Ik_grup AND StudGrup.Ik_prikazOtch is null 
	AND Grup.ik_uch_plan=sv_disc.ik_uch_plan
	AND sv_disc.ik_disc_uch_plan=Content_UchPl.ik_disc_uch_plan
	AND (Content_UchPl.n_sem=(@year-Grup.nYear_post)*2-@sem)
	and sv_disc.ik_disc=[discpln].iK_disc
--¬»ƒ «јЌя“»… - Ё «јћ≈Ќ  и практики
	AND Content_UchPl.ik_vid_zanyat in (Select ik_vid_zanyat From vid_zaniat Where ikTypeZanyat in (SELECT ikTypeZanyat FROM dbo.TypeZanyat WHERE bitOtchetnost = 1 AND bitExam = 1))	--практики тоже учитываем
--фильтруем те дисциплины, по которым нет ведомостей
	AND Content_UchPl.ik_upContent = Vedomost.ik_upContent AND Grup.Ik_grup=Vedomost.Ik_grup AND  lPriznak_napr=0
	AND sv_disc.IK_grp_disc=grp_disc.IK_grp_disc 
	and [MaxUspev].[ik_upContent]=Content_UchPl.[ik_upContent]
	and [MaxUspev].Ik_zach=StudGrup.Ik_zach
	 and StudGrup.Ik_zach = Zach.Ik_zach 
	and Zach.nCode = Person.nCode 
	and [MaxUspev].[Dd_exam]>@SemDate
order by Grup.Ik_grup, Person.Clastname,[cName_disc]



/*
	
сейчас у мен€ используетс€ такой скрипт:

USE UGTU
SELECT
Person.nCode, ЧPerson.PersonGUID, Ч Zach.Nn_zach,
Uspev.Cosenca, discpln.cName_disc, discpln.cShortName,
vid_zaniat.cshort_vid_zanyat, UspevKPTheme.KPTheme, Vedomost.Dd_exam,
Person.Clastname, Person.Cfirstname, Person.Cotch,
Uspev.i_balls, Grup.Cname_grup, Content_UchPl.n_sem,
Vedomost.UserName, Vedomost.lPriznak_napr

FROM Uspev INNER JOIN
Zach ON Uspev.Ik_zach = Zach.Ik_zach INNER JOIN
Person ON Zach.nCode = Person.nCode INNER JOIN
Vedomost ON Uspev.Ik_ved = Vedomost.Ik_ved INNER JOIN
Content_UchPl ON Content_UchPl.ik_upContent = Vedomost.ik_upContent INNER JOIN
sv_disc ON sv_disc.ik_disc_uch_plan = Content_UchPl.ik_disc_uch_plan INNER JOIN
discpln ON discpln.iK_disc = sv_disc.ik_disc INNER JOIN
--Vid_exam ON Vedomost.Ik_vid_exam = Vid_exam.Ik_vid_exam INNER JOIN
vid_zaniat ON Content_UchPl.ik_vid_zanyat = vid_zaniat.iK_vid_zanyat INNER JOIN
Grup ON Vedomost.Ik_grup = Grup.Ik_grup

left JOIN UspevDocument ON Uspev.Ik_zach = UspevDocument.ik_zach AND Vedomost.ik_upContent=UspevDocument.ik_upContent
left JOIN UspevKPTheme ON UspevDocument.idUspevDocs = UspevKPTheme.idUspevDocs
WHERE Vedomost.Dd_exam > '09.09.2015'
and Uspev.Cosenca > 2
Order by (Person.Clastname)








*/