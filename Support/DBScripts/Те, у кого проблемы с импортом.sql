select Person.nCode,  [Clastname], Cfirstname, Cotch, Relation_spec_fac.Ik_form_ed,Kat_zach.ik_type_kat
from Export_FB_journal, Person, ABIT_postup, ABIT_Diapazon_spec_fac, Relation_spec_fac, Kat_zach
where StatusID = 333
and Person.nCode = Export_FB_journal.nCode
and ABIT_postup.nCode = Person.nCode
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)