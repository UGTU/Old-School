select distinct Fac.Cname_fac,Spec_stud.Cname_spec, CType_kat, COUNT(distinct ABIT_postup.nCode)
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,ABIT_Vstup_exam,
	 ABIT_VidSdachi,grazd,Form_ed,Kat_zach,TypeKatZach
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Vstup_exam.ik_sdach = ABIT_VidSdachi.ik_sdach
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Person.Ik_grazd = grazd.ik_grazd
and ABIT_postup.ik_kat_zach in (select Ik_kat_zach from Kat_zach where bit_Lgota=1)
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and Relation_spec_fac.ik_kat_zaved = 4 --ВПО
and dbo.Student.nCode = ABIT_postup.nCode
and NNyear=2012
and ABIT_Vstup_exam.NN_abit not in (select ABIT_Vstup_exam.NN_abit from ABIT_Vstup_exam where ABIT_Vstup_exam.ik_sdach  in (5,8)) --не ЕГЭ
--and ABIT_Vstup_exam.ik_sdach  in (5,8) --ЕГЭ
group by Fac.Cname_fac, Spec_stud.Cname_spec, CType_kat
order by Fac.Cname_fac, Spec_stud.Cname_spec, CType_kat