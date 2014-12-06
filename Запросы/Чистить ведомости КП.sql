select count([Ik_ved]) c_ved, Vedomost.Ik_grup, Vedomost.[ik_upContent], n_sem
from [dbo].[Vedomost], Content_UchPl, Grup
where Content_UchPl.ik_upContent = Vedomost.ik_upContent
and Grup.Ik_grup = Vedomost.Ik_grup
and ik_vid_zanyat = 8
and lPriznak_napr = 0
group by Vedomost.Ik_grup, Vedomost.[ik_upContent], n_sem
order by c_ved

select * from discpln order by cName_disc
select * from sv_disc where ik_disc = 1415

select * from Grup order by Cname_grup  --1761

select * from Vedomost, Content_UchPl
where Ik_grup = 1761
and Vedomost.ik_upContent =  Content_UchPl.ik_upContent 
and ik_vid_zanyat = 8
order by ik_disc_uch_plan

delete from Vedomost where Ik_ved =    --326157 326161

delete from Content_UchPl where ik_upContent in (326157)