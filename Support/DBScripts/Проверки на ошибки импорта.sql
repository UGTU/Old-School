select  [ñname_disc],[cosenka], Person.[Clastname], [Cfirstname], [Cotch], [dbo].[Fac].Cname_fac, EducationBranch.Cname_spec
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