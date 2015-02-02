update Vedomost set lClose = 1 where ik_ved in
(select Vedomost.Ik_ved
from Vedomost, Grup, Content_UchPl, vid_zaniat
where Vedomost.Ik_grup = Grup.Ik_grup
and Vedomost.ik_upContent = Content_UchPl.ik_upContent
and Content_UchPl.ik_vid_zanyat = vid_zaniat.iK_vid_zanyat
and Vedomost.lPriznak_napr = 0
and Vedomost.lClose = 0
and Content_UchPl.n_sem < (YEAR(GetDate()) - Grup.nYear_post)*2-1
and vid_zaniat.iK_vid_zanyat <> 33
and YEAR(Grup.DateExit)>=YEAR(GetDate())
and Vedomost.Itab_n is not null)

