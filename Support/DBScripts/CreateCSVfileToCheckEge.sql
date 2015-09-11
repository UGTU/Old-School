select distinct Clastname+'%'+Cfirstname+'%'+Cotch+'%'+Doc_stud.Cd_seria+'%'+Doc_stud.Np_number
from ABIT_postup 
inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join Person on Person.nCode = ABIT_postup.nCode
left join Doc_stud on ABIT_postup.nCode = Doc_stud.nCode
left join documents on documents.ik_vid_doc = Doc_stud.Ik_vid_doc
where documents.IsIdentity = 1
and NNyear = 2015
and NN_abit in (select NN_abit from ABIT_Vstup_exam
			    where [ik_sdach] in (5,8))


