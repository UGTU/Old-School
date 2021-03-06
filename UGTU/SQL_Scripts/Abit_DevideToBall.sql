USE [ugtu]
GO
/****** Объект:  UserDefinedFunction [dbo].[Abit_EGEDevideToBall]    Дата сценария: 01/21/2009 10:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from [dbo].[Abit_EGEDevideToBall](2008,0)
alter FUNCTION [dbo].[Abit_EGEDevideToBall] 
(
	@nnyear int,
	@idreport int
)
RETURNS @Result TABLE
   (
	id				int             NULL,
    Cname_spec		varchar(100)	NULL,
	Sh_spec			varchar(50)		NULL,
	FormObuch		varchar(50)		NULL,
	Predmet			varchar(50)		NULL,
	int1      		INT				NULL,
	knt1      		INT				NULL,
	int2      		INT				NULL,
	knt2      		INT				NULL,
	int3      		INT				NULL,
	knt3      		INT				NULL,
	int4      		INT				NULL,
	knt4      		INT				NULL,
	int5      		INT				NULL,
	knt5      		INT				NULL,
	int6      		INT				NULL,
	knt6      		INT				NULL,
	int7      		INT				NULL,
	knt7      		INT				NULL,
	int8      		INT				NULL,
	knt8      		INT				NULL,
	int9      		INT				NULL,
	knt9      		INT				NULL,
	int10      		INT				NULL,
	knt10      		INT				NULL,
	int11      		INT				NULL,
	knt11      		INT				NULL,
	int12      		INT				NULL,
	knt12      		INT				NULL,
	int13      		INT				NULL,
	knt13      		INT				NULL,
	int14      		INT				NULL,
	knt14      		INT				NULL,
	int15      		INT				NULL,
	knt15      		INT				NULL,
	int16      		INT				NULL,
	knt16      		INT				NULL,
	int17      		INT				NULL,
	knt17      		INT				NULL,
	int18      		INT				NULL,
	knt18      		INT				NULL,
	int19      		INT				NULL,
	knt19      		INT				NULL,
	int20      		INT				NULL,
	knt20      		INT				NULL
   ) 
AS
BEGIN
 
declare @Cname_spec varchar(100)
declare @Sh_spec varchar(50)
declare @FormObuch varchar(50)
declare @ik_disc int
declare @cName_disc varchar(100)
declare @Count int
declare @id	   int
declare @NNrecord	int


set	@id=1

DECLARE Cursor1 CURSOR LOCAL FAST_FORWARD READ_ONLY FOR
	select distinct dbo.ABIT_Diapazon_spec_fac.NNrecord,dbo.ABIT_Disc.ik_disc,
	Cname_spec,Sh_spec,ReportName,сname_disc
	from dbo.ABIT_postup,dbo.ABIT_Vstup_exam,dbo.ABIT_Diapazon_spec_fac,
      dbo.Relation_spec_fac,dbo.Spec_stud,dbo.ABIT_Disc,dbo.ABIT_Report_spec,dbo.ABIT_Report
	where dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
	and dbo.ABIT_postup.NNrecord = dbo.ABIT_Diapazon_spec_fac.NNrecord
	and dbo.ABIT_Diapazon_spec_fac.ik_spec_fac  = dbo.Relation_spec_fac.ik_spec_fac
	and dbo.ABIT_Diapazon_spec_fac.ik_spec_fac = dbo.ABIT_Report_spec.ik_spec_fac
	and dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec
	and dbo.ABIT_Report_spec.IDReport = dbo.ABIT_Report.IDReport
	and dbo.ABIT_Vstup_exam.ik_disc = dbo.ABIT_Disc.ik_disc
	and ik_sdach = 5															 --Вид сдачи - ЕГЭ
	and dbo.ABIT_Diapazon_spec_fac.NNyear = @nnyear								 --Год поступления
	and dbo.ABIT_Report.IDReport=@idreport										 --Форма обучения
order by Cname_spec,сname_disc
open Cursor1
FETCH NEXT FROM Cursor1 INTO @NNrecord,@ik_disc,@Cname_spec,@Sh_spec,@FormObuch,@cName_disc
WHILE @@FETCH_STATUS = 0
BEGIN 
  insert into @Result values(@id,@Cname_spec,@Sh_spec,@FormObuch,@cName_disc,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  update @Result set int1=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=0 and cosenka<=5 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id--зачисленные
update @Result set knt1=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=0 and cosenka<=5 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id--зачисленные
  
update @Result set int2=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=6 and cosenka<=10 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt2=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=6 and cosenka<=10 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int3=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=11 and cosenka<=15 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt3=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=11 and cosenka<=15 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int4=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=16 and cosenka<=20 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt4=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=16 and cosenka<=20 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int5=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=21 and cosenka<=25 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt5=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=21 and cosenka<=25 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int6=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=26 and cosenka<=30 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt6=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=26 and cosenka<=30 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int7=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=31 and cosenka<=35 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt7=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=31 and cosenka<=35 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int8=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=36 and cosenka<=40 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt8=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=36 and cosenka<=40 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int9=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=41 and cosenka<=45 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt9=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=41 and cosenka<=45 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int10=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=46 and cosenka<=50 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt10=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=46 and cosenka<=50 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int11=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=51 and cosenka<=55 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt11=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=51 and cosenka<=55 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int12=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=56 and cosenka<=60 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt12=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=56 and cosenka<=60 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int13=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=61 and cosenka<=65 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt13=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=61 and cosenka<=65 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int14=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=66 and cosenka<=70 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt14=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=66 and cosenka<=70 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int15=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=71 and cosenka<=75 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt15=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=71 and cosenka<=75 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int16=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=76 and cosenka<=80 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt16=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=76 and cosenka<=80 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int17=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=81 and cosenka<=85 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt17=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=81 and cosenka<=85 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int18=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=86 and cosenka<=90 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt18=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=86 and cosenka<=90 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int19=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=91 and cosenka<=95 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt19=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=91 and cosenka<=95 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

update @Result set int20=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=96 and cosenka<=100 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat in (1,2))
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id
update @Result set knt20=(select count(distinct dbo.ABIT_postup.NN_abit) 
						   from dbo.ABIT_Vstup_exam,dbo.ABIT_postup 
						   where dbo.ABIT_postup.NNrecord = @NNrecord and ik_sdach = 5
							and dbo.ABIT_postup.NN_abit = dbo.ABIT_Vstup_exam.NN_abit
							and ik_disc=@ik_disc and cosenka>=96 and cosenka<=100 and ik_kat_zach in (select Ik_kat_zach from dbo.Kat_zach where ik_type_kat=3)
							and ik_zach in (select ik_zach from dbo.ABIT_sost_zach where ik_type_zach=2)) where id=@id

set @id=@id+1
FETCH NEXT FROM Cursor1 INTO @NNrecord,@ik_disc,@Cname_spec,@Sh_spec,@FormObuch,@cName_disc
END    
CLOSE Cursor1
DEALLOCATE Cursor1

RETURN
END

