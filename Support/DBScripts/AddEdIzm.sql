--------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[Ed_izm](
	[ik_ed_izm] [int] IDENTITY(1,1) NOT NULL,
	[cName_izm] [varchar](50) NOT NULL,
	[ShowToUser] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ed_izm] PRIMARY KEY CLUSTERED 
(
	[ik_ed_izm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
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
				uchet,ihour_gos, ik_disc_uch_plan, ik_default_kaf, iindivid, ViborGroup, iK_disc1,
				cname_disc, cshortname, lpract, ik_type_disc,iK_spclz, cName_spclz_short, ik_ed_izm, ShowToUser)
	SELECT sv_disc.ik_disc, ik_grp_disc, ik_ckl_disc,ik_pdgrp_disc, ik_podckl, cname_ckl_disc1, ik_uch_plan,
	uchet,ihour_gos, ik_disc_uch_plan, ik_default_kaf, iindivid, ViborGroup, discpln.iK_disc,
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

  if (@ik_grup <> 0)and(@vidgos>1)
	begin
	  if (@ik_spclz_grup is null) delete from @table where (iK_spclz is not null)
	  else delete from @table where (iK_spclz <> @ik_spclz_grup)
	end

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

GO

------------------------------------------------------------------------------------------------------------
select * from sv_disc
where ik_disc in (select ik_disc from discpln
				  where discpln.ik_type_disc = 5)

update sv_disc set iHour_gos = 1
where ik_disc in (select ik_disc from discpln
				  where discpln.ik_type_disc = 5)

update sv_disc set iHour_gos = iHour_gos*6
where ik_disc in (select ik_disc from discpln, Type_disc
				  where discpln.ik_type_disc = Type_disc.ik_type_disc
				  and ik_ed_izm = 2)

-------------------------------------------------------------------------------------------------------------
create VIEW [dbo].[AllDisciplines]
AS
Select discpln.iK_disc, RTRIM(discpln.cName_disc) as name_disc, discpln.ik_type_disc,Type_disc.ik_ed_izm, Ed_izm.ShowToUser 
From discpln, Type_disc, Ed_izm
where discpln.ik_type_disc = Type_disc.ik_type_disc  
and Type_disc.ik_ed_izm = Ed_izm.ik_ed_izm 
GO

--ДАТЬ ПРАВА!

-------------------------------------------------------------------------------------------------------------
--права:
	--software developers
	--все (ИС УГТУ)
ALTER Procedure [dbo].[Get_DiscUchPlan_YearUchPlan]
@ik_disc_uch_plan int
as
--параметры плана, дисциплина которого поменялась
select year_value, sv_disc.ik_uch_plan, grup_comment, ik_disc_uch_plan
from  sv_disc inner join Uch_pl on Uch_pl.ik_uch_plan = sv_disc.ik_uch_plan
inner join Year_uch_pl yup on yup.ik_year_uch_pl=Uch_pl.ik_year_uch_pl
where sv_disc.ik_disc_uch_plan = @ik_disc_uch_plan
GO




select * from sv_disc where ik_disc_uch_plan = 72112

select * from sv_disc_relation where depends_on_ik =  77794

select * from EducationBranch where ik_spec = 295