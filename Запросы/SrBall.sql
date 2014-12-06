select Cshort_spec,сname_disc,AVG(cosenka)
from dbo.ABIT_Vstup_exam,dbo.ABIT_postup,dbo.ABIT_Diapazon_spec_fac,
dbo.ABIT_sost_zach,dbo.ABIT_Disc,dbo.Relation_spec_fac,dbo.Spec_stud
where dbo.ABIT_Vstup_exam.NN_abit = dbo.ABIT_postup.NN_abit
and dbo.ABIT_postup.NNrecord = dbo.ABIT_Diapazon_spec_fac.NNrecord
and dbo.ABIT_sost_zach.ik_zach = dbo.ABIT_postup.ik_zach
and dbo.Relation_spec_fac.ik_spec_fac = dbo.ABIT_Diapazon_spec_fac.ik_spec_fac
and dbo.Spec_stud.ik_spec = dbo.Relation_spec_fac.ik_spec
and dbo.ABIT_Vstup_exam.ik_disc = dbo.ABIT_Disc.ik_disc
and NNyear=2010			--за 2010 год
and ik_type_zach = 2	--зачислен
and ik_fac<>6
group by Cshort_spec,сname_disc
order by Cshort_spec,сname_disc