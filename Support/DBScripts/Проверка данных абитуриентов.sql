--проверка идентификационного документа и гражданства
select [Clastname], [Cfirstname], [Cotch] 
,EducationBranch.Cname_spec, Form_ed.Cname_form_ed, Fac.Cshort_name_fac,
Strana.[Cstrana],documents.[cvid_doc], [Cd_seria], [Np_number], [Cd_kem_vidan], cast([Dd_vidan] as date)
from Person inner join ABIT_postup on Person.nCode = ABIT_postup.nCode
inner join [dbo].[ABIT_Diapazon_spec_fac] on ABIT_postup.NNrecord =  [dbo].[ABIT_Diapazon_spec_fac].NNrecord
inner join Relation_spec_fac on [dbo].[ABIT_Diapazon_spec_fac].ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
inner join Form_ed on Form_ed.Ik_form_ed = Relation_spec_fac.Ik_form_ed
inner join Fac on Fac.ik_fac = Relation_spec_fac.ik_fac
inner join [dbo].[Doc_stud] on Doc_stud.nCode = Person.nCode
inner join [dbo].[documents] on documents.ik_vid_doc = Doc_stud.Ik_vid_doc
inner join Strana on Person.Ik_grazd = Strana.Ik_strana
where  [dbo].[ABIT_Diapazon_spec_fac].NNyear = 2016
and documents.IsIdentity = 1
and (
(LTRIM(RTRIM(Np_number))='')
or
((LTRIM(RTRIM([Cd_seria]))='')and(Strana.Ik_strana = 2)and(documents.ik_vid_doc <> 10))
or
((Strana.Ik_strana = 2) and (documents.ik_type_grazd = 2))
or
((Strana.Ik_strana <> 2) and (documents.ik_type_grazd = 1))
or
((LTRIM(RTRIM([Cd_seria]))='')and(documents.ik_vid_doc = 12))
or
(LTRIM(RTRIM([Cd_kem_vidan]))='')
or
([Dd_vidan] is null)
)
order by [Clastname], [Cfirstname], [Cotch]

--проверка образовательного документа
select [Clastname], [Cfirstname], [Cotch] 
,EducationBranch.Cname_spec, Form_ed.Cname_form_ed, Fac.Cshort_name_fac,
Strana.[Cstrana],documents.[cvid_doc], [Cd_seria], [Np_number], [Cd_kem_vidan], cast([Dd_vidan] as date)
from Person inner join ABIT_postup on Person.nCode = ABIT_postup.nCode
inner join [dbo].[ABIT_Diapazon_spec_fac] on ABIT_postup.NNrecord =  [dbo].[ABIT_Diapazon_spec_fac].NNrecord
inner join Relation_spec_fac on [dbo].[ABIT_Diapazon_spec_fac].ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
inner join Form_ed on Form_ed.Ik_form_ed = Relation_spec_fac.Ik_form_ed
inner join Fac on Fac.ik_fac = Relation_spec_fac.ik_fac
inner join [dbo].[Doc_stud] on Doc_stud.nCode = Person.nCode
inner join [dbo].[documents] on documents.ik_vid_doc = Doc_stud.Ik_vid_doc
inner join Strana on Person.Ik_grazd = Strana.Ik_strana
where  [dbo].[ABIT_Diapazon_spec_fac].NNyear = 2016
and documents.[IsEducational] = 1
and (
(LTRIM(RTRIM(Np_number))='')
or
((LTRIM(RTRIM([Cd_seria]))='')and(documents.ik_vid_doc in (7,9)))
or
(LTRIM(RTRIM([Cd_kem_vidan]))='')
or
([Dd_vidan] is null)
)
order by [Clastname], [Cfirstname], [Cotch]

--проверка наличия образовательного и идентификационного документа
select [Clastname], [Cfirstname], [Cotch] 
,EducationBranch.Cname_spec, Form_ed.Cname_form_ed, Fac.Cshort_name_fac, identDoc.Ik_doc, EduDoc.Ik_doc
from Person inner join ABIT_postup on Person.nCode = ABIT_postup.nCode
inner join [dbo].[ABIT_Diapazon_spec_fac] on ABIT_postup.NNrecord =  [dbo].[ABIT_Diapazon_spec_fac].NNrecord
inner join Relation_spec_fac on [dbo].[ABIT_Diapazon_spec_fac].ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
inner join Form_ed on Form_ed.Ik_form_ed = Relation_spec_fac.Ik_form_ed
inner join Fac on Fac.ik_fac = Relation_spec_fac.ik_fac
left join
(select ik_doc, nCode from [Doc_stud] inner join [dbo].[documents] on documents.ik_vid_doc = Doc_stud.Ik_vid_doc 
 where IsIdentity = 1) identDoc on identDoc.nCode = Person.nCode
 left join
(select ik_doc, nCode from [Doc_stud] inner join [dbo].[documents] on documents.ik_vid_doc = Doc_stud.Ik_vid_doc 
 where [IsEducational] = 1) EduDoc on EduDoc.nCode = Person.nCode
 where  [dbo].[ABIT_Diapazon_spec_fac].NNyear = 2016
 and (
 (identDoc.Ik_doc is null)or(EduDoc.Ik_doc is null)
 )

 select [Clastname], [Cfirstname], [Cotch] 
,EducationBranch.Cname_spec, Form_ed.Cname_form_ed, Fac.Cshort_name_fac, 'отсутствует'
from Person inner join ABIT_postup on Person.nCode = ABIT_postup.nCode
inner join [dbo].[ABIT_Diapazon_spec_fac] on ABIT_postup.NNrecord =  [dbo].[ABIT_Diapazon_spec_fac].NNrecord
inner join Relation_spec_fac on [dbo].[ABIT_Diapazon_spec_fac].ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
inner join Form_ed on Form_ed.Ik_form_ed = Relation_spec_fac.Ik_form_ed
inner join Fac on Fac.ik_fac = Relation_spec_fac.ik_fac
left join (select * from [dbo].[PersonAddress] where [ik_AddressType] = 2) AdressProp
on AdressProp.nCode = Person.nCode
where [ik_personAddress] is null
and [dbo].[ABIT_Diapazon_spec_fac].NNyear = 2016
order by [Clastname], [Cfirstname], [Cotch]