select Fac.Cname_fac, Form_ed.Cname_form_ed, Grup.Cname_grup,  Content_UchPl.n_sem, discpln.cName_disc, vid_zaniat.cName_vid_zanyat, Vedomost.Ik_ved
from Vedomost, Grup, Content_UchPl, vid_zaniat, Relation_spec_fac rsf, sv_disc, discpln, Form_ed, Fac
where Vedomost.Ik_grup = Grup.Ik_grup
and Vedomost.ik_upContent = Content_UchPl.ik_upContent
and Content_UchPl.ik_vid_zanyat = vid_zaniat.iK_vid_zanyat
and Grup.ik_spec_fac = rsf.ik_spec_fac
and Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
and sv_disc.ik_disc = discpln.iK_disc
and rsf.Ik_form_ed = Form_ed.Ik_form_ed
and rsf.ik_fac = Fac.Ik_fac
and Vedomost.lPriznak_napr = 0
and Vedomost.lClose = 0
and Content_UchPl.n_sem < (YEAR(GetDate()) - Grup.nYear_post)*2-1
and vid_zaniat.iK_vid_zanyat <> 33
and YEAR(Grup.DateExit)>=YEAR(GetDate())
--and Fac.ik_fac = 27
order by Fac.Cname_fac, rsf.Ik_form_ed, Grup.Cname_grup,  Content_UchPl.n_sem
--and Vedomost.Itab_n is not null

