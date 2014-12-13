select * from ABIT_postup where nCode=40552

select * from Stud where Clastname='Башлыков'  -- nCode=40552
select * from Stud where nCode=30511
select * from Stud where Clastname='Карманова'  -- nCode=20816

select * from StudGrup where Ik_zach = (select Ik_zach from Zach where nCode in (13728))  -- Ik_zach = 16334
select * from StudGrup where Ik_zach = (select Ik_zach from Zach where nCode=20816)  -- Ik_zach = 12271

select * from Zach where nCode in (23793, 25709)

select * from StudGrup where Ik_zach=16334  --ik_studGrup=17564
select * from StudGrup where Ik_zach=12271  --ik_studGrup=13395

select * from Prikaz where ik_prikaz in (2968) 
select * from Prikaz where Nn_prikaz='107-с'

select * from Prikaz_Stud where ik_prikaz in (13,115) 

select * from StudGrupAcadem where ik_studGrup in (13408)
select * from StudGrupAcadem where ik_studGrup in (13395)

select * from Prikaz where Ik_prikaz in (3281,3158,2428)  

select * from Grup where Cname_grup='РЭНГМ-09'  --Ik_grup = 1054
select * from Grup where Ik_grup=1540

select * from Prikaz order by Dd_prikaz   --Ik_prikaz=3360

