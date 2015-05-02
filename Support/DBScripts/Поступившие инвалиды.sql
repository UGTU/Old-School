Select Fac.Cname_fac, Spec_stud.Cname_spec, cName_direction, Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') FIO, lSex, Dd_birth
from ABIT_postup 
inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join Relation_spec_fac on  ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Fac on Relation_spec_fac.ik_fac = fac.Ik_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Direction on Direction.ik_direction = Spec_stud.ik_direction
inner join Person  on Person.nCode = ABIT_postup.nCode
inner join Student on Person.nCode = Student.nCode
inner join Zach on Person.nCode = Zach.nCode
where ABIT_Diapazon_spec_fac.NNyear = 2014
and Person.Linval = 1