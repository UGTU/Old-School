USE [UGTU]
GO

/****** Object:  View [TeachersPlan].[НагрузкаТ]    Script Date: 19.10.2016 11:54:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















CREATE view [TeachersPlan].[НагрузкаТ]
(ГОД,
ПланФакт,
idFactStaffHistory,
IDImportCurricularLoad,
IDCurricularLoad,
IDDisciplineLoad,
DepartmentGUID,
[КодКафедры],
	[КодПреподавателя],
	[КодГруппы],
	[КодТипаПлана],
	[КодВедомости],
	[УчебныйГод],
	[НомерСтроки],
	[УчебныйПлан],
	[Факультет],
	[Курс],
	[Семестр],
	[Сессия],
	[Блок],
	[Дисциплина],
	[Группа],
	[Студентов],
	[Недель],
	[ВидЗанятий],
	[ПланЧасов],
	[ЧасовФакт],
	[Часов],
	[ВидКонтроля],
	[КСР],
	[КонтрольныхРабот],
	[Преподаватель],
	[НомерПотока],
	[ИндикаторПотока],
	[Аудитории],
	[ДополнительноЧасовНаСтудента],
	[ДополнительноЧасовНаГруппу],
	[НомерСтрокиВПлане],
	[ДатаНачала],
	[ДатаОкончания],
	[Новая],
	[НомерПары],
	[НомерПреподавателя],
	[Идентификатор],
	[ДляУдаления],
	[ФИОПреподавателя],
	[КодДисциплины],
	[НагрузкаАуд],
	[НагрузкаДр],
	[Бюджет],
	[Внебюджет],
	[Иностранцы],
	[ДоляВнебюдж],
	[ДоляИностр],
	[ООСНИН],
	[ИДСтроки],
	[НомерПодстроки],
	[КодПлана],
	[КодДолжности],
	[Реферат],
	[Эссе],
	[РГР],
	[Контрольных],
	[Экзамен],
	[Зачёт],
	[ЗачётСОценкой],
	[Специальность],
	[КодВидаСпецРаботы],
	[СтатусСтроки],
	[ДатаИзменения],
	[ВносившийПользователь],
	[ПроизведённыеДействия],
	[НормативНаСтуд],
	[НормативНаСтудВНед],
	[НормативНаПодгр],
	[НормативНаПодгрВНед],
	[Выборная],
	[Подготовка],
	[ИндивидуальныеКонсультации],
	[Дней],
	[ОписаниеЧасов],
	[СамРабота],
	[ЧасовНИР] ,
	[КодУровняОбразования] ,
	[КодФормыОбучения] ,
	[ОценкаПоРейтингу] ,
	[ЧасовНаЭкзамены] ,
	[ОписаниеВнебюджет] ,
	[ПреподавательДолжность] ,
	[ПреподавательСтепень],
	[ЭлектронныеЧасы],
	[НормирующийКоэффициент])

	AS 
	SELECT distinct
	[TeachersPlan].[IndividualPlans].[Period],
	IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,'П','Ф') as ПланФакт,
	max_Curricular.idFactStaffHistory,
	max_Curricular.IDImportCurricularLoad,
	CurricularLoad.IDCurricularLoad,
	DisciplineLoad.IDDisciplineLoad,
	KafTeachers.DepartmentGUID,
	Import.KafTeachers.DepartmentGUID as [КодКафедры],
	temp.КодПреподавателя as [КодПреподавателя],
	null as [КодГруппы],
	null as [КодТипаПлана],
	null as[КодВедомости],
	IIF (TeachersPlan.IndividualPlans.StartDate='2015-09-01','2015-2016', '2016-2017') as [УчебныйГод],
	null as [НомерСтроки],
	null as [УчебныйПлан],
	null as [Факультет],
	TeachersPlan.CurricularLoad.Courses, 
	TeachersPlan.CurricularLoad.Semestr,
	null as [Сессия],
	null as [Блок],
	TeachersPlan.CurricularLoad .DisciplineName,
	TeachersPlan.CurricularLoad.Groups,
	TeachersPlan.CurricularLoad.Students,
	TeachersPlan.CurricularLoad.Weeks,
	case TeachersPlan.DisciplineLoad.IDTypeLoad 
	when 1 then 'Лек'
	when 2 then 'Пр'
	when 3 then 'Лаб'
	when 4 then 'ДК1'
	when 5 then 'ДЭк'
	when 6 then 'ДЗа'
	when 7 then 'КРЗ'
	when 8 then 'ТТворч'
	when 9 then 'КР'
	when 10 then 'КП'
	when 11 then 'РукАспир'
	when 12 then 'РукМаг'
	when 13 then 'Учебная практика'
	when 14 then 'Производственная практика'
	when 15 then 'ВКР'
	when 16 then 'Другое'
	when 17 then 'ГАК'
	when 18 then 'РукПр'
	end as [ВидЗанятий],
	[TeachersPlan].[DisciplineLoad].[Quantity],
	[TeachersPlan].[DisciplineLoad].[factQuantity],
IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,[TeachersPlan].[DisciplineLoad].[Quantity],[TeachersPlan].[DisciplineLoad].[factQuantity]) as[Часов],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad=1,'ДЭк',IIF (TeachersPlan.DisciplineLoad.IDTypeLoad= 6,'ДЗа',null)) as[ВидКонтроля],
	null as [КСР],
	null as [КонтрольныхРабот],
	Import.KafTeachers.LastName as [Преподаватель],
	null as [НомерПотока],
	null as [ИндикаторПотока],
	null as [Аудитории],
	null as [ДополнительноЧасовНаСтудента],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad=16,IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,cast([TeachersPlan].[DisciplineLoad].[Quantity] as float), cast([TeachersPlan].[DisciplineLoad].[factQuantity]as float)),null)  as [ДополнительноЧасовНаГруппу],
	null as [НомерСтрокиВПлане],
	null as [ДатаНачала],
	null as [ДатаОкончания],
	null as [Новая],
	null as [НомерПары],
	Import.KafTeachers.EmployeeGuid as [НомерПреподавателя],
	null as [Идентификатор],
	null as [ДляУдаления],
	null as [ФИОПреподавателя],
	TeachersPlan.CurricularLoad.IDCurricularLoad AS [КодДисциплины],	 
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad in (1,2,3,4,5,6,9,10,11,12,15,17),IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,cast([TeachersPlan].[DisciplineLoad].[Quantity] as float), cast([TeachersPlan].[DisciplineLoad].[factQuantity]as float)),null) as [НагрузкаАуд],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad in (7,8,13,14,16,18) ,IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,cast([TeachersPlan].[DisciplineLoad].[Quantity] as float), cast([TeachersPlan].[DisciplineLoad].[factQuantity]as float)),null) as	[НагрузкаДр],
	null as [Бюджет],
	null as [Внебюджет],
	null as [Иностранцы],
	null as [ДоляВнебюдж],
	null as [ДоляИностр],
	null as [ООСНИН],
	null as [ИДСтроки],
	null as [НомерПодстроки],
	null as [КодПлана],
	null as [КодДолжности],
	null as	[Реферат],
	null as [Эссе],
	null as	[РГР],
	null as [Контрольных],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad=1,1,null) as [Экзамен],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad=6,1,null) as [Зачёт],
	null as[ЗачётСОценкой],
	null as [Специальность],
	null as [КодВидаСпецРаботы],
	null as  [СтатусСтроки],
	null as  [ДатаИзменения],
	null as  [ВносившийПользователь],
	null as  [ПроизведённыеДействия],
	null as  [НормативНаСтуд],
	null as  [НормативНаСтудВНед],
	null as  [НормативНаПодгр],
	null as  [НормативНаПодгрВНед],
	null as  [Выборная],
	null as  [Подготовка],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad=4,IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,cast([TeachersPlan].[DisciplineLoad].[Quantity] as float), cast([TeachersPlan].[DisciplineLoad].[factQuantity]as float)),null) as  [ИндивидуальныеКонсультации],
	null as  [Дней],
	null as  [ОписаниеЧасов],
	null as  [СамРабота],
	null as  [ЧасовНИР],
	null as  [КодУровняОбразования],
	null as  [КодФормыОбучения],
	null as  [ОценкаПоРейтингу],
	null as  [ЧасовНаЭкзамены],
	null as  [ОписаниеВнебюджет],
	null as  [ПреподавательДолжность],
	null as  [ПреподавательСтепень],
	null as  [ЭлектронныеЧасы],
	null as  [НормирующийКоэффициент]
	
	FROM 
	Import.KafTeachers 
    inner join 
	  (select distinct [КодПреподавателя], [учебныйгод],[dekanatMMIS].[Import].[Educators].[DepartmentGUID], [dekanatMMIS].[Import].[Educators].[EmployeeGUID]  
	   from [dekanatMMIS].[dbo].[ПреподавателиКафедры] 
	   inner join 	[dekanatMMIS].[Import].[Educators] on [dekanatMMIS].[dbo].[ПреподавателиКафедры].[Код] = [dekanatMMIS].[Import].[Educators].[КодПреподавателяКафедры]
      ) temp on temp.DepartmentGUID = Import.KafTeachers.DepartmentGUID and temp.EmployeeGUID = Import.KafTeachers.EmployeeGUID

	inner join TeachersPlan.IndividualPlans on Import.KafTeachers.idFactStaffHistory =TeachersPlan.IndividualPlans.IdTeacher 
	inner join TeachersPlan.ImportCurricularLoad on TeachersPlan.IndividualPlans.Id = TeachersPlan.ImportCurricularLoad.IDIndividualPlan 
	inner join TeachersPlan.CurricularLoad  on TeachersPlan.ImportCurricularLoad.IDImportCurricularLoad= TeachersPlan.CurricularLoad.IDImportCurricularLoad 
	inner join TeachersPlan.DisciplineLoad ON TeachersPlan.CurricularLoad.IDCurricularLoad=TeachersPlan.DisciplineLoad.IDCurricularLoad 
	inner JOIN TeachersPlan.TypeLoad ON TeachersPlan.DisciplineLoad.IDTypeLoad = TeachersPlan.TypeLoad.IDTypeLoad
	inner join 
	  (select max(TeachersPlan.ImportCurricularLoad.IDImportCurricularLoad) as  IDImportCurricularLoad, (TeachersPlan.IndividualPlans.[Id]) as [Id],
	   [dekanatMMIS].[Import].[Educators].idFactStaffHistory
	   from [dekanatMMIS].[Import].[Educators] 
	  inner join
	   TeachersPlan.IndividualPlans on [dekanatMMIS].[Import].[Educators].idFactStaffHistory = TeachersPlan.IndividualPlans.IdTeacher
			   inner join TeachersPlan.ImportCurricularLoad on TeachersPlan.ImportCurricularLoad.IDIndividualPlan = TeachersPlan.IndividualPlans.Id
			   --inner join [dekanatMMIS].[dbo].[ПреподавателиКафедры] on [dekanatMMIS].[dbo].[ПреподавателиКафедры].[Код] = [dekanatMMIS].[Import].[Educators].[КодПреподавателяКафедры]
			   group by  [dekanatMMIS].[Import].[Educators].idFactStaffHistory, [Id]
			   
			  ) max_Curricular on max_Curricular.idFactStaffHistory = Import.KafTeachers.idFactStaffHistory
			   and max_Curricular.IDImportCurricularLoad = TeachersPlan.ImportCurricularLoad.IDImportCurricularLoad 















GO


