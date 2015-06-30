USE [UGTU_ACTTEST]
GO

/****** Object:  UserDefinedFunction [dbo].[StudHistory]    Script Date: 23.05.2015 14:14:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




--select * from [StudHistForSpr](96)
Alter procedure [dbo].[StudHistForSpr](@ik_document INT)
--RETURNS @Result TABLE
--(
--	daypric int,
--	monthpric int,
--	yearpric int,
--	Nn_prikaz		varchar(20),
--	Cname_pric		varchar(50),
--	Dd_prikazVst    date,
--	ikTypePric int
--)
AS
declare @Date DATETIME
SET @Date  = (select DateCreate from Document where Ik_Document=@ik_document)
--BEGIN
	--insert into @Result(daypric,monthpric,yearpric,Nn_prikaz, Cname_pric,Dd_prikazVst,ikTypePric)
	Select * From(	select day(Dd_prikazVst) as daypric,month(Dd_prikazVst) as monthpric, year(Dd_prikazVst) as yearpric, Nn_prikaz, Cname_pric,Dd_prikazVst,ikTypePric
		from StudGrup inner join Prikaz on StudGrup.Ik_prikazZach = Prikaz.Ik_prikaz
					  inner join Pricina on StudGrup.ik_pricZach = Pricina.Ik_pric
		where ik_zach in (select ik_zach from StudGrup where Ik_studGrup in (select StudGrup.Ik_studGrup from StudGrup iner join Document
		on StudGrup.Ik_studGrup=Document.Ik_studGrup
		where Ik_Document=@ik_document))
		  and Pricina.ikTypePric not in (17,18) and Dd_prikazVst<@Date
		union
		select day(Dd_prikazVst) as daypric,month(Dd_prikazVst) as monthpric, year(Dd_prikazVst) as yearpric, Nn_prikaz, Cname_pric,Dd_prikazVst,ikTypePric
		from StudGrup inner join Prikaz on StudGrup.Ik_prikazOtch = Prikaz.Ik_prikaz
					  inner join Pricina on StudGrup.ik_pricOtch = Pricina.Ik_pric
		where ik_zach in (select ik_zach from StudGrup where Ik_studGrup in (select StudGrup.Ik_studGrup from StudGrup iner join Document
		on StudGrup.Ik_studGrup=Document.Ik_studGrup
		where Ik_Document=@ik_document))
		  and Pricina.ikTypePric not in (17,18)and Dd_prikazVst<@Date)td
		order by td.Dd_prikazVst 
--RETURN

DECLARE	@return_value int

EXEC	@return_value = [dbo].[StudHistForSpr]
		@ik_document = 96

SELECT	'Return Value' = @return_value

GO
