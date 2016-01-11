select min(sAbit), NNyear, Cshort_spec
from(
select sum([ABIT_Vstup_exam].cosenka) sAbit, [ABIT_postup].NN_abit, NNyear, EducationBranch.Cshort_spec
from [dbo].[ABIT_postup], [dbo].[ABIT_Vstup_exam], [dbo].[ABIT_Diapazon_spec_fac], [dbo].[Relation_spec_fac], EducationBranch
where [ABIT_postup].NN_abit = [ABIT_Vstup_exam].NN_abit
and [ABIT_postup].NNrecord = [ABIT_Diapazon_spec_fac].NNrecord
and [ABIT_Diapazon_spec_fac].ik_spec_fac = [Relation_spec_fac].ik_spec_fac
and EducationBranch.ik_spec = [Relation_spec_fac].ik_spec
and [ABIT_postup].ik_zach = 6
and [ABIT_postup].ik_kat_zach in (1)
and [Relation_spec_fac].ik_spec in (354549, 354548)
group by [ABIT_postup].NN_abit, NNyear, EducationBranch.Cshort_spec) s_ball
group by NNyear, Cshort_spec

