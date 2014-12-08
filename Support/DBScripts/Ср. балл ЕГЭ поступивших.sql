select count(id),sum(cosenka),Spec_stud.Cname_spec
from ABIT_postup, ABIT_Vstup_exam,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac, Kat_zach
where ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
--and ik_sdach in (5,8) --≈√Ё
and Ik_form_ed = 1
and ik_type_kat in (1,2)
and NNyear=2014
and Relation_spec_fac.ik_fac not in ()
--and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and cosenka is not NULL
group by Spec_stud.Cname_spec
--order by cosenka

select count(id),sum(cosenka)
from ABIT_postup, ABIT_Vstup_exam,ABIT_Diapazon_Disc
where ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_postup.NNrecord = ABIT_Diapazon_Disc.NNrecord
and ABIT_Diapazon_Disc.ik_disc = ABIT_Vstup_exam.ik_disc
and ik_sdach in (5,8) --≈√Ё
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and cosenka is not NULL
--order by cosenka