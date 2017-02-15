select *
from zach
where [Nn_zach]='152347'

select *
from dbo.StudGrup
where Ik_zach=38100 

select *
from UGTU_ZachTest.dbo.StudGrup
where Ik_zach=38100

delete from dbo.StudGrup
where Ik_zach=38100 StudGrup.Ik_studGrup=62273

update dbo.StudGrup
set StudGrup.Ik_prikazOtch=25628, StudGrup.[ik_pricOtch]=153, Ik_grup=9571
where StudGrup.Ik_studGrup=51710


select *
from dbo.Grup
where Grup.Cname_grup like 'ан%'