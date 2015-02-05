--EXEC	[dbo].[StudGetInfForSprav] @Ik_studGrup = 42062
ALTER   procedure [dbo].[StudGetInfForSprav](@Ik_studGrup INT)
as

declare @Date DATETIME
SET @Date=GETDATE()


	SELECT year(@Date)-nYear_post + iif(MONTH(@Date)>8,1,0) as kurs,RTRIM(dbo.FIOToDat(Clastname,2)) + ' '+ dbo.FIOToDat(Cfirstname,1) + ' '+ dbo.FIOToDat(isnull(Cotch,''),3) as FIO,
		   DAY(@Date) as sprDate, Month(@Date) as sprMonth, YEAR(@Date) as sprYear,
			1 as zachDate, 9 as zachMonth, year(Prikaz.Dd_prikazVst) zachYear,
			Cshort_spec, Cname_spec, Cname_fac_rod_pad, fac.ik_fac, YEAR(Dd_birth)[studBirthYear], ManagerSmallName,Dep_Index ,
			Podgot, fe.Cname_form_pril,DepPhoneNumber,Grup.Cname_grup, YEAR(Dd_prikazVst) AS YearPricZach, year(Grup.DateExit) YearGrupEnd
		FROM StudGrup 
		    inner join Zach on StudGrup.Ik_zach = Zach.Ik_zach
			inner join Person on Zach.nCode = Person.nCode
		    inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
			inner join Relation_spec_fac rsf on Grup.ik_spec_fac = rsf.ik_spec_fac
			INNER JOIN Spec_stud ON rsf.ik_spec=Spec_stud.ik_spec
			INNER JOIN fac ON rsf.ik_fac=fac.ik_fac 
			INNER JOIN Import.DepartmentMainData import_dmd ON fac.DepartmentGUID=import_dmd.DepartmentGUID 
			Inner join Direction _dir On Spec_stud.ik_direction =_dir.ik_direction
			Inner join Form_ed fe ON rsf.Ik_form_ed=fe.Ik_form_ed
			inner join (select Ik_zach, min(Prikaz.Ik_prikaz) ik_zac_first
						from StudGrup inner join Prikaz on StudGrup.Ik_prikazZach = Prikaz.Ik_prikaz
						where Ik_zach in (select Ik_zach from StudGrup where Ik_studGrup=@Ik_studGrup) group by Ik_zach) grs
						on grs.Ik_zach = StudGrup.Ik_zach
			inner join Prikaz on ik_zac_first = Prikaz.Ik_prikaz
			WHERE  [Ik_studGrup]=@Ik_studGrup

--select * from StudHistory(42062)
alter function StudHistory(@Ik_studGrup INT)
RETURNS @Result TABLE
(
	Dd_prikazVst	date,
	Nn_prikaz		varchar(20),
	Cname_pric		varchar(50)
)
AS
BEGIN
	insert into @Result(Dd_prikazVst, Nn_prikaz, Cname_pric)
		select cast(Dd_prikazVst as date), Nn_prikaz, Cname_pric
		from StudGrup inner join Prikaz on StudGrup.Ik_prikazZach = Prikaz.Ik_prikaz
					  inner join Pricina on StudGrup.ik_pricZach = Pricina.Ik_pric
		where ik_zach in (select ik_zach from StudGrup where Ik_studGrup = @Ik_studGrup)
		union
		select cast(Dd_prikazVst as date), Nn_prikaz, Cname_pric
		from StudGrup inner join Prikaz on StudGrup.Ik_prikazOtch = Prikaz.Ik_prikaz
					  inner join Pricina on StudGrup.ik_pricOtch = Pricina.Ik_pric
		where ik_zach in (select ik_zach from StudGrup where Ik_studGrup = @Ik_studGrup)
RETURN
END

GO

