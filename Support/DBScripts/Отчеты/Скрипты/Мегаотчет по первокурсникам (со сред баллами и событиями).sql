--информация по каждому зачисленному
select distinct	Fac.Cname_fac,
		EducationBranch.Cname_spec,
		Direction.cName_direction,
		Form_ed.Cname_form_ed,
		Kat_zach.Cname_kat_zach,
		Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') FIO,
		1,
		ISNULL([1SrBall].[SrBall],0) [1SrBall],
		2,
		ISNULL([2SrBall].[SrBall],0) [2SrBall],
		AllBalls,
	    VstupExamBalls,
		a_balls.EGEBalls,
		BonusBalls,


		ISNULL(NextEducBranch.Cname_spec,'нет') as Cname_specPer,
		IIF([StudGrupAcadem].ik_studGrupNew >0, 'Да','Нет') akadem,		
		ISNULL(PricinaOtch.[Cname_pric],'нет') as PricinaOtch,



		--ISNULL(Otlich,'') Otlich,
		--ISNULL(Soch,'') Soch,
		--ISNULL(GTO,'') GTO,
		--Person.nCode,
		ISNULL(medal_abit.cmedal,'нет') medal_abit,
		Strana.c_grazd,
		ISNULL(ISNULL(ISNULL(pr.Cregion,vrem.Cregion),fact.Cregion),'') Cregion,
		ISNULL(docs.Cd_kem_vidan,'')
		/*
		Институт\ филиал
- специальность\ направление
-квалификация (бакалавриат, прикладной бакалавриат, специалитет, магистратура, СПО)
- форма обучения (очно, заочно, очно-заочно)
- категория поступления(общий конкурс, целевик, особое право, преимущественное право, бюджет, контракт)
- фио
- всего баллов (с учетом баллов, начисленных за индивидуальные достижения)
- баллы (экзамены вуза и егэ)
- баллы только егэ
- баллы, начисленные за индивидуальные достижения -аттестат с отл.
- сочинение (да или нет)
-значок гто (да или нет)
-гражданство (страна)
-регион
-название учрежедения, которое выдало документ об образовании
*/
	from dbo.Person 
	inner join ABIT_postup on ABIT_postup.nCode = dbo.Person.nCode
	inner join Kat_zach on ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	inner join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
	inner join Fac on fac.Ik_fac = Relation_spec_fac.ik_fac
	inner join Form_ed on Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
	inner join Direction on Direction.ik_direction = EducationBranch.ik_direction
	inner join TypeKatZach on Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
	inner join Abit_GetBalls(year(DATEADD(yy,-1,GETDATE()))) a_balls on a_balls.nn_abit = ABIT_postup.nn_abit




--события
inner join dbo.Zach ON ABIT_postup.nCode=Zach.nCode
inner join (SELECT ik_zach, MIN([Ik_studGrup]) [Ik_studGrup] FROM  [dbo].[StudGrup]
	GROUP BY ik_zach) [MinStudGrup] ON Zach.[Ik_zach]=[MinStudGrup].[Ik_zach]
inner join [dbo].[StudGrup] [FirstStudGrup] 
	ON [MinStudGrup].[Ik_zach]=[FirstStudGrup].[Ik_zach] AND [MinStudGrup].[Ik_studGrup]=[FirstStudGrup].[Ik_studGrup]
inner join dbo.Grup FirstGrup ON  [FirstStudGrup].ik_grup = FirstGrup.Ik_grup
left join (SELECT * FROM [dbo].[Pricina] WHERE [Pricina].ikTypePric = 2) PricinaOtch ON [FirstStudGrup].[ik_pricOtch]=PricinaOtch.[ik_pric]

--перевод на др специальность
left join 
	dbo.StudGrup NextStudGrup ON [FirstStudGrup].Ik_zach=NextStudGrup.Ik_zach AND [FirstStudGrup].Ik_grup<>NextStudGrup.Ik_grup
left join
	dbo.Grup NextGrup ON  NextStudGrup.ik_grup = NextGrup.Ik_grup AND NextGrup.ik_spec_fac<>FirstGrup.ik_spec_fac
left join Relation_spec_fac NextRelSpecFac on NextGrup.ik_spec_fac = NextRelSpecFac.ik_spec_fac
left join EducationBranch NextEducBranch on NextRelSpecFac.ik_spec = NextEducBranch.ik_spec


left join [dbo].[StudGrupAcadem] ON [FirstStudGrup].[ik_studGrup]=[StudGrupAcadem].[ik_studGrup]

