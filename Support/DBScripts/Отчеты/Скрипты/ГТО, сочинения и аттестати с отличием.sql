--информация по каждому зачисленному
select distinct	Fac.Cname_fac,
		EducationBranch.Cname_spec,
		Direction.cName_direction,
		Form_ed.Cname_form_ed,
		Kat_zach.Cname_kat_zach,
		Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') FIO,
		AllBalls,
	    VstupExamBalls,
		a_balls.EGEBalls,
		BonusBalls,
		ISNULL(Otlich,'') Otlich,
		ISNULL(Soch,'') Soch,
		ISNULL(GTO,'') GTO,
		--Person.nCode,
		Strana.c_grazd,
		ISNULL(ISNULL(pr.Cregion,vrem.Cregion),fact.Cregion) Cregion,
		docs.Cd_kem_vidan
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

	where ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)	--зачисленные
	  --and TypeKatZach.ik_type_kat in (1,2,12)										--не контракт
	  --and EducationBranch.ik_direction in (1,2,9,10)								-- бакалавры/специалисты	
	  and NNyear=year(GETDATE())
order by Fac.Cname_fac,
		EducationBranch.Cname_spec,
		Direction.cName_direction,
		Form_ed.Cname_form_ed,
		Kat_zach.Cname_kat_zach,
		Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') 

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
	  --and TypeKatZach.ik_type_kat in (1,2,12)										--не контракт
	  --and EducationBranch.ik_direction in (1,2,9,10)								-- бакалавры/специалисты	
	  and NNyear=year(GETDATE())) stat
where Soch = 'Да' 