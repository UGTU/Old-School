  -- проверка приказов этапах зачисления  -------------------------------------------------
 select * from [UGTU].[dbo].[Abit_Campaign_Content]
  where ik_prikaz_zach = 18721

 select * from [Abit_Campaign_Content] where id_direction = 3 and ID_Campaign='UGTU2015'

 -------------------------------------------------------------------------------------------

--вставка новых абитуриентов
insert into Export_FB_journal([Is_actual], [nCode], [Registration_Date], [NNYear])
select 0,ABIT_postup.nCode, ABIT_postup.dd_pod_zayav, 2015 
from ABIT_postup
where NNrecord in (select NNrecord from ABIT_Diapazon_spec_fac
				 where NNyear=2015)
and nCode not in (select nCode from Export_FB_journal)


select * from [dbo].[Export_FB_journal] where nnyear = 2015
and ((Is_actual = 0)or(Is_actual is null))
order by [Import_result]

--те, кто прошли с ошибками--------------------------------------------------------------------------------------------------------------------------
select Person.nCode,Person.Clastname, Person.Cfirstname,  [Import_result], prikaz_result, Cshort_name_fac, Cshort_spec, cName_direction, Cname_form_ed, CType_kat
from [dbo].[Export_FB_journal] inner join Person on Person.nCode = [dbo].[Export_FB_journal].nCode
left join (select Fac.Cshort_name_fac, EducationBranch.Cshort_spec, ABIT_postup.nCode, Direction.cName_direction,
			Form_ed.Cname_form_ed, TypeKatZach.CType_kat
           from ABIT_postup, ABIT_Diapazon_spec_fac, Relation_spec_fac, Fac, EducationBranch, Kat_zach, TypeKatZach, Direction, Form_ed
		   where ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
		   and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
		   and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
		   and Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
		   and EducationBranch.ik_direction = Direction.ik_direction
		   and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
		   and Relation_spec_fac.ik_fac = fac.Ik_fac
		   and ABIT_postup.ik_zach = 6
		   and Relation_spec_fac.ik_spec = EducationBranch.ik_spec) spec on spec.nCode = Person.nCode
where nnyear = 2015
and ((is_actual = 0)or(is_actual is null))
--order by  Person.Clastname, Person.Cfirstname
--order by cName_direction,CType_kat
order by prikaz_result
-------------------------------------------------------------------------------------------------------------------------------------------------------

update [dbo].[Export_FB_journal] set Is_actual = 1, prikaz_result = 'In Prikaz', ErrorCode = 0
where nnyear = 2015 and ErrorCode = 3020

update [dbo].[Export_FB_journal] set prikaz_result = 'Результаты ЕГЭ не подтверждены'
where nnyear = 2015 and ErrorCode = 1

update [dbo].[Export_FB_journal] set [Import_result] = 'Is exported' where [Import_result] = 'В приказе'

select count(ABIT_postup.NN_abit) kk,  ABIT_postup.nCode
from ABIT_postup
where ik_zach = 6
and NNrecord in (select NNrecord from ABIT_Diapazon_spec_fac where NNyear=2015)
group by ABIT_postup.nCode
order by kk

select * from person where nCode in (114999,114928)

select * from ABIT_postup where nCode = 115524

--всего зачисленных----------------------------------------------------------------------------------
select count(ABIT_postup.NN_abit) from ABIT_postup
where ik_zach = 6
and NNrecord in (select NNrecord from ABIT_Diapazon_spec_fac
				 where NNyear=2015)


--платных магистров----------------------------------------------------------------------------------
select count(ABIT_postup.NN_abit) from ABIT_postup
where ik_zach = 6
and NNrecord in (select NNrecord from ABIT_Diapazon_spec_fac, Relation_spec_fac, Fac, EducationBranch 
				 where NNyear=2015
				 and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
				 and Relation_spec_fac.ik_fac = fac.Ik_fac
				 and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
				 and EducationBranch.ik_direction = 3)
and ik_kat_zach in (select ik_kat_zach from Kat_zach
					where Kat_zach.ik_type_kat = 3)

--бюджетных магистров--------------------------------------------------------------------------------
select count(ABIT_postup.NN_abit) from ABIT_postup
where ik_zach = 6
and NNrecord in (select NNrecord from ABIT_Diapazon_spec_fac, Relation_spec_fac, Fac, EducationBranch 
				 where NNyear=2015
				 and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
				 and Relation_spec_fac.ik_fac = fac.Ik_fac
				 and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
				 and EducationBranch.ik_direction = 3)
and ik_kat_zach in (select ik_kat_zach from Kat_zach
					where Kat_zach.ik_type_kat = 1)

--платных магистров----------------------------------------------------------------------------------
select count(ABIT_postup.NN_abit) from ABIT_postup
where ik_zach = 6
and NNrecord in (select NNrecord from ABIT_Diapazon_spec_fac, Relation_spec_fac, Fac, EducationBranch 
				 where NNyear=2015
				 and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
				 and Relation_spec_fac.ik_fac = fac.Ik_fac
				 and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
				 and EducationBranch.ik_direction = 3)
and ik_kat_zach in (select ik_kat_zach from Kat_zach
					where Kat_zach.ik_type_kat = 3)

--бюджетных СПО--------------------------------------------------------------------------------
select count(ABIT_postup.NN_abit) from ABIT_postup
where ik_zach = 6
and NNrecord in (select NNrecord from ABIT_Diapazon_spec_fac, Relation_spec_fac, Fac, EducationBranch 
				 where NNyear=2015
				 and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
				 and Relation_spec_fac.ik_fac = fac.Ik_fac
				 and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
				 and EducationBranch.ik_direction = 5)
and ik_kat_zach in (select ik_kat_zach from Kat_zach
					where Kat_zach.ik_type_kat = 1)

--платных СПО--------------------------------------------------------------------------------
select count(ABIT_postup.NN_abit) from ABIT_postup
where ik_zach = 6
and NNrecord in (select NNrecord from ABIT_Diapazon_spec_fac, Relation_spec_fac, Fac, EducationBranch 
				 where NNyear=2015
				 and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
				 and Relation_spec_fac.ik_fac = fac.Ik_fac
				 and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
				 and EducationBranch.ik_direction = 5)
and ik_kat_zach in (select ik_kat_zach from Kat_zach
					where Kat_zach.ik_type_kat = 3)
				 




select Fac.Cshort_name_fac, EducationBranch.Cshort_spec, ABIT_postup.nCode, Direction.cName_direction, 
			Form_ed.Cname_form_ed, TypeKatZach.CType_kat,
			ABIT_Diapazon_spec_fac.NNrecord, Relation_spec_fac.ik_spec_fac, Relation_spec_fac.ik_fac,Relation_spec_fac.ik_spec 
           from ABIT_postup, ABIT_Diapazon_spec_fac, Relation_spec_fac, Fac, EducationBranch, Kat_zach, TypeKatZach, Direction, Form_ed
		   where ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
		   and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
		   and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
		   and Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
		   and EducationBranch.ik_direction = Direction.ik_direction
		   and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
		   and Relation_spec_fac.ik_fac = fac.Ik_fac
		   and nCode = 115524
		   and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
		   and ABIT_postup.ik_zach = 6 

select * from ABIT_postup where nCode = 115524