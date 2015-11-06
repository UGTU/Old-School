--сколько всего абитуриентов
select distinct nCode from Person
where nCode in (select nCode from ABIT_postup,[ABIT_Diapazon_spec_fac]
				where ABIT_postup.NNrecord = [dbo].[ABIT_Diapazon_spec_fac].NNrecord and NNyear=2015)
and nCode not in (select nCode from Export_FB_journal where NNYear = 2015)
order by Person.[Clastname], [Cfirstname], [Cotch]

select * from Export_FB_journal where NNYear = 2015

/*delete from Export_FB_journal 
where NNYear = 2015 
and nCode not in
(select nCode from Person
where nCode in (select nCode from ABIT_postup,[ABIT_Diapazon_spec_fac]
				where ABIT_postup.NNrecord = [dbo].[ABIT_Diapazon_spec_fac].NNrecord and NNyear=2015))

insert into Export_FB_journal(nCode,[Is_actual])
select nCode,0 from Person
where nCode in (select nCode from ABIT_postup,[ABIT_Diapazon_spec_fac]
				where ABIT_postup.NNrecord = [dbo].[ABIT_Diapazon_spec_fac].NNrecord and NNyear=2015)
and nCode not in (select nCode from Export_FB_journal)
order by Person.[Clastname], [Cfirstname], [Cotch]

alter table Export_FB_journal alter column Is_actual bit null

update Export_FB_journal set Is_actual = null where NNYear = 2015*/

select  [сname_disc],[cosenka], Person.[Clastname], [Cfirstname], [Cotch], [dbo].[Fac].Cname_fac, EducationBranch.Cname_spec
from [dbo].[ABIT_Disc],[dbo].[ABIT_Vstup_exam], ABIT_postup, [dbo].[ABIT_Diapazon_spec_fac], Person, Relation_spec_fac, Fac,  EducationBranch
where [dbo].[ABIT_Vstup_exam].[NN_abit]= ABIT_postup.[NN_abit] 
and ABIT_postup.NNrecord = [dbo].[ABIT_Diapazon_spec_fac].NNrecord
and ABIT_postup.nCode = Person.nCode
and [dbo].[ABIT_Disc].ik_disc = [dbo].[ABIT_Vstup_exam].ik_disc
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and NNyear = 2015
and [cosenka] is not null
and [ik_sdach] not in (5,8)
and [NNvedom] =''

select Person.[Clastname], [Cfirstname], [Cotch], [dbo].[Fac].Cname_fac, EducationBranch.Cname_spec
from Doc_stud, ABIT_postup, ABIT_Diapazon_spec_fac, Person, Relation_spec_fac, Fac,  EducationBranch
where Doc_stud.nCode = ABIT_postup.nCode
and ABIT_postup.nCode = Person.nCode
and ABIT_postup.NNRecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and NNyear = 2015
and Ik_vid_doc in (7,9)
and Doc_stud.Cd_seria = ''

select Doc_stud.Dd_vidan, Person.[Clastname], [Cfirstname], [Cotch], [dbo].[Fac].Cname_fac, EducationBranch.Cname_spec
from Doc_stud, ABIT_postup, ABIT_Diapazon_spec_fac, Person, Relation_spec_fac, Fac,  EducationBranch
where Doc_stud.nCode = ABIT_postup.nCode
and ABIT_postup.nCode = Person.nCode
and ABIT_postup.NNRecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and NNyear = 2015
and Doc_stud.Dd_vidan > '2015-21-09'

--нет серии
select Doc_stud.Dd_vidan, Person.[Clastname], [Cfirstname], [Cotch], [dbo].[Fac].Cname_fac, EducationBranch.Cname_spec,documents.cvid_doc
from Doc_stud, ABIT_postup, ABIT_Diapazon_spec_fac, Person, Relation_spec_fac, Fac,  EducationBranch,documents
where Doc_stud.nCode = ABIT_postup.nCode
and ABIT_postup.nCode = Person.nCode
and ABIT_postup.NNRecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Doc_stud.Ik_vid_doc = documents.Ik_vid_doc
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and documents.IsIdentity = 1
and NNyear = 2015
and ABIT_postup.nCode in (113345,114304,127178)

--Не тот документ
select Doc_stud.Dd_vidan, Person.[Clastname], [Cfirstname], [Cotch], [dbo].[Fac].Cname_fac, EducationBranch.Cname_spec,documents.cvid_doc,
Direction.cName_direction, ik_zach
from Doc_stud, ABIT_postup, ABIT_Diapazon_spec_fac, Person, Relation_spec_fac, Fac,  EducationBranch,documents,Direction
where Doc_stud.nCode = ABIT_postup.nCode
and ABIT_postup.nCode = Person.nCode
and ABIT_postup.NNRecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Doc_stud.Ik_vid_doc = documents.Ik_vid_doc
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and EducationBranch.ik_direction = Direction.ik_direction
and documents.IsEducational = 1
and NNyear = 2015
and ABIT_postup.nCode in (114167,114178,114503,114831,126090)

Select * from [dbo].[ABIT_Diapazon_spec_fac], Relation_spec_fac, Fac,  EducationBranch
where NNRecord = 1781
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec

--проблемы с гражданством
select Person.nCode, Person.[Clastname], [Cfirstname], [Cotch], [dbo].[Fac].Cname_fac, EducationBranch.Cname_spec, documents.cvid_doc, Strana.c_grazd
from Doc_stud, ABIT_postup, ABIT_Diapazon_spec_fac, Person, Relation_spec_fac, Fac,  EducationBranch,documents,Strana
where Doc_stud.nCode = ABIT_postup.nCode
and ABIT_postup.nCode = Person.nCode
and ABIT_postup.NNRecord = ABIT_Diapazon_spec_fac.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and Doc_stud.Ik_vid_doc = documents.Ik_vid_doc
and Person.Ik_grazd = Strana.Ik_strana
and NNyear = 2015
and documents.IsIdentity = 1
and ABIT_postup.nCode in (select nCode from Export_FB_journal where ErrorCode = 69)