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
					  Where (ik_year = (select ik_year_uch_pl from Year_uch_pl where year_value = year(GetDate())))
					  or ((dbo.Grup.DateExit<GetDate())and(ik_year =(select ik_year_uch_pl from Year_uch_pl where year_value = year(dbo.Grup.DateExit)-1)))

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

ALTER FUNCTION [dbo].[UspevGetVidZanyatForVedomost]
(
	@n_sem int, 
	@Ik_grup int
)
RETURNS @Result TABLE
(
	ik_vid_zanyat		int NOT NULL,
	cName_vid_zanyat	VARCHAR(50) NULL,
	Content_name		varchar(500),
	ik_upContent		int,
	ik_ved				int,
	lClose				bit,
	Itab_n				varchar(50),
	Dd_exam				datetime,
	cNumber_ved			varchar(50),
	HasTema				bit

	--CreateEnable		bit not null,	--можно ли создать
	--IsCreated			bit not null,	--создан
	--IsDependent			bit  null		--зависит от др. видов зан€тий
 )
AS
BEGIN

insert INTO @Result(ik_vid_zanyat, cName_vid_zanyat, Content_name, ik_upContent, ik_ved, lClose, Itab_n, Dd_exam, cNumber_ved, HasTema)
SELECT DISTINCT vid_zaniat.ik_vid_zanyat, vid_zaniat.cName_vid_zanyat, discpln.cName_disc + ', ' + cName_vid_zanyat,
				Content_UchPl.ik_upContent, Vedomost.Ik_ved, Vedomost.lClose, Itab_n, Dd_exam, cNumber_ved, lTema
FROM Grup 
	inner join Grup_UchPlan on Grup_UchPlan.ik_grup = Grup.Ik_grup
	inner join sv_disc on sv_disc.ik_uch_plan = Grup_UchPlan.ik_uch_plan
	inner join  discpln on discpln.iK_disc = sv_disc.ik_disc
	inner join Content_UchPl on Content_UchPl.ik_disc_uch_plan=sv_disc.ik_disc_uch_plan
	inner join dbo.vid_zaniat on Content_UchPl.ik_vid_zanyat=vid_zaniat.ik_vid_zanyat
	inner join dbo.TypeZanyat on TypeZanyat.ikTypeZanyat=vid_zaniat.ikTypeZanyat
	inner join Year_uch_pl on Grup_UchPlan.ik_year = Year_uch_pl.ik_year_uch_pl
	left join Vedomost on Vedomost.ik_upContent = Content_UchPl.ik_upContent and Vedomost.Ik_grup = Grup.Ik_grup
WHERE	Content_UchPl.n_sem=@n_sem AND 

	Grup.Ik_grup=@Ik_grup AND 
	(TypeZanyat.bitOtchetnost=1) AND
	(sv_disc.iK_spclz IS NULL OR sv_disc.iK_spclz=Grup.ik_spclz OR Grup.ik_spclz IS NULL) 
	and year_value = Grup.nYear_post + cast((@n_sem-1)*0.5 as int)  --это определение учебного года на основании семестра
	and ((Vedomost.lPriznak_napr is null)or(Vedomost.lPriznak_napr=0))

