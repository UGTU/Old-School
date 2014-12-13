select distinct NNyear,FIO,Cname_kat_zach,cName_direction,Cshort_name_fac, Cname_spec,pr.Cstrana + ', ' + pr.Cregion +
	   ', ' + pr.Cgorod, fac.Cstrana + ', ' + fac.Cregion + ', ' + fac.Cgorod, 
		vrem.Cstrana + ', ' + vrem.Cregion + ', ' + vrem.Cgorod,c_grazd from
(
select distinct  Clastname + ' ' + Cfirstname + ' ' + Cotch FIO,Fac.Cshort_name_fac,
	   dbo.Person.nCode,grazd.Ik_grazd,c_grazd,NNyear,cshort_sdach,Cname_kat_zach,Spec_stud.Cname_spec,cName_direction,Cname_form_ed
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Fac,ABIT_Vstup_exam,
	 ABIT_VidSdachi,grazd,Kat_zach,TypeKatZach,Spec_stud, Direction,Relation_spec_fac, Form_ed
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Vstup_exam.ik_sdach = ABIT_VidSdachi.ik_sdach
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Person.Ik_grazd = grazd.ik_grazd
and Spec_stud.ik_direction = Direction.ik_direction
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed 
and Relation_spec_fac.ik_spec_fac = ABIT_Diapazon_spec_fac.ik_spec_fac
--and Fac.Ik_fac in (13,21) --ѕЁЋ 
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and dbo.Student.nCode = ABIT_postup.nCode
and NNyear=2012
and Lobchegit = 1
--and grazd.ik_grazd <> 2 --не российское гражданство
) stud
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on stud.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fac
on stud.nCode = fac.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on stud.nCode = vrem.nCode
/*where (pr.Ik_strana<>2)or(fac.Ik_strana<>2)or(vrem.Ik_strana<>2)or(Ik_grazd<>2)or (Ik_grazd <> 2) */
order by Cname_kat_zach, Cshort_name_fac,FIO