select distinct Cshort_name_fac, Cshort_spec, Clastname + ' ' + Cfirstname + ' ' + Cotch fio,сname_disc,ave.cosenka
from ABIT_postup ap,Person,ABIT_Vstup_exam ave,ABIT_Diapazon_spec_fac adsf,
Relation_spec_fac rsf,ABIT_Disc ad,Fac,Spec_stud
where ap.NNrecord = adsf.NNrecord and ap.NN_abit = ave.NN_abit
and ad.ik_disc = ave.ik_disc and Fac.Ik_fac = rsf.ik_fac and rsf.ik_spec = Spec_stud.ik_spec
and ap.nCode = Person.nCode
and adsf.NNyear = 2011
and adsf.ik_spec_fac = rsf.ik_spec_fac
and fac.ik_fac not in (5,6,9,14,15,17,19,20)
and Ik_form_ed = 1
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach=2)	--зачислен
--and ik_kat_zach in (select ik_kat_zach from Kat_zach where ik_type_kat = 3) --контракт
and ik_sdach in (5,8)  --ЕГЭ
order by Cshort_name_fac, Cshort_spec, fio, сname_disc