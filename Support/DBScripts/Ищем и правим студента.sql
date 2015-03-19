
select * from Person where Clastname='Алексеенко'

select * from ABIT_postup where nCode=68098

select * from ABIT_Diapazon_spec_fac where NNrecord=750 
select * from Relation_spec_fac where ik_spec_fac = 274
select * from Spec_stud where ik_spec=354607

select * from Doc_stud where nCode = 15966

select * from Zach where ncode in (46878)
select * from Zach where Ik_zach in (14369)


select StudGrup.*, Cname_grup from StudGrup, Grup 
where StudGrup.Ik_grup = Grup.Ik_grup
and ik_zach in (25901)

select * from StudGrup where ik_pricZach=13

update Uspev set ik_zach = 18621 where ik_zach = 26406
and Ik_ved not in (select Ik_ved from Uspev where ik_zach = 18621)

select * from Uspev where Ik_ved in (select Ik_ved from Uspev where ik_zach = 26406 )
and Ik_ved in (select Ik_ved from Vedomost where lPriznak_napr = 1)

SELECT        * FROM            Uspev WHERE        (Ik_zach = 26406)
and Ik_ved in (select Ik_ved from Vedomost where lPriznak_napr = 1)

select * from Grup where Ik_grup in (6234)

--если 2 раза в одной группе
select * from
(
select ik_zach,count(Ik_studGrup) cou_stud
from StudGrup
Where  [Ik_prikazOtch] is null
group by ik_zach) st
where st.cou_stud>1
--order by cou_stud

select * from StudGrup where Ik_zach=22877

delete from StudGrup where Ik_studGrup=41728