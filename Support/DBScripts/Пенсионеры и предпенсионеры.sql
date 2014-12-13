---------------------------------------------Текущие студенты-------------------------------------------------------------------------------------------------------
--женщины с 49
Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec, cast((year(GETDATE())-Grup.nYear_post+1) as varchar(2)) + ' ' + 'курс' as Course,
				 Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth, Person.ctelefon,Person.cSotTel
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  (StudGrup.Ik_prikazOtch is null) --не отчислен из группы
and (year(Grup.DateExit)>year(GETDATE()))
and year(GETDATE())-year(Person.Dd_birth)>=49
and Person.lSex = 0
order by Dd_birth

--мужчины с 54
Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec, cast((year(GETDATE())-Grup.nYear_post+1) as varchar(2)) + ' ' + 'курс' as Course,
				 Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth, Person.ctelefon,Person.cSotTel
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  (StudGrup.Ik_prikazOtch is null) --не отчислен из группы
and (year(Grup.DateExit)>year(GETDATE()))
and year(GETDATE())-year(Person.Dd_birth)>=54
and Person.lSex = 1
order by Dd_birth
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--женщины с 49
Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec, cast((year(GETDATE())-Grup.nYear_post+1) as varchar(2)) + ' ' + 'курс' as Course,
				 Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth, Person.ctelefon,Person.cSotTel
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  (StudGrup.Ik_prikazOtch is null) --не отчислен из группы
and (year(Grup.DateExit)=2013)
and year(GETDATE())-year(Person.Dd_birth)>=49
and Person.lSex = 0
order by Dd_birth

--мужчины с 54
Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec, cast((year(GETDATE())-Grup.nYear_post+1) as varchar(2)) + ' ' + 'курс' as Course,
				 Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth, Person.ctelefon,Person.cSotTel
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  (StudGrup.Ik_prikazOtch is null) --не отчислен из группы
and (year(Grup.DateExit)=2013)
and year(GETDATE())-year(Person.Dd_birth)>=54
and Person.lSex = 1
order by Dd_birth
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Все пенсионники для проверки
--женщины с 49
Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec, cast((year(GETDATE())-Grup.nYear_post+1) as varchar(2)) + ' ' + 'курс' as Course,
				 Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth, Person.ctelefon,Person.cSotTel
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  year(GETDATE())-year(Person.Dd_birth)>=49
and Person.lSex = 0
order by Dd_birth

--мужчины с 54
Select distinct Person.nCode,Fac.Cname_fac,Spec_stud.Cname_spec, cast((year(GETDATE())-Grup.nYear_post+1) as varchar(2)) + ' ' + 'курс' as Course,
				 Cshort_name_fac,Grup.Cname_grup,Clastname +' '+Cfirstname +' '+ Cotch fio, cast(Person.Dd_birth AS DATE) Dd_birth, Person.ctelefon,Person.cSotTel
from Person inner join Zach on Zach.nCode = Person.nCode
inner join StudGrup on Zach.Ik_zach = StudGrup.Ik_zach
inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
inner join dbo.Relation_spec_fac on Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
where  year(GETDATE())-year(Person.Dd_birth)>=54
and Person.lSex = 1
order by Dd_birth


---абитуриенты без группы
Select distinct Fac.Cname_fac,Spec_stud.Cname_spec, Clastname + ' ' + Cfirstname + ' ' + Cotch FIO,
	   dbo.Person.nCode,grazd.Ik_grazd,c_grazd,NNyear,cshort_sdach,Cname_form_ed,CType_kat, Person.ctelefon,Person.cSotTel
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,ABIT_Vstup_exam,
	 ABIT_VidSdachi,grazd,Form_ed,Kat_zach,TypeKatZach
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Vstup_exam.ik_sdach = ABIT_VidSdachi.ik_sdach
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Person.Ik_grazd = grazd.ik_grazd
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and dbo.Student.nCode = ABIT_postup.nCode
and ABIT_postup.nCode not in (select nCode from Zach)
and year(GETDATE())-year(Person.Dd_birth)>=54
and Person.lSex = 1
and NNyear=2013

Select distinct Fac.Cname_fac,Spec_stud.Cname_spec, Clastname + ' ' + Cfirstname + ' ' + Cotch FIO,
	   dbo.Person.nCode,grazd.Ik_grazd,c_grazd,NNyear,cshort_sdach,Cname_form_ed,CType_kat, Person.ctelefon,Person.cSotTel
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,ABIT_Vstup_exam,
	 ABIT_VidSdachi,grazd,Form_ed,Kat_zach,TypeKatZach
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Vstup_exam.ik_sdach = ABIT_VidSdachi.ik_sdach
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Person.Ik_grazd = grazd.ik_grazd
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and dbo.Student.nCode = ABIT_postup.nCode
and ABIT_postup.nCode not in (select nCode from Zach)
and year(GETDATE())-year(Person.Dd_birth)>=54
and Person.lSex = 1
and NNyear=2013