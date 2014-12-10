select  [Clastname] + ' ' + [Cfirstname] + ' ' + [Cotch] as FIO, Fac.Cname_fac, Spec_stud.Cname_spec, cName_direction
from Grup, StudGrup, Zach, Person, Relation_spec_fac, Fac, Spec_stud, Direction 
where Grup.Ik_grup = StudGrup.Ik_grup and StudGrup.Ik_zach = Zach.Ik_zach
and Zach.nCode = Person.nCode and Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and Spec_stud.ik_direction = Direction.ik_direction
and year([DateExit]) = 2014 and StudGrup.Ik_prikazOtch is null
order by Fac.Ik_fac, Spec_stud.ik_spec,FIO