/*DECLARE @ik_vid_zanyat		INT
DECLARE @cName_vid_zanyat	VARCHAR(50) 
DECLARE @ik_uch_plan		INT
DECLARE @ik_upContent       INT

--¬џЅ»–ј≈ћ ¬—≈ виды зан€тий, по которым должны создаватьс€ ведомости
--и которые есть в учебном плане
DECLARE VidZanyatCursor CURSOR LOCAL FAST_FORWARD READ_ONLY FOR 
SELECT DISTINCT vid_zaniat.ik_vid_zanyat, vid_zaniat.cName_vid_zanyat, Grup_UchPlan.ik_uch_plan,Content_UchPl.ik_upContent
FROM 
dbo.Content_UchPl, dbo.sv_disc, dbo.Grup, dbo.vid_zaniat, dbo.TypeZanyat,Grup_UchPlan,Year_uch_pl	
WHERE 
	Content_UchPl.ik_disc_uch_plan=sv_disc.ik_disc_uch_plan AND
	Content_UchPl.n_sem=@n_sem AND 
	Content_UchPl.ik_vid_zanyat=vid_zaniat.ik_vid_zanyat AND 
	TypeZanyat.ikTypeZanyat=vid_zaniat.ikTypeZanyat AND
	Grup_UchPlan.ik_grup = Grup.Ik_grup AND
	Grup_UchPlan.ik_uch_plan=sv_disc.ik_uch_plan AND
	Grup.Ik_grup=@Ik_grup AND 
	Grup_UchPlan.ik_year = Year_uch_pl.ik_year_uch_pl AND
	TypeZanyat.bitOtchetnost=1 AND
	(sv_disc.iK_spclz IS NULL OR sv_disc.iK_spclz=Grup.ik_spclz OR Grup.ik_spclz IS NULL) 
	AND n_module IS NULL AND i_balls IS NULL
	and year_value = Grup.nYear_post + cast((@n_sem-1)*0.5 as int)  --это определение учебного года на основании семестра
OPEN VidZanyatCursor

FETCH NEXT FROM VidZanyatCursor INTO @ik_vid_zanyat, @cName_vid_zanyat, @ik_uch_plan,@ik_upContent

WHILE @@FETCH_STATUS = 0
BEGIN

 
	--провер€ем созданы ли ведомости (в этом случае считаем,что их можно создать не провер€€
	IF EXISTS(SELECT 'TRUE' FROM dbo.Vedomost, dbo.Content_UchPl, sv_disc, grup 
				WHERE Content_UchPl.n_sem=@n_sem AND Content_UchPl.ik_vid_zanyat=@ik_vid_zanyat AND
						Vedomost.Ik_grup=@Ik_grup AND 
						Vedomost.lPriznak_napr=0 AND --не направление 
						Vedomost.lVnosn=0 AND --не выносной
						 --Content_UchPl.n_module is NULL
						--AND Content_UchPl.i_balls IS NULL AND
						Vedomost.ik_upContent=Content_UchPl.ik_upContent
						and Content_UchPl.ik_disc_uch_plan=sv_disc.ik_disc_uch_plan
						and sv_disc.ik_uch_plan=@ik_uch_plan
						and grup.ik_grup=@Ik_grup)
	BEGIN
		INSERT INTO @Result(ik_vid_zanyat, cName_vid_zanyat, CreateEnable, IsCreated, IsDependent)
		SELECT @ik_vid_zanyat, @cName_vid_zanyat,1,1, 0
	END

	ELSE
	BEGIN

		INSERT INTO @Result(ik_vid_zanyat, cName_vid_zanyat, CreateEnable, IsCreated, IsDependent)
		SELECT @ik_vid_zanyat, @cName_vid_zanyat,1,
			--dbo.UspevCanCreateVedForVidZanyat(@n_sem, @Ik_grup, @ik_vid_zanyat), --ѕ–ќ¬≈–я≈ћ, „“ќ все ведомости по тем видам зан€тий, которые согласно правилам должны быть закрыты, чтобы создать данные ведомости, —ќ«ƒјЌџ » «ј –џ“џ
			0, 0
	END

	FETCH NEXT FROM VidZanyatCursor INTO @ik_vid_zanyat, @cName_vid_zanyat, @ik_uch_plan,@ik_upContent

END*/

