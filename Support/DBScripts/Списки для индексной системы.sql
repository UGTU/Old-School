select distinct Clastname,Cfirstname,Cotch, Grup.Cname_grup, discpln.cName_disc
from Vedomost,Grup,Prepod,Content_UchPl,sv_disc,discpln,Person,Relation_spec_fac
where dD_vydano>'01.09.2011' and dD_vydano<'01.09.2012'
and Grup.DateExit>'01.09.2012'
and Vedomost.Ik_grup = Grup.Ik_grup
and Vedomost.Itab_n = Prepod.itab_n
and Vedomost.ik_upContent = Content_UchPl.ik_upContent
and Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
and sv_disc.ik_disc = discpln.iK_disc
and Person.nCode = Prepod.nCode
and Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = 1
order by Clastname,Cfirstname,Cotch