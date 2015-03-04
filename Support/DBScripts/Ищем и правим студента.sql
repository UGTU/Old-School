
select * from Person where Clastname='Пимкина'

select * from ABIT_postup where nCode=68481
select * from ABIT_Vstup_exam where NN_abit = 27536

select * from ABIT_Diapazon_spec_fac, Relation_spec_fac, EducationBranch, fac 
where ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = fac.Ik_fac
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and NNrecord=716 


select * from Relation_spec_fac where ik_spec_fac = 274
select * from Spec_stud where ik_spec=354607

select * from Doc_stud where nCode = 68148

select * from Zach where ncode in (17167,30376,30910,32372)
select * from Zach where Ik_zach in (14369)
select * from Zach where Nn_zach='121358'


select StudGrup.*, Cname_grup from StudGrup, Grup 
where StudGrup.Ik_grup = Grup.Ik_grup
and ik_zach in (15886,18627)
--and Ik_studGrup = 29204

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