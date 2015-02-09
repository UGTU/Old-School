declare @Ik_studGrup int
declare @Ik_prikaz   int

declare cur1 cursor for
	select Ik_studGrup,Ik_prikaz  from StudGrup inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
	inner join
	(select min(Ik_prikaz) Ik_prikaz, YEAR(Dd_prikazVst) year_otch
										  from Prikaz, StudGrup sg
										  where Prikaz.Ik_prikaz = sg.Ik_prikazOtch
											and sg.ik_pricOtch = 3 and Ik_prikaz>0
										  group by YEAR(Dd_prikazVst)) pr_temp
										  on year(Grup.DateExit) = pr_temp.year_otch
	where year(DateExit)<=2014
	  and Ik_prikazOtch is null 
	  and Ik_prikazZach is not null 
open cur1
fetch next from cur1 into @Ik_studGrup, @Ik_prikaz
while @@Fetch_Status = 0
begin
  update StudGrup set Ik_prikazOtch = @Ik_prikaz
  where Ik_studGrup = @Ik_studGrup

  FETCH NEXT FROM cur1 INTO @Ik_studGrup, @Ik_prikaz
END     
CLOSE cur1
DEALLOCATE cur1