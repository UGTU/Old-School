select Person.nCode,Person.Clastname + ' ' + Person.Cfirstname + ' ' + Person.Cotch FIO,TypeKatZach.CType_kat, Form_ed.Cname_form_ed, Fac.Cshort_name_fac, Spec_stud.Cname_spec,Direction.cName_direction,
	   typ_zaved.ctyp_zaved,Kat_zaved.cKat_Zaved, Student.Ngodokon
from ABIT_postup, ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac, Person,Zaved_stud, Student,Direction,Kat_zach, TypeKatZach,typ_zaved,Kat_zaved, Form_ed
where ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and Zaved_stud.ik_zaved = Student.Ik_zaved
and Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
and TypeKatZach.ik_type_kat = Kat_zach.ik_type_kat
and Kat_zaved.ik_kat_zaved = typ_zaved.ik_kat_zaved
and Form_ed.Ik_form_ed = Relation_spec_fac.Ik_form_ed
and Student.nCode = Person.nCode
and typ_zaved.ik_typ_zaved = Zaved_stud.ik_typ_zaved
and Person.nCode = ABIT_postup.nCode
and Direction.ik_direction = Spec_stud.ik_direction
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac																							
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec																							
and NNyear=year(Getdate())																					
and ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)		
order by cName_direction, CType_kat