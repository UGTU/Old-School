select distinct p.Clastname,p.Cfirstname +' '+p.Cotch ImOT,  --отчисленные
year(p.Dd_birth),Fac.Cshort_name_fac,Spec_stud.Cname_spec,Grup.Cname_grup,
cast(Prikaz.Dd_prikazVst as date), Pricina.Cname_pric
from Person p, Relation_spec_fac rsf, Fac,Spec_stud, Zach Z, StudGrup,Prikaz,Grup,Pricina
where p.nCode = Z.nCode 
and Z.Ik_zach = StudGrup.ik_zach
and StudGrup.Ik_prikazOtch = Prikaz.Ik_prikaz
and ik_pricOtch not in (3)  --не потому, что закончил обучение
and Dd_prikaz>'01.01.2009'
and (select COUNT(Ik_prikazZach) from StudGrup,Prikaz --
	 where ik_zach = Z.Ik_zach and StudGrup.Ik_prikazZach = Prikaz.Ik_prikaz
	 and Dd_prikaz>'01.01.2009')=0
and StudGrup.Ik_grup = Grup.Ik_grup	 
and StudGrup.ik_pricOtch = Pricina.Ik_pric
and Grup.ik_spec_fac = rsf.ik_spec_fac
and Fac.Ik_fac = rsf.ik_fac
and Spec_stud.ik_spec = rsf.ik_spec
and Fac.Ik_fac not in (13,21,22) --не колледжи
order by p.Clastname,ImOT

--pric зачисления = 13

select * from StudGrup,Prikaz --
	 where ik_zach = 6510 and StudGrup.Ik_prikazZach = Prikaz.Ik_prikaz
	 and Dd_prikaz>'01.01.2009'