select  cos_mat.FIO,cos_mat.Cname_grup, cos_fis.cosenka,  cos_mat.cosenka
from (select Person.nCode,Person.Clastname + ' ' + Person.Cfirstname + ' ' + Person.Cotch FIO,Fac.Cshort_name_fac, Spec_stud.Cname_spec,grup.Cname_grup,cosenka
from ABIT_postup, ABIT_Vstup_exam,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac, Person,ABIT_Disc, grup, StudGrup,Zach
where ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and Person.nCode = ABIT_postup.nCode
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and ABIT_postup.nCode = Zach.nCode
and Zach.Ik_zach = StudGrup.Ik_zach and StudGrup.Ik_grup = Grup.Ik_grup
--and ik_disc = 1																										-- математика
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ABIT_Vstup_exam.ik_disc = ABIT_Disc.ik_disc
and ik_sdach in (5,8)	
and ABIT_Vstup_exam.ik_disc = 1																								--ЕГЭ
and NNyear=year(Getdate())
--and Ik_form_ed=1																										--очное
--and Spec_stud.ik_spec <> 354550																						-- не архитектура
and ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)												--зачисленные
and cosenka is not NULL
--group by Person.Clastname + ' ' + Person.Cfirstname + ' ' + Person.Cotch,Fac.Cshort_name_fac, Spec_stud.Cname_spec
--having sum(cosenka)>225
) cos_mat
left join 
(select Person.nCode,Person.Clastname + ' ' + Person.Cfirstname + ' ' + Person.Cotch FIO,Fac.Cshort_name_fac, Spec_stud.Cname_spec,cosenka
from ABIT_postup, ABIT_Vstup_exam,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac, Person,ABIT_Disc, grup, StudGrup,Zach
where ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and Person.nCode = ABIT_postup.nCode
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and ABIT_postup.nCode = Zach.nCode
and Zach.Ik_zach = StudGrup.Ik_zach and StudGrup.Ik_grup = Grup.Ik_grup
--and ik_disc = 1																										-- математика
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ABIT_Vstup_exam.ik_disc = ABIT_Disc.ik_disc
and ik_sdach in (5,8)	
and ABIT_Vstup_exam.ik_disc = 2																								--ЕГЭ
and NNyear=year(Getdate())
--and Ik_form_ed=1																										--очное
--and Spec_stud.ik_spec <> 354550																						-- не архитектура
and ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)												--зачисленные
and cosenka is not NULL
--group by Person.Clastname + ' ' + Person.Cfirstname + ' ' + Person.Cotch,Fac.Cshort_name_fac, Spec_stud.Cname_spec
--having sum(cosenka)>225
) cos_fis on cos_fis.nCode = cos_mat.nCode
order by Cname_grup,FIO