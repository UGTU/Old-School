--абитуриенты
select age, count(nCode) from
(select distinct year(GetDate()) - year(Person.Dd_birth)-1 as age, Person.nCode, year(Person.Dd_birth) dbir
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,ABIT_Vstup_exam,
	 ABIT_VidSdachi,grazd,Form_ed,Kat_zach,TypeKatZach
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Vstup_exam.ik_sdach = ABIT_VidSdachi.ik_sdach
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Person.Ik_grazd = grazd.ik_grazd
and Relation_spec_fac.ik_kat_zaved = 4 --ВПО
and Fac.Ik_fac = 6
--and Kat_zach.ik_type_kat = 3 --контрактники
and Person.lSex = 0
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and dbo.Student.nCode = ABIT_postup.nCode
and NNyear=2012) vozr
group by age

--студенты
select age, count(nCode) from
(select distinct year(GetDate()) - year(Person.Dd_birth)-1 as age, Person.nCode, year(Person.Dd_birth) dbir
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
inner join Kat_zach on StudGrup.ik_kat_zach = Kat_zach.Ik_kat_zach
where  StudGrup.Ik_prikazOtch is null --не отчислен из группы
and (year(Grup.DateExit)>year(GETDATE()))
and Fac.Ik_fac = 6
--and Kat_zach.ik_type_kat = 3 --контрактники
and Person.lSex = 0
and Grup.nYear_post<>2012
) vozr
group by age
