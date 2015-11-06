
select distinct Fac.Cshort_name_fac,EducationBranch.Cname_spec, Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') FIO,
	   [dbo].[ABIT_type_zach].Cname_type_zach,
       Fac.Cname_fac, Direction.cName_direction, Cname_form_ed,CType_kat, EducationBranch.Cname_spec,
	   Gorod.[Cgorod], Cregion,Cstrana,
	    [Zaved_stud].cName_zaved, Student.Ngodokon,
	   dbo.Person.nCode,NNyear,cSotTel,ctelefon,Cname_kat_zach,
	   cast(Dd_birth as DATE) Dd_birth
from dbo.Person, ABIT_postup, ABIT_Diapazon_spec_fac, dbo.Student, Relation_spec_fac,EducationBranch, Fac, Direction,
	 Form_ed,Kat_zach,TypeKatZach, ABIT_sost_zach, [dbo].[ABIT_type_zach], [dbo].[Zaved_stud],dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac

and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and ABIT_postup.ik_zach = ABIT_sost_zach.ik_zach
and ABIT_sost_zach.[ik_type_zach] = [dbo].[ABIT_type_zach].ik_type_zach
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and EducationBranch.ik_direction = Direction.ik_direction
and dbo.Student.nCode = ABIT_postup.nCode
and Student.Ngodokon=2015
and ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)
and Student.[Ik_zaved] = [Zaved_stud].ik_zaved
and [Zaved_stud].Ik_gorod = dbo.Gorod.Ik_gorod
and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
and dbo.Raion.Ik_region = dbo.Region.Ik_region
and dbo.Region.Ik_strana = dbo.Strana.Ik_strana

		   