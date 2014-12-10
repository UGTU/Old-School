select Relation_spec_fac.Ik_form_ed,Form_ed.Cname_form_ed, Spec_stud.Cname_spec,TypeKatZach.CType_kat, sum(cosenka),count(distinct id), count(distinct ABIT_postup.nCode),
COUNT(distinct ABIT_Diapazon_Disc.ik_disc_nabor),
       cast(cast(sum(cosenka) as numeric(8,2))/cast(count(distinct id) as numeric(8,2)) as numeric(8,2))
from ABIT_postup, ABIT_Vstup_exam,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac,Kat_zach,Form_ed,
	 TypeKatZach, ABIT_Diapazon_Disc
where ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_Diapazon_Disc.ik_disc = ABIT_Vstup_exam.ik_disc
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_Diapazon_Disc.NNrecord
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and TypeKatZach.ik_type_kat = Kat_zach.ik_type_kat
--and bit_Lgota = 1                --не льготники/олимпиадники 
and ik_sdach in (5,8) --ЕГЭ
and Relation_spec_fac.ik_kat_zaved = 4 --ВПО
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and cosenka is not NULL
and NNyear = 2012
and Kat_zach.ik_type_kat = 3 --бюджетники
group by Relation_spec_fac.Ik_form_ed, Spec_stud.Cname_spec, TypeKatZach.CType_kat,Form_ed.Cname_form_ed
order by Relation_spec_fac.Ik_form_ed,Spec_stud.Cname_spec

--order by cosenka

