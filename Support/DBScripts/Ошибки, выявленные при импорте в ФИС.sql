--ошибки серии документа у проф образования
select Person.Clastname, Person.Cfirstname, Person.Cotch,  fac.Cshort_name_fac, EducationBranch.Cname_spec
from Person inner join ABIT_postup on ABIT_postup.nCode = Person.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
inner join  Relation_spec_fac on Relation_spec_fac.ik_spec_fac = ABIT_Diapazon_spec_fac.ik_spec_fac
inner join fac on fac.Ik_fac = Relation_spec_fac.ik_fac
inner join Doc_stud on Doc_stud.nCode = Person.nCode
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
where Doc_stud.Ik_vid_doc = 7
and ABIT_Diapazon_spec_fac.NNyear = 2015
and ((Doc_stud.Cd_seria is null)or(Doc_stud.Cd_seria = ''))
order by Person.Clastname, Person.Cfirstname

--отсутствие идентификационного документа
select Person.Clastname, Person.Cfirstname, Person.Cotch,  fac.Cshort_name_fac, EducationBranch.Cname_spec
from Person inner join ABIT_postup on ABIT_postup.nCode = Person.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
inner join  Relation_spec_fac on Relation_spec_fac.ik_spec_fac = ABIT_Diapazon_spec_fac.ik_spec_fac
inner join fac on fac.Ik_fac = Relation_spec_fac.ik_fac
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
left join Doc_stud on Doc_stud.nCode = Person.nCode
left join documents on documents.ik_vid_doc = Doc_stud.Ik_vid_doc
where (IsIdentity is null)
and ABIT_Diapazon_spec_fac.NNyear = 2015
order by Person.Clastname, Person.Cfirstname

--отсутствие даты выдачи у идентификационного документа
select Person.Clastname, Person.Cfirstname, Person.Cotch,  fac.Cshort_name_fac, EducationBranch.Cname_spec
from Person inner join ABIT_postup on ABIT_postup.nCode = Person.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
inner join  Relation_spec_fac on Relation_spec_fac.ik_spec_fac = ABIT_Diapazon_spec_fac.ik_spec_fac
inner join fac on fac.Ik_fac = Relation_spec_fac.ik_fac
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
left join Doc_stud on Doc_stud.nCode = Person.nCode
left join documents on documents.ik_vid_doc = Doc_stud.Ik_vid_doc
where IsIdentity = 1
and Doc_stud.Dd_vidan is null
and ABIT_Diapazon_spec_fac.NNyear = 2015
order by Person.Clastname, Person.Cfirstname