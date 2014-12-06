CREATE TABLE [dbo].[Grup_UchPlan](
	[ik_grup] [int] NOT NULL,
	[ik_uch_plan] [int] NOT NULL,
	[ik_year] [int] NOT NULL,
	[ik_grup_uchplan] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Grup_UchPlan] PRIMARY KEY CLUSTERED 
(
	[ik_grup_uchplan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Grup_UchPlan]  WITH CHECK ADD  CONSTRAINT [FK_Grup_UchPlan_Grup] FOREIGN KEY([ik_grup])
REFERENCES [dbo].[Grup] ([Ik_grup])
GO

ALTER TABLE [dbo].[Grup_UchPlan] CHECK CONSTRAINT [FK_Grup_UchPlan_Grup]
GO

ALTER TABLE [dbo].[Grup_UchPlan]  WITH CHECK ADD  CONSTRAINT [FK_Grup_UchPlan_Uch_pl] FOREIGN KEY([ik_uch_plan])
REFERENCES [dbo].[Uch_pl] ([ik_uch_plan])
GO

ALTER TABLE [dbo].[Grup_UchPlan] CHECK CONSTRAINT [FK_Grup_UchPlan_Uch_pl]
GO

ALTER TABLE [dbo].[Grup_UchPlan]  WITH CHECK ADD  CONSTRAINT [FK_Grup_UchPlan_Year_uch_pl] FOREIGN KEY([ik_year])
REFERENCES [dbo].[Year_uch_pl] ([ik_year_uch_pl])
GO

ALTER TABLE [dbo].[Grup_UchPlan] CHECK CONSTRAINT [FK_Grup_UchPlan_Year_uch_pl]
GO

insert into Year_uch_pl(year_value)
values(2015)
insert into Year_uch_pl(year_value)
values(2016)
insert into Year_uch_pl(year_value)
values(2017)
insert into Year_uch_pl(year_value)
values(2018)
insert into Year_uch_pl(year_value)
values(2019)

delete from Grup_UchPlan

declare @col int
declare @Ik_uch_plan int
declare @Ik_grup int
declare @DateCreate date
declare @DateExit date
declare @i int
declare @ik_year int

declare cur1 cursor for
  select year(DateExit)-year(DateCreate),Ik_uch_plan,Ik_grup,DateCreate from grup
open cur1
fetch next from cur1 into @col, @Ik_uch_plan, @Ik_grup, @DateCreate
while @@Fetch_Status = 0
begin
  set @i = 0
  if @Ik_uch_plan is not null
  while @i<@col
  begin
    select @ik_year = ik_year_uch_pl from Year_uch_pl where year_value = year(@DateCreate)+@i
    insert into Grup_UchPlan(ik_grup,ik_uch_plan,ik_year)
	values(@Ik_grup,@Ik_uch_plan,@ik_year)
	set @i = @i + 1
  end
  FETCH NEXT FROM cur1 INTO @col, @Ik_uch_plan, @Ik_grup, @DateCreate
END     
CLOSE cur1
DEALLOCATE cur1

--------------------------------------------------
--удаление индекса IX_Grup_Ik_uch_plan
alter table grup drop FK_Grup_Uch_pl
alter table grup drop column ik_uch_plan
--------------------------------------------------

ALTER VIEW [dbo].[TREE_groups]
AS
SELECT     TOP (100) PERCENT dbo.Grup.Ik_grup,dbo.Grup.ik_spclz, dbo.Grup.Cname_grup, dbo.Relation_spec_fac.ik_spec_fac, dbo.Grup.nYear_post, dbo.Grup_UchPlan.Ik_uch_plan, 
                      dbo.Grup.DateExit, dbo.Grup.DateCreate
FROM         dbo.Grup INNER JOIN
                      dbo.Relation_spec_fac ON dbo.Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac INNER JOIN
                      dbo.Spec_stud ON dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec inner join 
					  dbo.Grup_UchPlan on Grup_UchPlan.ik_grup = dbo.Grup.Ik_grup
					  Where ik_year = (select ik_year_uch_pl from Year_uch_pl where year_value = year(GetDate()))

ORDER BY dbo.Grup.nYear_post

GO
  
-------------------------------------------------
ALTER FUNCTION [dbo].[GetCurrentGrup]
(       
  @ik_spec_fac int
)
RETURNS @Result TABLE
(
  isCurrent					bit,	--признак действующей/недействующей группы
  Ik_grup					int,
  ik_spec_fac				int,
  Cname_grup				varchar(50),
  Ik_uch_plan				int NULL,
  nYear_post				int NULL,
  YearObuch					int null,
  DateCreate				datetime NULL,
  DateExit					datetime NULL,
  ik_spclz					int,
  Cname_spclz				varchar(300)			
)
AS
BEGIN

  insert into @Result(isCurrent,Ik_grup,ik_spec_fac,Cname_grup,Ik_uch_plan,nYear_post,YearObuch,DateCreate,DateExit,ik_spclz, Cname_spclz)
  Select 0,Grup.Ik_grup,Grup.ik_spec_fac,Cname_grup,Grup_UchPlan.Ik_uch_plan,nYear_post,YearObuch,DateCreate,DateExit,Grup.ik_spclz,  spclz.cName_spclz
  from Grup inner join Relation_spec_fac rsf 
  on Grup.ik_spec_fac = rsf.ik_spec_fac 
  inner join Grup_UchPlan on Grup_UchPlan.ik_grup = Grup.Ik_grup
  left join spclz on Grup.ik_spclz = spclz.iK_spclz
  where Grup.ik_spec_fac = @ik_spec_fac 
  and ik_year = (select ik_year_uch_pl from Year_uch_pl where year_value = YEAR(GetDate()))
 
 update @Result set isCurrent = 1 
 where DateExit > GetDate() 
 and DATEFROMPARTS(nYear_post+YearObuch,6,30)>GetDate()

RETURN
END
GO 
----------------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER FUNCTION [dbo].[GrupInfo](@ik_grup int)
RETURNS @Result TABLE
   (
    Ik_grup                 INT,
	ik_spec_fac				int,
	Cname_grup				VARCHAR(50),
	Ik_uch_plan				int,
	nYear_post				int,
	DateCreate				datetime,
	DateExit				datetime,
	ik_spclz				int,
	Cname_spec				varchar(300),
	id_parent				int
   ) 
AS
BEGIN
 INSERT INTO @Result(Ik_grup, ik_spec_fac, Cname_grup, Ik_uch_plan, nYear_post, DateCreate, DateExit, ik_spclz, Cname_spec, id_parent)
	select Grup.Ik_grup, ik_spec_fac, Cname_grup, Grup_UchPlan.Ik_uch_plan, nYear_post, DateCreate, DateExit, Grup.ik_spclz, spclz.cName_spclz, id_parent
	from Grup inner join Grup_UchPlan on Grup_UchPlan.ik_grup = Grup.Ik_grup left join spclz on Grup.ik_spclz = spclz.iK_spclz 
	left join Uch_pl on Grup_UchPlan.Ik_uch_plan=Uch_pl.ik_uch_plan where Grup.Ik_grup = @ik_grup
	and Grup_UchPlan.ik_year = (select ik_year_uch_pl from Year_uch_pl where year_value = YEAR(GetDate()))
  RETURN
END


GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------

EXEC sp_rename 'Grup', 'Class';

create VIEW [dbo].[Grup]
AS
SELECT     dbo.Class.Ik_grup,ik_spec_fac,Cname_grup,nYear_post,DateCreate,DateExit,ik_spclz,ik_uch_plan
FROM       dbo.Class inner join 
					  dbo.Grup_UchPlan on Grup_UchPlan.ik_grup = dbo.Class.Ik_grup
					  Where ik_year = (select ik_year_uch_pl from Year_uch_pl where year_value = year(GetDate()))

GO
