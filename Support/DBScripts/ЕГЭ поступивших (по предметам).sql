select Person.Clastname + ' ' + Person.Cfirstname + ' ' + Person.Cotch,Fac.Cshort_name_fac, Spec_stud.Cshort_spec,cosenka
from ABIT_postup, ABIT_Vstup_exam,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac, Person
where ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and Person.nCode = ABIT_postup.nCode
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and ik_disc = 1  -- математика
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ik_sdach in (5,8) --ЕГЭ
and NNyear=2012
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and cosenka is not NULL
order by Fac.Cshort_name_fac, Spec_stud.Cshort_spec

select Person.Clastname + ' ' + Person.Cfirstname + ' ' + Person.Cotch,Fac.Cshort_name_fac, Spec_stud.Cshort_spec,cosenka
from ABIT_postup, ABIT_Vstup_exam,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac, Person
where ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and Person.nCode = ABIT_postup.nCode
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and ik_disc = 2  -- физика
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ik_sdach in (5,8) --ЕГЭ
and NNyear=2012
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and cosenka is not NULL
order by Fac.Cshort_name_fac, Spec_stud.Cshort_spec


--распределение по баллам 0-5  5-10 и т.д.

select Fac.Cshort_name_fac ,Spec_stud.Cname_spec, Spec_stud.Sh_spec, Form_ed.Cname_form_ed, TypeKatZach.CType_kat,ABIT_Disc.сname_disc,count(distinct ocen_table.NN_abit)
from ABIT_postup inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord 
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac 
inner join Form_ed on Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
inner join Kat_zach on ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
inner join TypeKatZach on Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
inner join ABIT_Vstup_exam on ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
inner join ABIT_Disc on ABIT_Vstup_exam.ik_disc = ABIT_Disc.ik_disc
left join
(select * from ABIT_Vstup_exam  
 where ABIT_Vstup_exam.cosenka > 95 and ABIT_Vstup_exam.cosenka<101--ЕГЭ
 ) ocen_table on ocen_table.id = ABIT_Vstup_exam.id

Where ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and NNyear=2012
and ABIT_Vstup_exam.ik_sdach in (5,8)
group by Fac.Cshort_name_fac,Spec_stud.Cname_spec, Spec_stud.Sh_spec, Form_ed.Cname_form_ed, TypeKatZach.CType_kat,ABIT_Disc.сname_disc
order by Fac.Cshort_name_fac ,Spec_stud.Cname_spec

--- старый (для проверки)

select Fac.Cshort_name_fac ,Spec_stud.Cname_spec, Spec_stud.Sh_spec, Form_ed.Cname_form_ed, TypeKatZach.CType_kat,ABIT_Disc.сname_disc,count(distinct ABIT_postup.NN_abit)
from ABIT_postup inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord 
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac 
inner join Form_ed on Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
inner join Kat_zach on ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
inner join TypeKatZach on Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
inner join ABIT_Vstup_exam on ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
inner join ABIT_Disc on ABIT_Vstup_exam.ik_disc = ABIT_Disc.ik_disc
Where ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and ABIT_Vstup_exam.cosenka > 20 and ABIT_Vstup_exam.cosenka<26
and NNyear=2012
and ABIT_Vstup_exam.ik_sdach in (5,8)
group by Fac.Cshort_name_fac,Spec_stud.Cname_spec, Spec_stud.Sh_spec, Form_ed.Cname_form_ed, TypeKatZach.CType_kat,ABIT_Disc.сname_disc
order by Fac.Cshort_name_fac ,Spec_stud.Cname_spec