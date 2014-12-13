select distinct Fac.Cname_fac,Spec_stud.Cname_spec, Clastname + ' ' + Cfirstname + ' ' + Cotch, cName_zaved
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
--and Relation_spec_fac.ik_kat_zaved = 4 --ВПО
and dbo.Student.nCode = ABIT_postup.nCode
and NNyear=2013
--and Relation_spec_fac.Ik_form_ed = 1
and Zaved_stud.ik_zaved = Student.Ik_zaved
and Student.Ik_zaved in (1993,2288,3095,2811,2721,3204)		--1993, 2288, 2811, 2952, 44, 1684, 2715, 2707, 2708
order by Fac.Cname_fac, Spec_stud.Cname_spec