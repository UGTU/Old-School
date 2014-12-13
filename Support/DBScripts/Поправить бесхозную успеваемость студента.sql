select * from Person where Clastname = 'Савельев' order by Cfirstname,Cotch  --nCode = 34823

select * from Zach where nCode = 34823 --ik_zach = 18629

select * 
from Uspev, Vedomost, Content_UchPl, sv_disc, discpln
where Ik_zach = 18629
and Uspev.Ik_ved = Vedomost.Ik_ved 
and Vedomost.ik_upContent = Content_UchPl.ik_upContent
and sv_disc.ik_disc_uch_plan = Content_UchPl.ik_disc_uch_plan
and sv_disc.ik_disc= discpln.iK_disc
and n_sem = 1 and Cosenca <> -1

exec UspevUpdateVedomost 127407
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--несовпадение группы и ее учебного плана
declare @ik_ved				int
declare @ik_grup			int
declare @ik_ved_old			int
declare @ik_upContent_old	int
declare @ik_upContent_new	int
declare @Ik_uch_plan_grup	int
declare @ik_disc			int	
declare @ik_vid_zanyat		int
declare @n_sem				int
declare @n_module			int
declare @ik_uch_plan_old	int
declare @lPriznak_napr		int

--для ведомостей БРС
declare curs cursor for
	select distinct Vedomost.Ik_ved, [Vedomost].ik_upContent, [Grup].Ik_uch_plan, [sv_disc].ik_disc, [dbo].[Content_UchPl].ik_vid_zanyat, [dbo].[Content_UchPl].n_sem,   --9069 штук
	       [dbo].[Content_UchPl].n_module, [dbo].[sv_disc].ik_uch_plan,  [Grup].Ik_grup, lPriznak_napr																	 --1884 штук
	from [dbo].[Vedomost]
	inner join [dbo].[Content_UchPl] ON [Vedomost].ik_upContent=[Content_UchPl].ik_upContent
	inner join [dbo].[sv_disc] ON [Content_UchPl].ik_disc_uch_plan=[sv_disc].ik_disc_uch_plan
	inner join [dbo].[Grup] ON [Vedomost].Ik_grup=[Grup].Ik_grup AND [Grup].Ik_uch_plan<>[sv_disc].ik_uch_plan
	inner join Uspev on Uspev.Ik_ved = Vedomost.Ik_ved
	where (Uspev.Cosenca >-1)or(Uspev.i_balls is not null)
	order by Vedomost.Ik_ved
	open curs
	FETCH curs INTO @ik_ved, @ik_upContent_old, @Ik_uch_plan_grup, @ik_disc, @ik_vid_zanyat, @n_sem, @n_module, @ik_uch_plan_old, @ik_grup, @lPriznak_napr
	--88328	266419	1708	85	6	1	NULL	1195	1570	1
	while  @@FETCH_STATUS = 0
	BEGIN
	  select @ik_upContent_new = ik_upContent   --ищем такой же контент в плане группы
	  from Content_UchPl, sv_disc
	  where  sv_disc.ik_disc_uch_plan = Content_UchPl.ik_disc_uch_plan and sv_disc.ik_uch_plan = @Ik_uch_plan_grup
	  and sv_disc.ik_disc = @ik_disc 
	  and Content_UchPl.n_sem = @n_sem 
	  and ((@n_module is null)or(Content_UchPl.n_module = @n_module))
	  and Content_UchPl.ik_vid_zanyat = @ik_vid_zanyat

	  if (@ik_upContent_new is not null)       --если контент найден
	  begin 
	    if (@lPriznak_napr = 1) update [Vedomost] set ik_upContent = @ik_upContent_new where Ik_ved = @ik_ved --для направления просто переключаем его на новый контент
		else
	     if ((select count(Uspev.ik_ved) from Vedomost,Uspev										--для обычной ведомости
			where Vedomost.Ik_ved = Uspev.Ik_ved and Vedomost.ik_upContent =  @ik_upContent_new
			and Vedomost.Ik_grup = @ik_grup
			and lPriznak_napr = 0
			and ((Uspev.Cosenca >-1)or(Uspev.i_balls is not null)))=0)  --если по ней не внесены ни баллы, ни оценки 
			begin
			  select @ik_ved_old = Ik_ved													--ищем такую неоценненую ведомость
			  from Vedomost where ik_upContent =  @ik_upContent_new and Ik_grup = @ik_grup and lPriznak_napr = 0 
			  if (@ik_ved_old is not null)and(@lPriznak_napr = 0) exec DelVed @ik_ved_old   --удаляем ее

			  update [Vedomost] set ik_upContent = @ik_upContent_new where Ik_ved = @ik_ved  --ставим на ее место ведомость с оценками
			end
	  end

	FETCH NEXT FROM curs INTO @ik_ved,@ik_upContent_old, @Ik_uch_plan_grup, @ik_disc, @ik_vid_zanyat, @n_sem, @n_module, @ik_uch_plan_old, @ik_grup, @lPriznak_napr
  END
  CLOSE curs
  DEALLOCATE curs   

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--несовпадения по специализации
declare @Ik_ved int
declare @ik_disc int
declare @ik_uch_plan int
declare @disc_spclz int
declare @grup_spclz int
declare @ik_vid_zanyat int
declare @n_sem int
declare @n_module int
declare @lPriznak_napr		int
declare @ik_ved_old int

