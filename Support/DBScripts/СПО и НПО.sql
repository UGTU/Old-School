select Clastname + ' ' + Cfirstname + ' ' + Cotch fio, Fac.Cshort_name_fac, Spec_stud.Cname_spec, Form_ed.Cname_form_ed, Kat_zaved.cKat_Zaved, Ngodokon
from ABIT_postup, ABIT_Diapazon_spec_fac, Relation_spec_fac, Fac, Spec_stud, Student, Zaved_stud, typ_zaved, Kat_zaved, Person, Form_ed
where ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ABIT_postup.nCode = Student.nCode and Student.Ik_zaved = Zaved_stud.ik_zaved and Person.nCode = Student.nCode
and Zaved_stud.ik_typ_zaved = typ_zaved.ik_typ_zaved and typ_zaved.ik_kat_zaved = Kat_zaved.ik_kat_zaved
and Form_ed.Ik_form_ed = Relation_spec_fac.Ik_form_ed
and ABIT_Diapazon_spec_fac.NNyear = 2013
and Spec_stud.ik_direction in (1,2,3)
and Kat_zaved.ik_kat_zaved in (2,3)
order by fio