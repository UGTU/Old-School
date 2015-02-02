update StudGrup set Ik_prikazOtch=16023, ik_pricOtch = 3
--select * from StudGrup
where Ik_grup in
(select Ik_grup from grup where year(DateExit)=2014)
and Ik_prikazOtch is null and Ik_prikazZach is not null