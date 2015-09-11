declare @ik_upContent  int
declare @Ik_ved  int

declare cur1 cursor for
	select cup.ik_upContent, Ik_ved 
	from Content_UchPl cup 
	inner join sv_disc on cup.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
	inner join discpln on sv_disc.ik_disc = discpln.iK_disc
	left join Vedomost on Vedomost.ik_upContent = cup.ik_upContent
	where cup.ik_vid_zanyat not in (select ik_vid_zanyat
									from Uch_plan_columns
									where ik_type_disc = discpln.ik_type_disc)
	and sv_disc.ik_uch_plan = 1548
open cur1
fetch next from cur1 into @ik_upContent, @Ik_ved
while @@Fetch_Status = 0
begin
	exec DelVed @ik_ved = @Ik_ved
	delete from Content_UchPl where ik_upContent = @ik_upContent 
	FETCH NEXT FROM cur1 INTO @ik_upContent, @Ik_ved
END     
CLOSE cur1
DEALLOCATE cur1