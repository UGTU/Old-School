select Direction.cName_direction, NNrecord, EducationBranch.Cname_spec, MestBudjet, MestCKP, MestKontrakt, EducationBranch.ik_spec, Form_ed.Cname_form_ed, EducationBranch.ik_FB, EducationBranch.ik_main_spec
from ABIT_Diapazon_spec_fac, Relation_spec_fac, EducationBranch, Direction, Form_ed
where ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and EducationBranch.ik_direction = Direction.ik_direction
and Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
and ABIT_Diapazon_spec_fac.NNyear = 2014
and ik_fac not in (14,15,17)
order by Direction.ik_direction, EducationBranch.Cname_spec