select  Clastname + ' ' + Cfirstname + ' ' + Cotch,Cshort_name_fac,Cshort_spec, cName_direction, Cname_type_zach,CType_kat, Ngodokon,ctyp_zaved,cKat_Zaved
from ABIT_postup,Student,Person, ABIT_Diapazon_spec_fac,Zaved_stud,typ_zaved,Kat_zaved,
     Relation_spec_fac, Spec_stud, Direction,ABIT_sost_zach,ABIT_type_zach,Fac,Kat_zach,TypeKatZach
where ABIT_postup.nCode = Student.nCode and ABIT_postup.nCode = Person.nCode
and ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and Spec_stud.ik_direction = Direction.ik_direction
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and NNyear=2011
and Zaved_stud.ik_zaved = Student.Ik_zaved
and Zaved_stud.ik_typ_zaved = typ_zaved.ik_typ_zaved
and typ_zaved.ik_kat_zaved = Kat_zaved.ik_kat_zaved
and ABIT_postup.ik_zach = ABIT_sost_zach.ik_zach
and ABIT_sost_zach.ik_type_zach = ABIT_type_zach.ik_type_zach
and Relation_spec_fac.ik_fac = Fac.Ik_fac
order by cName_direction,Cname_type_zach,Ngodokon
