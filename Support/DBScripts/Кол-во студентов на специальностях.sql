select  count(Person.nCode), Fac.Cname_fac, Spec_stud.Cname_spec
from Grup, StudGrup, Zach, Person, Relation_spec_fac, Fac, Spec_stud, Direction 
where Grup.Ik_grup = StudGrup.Ik_grup and StudGrup.Ik_zach = Zach.Ik_zach
and Zach.nCode = Person.nCode and Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and Spec_stud.ik_direction = Direction.ik_direction
--and year([DateExit]) = 2014 
and Grup.DateExit > '01.06.2014'
and StudGrup.Ik_prikazOtch is null
and Fac.ik_fac not in (9)
group by Fac.Cname_fac, Spec_stud.Cname_spec
order by Fac.Cname_fac, Spec_stud.Cname_spec