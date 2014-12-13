Select t_zayav.cName_zaved, t_zayav.n_zayav, t_zach.n_zach from
(select distinct COUNT(distinct Person.nCode) n_zayav, cName_zaved, Student.Ik_zaved
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,ABIT_Vstup_exam,
	 ABIT_VidSdachi,grazd,Form_ed,Kat_zach,TypeKatZach, Zaved_stud
where ABIT_postup.nCode = dbo.Person.nCode 
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Vstup_exam.ik_sdach = ABIT_VidSdachi.ik_sdach
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Person.Ik_grazd = grazd.ik_grazd
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and dbo.Student.nCode = ABIT_postup.nCode
and NNyear=2013
and Zaved_stud.ik_zaved = Student.Ik_zaved
AND Zaved_stud.Ik_gorod IN (select Ik_gorod from Gorod where Ik_raion in (35, 45))
group by cName_zaved, Student.Ik_zaved) t_zayav
left join
(select distinct COUNT(distinct Person.nCode) n_zach, cName_zaved, Student.Ik_zaved
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,ABIT_Vstup_exam,
	 ABIT_VidSdachi,grazd,Form_ed,Kat_zach,TypeKatZach, Zaved_stud
where ABIT_postup.nCode = dbo.Person.nCode 
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
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
and NNyear=2013
and Zaved_stud.ik_zaved = Student.Ik_zaved
AND Zaved_stud.Ik_gorod IN (select Ik_gorod from Gorod where Ik_raion in (35, 45))
group by cName_zaved, Student.Ik_zaved) t_zach on t_zach.Ik_zaved = t_zayav.Ik_zaved
order by t_zayav.cName_zaved