--ѕ–ќ¬≈–я≈ћ, я¬Ћя≈“—я Ћ» ¬»ƒ «јЌя“»… "«ј¬»—»ћџћ" - т.е. ƒЋя —ќ«ƒјЌ»я ¬≈ƒќћќ—“≈… ƒ.Ѕ. 
--—ќ«ƒјЌџ » «ј –џ“џ ¬≈ƒќћќ—“» ƒ–. ¬»ƒќ¬ «яЌя“»…
--и чтобы эти виды зан€тий были в уч. плане текущего семестра
/*UPDATE 	@Result 
	SET IsDependent=1
	from  dbo.Grup, dbo.Relation_spec_fac, dbo.UspevRuleContent, @Result as result
	WHERE  Grup.ik_spec_fac=Relation_spec_fac.ik_spec_fac AND Grup.Ik_grup=@Ik_grup AND
			Relation_spec_fac.ik_rule=UspevRuleContent.ik_rule AND 
			UspevRuleContent.ik_dependVid_zanyat=result.ik_vid_zanyat
			AND UspevRuleContent.ik_Vid_zanyat in (select ik_Vid_zanyat from @Result)*/
return 
end

GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
alter PROCEDURE [dbo].[AppendVedomost]
@flag INT, 
@Ik_ved INT,						--код ведомости		
@cNumber_ved varchar(12) = NULL,	--номер (обозначение) ведомости
@Itab_n varchar(50) = NULL,			--код препода
@Ik_vid_exam INT = NULL,			--вид экзамена (первичный, вторичный)
@Dd_exam DATETIME = NULL,			--дата экзамена
@lClose BIT=0,
@lPriznak_napr BIT = NULL			--признак направлени€

AS
  IF @flag=-1  --удаление ведомости
  BEGIN
	DELETE FROM Vedomost
	WHERE Ik_ved = @Ik_ved
  END

  IF @flag=0  --редактирование ведомости
  BEGIN
		UPDATE Vedomost 
		SET cNumber_ved = @cNumber_ved, Itab_n = @Itab_n, Ik_vid_exam = @Ik_vid_exam, 
			Dd_exam = @Dd_exam, lPriznak_napr = @lPriznak_napr, lClose = @lClose
		WHERE Ik_ved = @Ik_ved
  END


GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create FUNCTION [dbo].[GetNapravlInfo]
(
	@ik_studGrup int
)
RETURNS @Result TABLE
(
	n_sem				int NOT NULL,
	Content_name		varchar(500),
	ik_upContent		int,
	ik_ved				int,
	lClose				bit,
	Itab_n				varchar(50),
	Dd_exam				datetime,
	dD_vydano			datetime,
	cNumber_ved			varchar(50)
 )
AS
BEGIN
  insert INTO @Result(n_sem, Content_name, ik_upContent, ik_ved, lClose, Itab_n, Dd_exam, dD_vydano, cNumber_ved)
  SELECT n_sem, discpln.cName_disc + ', ' + vid_zaniat.cName_vid_zanyat, Content_UchPl.ik_upContent, Vedomost.Ik_ved,
		 lClose, Itab_n, Dd_exam, dD_vydano, cNumber_ved
  from StudGrup 
  inner join Grup on Grup.Ik_grup = StudGrup.Ik_grup
  inner join Grup_UchPlan on Grup.Ik_grup = Grup_UchPlan.Ik_grup
  inner join Year_uch_pl on Year_uch_pl.ik_year_uch_pl = Grup_UchPlan.ik_year
  inner join sv_disc on Grup_UchPlan.ik_uch_plan = sv_disc.ik_uch_plan
  inner join discpln on sv_disc.ik_disc = discpln.iK_disc
  inner join Content_UchPl on sv_disc.ik_disc_uch_plan = Content_UchPl.ik_disc_uch_plan
  inner join vid_zaniat on Content_UchPl.ik_vid_zanyat = vid_zaniat.iK_vid_zanyat
  inner join dbo.TypeZanyat on TypeZanyat.ikTypeZanyat=vid_zaniat.ikTypeZanyat
  left join Vedomost on Vedomost.ik_upContent = Content_UchPl.ik_upContent and Vedomost.Ik_grup = Grup.Ik_grup
  left join Uspev on Uspev.Ik_ved = Vedomost.Ik_ved and Uspev.Ik_zach = StudGrup.Ik_zach
  Where Ik_studGrup = @ik_studGrup and year_value=year(GetDate())
  and TypeZanyat.bitOtchetnost=1
  and ((Vedomost.Ik_ved is null) or ((Vedomost.lPriznak_napr=0)and(Vedomost.lClose = 1)and((Uspev.Cosenca<>1)and(Uspev.Cosenca<=2)))) --нет ведомости или оценки

