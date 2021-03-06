/****** Script for SelectTopNRows command from SSMS  ******/
--Название документа	Вид документа	Статус документа	Подтверждение утраты	Подтверждение обмена	Уровень образования	Серия документа	Номер документа	Дата выдачи	Регистрационный номер	Код специальности, 
--направления подготовки	Наименование специальности, направления подготовки	Наименование квалификации	Образовательная программа	
--Год поступления	Год окончания	Срок обучения, лет	Фамилия получателя	Имя получателя	Отчество получателя	Дата рождения получателя 	Пол получателя	
--Гражданин иностранного государства	Форма обучения 	Высшее образование, получаемое впервые	Источник финансирования обучения

DECLARE @yearGrad int, @DiplDate DATE
set @yearGrad=2015
set @DiplDate = '27.06.2015'


select diplNumber, COUNT(*) col from
(SELECT distinct --'Диплом', IIF(IsExcellent=0,'Диплом бакалавра','Диплом бакалавра с отличием') , 
--'Оригинал', 'Нет', 'Нет', 'Высшее образование - бакалавриат' [DiplKind], ISNULL([Diplom].DiplSeries,''),
[TREE_student].nCode, ISNULL( [Diplom].DiplNumber,'') diplNumber--,CONVERT(VARCHAR(10),  @DiplDate,104), 



--ISNULL([RegNumber],''),CONVERT(VARCHAR(20),[Spec_stud].[Sh_spec]), [Spec_stud].[Cname_spec], ISNULL([Spec_stud].[Cname_qualif],''), '', YearPost, @yearGrad as YearGrad, [TREE_specialties].YearObuch,
--[Clastname], [Cfirstname], ISNULL([Cotch],''), 
--ISNULL(CONVERT(VARCHAR(10), [Dd_birth], 104),'') [Dd_birth], IIF(lSex=1,'Муж','Жен'),
--ISNULL(IIF(Strana.ik_type_grazd=1,'РФ', IIF(Strana.[bit_SNG]=1, 'ближнее (из стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)', 'дальнее (других иностранных - кроме стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)')),'лица без гражданства')

--, [TREE_specialties].Cname_form_ed, IIF(attest.[Ik_vid_doc] = 9 , 'Нет','Да'), IIF([Kat_zach].ik_type_kat=1, 'Обучение за счет бюджетных ассигнований',IIF([Kat_zach].ik_type_kat=2, 'Целевое обучение','Платное обучение'))



--,[Spec_stud].[Sh_spec]
  FROM [dbo].[StudGrup]
  inner join [dbo].[Kat_zach] on [StudGrup].ik_kat_zach=[Kat_zach].Ik_kat_zach
  inner join [dbo].[TREE_groups] [Grup] ON [StudGrup].Ik_grup=[Grup].Ik_grup
  inner join [dbo].[TREE_specialties] ON [Grup].ik_spec_fac=[TREE_specialties].ik_spec_fac
  inner join [dbo].[Spec_stud] ON [TREE_specialties].ik_spec=[Spec_stud].ik_spec
  inner join [dbo].[TREE_student] ON [StudGrup].Ik_zach=[TREE_student].Ik_zach
  inner join [dbo].[Diplom] ON [StudGrup].Ik_zach=[Diplom].Ik_zach and [Diplom].Cosenca is not null
  inner join (select [Ik_zach], MIN(YEAR([Dd_prikaz]))YearPost FROM [dbo].[StudGrup] inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz] GROUP BY [Ik_zach])YearPostTable
  ON [StudGrup].Ik_zach=YearPostTable.Ik_zach
  left join dbo.Strana on [TREE_student].ik_grazd=Strana.Ik_strana
  left join [dbo].[Direction] on [TREE_specialties].ik_direction=[Direction].ik_direction

  LEFT JOIN 
		(SELECT nCode, MAX(Ik_vid_doc) Ik_vid_doc FROM dbo.Doc_stud WHERE Ik_vid_doc in
				 (SELECT Ik_vid_doc FROM [dbo].[documents] WHERE [IsEducational] =1)
			GROUP BY nCode			
					)attest
		ON attest.nCode=[TREE_student].nCode
 where 
  [Direction].id_type_direction in (1)
  --and lSex=1
  and 
  [StudGrup].[ik_pricOtch]=3
  and [StudGrup].[Ik_prikazOtch] IN
  (select [Ik_prikaz] from [dbo].[Prikaz] where YEAR([Dd_prikaz])=@yearGrad)
  --and IsExcellent=0

  and [Diplom].DiplNumber is not null


  UNION
  SELECT distinct [TREE_student].nCode, ISNULL( [Diplom].DiplNumber,'') diplNumber
  FROM [dbo].[StudGrup]
  inner join [dbo].[Kat_zach] on [StudGrup].ik_kat_zach=[Kat_zach].Ik_kat_zach
  inner join [dbo].[TREE_groups] [Grup] ON [StudGrup].Ik_grup=[Grup].Ik_grup
  inner join [dbo].[TREE_specialties] ON [Grup].ik_spec_fac=[TREE_specialties].ik_spec_fac
  inner join [dbo].[Spec_stud] ON [TREE_specialties].ik_spec=[Spec_stud].ik_spec
  inner join [dbo].[TREE_student] ON [StudGrup].Ik_zach=[TREE_student].Ik_zach
  inner join [dbo].[Diplom] ON [StudGrup].Ik_zach=[Diplom].Ik_zach and [Diplom].Cosenca is not null
  inner join (select [Ik_zach], MIN(YEAR([Dd_prikaz]))YearPost FROM [dbo].[StudGrup] inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz] GROUP BY [Ik_zach])YearPostTable
  ON [StudGrup].Ik_zach=YearPostTable.Ik_zach
  left join dbo.Strana on [TREE_student].ik_grazd=Strana.Ik_strana
  left join [dbo].[Direction] on [TREE_specialties].ik_direction=[Direction].ik_direction

  LEFT JOIN 
		(SELECT nCode, MAX(Ik_vid_doc) Ik_vid_doc FROM dbo.Doc_stud WHERE Ik_vid_doc in
				 (SELECT Ik_vid_doc FROM [dbo].[documents] WHERE [IsEducational] =1)
			GROUP BY nCode			
					)attest
		ON attest.nCode=[TREE_student].nCode
 where 
  [Direction].id_type_direction in (2)
  --and lSex=1
  and 
  [StudGrup].[ik_pricOtch]=3
  and [StudGrup].[Ik_prikazOtch] IN
  (select [Ik_prikaz] from [dbo].[Prikaz] where YEAR([Dd_prikaz])=@yearGrad)
  --and IsExcellent=0

  and [Diplom].DiplNumber is not null

  UNION
  SELECT [TREE_student].nCode, ISNULL( [Diplom].DiplNumber,'') diplNumber
  FROM [dbo].[StudGrup]
  inner join [dbo].[Kat_zach] on [StudGrup].ik_kat_zach=[Kat_zach].Ik_kat_zach
  inner join [dbo].[TREE_groups] [Grup] ON [StudGrup].Ik_grup=[Grup].Ik_grup
  inner join [dbo].[TREE_specialties] ON [Grup].ik_spec_fac=[TREE_specialties].ik_spec_fac
  inner join [dbo].[Spec_stud] ON [TREE_specialties].ik_spec=[Spec_stud].ik_spec
  inner join [dbo].[TREE_student] ON [StudGrup].Ik_zach=[TREE_student].Ik_zach
  inner join [dbo].[Diplom] ON [StudGrup].Ik_zach=[Diplom].Ik_zach and [Diplom].Cosenca is not null
  inner join (select [Ik_zach], MIN(YEAR([Dd_prikaz]))YearPost FROM [dbo].[StudGrup] inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz] GROUP BY [Ik_zach])YearPostTable
  ON [StudGrup].Ik_zach=YearPostTable.Ik_zach
  left join dbo.Strana on [TREE_student].ik_grazd=Strana.Ik_strana
  left join [dbo].[Direction] on [TREE_specialties].ik_direction=[Direction].ik_direction

  LEFT JOIN 
		(SELECT nCode, MAX(Ik_vid_doc) Ik_vid_doc FROM dbo.Doc_stud WHERE Ik_vid_doc in
				 (SELECT Ik_vid_doc FROM [dbo].[documents] WHERE [IsEducational] =1)
			GROUP BY nCode			
					)attest
		ON attest.nCode=[TREE_student].nCode
 where 
  [Direction].id_type_direction in (3)
  --and lSex=1
  and 
  [StudGrup].[ik_pricOtch]=3
  and [StudGrup].[Ik_prikazOtch] IN
  (select [Ik_prikaz] from [dbo].[Prikaz] where YEAR([Dd_prikaz])=@yearGrad)
  --and IsExcellent=0

  and [Diplom].DiplNumber is not null)dipl
  group by DiplNumber
  --having COUNT(*)>1

