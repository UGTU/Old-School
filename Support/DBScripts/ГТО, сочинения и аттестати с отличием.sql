--информация по каждому зачисленному
select	Fac.Cname_fac,
		EducationBranch.Cname_spec,
		Direction.cName_direction,
		Form_ed.Cname_form_ed,
		Kat_zach.Cname_kat_zach,
		Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') FIO,
		AllBalls,
	    VstupExamBalls,
		a_balls.EGEBalls,
		BonusBalls,
		Otlich,
		Soch,
		GTO,
		Person.nCode
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
	  and TypeKatZach.ik_type_kat in (1,2,12)										--не контракт
	  and EducationBranch.ik_direction in (1,2,9,10)								-- бакалавры/специалисты	
	  and NNyear=year(GETDATE())
order by  Clastname,Cfirstname,Cotch

--
select sum(AllBalls), count(nCode)
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
	  and TypeKatZach.ik_type_kat in (1,2,12)										--не контракт
	  and EducationBranch.ik_direction in (1,2,9,10)								-- бакалавры/специалисты	
	  and NNyear=year(GETDATE())) stat
where Soch = 'Да' 