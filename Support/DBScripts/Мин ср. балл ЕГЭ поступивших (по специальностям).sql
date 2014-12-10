select Ik_form_ed,Cname_form_ed, Cname_spec,CType_kat,
	   cast(CAST(sum(cosenka) as numeric(8,2))/cast(count(cosenka) as numeric(8,2)) as numeric(8,2))
from
(select Relation_spec_fac.Ik_form_ed,Form_ed.Cname_form_ed, Spec_stud.Cname_spec,TypeKatZach.CType_kat,
	   ABIT_Vstup_exam.ik_disc, ABIT_Disc.сname_disc, MIN(cosenka) cosenka
from ABIT_postup, ABIT_Vstup_exam,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac,Kat_zach,Form_ed,
	 TypeKatZach,ABIT_Diapazon_Disc, ABIT_Disc
where ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ABIT_Disc.iK_disc = ABIT_Vstup_exam.ik_disc
and TypeKatZach.ik_type_kat = Kat_zach.ik_type_kat
and ABIT_Diapazon_Disc.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_Diapazon_Disc.ik_disc = ABIT_Vstup_exam.ik_disc
and bit_Lgota = 0                --не льготники/олимпиадники 
and ik_sdach in (5,8) --ЕГЭ
and Relation_spec_fac.ik_kat_zaved = 4 --ВПО
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and cosenka is not NULL
and NNyear = 2012
--and Kat_zach.ik_type_kat = 1 --бюджетники
group by Relation_spec_fac.Ik_form_ed, Spec_stud.Cname_spec, TypeKatZach.CType_kat,Form_ed.Cname_form_ed,
	     ABIT_Vstup_exam.ik_disc, ABIT_Disc.сname_disc
) temp_t
group by Ik_form_ed, Cname_spec, CType_kat,Cname_form_ed
order by Ik_form_ed,Cname_spec
--order by cosenka

