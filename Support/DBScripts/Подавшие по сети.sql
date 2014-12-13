select distinct Clastname + ' ' + Cfirstname + ' ' + Cotch FIO,Fac.Cname_fac,Spec_stud.Cname_spec,  ctelefon, cSotTel,cEmail
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,
	 Form_ed,Kat_zach,TypeKatZach
where ABIT_postup.nCode = dbo.Person.nCode 
and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and dbo.Student.nCode = ABIT_postup.nCode
and NNyear=2014
and ik_zach = 9
and ABIT_postup.nCode not in (select nCode from ABIT_postup where ik_zach <>9)
order by FIO,Fac.Cname_fac, Spec_stud.Cname_spec