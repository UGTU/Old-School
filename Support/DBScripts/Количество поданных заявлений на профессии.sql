select EducationBranch.[Cname_spec], Form_ed.Cname_form_ed, count(distinct [dbo].[ABIT_postup].NN_abit)
from [dbo].[ABIT_Diapazon_spec_fac] inner join [dbo].[ABIT_postup] on [dbo].[ABIT_postup].NNrecord = [dbo].[ABIT_Diapazon_spec_fac].NNrecord
inner join [dbo].[Relation_spec_fac] on [dbo].[Relation_spec_fac].ik_spec_fac = [dbo].[ABIT_Diapazon_spec_fac].ik_spec_fac
inner join EducationBranch on EducationBranch.ik_spec = [dbo].[Relation_spec_fac].ik_spec
inner join Direction on EducationBranch.ik_direction = Direction.ik_direction
inner join Form_ed on Form_ed.Ik_form_ed = [dbo].[Relation_spec_fac].Ik_form_ed
where NNyear = 2015 and Direction.ik_direction = 12
group by EducationBranch.[Cname_spec], Form_ed.Cname_form_ed