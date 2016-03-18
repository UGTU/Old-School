--select * from [PFDU_GetStudCounts](getDate())

alter FUNCTION [dbo].[PFDU_GetStudCounts](@date date)
RETURNS @Result TABLE
   (
      Code			int,
	  NameValue		varchar(500),
	  StudCount		numeric(8,2)
   )
AS
BEGIN
  INSERT INTO @Result
  select 1, 'Общая численность студентов, обучающихся по программам бакалавриата, специалитета, магистратуры', count(Ik_studGrup)
  from StudGrup, Grup, Relation_spec_fac, EducationBranch
  where StudGrup.Ik_grup = Grup.Ik_grup
    and Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
	and EducationBranch.ik_spec = Relation_spec_fac.ik_spec
    and Grup.DateExit>@date
    and ((StudGrup.Ik_prikazOtch is null)or(StudGrup.Ik_prikazOtch in (select Ik_prikazOtch from Prikaz where [Dd_prikaz]>@date)))
	and ik_direction in (1,2,3,9,10)
  
  INSERT INTO @Result
  select 2, 'в том числе: по очной форме обучения', count(Ik_studGrup)
  from StudGrup, Grup, Relation_spec_fac, EducationBranch
  where StudGrup.Ik_grup = Grup.Ik_grup
    and Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
	and EducationBranch.ik_spec = Relation_spec_fac.ik_spec
    and Grup.DateExit>@date
    and ((StudGrup.Ik_prikazOtch is null)or(StudGrup.Ik_prikazOtch in (select Ik_prikazOtch from Prikaz where [Dd_prikaz]>@date)))
	and ik_direction in (1,2,3,9,10)
	and Ik_form_ed = 1

  INSERT INTO @Result
  select 3, 'в том числе: по очно-заочной (вечерней) форме обучения', count(Ik_studGrup)
  from StudGrup, Grup, Relation_spec_fac, EducationBranch
  where StudGrup.Ik_grup = Grup.Ik_grup
    and Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
	and EducationBranch.ik_spec = Relation_spec_fac.ik_spec
    and Grup.DateExit>@date
    and ((StudGrup.Ik_prikazOtch is null)or(StudGrup.Ik_prikazOtch in (select Ik_prikazOtch from Prikaz where [Dd_prikaz]>@date)))
	and ik_direction in (1,2,3,9,10)
	and Ik_form_ed = 7

  INSERT INTO @Result
  select 4, 'в том числе: по заочной форме обучения', count(Ik_studGrup)
  from StudGrup, Grup, Relation_spec_fac, EducationBranch
  where StudGrup.Ik_grup = Grup.Ik_grup
    and Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
	and EducationBranch.ik_spec = Relation_spec_fac.ik_spec
    and Grup.DateExit>@date
    and ((StudGrup.Ik_prikazOtch is null)or(StudGrup.Ik_prikazOtch in (select Ik_prikazOtch from Prikaz where [Dd_prikaz]>@date)))
	and ik_direction in (1,2,3,9,10)
	and Ik_form_ed in (2, 6)

  INSERT INTO @Result
  select 6, 'Общая численность обучающихся по программам среднего профессионального образования', count(Ik_studGrup)
  from StudGrup, Grup, Relation_spec_fac, EducationBranch
  where StudGrup.Ik_grup = Grup.Ik_grup
    and Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
	and EducationBranch.ik_spec = Relation_spec_fac.ik_spec
    and Grup.DateExit>@date
    and ((StudGrup.Ik_prikazOtch is null)or(StudGrup.Ik_prikazOtch in (select Ik_prikazOtch from Prikaz where [Dd_prikaz]>@date)))
	and ik_direction=5

  INSERT INTO @Result
  select 7, 'Общая численность иностранных студентов, обучающихся по программам бакалавриата, специалитета, магистратуры', count(Ik_studGrup)
  from StudGrup, Grup, Relation_spec_fac, EducationBranch, zach, Person
  where StudGrup.Ik_grup = Grup.Ik_grup
    and Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
	and EducationBranch.ik_spec = Relation_spec_fac.ik_spec
	and zach.Ik_zach = StudGrup.Ik_zach
	and zach.nCode  = Person.nCode
    and Grup.DateExit>@date
    and ((StudGrup.Ik_prikazOtch is null)or(StudGrup.Ik_prikazOtch in (select Ik_prikazOtch from Prikaz where [Dd_prikaz]>@date)))
	and ik_direction in (1,2,3,9,10)
	and [Ik_grazd] <> 2

  INSERT INTO @Result
  select 8, 'Средний балл ЕГЭ студентов, принятых на обучение по программам бакалавриата и специалитета, по всем формам обучения', 
  cast(sum(cosenka) as numeric(18,2))/cast(count(id) as numeric(18,2))
  from ABIT_postup, ABIT_Vstup_exam, ABIT_Diapazon_Disc, ABIT_Diapazon_spec_fac, Relation_spec_fac, EducationBranch
  where ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
    and ABIT_postup.NNrecord = ABIT_Diapazon_Disc.NNrecord
    and ABIT_Diapazon_Disc.ik_disc = ABIT_Vstup_exam.ik_disc
	and ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
    and ik_sdach in (5,8) --ЕГЭ
    and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
    and cosenka is not NULL
	and ik_direction in (1,2,9,10)

RETURN 
  END

GO