select fac.Cname_fac,EducationBranch.Cname_spec, Form_ed.Cname_form_ed, Direction.cName_direction, ABIT_Diapazon_spec_fac.MestBudjet 
from ABIT_Diapazon_spec_fac, Relation_spec_fac, EducationBranch, Fac, Form_ed, Direction
where ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and Relation_spec_fac.ik_fac = Fac.Ik_fac
and Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
and EducationBranch.ik_direction = Direction.ik_direction
and NNyear = 2014
and MestBudjet <>0
order by fac.Cname_fac,EducationBranch.Cname_spec