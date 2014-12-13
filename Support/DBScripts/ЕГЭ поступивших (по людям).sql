select Person.Clastname + ' ' + Person.Cfirstname + ' ' + Person.Cotch FIO,Fac.Cshort_name_fac, Spec_stud.Cshort_spec,сname_disc,cosenka
from ABIT_postup, ABIT_Vstup_exam,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac, Person,ABIT_Disc
where ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and Person.nCode = ABIT_postup.nCode
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
--and ik_disc = 1  -- математика
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ABIT_Vstup_exam.ik_disc = ABIT_Disc.ik_disc
--and ik_sdach in (5,8) --ЕГЭ
and NNyear=2012
and Fac.Ik_fac =6
and ABIT_Disc.ik_disc in (select ik_disc from ABIT_Diapazon_Disc where NNrecord=ABIT_postup.NNrecord)
and ABIT_postup.ik_kat_zach in (select ik_kat_zach from Kat_zach where ik_type_kat in (3))
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and cosenka is not NULL
order by Fac.Cshort_name_fac, Spec_stud.Cshort_spec, FIO
