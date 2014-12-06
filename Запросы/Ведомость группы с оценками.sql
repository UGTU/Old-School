select * from Grup where Cname_grup='ÂÂ-09'

delete  from Vedomost where Ik_grup = 1065
and ik_upContent in (select ik_upContent from Content_UchPl where ik_disc_uch_plan = 34477)

delete from Uspev where Ik_ved in (select Ik_ved  from Vedomost where Ik_grup = 1065
and ik_upContent in (select ik_upContent from Content_UchPl where ik_disc_uch_plan = 34477))

select * from sv_disc where ik_uch_plan = 705 and ik_disc = 435