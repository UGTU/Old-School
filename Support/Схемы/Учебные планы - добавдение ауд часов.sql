alter table [dbo].[sv_disc]
add iHour_Audit int

go


--заполнение часов аудиторных по текущим значениям
update [dbo].[sv_disc]
set [iHour_Audit]= AllHourCount
FROM
[dbo].[sv_disc] INNER JOIN
(SELECT ik_disc_uch_plan, SUM(HourCount) AllHourCount
FROM
(SELECT DISTINCT Content_UchPl.[ik_upContent], sv_disc.ik_disc_uch_plan, ISNULL([i_hour_per_week],0)*ISNULL(ISNULL(UchPlan_WeekCount_Exception.week_count, sem_uch_pl.kol_ned),1) HourCount
FROM 
	dbo.Uch_pl 
	INNER JOIN
	dbo.sv_disc ON dbo.sv_disc.ik_uch_plan = dbo.Uch_pl.ik_uch_plan INNER JOIN
    dbo.Content_UchPl ON dbo.sv_disc.ik_disc_uch_plan = dbo.Content_UchPl.ik_disc_uch_plan	LEFT JOIN
    dbo.sem_uch_pl  ON dbo.sem_uch_pl.ik_uch_plan = Uch_pl.ik_uch_plan LEFT JOIN
    dbo.UchPlan_WeekCount_Exception ON dbo.Content_UchPl.ik_upContent = dbo.UchPlan_WeekCount_Exception.ik_upContent)allContent
GROUP BY ik_disc_uch_plan)AllDiskHour
ON [sv_disc].ik_disc_uch_plan=AllDiskHour.ik_disc_uch_plan

--ORDER BY AllHourCount

go

SELECT DISTINCT Content_UchPl.[ik_upContent], sv_disc.ik_disc_uch_plan, ISNULL([i_hour_per_week],0)HourCount,ISNULL(ISNULL(UchPlan_WeekCount_Exception.week_count, sem_uch_pl.kol_ned),1)  weekCount
FROM 
	dbo.Uch_pl 
	INNER JOIN
	dbo.sv_disc ON dbo.sv_disc.ik_uch_plan = dbo.Uch_pl.ik_uch_plan INNER JOIN
    dbo.Content_UchPl ON dbo.sv_disc.ik_disc_uch_plan = dbo.Content_UchPl.ik_disc_uch_plan	LEFT JOIN
    dbo.sem_uch_pl  ON dbo.sem_uch_pl.ik_uch_plan = Uch_pl.ik_uch_plan LEFT JOIN
    dbo.UchPlan_WeekCount_Exception ON dbo.Content_UchPl.ik_upContent = dbo.UchPlan_WeekCount_Exception.ik_upContent
ORDER BY weekCount DESC, HourCount DESC
	
	
	




GO

ALTER PROCEDURE [dbo].[GetDisciplines_4filters] 
	@ik_uch_plan	int,
	@ik_ckl_disc	int,
	@ik_grp_disc	int,
	@ik_pdgrp_disc	int,
	@n_sem			int,
	@ik_vid_zan		int,
	@ik_grup		int
AS
declare @table table
(
	ik_disc				int,
	ik_grp_disc			int,
	ik_ckl_disc			int,
	ik_pdgrp_disc		int,
	ik_podckl			int,
	iK_spclz			int,
	cname_ckl_disc1		varchar(100),
	ik_uch_plan			int,
	uchet				bit,
	ihour_gos			int,
	[iHour_Audit]		int,
	ik_disc_uch_plan	int,
	ik_default_kaf		int,
	iindivid			int,
	ViborGroup			int,
	iK_disc1			int,
	cname_disc			varchar(500),
	cName_spclz_short	varchar(20),
	cshortname			varchar(40),
	lpract				bit,
	ik_type_disc		tinyint,
	ik_ed_izm			int,
	ShowToUser			varchar(50)
)

declare @ik_spclz_grup int
declare @vidgos		   int

  if @ik_grup <> 0 
	select @ik_spclz_grup = ik_spclz,  @vidgos = VidGos
	from Grup,Relation_spec_fac where Ik_grup = @ik_grup and Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
  else set @ik_spclz_grup = null

  insert into @table (ik_disc, ik_grp_disc, ik_ckl_disc, ik_pdgrp_disc, ik_podckl, cname_ckl_disc1, ik_uch_plan,
				uchet,ihour_gos, [iHour_Audit], ik_disc_uch_plan, ik_default_kaf, iindivid, ViborGroup, iK_disc1,
				cname_disc, cshortname, lpract, ik_type_disc,iK_spclz, cName_spclz_short, ik_ed_izm, ShowToUser)
	SELECT sv_disc.ik_disc, ik_grp_disc, ik_ckl_disc,ik_pdgrp_disc, ik_podckl, cname_ckl_disc1, ik_uch_plan,
	uchet,ihour_gos, [iHour_Audit], ik_disc_uch_plan, ik_default_kaf, iindivid, ViborGroup, discpln.iK_disc,
	cname_disc, cshortname, lpract, Type_disc.ik_type_disc, sv_disc.iK_spclz, eb.Cshort_spec, Ed_izm.ik_ed_izm, ShowToUser

	FROM sv_disc INNER JOIN discpln ON sv_disc.ik_disc = discpln.ik_disc
	inner join Type_disc on discpln.ik_type_disc = Type_disc.ik_type_disc
	inner join Ed_izm on Type_disc.ik_ed_izm = Ed_izm.ik_ed_izm
	left join EducationBranch eb on sv_disc.iK_spclz = eb.ik_spec
	WHERE sv_disc.ik_uch_plan = @ik_uch_plan
	and ((sv_disc.ik_pdgrp_disc = @ik_pdgrp_disc)or(@ik_pdgrp_disc = 3))	--фильтр по подгруппе
	and ((sv_disc.ik_grp_disc = @ik_grp_disc)or(@ik_grp_disc = 9))			--фильтр по группе
	and ((sv_disc.ik_ckl_disc = @ik_ckl_disc)or(@ik_ckl_disc = 11))			--фильтр по циклу
	and ((@n_sem in (select n_sem from Content_UchPl where ik_disc_uch_plan=sv_disc.ik_disc_uch_plan))or(@n_sem=0))	--фильтр по семестру
	ORDER BY ik_spec,Cshort_spec,Cname_disc

  /*if (@ik_grup <> 0)and(@vidgos>1)
	begin
	  if (@ik_spclz_grup is null) delete from @table where (iK_spclz is not null)
	  else delete from @table where (iK_spclz <> @ik_spclz_grup)
	end*/

	update @table set cName_spclz_short = '<все профили>' where cName_spclz_short is null

  if (@ik_vid_zan=0)
	begin
		SELECT * FROM @table
	end
	else
	begin
		if (@n_sem=0)
		begin
			SELECT * FROM @table t
			where @ik_vid_zan in (select ik_vid_zanyat from Content_UchPl
						where ik_disc_uch_plan=t.ik_disc_uch_plan)
		end
		else 
		begin
			SELECT * FROM @table t
			where @ik_vid_zan in (select ik_vid_zanyat from Content_UchPl
						where ik_disc_uch_plan=t.ik_disc_uch_plan and n_sem=@n_sem)
		end
	end


