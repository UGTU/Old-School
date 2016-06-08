select  cast(('30.06.'+ cast(2015 as varchar(4))) as datetime)





select Grup.Cname_grup, Ik_studGrup, Ik_prikaz  from StudGrup inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
	inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
	inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
	inner join
	(select min(Ik_prikaz) Ik_prikaz, YEAR(Dd_prikazVst) year_otch
										  from Prikaz, StudGrup sg
										  where Prikaz.Ik_prikaz = sg.Ik_prikazOtch
											and sg.ik_pricOtch = 3 and Ik_prikaz>0
										  group by YEAR(Dd_prikazVst)) pr_temp
										  on year(Grup.DateExit) = pr_temp.year_otch
	where year(DateExit)<2016
	  and Grup.nYear_post + Relation_spec_fac.YearObuch < 2016
	  and Ik_prikazOtch is null 
	  and Ik_prikazZach is not null 
	  and Ik_zach in (select ik_zach from Diplom where Cosenca is not null)


-------------------------------------отчисление тех, кто сдал диплом---------------------------------------------------------------------
declare @Ik_studGrup int
declare @Ik_prikaz   int

declare cur1 cursor for
	select Ik_studGrup, Ik_prikaz  from StudGrup inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
	inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
	inner join
	(select min(Ik_prikaz) Ik_prikaz, YEAR(Dd_prikazVst) year_otch
										  from Prikaz, StudGrup sg
										  where Prikaz.Ik_prikaz = sg.Ik_prikazOtch
											and sg.ik_pricOtch = 3 and Ik_prikaz>0
										  group by YEAR(Dd_prikazVst)) pr_temp
										  on year(Grup.DateExit) = pr_temp.year_otch
	where year(DateExit)<2016
	  and Grup.nYear_post + Relation_spec_fac.YearObuch < 2016
	  and Ik_prikazOtch is null 
	  and Ik_prikazZach is not null 
	  and Ik_zach in (select ik_zach from Diplom where Cosenca is not null)
open cur1
fetch next from cur1 into @Ik_studGrup, @Ik_prikaz
while @@Fetch_Status = 0
begin
  update StudGrup set Ik_prikazOtch = @Ik_prikaz, ik_pricOtch = 3
  where Ik_studGrup = @Ik_studGrup

  FETCH NEXT FROM cur1 INTO @Ik_studGrup, @Ik_prikaz
END     
CLOSE cur1
DEALLOCATE cur1

-----------------------------создание приказов для отчисления по неизвестной причине---------------------------

insert into [dbo].[Prikaz]([Nn_prikaz],[ik_typePrikaz],[Dd_prikaz],[Dd_prikazVst])
select '<неизвестен>', 1, cast(('30.06.'+cast(year(Grup.DateExit) as varchar(4))) as datetime), cast(('30.06.'+cast(year(Grup.DateExit) as varchar(4))) as datetime)
from StudGrup inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
	inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
	inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
	inner join
	(select min(Ik_prikaz) Ik_prikaz, YEAR(Dd_prikazVst) year_otch
										  from Prikaz, StudGrup sg
										  where Prikaz.Ik_prikaz = sg.Ik_prikazOtch
											and sg.ik_pricOtch = 3 and Ik_prikaz>0
										  group by YEAR(Dd_prikazVst)) pr_temp
										  on year(Grup.DateExit) = pr_temp.year_otch
	where year(DateExit)<2016
	  and Grup.nYear_post + Relation_spec_fac.YearObuch < 2016
	  and Ik_prikazOtch is null 
	  and Ik_prikazZach is not null 
group by year(Grup.DateExit)

-----------------------------отчисление по неизвестной причине-------------------------------------------------

declare @Ik_studGrup int
declare @Ik_prikaz   int

declare cur1 cursor for
	select Ik_studGrup, Ik_prikaz  from StudGrup inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
	inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = Grup.ik_spec_fac
	inner join
	(select Ik_prikaz, YEAR(Dd_prikazVst) year_otch
										  from Prikaz
										  where [Nn_prikaz] like '%<неизвестен>%') pr_temp
										  on year(Grup.DateExit) = pr_temp.year_otch
	where year(DateExit)<2016
	  and Grup.nYear_post + Relation_spec_fac.YearObuch < 2016
	  and Ik_prikazOtch is null 
	  and Ik_prikazZach is not null
open cur1
fetch next from cur1 into @Ik_studGrup, @Ik_prikaz
while @@Fetch_Status = 0
begin
  update StudGrup set Ik_prikazOtch = @Ik_prikaz, ik_pricOtch = 160
  where Ik_studGrup = @Ik_studGrup

  FETCH NEXT FROM cur1 INTO @Ik_studGrup, @Ik_prikaz
END     
CLOSE cur1
DEALLOCATE cur1

-----------------------------правим неудачно отчисленных-------------------------------------------------------
declare @Ik_studGrup	int
declare @Ik_grup		int
declare @YearObuch		int
declare @nYear_post		int

declare cur1 cursor for
	select Ik_studGrup, StudGrup.Ik_grup, YearObuch, Grup.nYear_post  from StudGrup 
	inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
	inner join Relation_spec_fac rsf on rsf.ik_spec_fac = Grup.ik_spec_fac
	where Ik_prikazOtch is not null and ik_pricOtch is null 
open cur1
fetch next from cur1 into @Ik_studGrup, @Ik_grup, @YearObuch, @nYear_post
while @@Fetch_Status = 0
begin
  if @nYear_post+@YearObuch < year(GETDATE())
  begin
    update StudGrup set ik_pricOtch = 3
    where Ik_studGrup = @Ik_studGrup
  end
    else
    begin
	  update StudGrup set ik_pricOtch = 118
      where Ik_studGrup = @Ik_studGrup
	end

  FETCH NEXT FROM cur1 INTO @Ik_studGrup, @Ik_grup, @YearObuch, @nYear_post
END     
CLOSE cur1
DEALLOCATE cur1