--Нужна выборка из ведомостей для фактической нагрузки:
--
--На вход подается:
--iTab_n - табельный номер препода
--ik_calc_unit - ID расч. единицы - из него можно получить ik_uch_plan: (SELECT ik_uch_plan FROM Calc_unit WHERE ik_calc_unit = @CalcUnitIK)
--ik_type_ed - ID типа обучения (бюджет, контракт) - из него можно получить ik_type_kat
--ik_disc
--ik_grup
--n_sem - номер семестра
--ik_vid_zanyat
--
--На выходе должна быть таблица:
--
--Дата, время                        Кол-во человек, которые сдали
--
--В таблице должны учитываться и ведомости и направления (хотя направления пока можно сделать в отдельную таблицу)
use ugtu

declare @ik_group int
select @ik_group=
	ik_grup from grup where Cname_grup ='ИСТ-04'

declare @n_sem int
set @n_sem=8

declare @ik_vid_zanyat int
set @ik_vid_zanyat=6

declare @ik_disc int
select @ik_disc=iK_disc 
from dbo.discpln where cName_disc='Информационные сети'

declare @ik_type_kat int
set @ik_type_kat=1



select * 
from 
dbo.Grup, dbo.sv_disc, dbo.Content_UchPl,
dbo.Vedomost, dbo.Uspev, dbo.StudGrup, dbo.Kat_zach
where
Grup.ik_grup=@ik_group 
and Grup.ik_uch_plan=sv_disc.ik_uch_plan
and sv_disc.ik_disc=@ik_disc
and sv_disc.ik_disc_uch_plan=Content_UchPl.ik_disc_uch_plan
and Content_UchPl.ik_vid_zanyat=@ik_vid_zanyat and Content_UchPl.n_sem=@n_sem
and Content_UchPl.ik_upContent=Vedomost.ik_upContent
and Vedomost.ik_grup=@ik_group
and Vedomost.ik_ved=Uspev.ik_ved
and StudGrup.ik_grup=@ik_group
and Uspev.Ik_zach=StudGrup.Ik_zach
and StudGrup.Ik_kat_zach=Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat=@ik_type_kat



select Dd_exam, lPriznak_napr, count(*) as StudCount 
from 
dbo.Grup, dbo.sv_disc, dbo.Content_UchPl,
dbo.Vedomost, dbo.Uspev, dbo.StudGrup, dbo.Kat_zach
where
Grup.ik_grup=@ik_group 
and Grup.ik_uch_plan=sv_disc.ik_uch_plan
and sv_disc.ik_disc=@ik_disc
and sv_disc.ik_disc_uch_plan=Content_UchPl.ik_disc_uch_plan
and Content_UchPl.ik_vid_zanyat=@ik_vid_zanyat and Content_UchPl.n_sem=@n_sem
and Content_UchPl.ik_upContent=Vedomost.ik_upContent
and Vedomost.ik_grup=@ik_group
and Vedomost.ik_ved=Uspev.ik_ved
and StudGrup.ik_grup=@ik_group
and Uspev.Ik_zach=StudGrup.Ik_zach
and Uspev.Cosenca>2
and StudGrup.Ik_kat_zach=Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat=@ik_type_kat
group by Dd_exam, lPriznak_napr



