select * from grup order by Cname_grup  --1475

select * from Vedomost where Ik_grup = 1475 
and ik_upContent in (select ik_upContent from Content_UchPl where n_sem=8 and ik_vid_zanyat = 6)
and lPriznak_napr=0

update Uspev set Cosenca=-1 where Ik_ved = 137536 