return 
end

GO

--¬џƒј“№ ѕ–ј¬ј Ќј ‘”Ќ ÷»ё

--------------------------------------------------------------------------------------------------------------------------------------------

alter FUNCTION [dbo].[GetStudNaprav]
(
	@ik_studGrup int
)
RETURNS @Result TABLE
(
	n_sem				int NOT NULL,
	Content_name		varchar(500),
	ik_upContent		int,
	ik_ved				int,
	lClose				varchar(20),
	Itab_n				varchar(50),
	Dd_exam				datetime,
	dD_vydano			datetime,
	cNumber_ved			varchar(50),
	KPTheme				varchar(2000),
	cName_vid_exam		varchar(12),
	Cosenca				varchar(20)
 )
AS
BEGIN
  insert INTO @Result(n_sem, Content_name, ik_upContent, ik_ved, lClose, Itab_n, Dd_exam, dD_vydano, cNumber_ved, KPTheme,cName_vid_exam,Cosenca)
  SELECT n_sem, discpln.cName_disc + ', ' + vid_zaniat.cName_vid_zanyat, Content_UchPl.ik_upContent, Vedomost.Ik_ved,
		 cast(lClose as varchar(20)), Itab_n, Dd_exam, dD_vydano, cNumber_ved, KPTheme, cName_vid_exam,cast(Cosenca as varchar(20))
  from StudGrup 
  inner join Grup on Grup.Ik_grup = StudGrup.Ik_grup
  inner join Grup_UchPlan on Grup.Ik_grup = Grup_UchPlan.Ik_grup
  inner join Year_uch_pl on Year_uch_pl.ik_year_uch_pl = Grup_UchPlan.ik_year
  inner join sv_disc on Grup_UchPlan.ik_uch_plan = sv_disc.ik_uch_plan
  inner join discpln on sv_disc.ik_disc = discpln.iK_disc
  inner join Content_UchPl on sv_disc.ik_disc_uch_plan = Content_UchPl.ik_disc_uch_plan
  inner join vid_zaniat on Content_UchPl.ik_vid_zanyat = vid_zaniat.iK_vid_zanyat
  inner join dbo.TypeZanyat on TypeZanyat.ikTypeZanyat=vid_zaniat.ikTypeZanyat
  inner join Vedomost on Vedomost.ik_upContent = Content_UchPl.ik_upContent and Vedomost.Ik_grup = Grup.Ik_grup
  inner join Vid_exam on Vid_exam.ik_vid_exam = Vedomost.ik_vid_exam
  inner join Uspev on Uspev.Ik_ved = Vedomost.Ik_ved and Uspev.Ik_zach = StudGrup.Ik_zach
  left join UspevDocument on UspevDocument.ik_upContent = Content_UchPl.ik_upContent and UspevDocument.ik_zach = StudGrup.Ik_zach
  left join UspevKPTheme on UspevKPTheme.idUspevDocs = UspevDocument.idUspevDocs
  Where Ik_studGrup = @ik_studGrup and year_value=year(GetDate())
  and TypeZanyat.bitOtchetnost=1 and lPriznak_napr=1

  update @Result set Cosenca = NULL where Cosenca=-1
  update @Result set Cosenca = 'зачтено' where Cosenca=1

  update @Result set lClose = 'открыто' where lClose = '0'
  update @Result set lClose = 'закрыто' where lClose = '1'
  update @Result set lClose = 'аннулир.' where lClose is null

return 
end

GO

--¬џƒј“№ ѕ–ј¬ј Ќј ‘”Ќ ÷»ё

--------------------------------------------------------------------------------------------------------------------------------------------