declare @ik_upContent_new int

declare curs cursor for												
	select Ik_ved, sv_disc.ik_disc, sv_disc.ik_uch_plan, sv_disc.iK_spclz, Grup.ik_spclz, Content_UchPl.ik_vid_zanyat, Content_UchPl.n_sem, 
		   Content_UchPl.n_module, Vedomost.lPriznak_napr																						--1771 штук
	from Vedomost,Content_UchPl,Grup, sv_disc, discpln
	where Vedomost.ik_upContent = Content_UchPl.ik_upContent
	and Vedomost.Ik_grup = Grup.Ik_grup
	and sv_disc.ik_disc_uch_plan = Content_UchPl.ik_disc_uch_plan
	and (sv_disc.iK_spclz <> Grup.ik_spclz)
	and sv_disc.ik_disc = discpln.iK_disc
	and sv_disc.iK_spclz is not null
	--and Vedomost.lPriznak_napr = 1
	--and Vedomost.lClose = 1
	--and Vedomost.Ik_ved in (select ik_ved from Uspev where Cosenca > -1 or i_balls is not null)
	--order by Content_UchPl.n_module
	open curs
	FETCH curs INTO @Ik_ved, @ik_disc,  @ik_uch_plan, @disc_spclz, @grup_spclz, @ik_vid_zanyat, @n_sem,@n_module,@lPriznak_napr
	while  @@FETCH_STATUS = 0
	BEGIN
	  select @ik_upContent_new = ik_upContent --ищем контент, совпадающий по специализации
	  from Content_UchPl, sv_disc
	  where Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
	  and sv_disc.ik_uch_plan = @ik_uch_plan
	  and sv_disc.ik_disc = @ik_disc 
	  and sv_disc.iK_spclz = @grup_spclz
	  and Content_UchPl.ik_vid_zanyat = @ik_vid_zanyat 
	  and Content_UchPl.n_sem = @n_sem

	  if @ik_upContent_new is not null
	  begin
	    
	   
	    if (@lPriznak_napr = 1) update [Vedomost] set ik_upContent = @ik_upContent_new where Ik_ved = @ik_ved --для направления просто переключаем его на новый контент
		else 
		  if ((select count(Uspev.ik_ved) from Vedomost,Uspev										--для обычной ведомости
			where Vedomost.Ik_ved = Uspev.Ik_ved and Vedomost.ik_upContent =  @ik_upContent_new
			--and Vedomost.Ik_grup = @ik_grup
			and lPriznak_napr = 0
			and ((Uspev.Cosenca >-1)or(Uspev.i_balls is not null)))=0)  --если по ней не внесены ни баллы, ни оценки 
			begin
			  select @ik_ved_old = Ik_ved													--ищем такую неоценненую ведомость
			  from Vedomost where ik_upContent =  @ik_upContent_new and lPriznak_napr = 0 
			  if (@ik_ved_old is not null)and(@lPriznak_napr = 0) exec DelVed @ik_ved_old   --удаляем ее

			  update [Vedomost] set ik_upContent = @ik_upContent_new where Ik_ved = @ik_ved  --ставим на ее место ведомость с оценками
			end
	  end

	  FETCH NEXT FROM curs INTO @Ik_ved, @ik_disc,  @ik_uch_plan, @disc_spclz, @grup_spclz, @ik_vid_zanyat, @n_sem,@n_module,@lPriznak_napr
    END
  CLOSE curs
  DEALLOCATE curs   


 select * from Grup where Cname_grup='СТ-10'  --ik_grup = 1476  ik_uch_plan = 970   ik_spclz = 74

  select sv_disc.iK_spclz disc_spclz, sv_disc.ik_uch_plan disc_uch_plan, Grup.*,  Content_UchPl.*, Vedomost.*
  from Grup inner join sv_disc on Grup.Ik_uch_plan = sv_disc.ik_uch_plan 
  inner join Content_UchPl on sv_disc.ik_disc_uch_plan = Content_UchPl.ik_disc_uch_plan 
  left join Vedomost on Vedomost.ik_upContent = Content_UchPl.ik_upContent
  where Grup.Ik_grup = 1476 and Content_UchPl.n_sem = 8 and Content_UchPl.ik_vid_zanyat = 7