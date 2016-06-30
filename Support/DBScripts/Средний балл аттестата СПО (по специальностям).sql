select [Cname_spec] Специальность, Form_ed.[Cname_form_ed], [dbo].[TypeKatZach].[CType_kat], cast(avg([SchoolAverMark]) as numeric(8,2)) Средний_балл
from [dbo].[ABIT_postup] inner join [dbo].[ABIT_Diapazon_spec_fac] on [dbo].[ABIT_postup].NNrecord = [dbo].[ABIT_Diapazon_spec_fac].NNrecord
inner join [dbo].[Relation_spec_fac] on [dbo].[Relation_spec_fac].ik_spec_fac = [dbo].[ABIT_Diapazon_spec_fac].ik_spec_fac
inner join EducationBranch on EducationBranch.ik_spec = [dbo].[Relation_spec_fac].ik_spec
inner join Kat_zach on Kat_zach.Ik_kat_zach = [dbo].[ABIT_postup].ik_kat_zach
inner join Form_ed on Form_ed.ik_form_ed = [dbo].[Relation_spec_fac].ik_form_ed
inner join [dbo].[TypeKatZach] on Kat_zach.ik_type_kat = [dbo].[TypeKatZach].ik_type_kat
where 
 [dbo].[ABIT_postup].ik_zach in (2)
 and [SchoolAverMark] <> 0
 and ik_direction in (5,12)
 and [NNyear] = 2015
group by [Cname_spec],Form_ed.[Cname_form_ed],[dbo].[TypeKatZach].[CType_kat]
order by [Cname_spec], Form_ed.[Cname_form_ed]