select  COUNT(Zach.nCode)
from Grup, StudGrup, Zach, Person, Relation_spec_fac, Fac, Spec_stud, Direction 

where Grup.Ik_grup = StudGrup.Ik_grup and StudGrup.Ik_zach = Zach.Ik_zach
and Zach.nCode = Person.nCode and Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and Spec_stud.ik_direction = Direction.ik_direction
and Zach.nCode = Person.nCode
and year([DateExit]) = 2016 and StudGrup.Ik_prikazOtch is null

and Fac.ik_fac NOT IN (15,17)

--and Fac.ik_fac  IN (13,21,22,23,31)

--and Relation_spec_fac.[Ik_form_ed]=1
and Person.[lSex]=0
--order by Fac.Ik_fac, Spec_stud.ik_spec,FIO