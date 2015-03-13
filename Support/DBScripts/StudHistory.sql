--select * from StudHistory(42062)
ALTER function [dbo].[StudHistory](@Ik_studGrup INT)
RETURNS @Result TABLE
(
	daypric int,
	monthpric int,
	yearpric int,
	Nn_prikaz		varchar(20),
	Cname_pric		varchar(50),
	Dd_prikazVst    date,
	ikTypePric int
)
AS
BEGIN
	insert into @Result(daypric,monthpric,yearpric,Nn_prikaz, Cname_pric,Dd_prikazVst,ikTypePric)
	Select * From(	select day(Dd_prikazVst) as daypric,month(Dd_prikazVst) as monthpric, year(Dd_prikazVst) as yearpric, Nn_prikaz, Cname_pric,Dd_prikazVst,ikTypePric
		from StudGrup inner join Prikaz on StudGrup.Ik_prikazZach = Prikaz.Ik_prikaz
					  inner join Pricina on StudGrup.ik_pricZach = Pricina.Ik_pric
		where ik_zach in (select ik_zach from StudGrup where Ik_studGrup = @Ik_studGrup)
		  and Pricina.ikTypePric not in (17,18)
		union
		select day(Dd_prikazVst) as daypric,month(Dd_prikazVst) as monthpric, year(Dd_prikazVst) as yearpric, Nn_prikaz, Cname_pric,Dd_prikazVst,ikTypePric
		from StudGrup inner join Prikaz on StudGrup.Ik_prikazOtch = Prikaz.Ik_prikaz
					  inner join Pricina on StudGrup.ik_pricOtch = Pricina.Ik_pric
		where ik_zach in (select ik_zach from StudGrup where Ik_studGrup = @Ik_studGrup)
		  and Pricina.ikTypePric not in (17,18))td
		order by td.Dd_prikazVst 
RETURN
END

GO


