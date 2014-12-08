Select distinct cshort_name_kaf, n_sem/2+n_sem%2 as Course, n_sem, cName_disc, Cname_spec + ' ('+Spec_stud.Cshort_spec+')' sp_name,Cshort_name_fac
from Grup,sv_disc,Content_UchPl,kafedra,discpln,Relation_spec_fac,Fac,Spec_stud
where Grup.Ik_uch_plan = sv_disc.ik_uch_plan
and sv_disc.ik_disc_uch_plan = Content_UchPl.ik_disc_uch_plan
and Content_UchPl.ik_kaf = kafedra.ik_kaf
and sv_disc.ik_disc = discpln.iK_disc
and Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and n_sem<7
and nYear_post>2008
order by Cshort_name_fac,sp_name,Course

