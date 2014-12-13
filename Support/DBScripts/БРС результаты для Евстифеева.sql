select Person.Clastname + ' ' + Person.Cfirstname + ' ' + Person.Cotch fio, Grup.Cname_grup, discpln.cName_disc, Uspev.i_balls, Uspev.Cosenca
from Vedomost, Content_UchPl, Uspev, StudGrup, grup,Person, Zach, sv_disc, discpln
where Vedomost.ik_upContent = Content_UchPl.ik_upContent and Vedomost.Ik_ved = Uspev.Ik_ved
and Uspev.Ik_zach = Zach.Ik_zach and Zach.nCode = Person.nCode and Zach.Ik_zach = StudGrup.Ik_zach
and StudGrup.Ik_grup = Grup.Ik_grup and Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
and sv_disc.ik_disc = discpln.iK_disc
and Content_UchPl.i_balls>0
and Content_UchPl.ik_vid_zanyat = 6
and Uspev.i_balls between 50 and 60
and Vedomost.Dd_exam > '01.09.2012' and Vedomost.Dd_exam < '01.11.2013'
--and Zach.Ik_zach not in (select Ik_zach from StudGrup where Ik_prikazOtch is null)
order by Uspev.Cosenca

-------------------------------------------------------------------------------------------------------------------------------------------------
--кто не заполняет БРС
select * from
(select Fac.Cname_fac, Grup.Cname_grup, discpln.cName_disc, cast(n_sem as varchar(1)) + ' семестр' semestr, isnull(cast(Content_UchPl.n_module as varchar(7)),vid_zaniat.cName_vid_zanyat) modul, Vedomost.Ik_ved, count(Uspev.Ik_zach) col_ocen
from Content_UchPl inner join sv_disc on Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
inner join vid_zaniat on vid_zaniat.iK_vid_zanyat = Content_UchPl.ik_vid_zanyat
inner join Grup on Grup.Ik_uch_plan = sv_disc.ik_uch_plan
inner join discpln on sv_disc.ik_disc = discpln.iK_disc
inner join Relation_spec_fac on Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
left join Vedomost on Vedomost.ik_upContent = Content_UchPl.ik_upContent
left join Uspev on Vedomost.Ik_ved = Uspev.Ik_ved
where /*((Vedomost.ik_ved is null)or(Uspev.i_balls is null))
and */Content_UchPl.i_balls>0
and Content_UchPl.ik_vid_zanyat in (6,33)
and Relation_spec_fac.Ik_form_ed = 1
and n_sem < (Year(GETDATE()) - Grup.nYear_post)*2
and n_sem > (year(Grup.DateCreate) - Grup.nYear_post)
group by Fac.Cname_fac, Grup.Cname_grup, discpln.cName_disc, vid_zaniat.cName_vid_zanyat, Content_UchPl.n_module, Vedomost.Ik_ved, n_sem
) temp_t
where Ik_ved is null or col_ocen = 0
order by Cname_fac, Cname_grup, semestr, modul