left join dbo.Student stud ON Person.nCode=Stud.nCode
left join medal_abit ON Stud.ik_medal=medal_abit.ik_medal








	--успеваемость

	left join 
	(SELECT [Ik_zach], [n_sem], AVG(CONVERT(FLOAT,[Cosenca])) SrBall
		FROM [dbo].[MaxUspev]
		WHERE [n_sem]=1 AND [Cosenca]>=2
		GROUP BY [Ik_zach], [n_sem]
	)[1SrBall] ON Zach.[Ik_zach]=[1SrBall].[Ik_zach]
	left join
	(SELECT [Ik_zach], [n_sem], AVG(CONVERT(FLOAT,[Cosenca])) SrBall
		FROM [dbo].[MaxUspev]
		WHERE [n_sem]=2 AND [Cosenca]>=2
		GROUP BY [Ik_zach], [n_sem]
	)[2SrBall] ON Zach.[Ik_zach]=[2SrBall].[Ik_zach]




	left join (select nCode, 'Да' as Otlich 
			  from doc_stud, Abit_Bonuses, documents 
			  where Abit_Bonuses.ik_doc = doc_stud.ik_doc 
			  and documents.ik_vid_doc = doc_stud.Ik_vid_doc
			  and documents.IsEducational = 1
			  ) att_otl on att_otl.nCode = ABIT_postup.nCode
	left join (select nCode, 'Да' as Soch 
			  from doc_stud, Abit_Bonuses
			  where Abit_Bonuses.ik_doc = doc_stud.ik_doc 
			  and doc_stud.Ik_vid_doc = 57
			  ) Sochin on Sochin.nCode = ABIT_postup.nCode
	left join (select nCode, 'Да' as GTO 
			  from doc_stud, Abit_Bonuses 
			  where Abit_Bonuses.ik_doc = doc_stud.ik_doc 
			  and doc_stud.Ik_vid_doc = 56
			  and Abit_Bonuses.balls = 2
			  ) Znac_GTO on Znac_GTO.nCode = ABIT_postup.nCode

			  left join dbo.Strana ON Person.Ik_grazd=Strana.[Ik_strana]

left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on ABIT_postup.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fact
on ABIT_postup.nCode = fact.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem

on ABIT_postup.nCode = vrem.nCode
left join (select Doc_stud.*,documents.cvid_doc from Doc_stud, documents where documents.Ik_vid_doc = Doc_stud.Ik_vid_doc and [IsEducational] = 1) docs
on ABIT_postup.nCode = docs.nCode

	where ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)	--зачисленные
	  --and TypeKatZach.ik_type_kat in (1,2,12)										--не контракт
	  --and EducationBranch.ik_direction in (1,2,9,10)								-- бакалавры/специалисты	
	  and NNyear=year(DATEADD(yy,-1,GETDATE()))
order by Form_ed.Cname_form_ed desc,Fac.Cname_fac,
		EducationBranch.Cname_spec,
		Direction.cName_direction,
		Kat_zach.Cname_kat_zach,
		Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') 

--
/*select sum(AllBalls), count(nCode)
from
	(select	EducationBranch.Cname_spec,
		Form_ed.Cname_form_ed,
		Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') FIO,
		a_balls.EGEBalls,
		a_balls.AllBalls,
		VstupExamBalls,
		Otlich,
		Soch,
		GTO,
		Person.nCode
	from dbo.Person 
	inner join ABIT_postup on ABIT_postup.nCode = dbo.Person.nCode
	inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	inner join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
	inner join Form_ed on Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
	inner join Kat_zach on ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	inner join TypeKatZach on Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
	inner join Abit_GetBalls(year(GETDATE())) a_balls on a_balls.nn_abit = ABIT_postup.nn_abit
	left join (select nCode, 'Да' as Otlich 
			  from doc_stud, Abit_Bonuses, documents 
			  where Abit_Bonuses.ik_doc = doc_stud.ik_doc 
			  and documents.ik_vid_doc = doc_stud.Ik_vid_doc
			  and documents.IsEducational = 1
			  ) att_otl on att_otl.nCode = ABIT_postup.nCode
	left join (select nCode, 'Да' as Soch 
			  from doc_stud, Abit_Bonuses
			  where Abit_Bonuses.ik_doc = doc_stud.ik_doc 
			  and doc_stud.Ik_vid_doc = 57
			  ) Sochin on Sochin.nCode = ABIT_postup.nCode
	left join (select nCode, 'Да' as GTO 
			  from doc_stud, Abit_Bonuses 
			  where Abit_Bonuses.ik_doc = doc_stud.ik_doc 
			  and doc_stud.Ik_vid_doc = 56
			  and Abit_Bonuses.balls = 2
			  ) Znac_GTO on Znac_GTO.nCode = ABIT_postup.nCode




	where ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)	--зачисленные
	  --and TypeKatZach.ik_type_kat in (1,2,12)										--не контракт
	  --and EducationBranch.ik_direction in (1,2,9,10)								-- бакалавры/специалисты	
	  and NNyear=year(GETDATE())) stat
where Soch = 'Да' */


--select year(DATEADD(yy,-1,GETDATE()))