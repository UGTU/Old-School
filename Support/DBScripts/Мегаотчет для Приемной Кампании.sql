Select Fac.Cname_fac, Spec_stud.Cname_spec, cName_direction, Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') FIO, cvid_doc,  Zaved_stud.cName_zaved, Cgorod, 
  Craion, Cregion, Cstrana, Ngodokon,Cname_type_zach,
	   сname_disc, cname_sdach,cosenka, Cname_kat_zach, c_grazd, lSex, 2014 - year(Dd_birth)-1 vozrast
from ABIT_postup 
inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join Relation_spec_fac on  ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Fac on Relation_spec_fac.ik_fac = fac.Ik_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Direction on Direction.ik_direction = Spec_stud.ik_direction
inner join Person  on Person.nCode = ABIT_postup.nCode
inner join Student on Person.nCode = Student.nCode
inner join ABIT_sost_zach on ABIT_sost_zach.ik_zach = ABIT_postup.ik_zach
inner join ABIT_type_zach on ABIT_type_zach.ik_type_zach = ABIT_sost_zach.ik_type_zach
inner join Kat_zach on Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
inner join grazd on grazd.ik_grazd = Person.Ik_grazd
left join Doc_stud on ABIT_postup.nCode = Doc_stud.nCode
left join documents on Doc_stud.ik_vid_doc = documents.ik_vid_doc
left join Zaved_stud on Student.Ik_zaved = Zaved_stud.ik_zaved
left join Gorod on Gorod.Ik_gorod = Zaved_stud.Ik_gorod
left join Raion on Raion.Ik_raion = Gorod.Ik_raion
left join Region on Region.Ik_region = Raion.Ik_region
left join Strana on Strana.Ik_strana = Region.Ik_strana
left join ABIT_Vstup_exam on ABIT_Vstup_exam.NN_abit = ABIT_postup.NN_abit
left join ABIT_Disc on ABIT_Disc.ik_disc = ABIT_Vstup_exam.ik_disc
left join ABIT_VidSdachi on ABIT_VidSdachi.ik_sdach = ABIT_Vstup_exam.ik_sdach
where --ik_direction in (1,2,3)		--ВПО
  NNyear = 2014					 --За текущий год
  and ((IsEducational = 1)or(IsEducational is null))	 --образовательный документ
order by FIO

Select distinct Fac.Cname_fac, Spec_stud.Cname_spec, cName_direction, Clastname + ' ' + Cfirstname + ' ' + isnull(Cotch,'') FIO, cvid_doc,  Zaved_stud.cName_zaved, Cgorod, 
  Craion, Cregion, Cstrana, Ngodokon,Cname_type_zach,
	   Cname_kat_zach, c_grazd, lSex, 2014 - year(Dd_birth)-1 vozrast
from ABIT_postup 
inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join Relation_spec_fac on  ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Fac on Relation_spec_fac.ik_fac = fac.Ik_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Direction on Direction.ik_direction = Spec_stud.ik_direction
inner join Person  on Person.nCode = ABIT_postup.nCode
inner join Student on Person.nCode = Student.nCode
inner join ABIT_sost_zach on ABIT_sost_zach.ik_zach = ABIT_postup.ik_zach
inner join ABIT_type_zach on ABIT_type_zach.ik_type_zach = ABIT_sost_zach.ik_type_zach
inner join Kat_zach on Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
inner join grazd on grazd.ik_grazd = Person.Ik_grazd
left join Doc_stud on ABIT_postup.nCode = Doc_stud.nCode
left join documents on Doc_stud.ik_vid_doc = documents.ik_vid_doc
left join Zaved_stud on Student.Ik_zaved = Zaved_stud.ik_zaved
left join Gorod on Gorod.Ik_gorod = Zaved_stud.Ik_gorod
left join Raion on Raion.Ik_raion = Gorod.Ik_raion
left join Region on Region.Ik_region = Raion.Ik_region
left join Strana on Strana.Ik_strana = Region.Ik_strana
where --ik_direction in (1,2,3)		--ВПО
  NNyear = 2014					 --За текущий год
  and ((IsEducational = 1)or(IsEducational is null))	 --образовательный документ
order by FIO