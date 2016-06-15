select [Cname_spec] Специальность, [NNyear] Год_поступления, min([SchoolAverMark]) Минимальная_средняя
from [dbo].[ABIT_postup] inner join [dbo].[ABIT_Diapazon_spec_fac] on [dbo].[ABIT_postup].NNrecord = [dbo].[ABIT_Diapazon_spec_fac].NNrecord
inner join [dbo].[Relation_spec_fac] on [dbo].[Relation_spec_fac].ik_spec_fac = [dbo].[ABIT_Diapazon_spec_fac].ik_spec_fac
inner join EducationBranch on EducationBranch.ik_spec = [dbo].[Relation_spec_fac].ik_spec
inner join Kat_zach on Kat_zach.Ik_kat_zach = [dbo].[ABIT_postup].ik_kat_zach
where EducationBranch.ik_spec in (354409,354613, 310, 354611)
 and [dbo].[ABIT_postup].ik_zach in (2)
 and [SchoolAverMark] <> 0
 and ik_type_kat in (1,2)
group by [Cname_spec],[NNyear]