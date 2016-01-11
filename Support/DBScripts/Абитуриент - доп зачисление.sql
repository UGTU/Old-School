select *
from dbo.STud
where STud.Clastname like 'Шигапов'

select *
from dbo.Zach
where nCode=114928


select *
from dbo.STudGrup
where ik_zach=36492 

delete from
dbo.STudGrup
where ik_studGrup= 
49866

insert into [dbo].[StudGrup]
           ([Ik_grup]
           ,[Ik_zach]
           ,[ik_kat_zach]
           ,[Ik_prikazZach]
           ,[ik_pricZach])
select 9463,ik_zach,10,[Ik_prikazZach]
           ,[ik_pricZach]
from dbo.STudGrup
where ik_zach=36492 