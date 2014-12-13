select distinct NNyear,Fac.Cname_fac,Spec_stud.Cname_spec, Clastname + ' ' + Cfirstname + ' ' + Cotch FIO, cName_zaved,  Ngodokon, Cd_seria + ' ' + Np_number
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,
	 Form_ed,Kat_zach,TypeKatZach, Zaved_stud, Doc_stud
where ABIT_postup.nCode = dbo.Person.nCode 
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and dbo.Student.nCode = ABIT_postup.nCode
and NNyear in (2013,2014)
and Doc_stud.nCode = Person.nCode
and Doc_stud.Ik_vid_doc in (select Ik_vid_doc from documents where IsEducational = 1)
and Zaved_stud.ik_zaved = Student.Ik_zaved
and Ngodokon in (2012,2013,2014)
and Student.Ik_zaved in (2288,3267,2811,3204)		--1993, 2288, 2811, 2952, 44, 1684, 2715, 2707, 2708
order by NNyear,FIO,Fac.Cname_fac, Spec_stud.Cname_spec