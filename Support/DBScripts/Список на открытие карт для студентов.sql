select distinct Cname_spec,dd_pod_zayav,Clastname, Cfirstname, Cotch,lSex, cast(Dd_birth as DATE) Dd_birth, 
	   Cplacebirth, /*LEFT(Cd_seria,2) + ' ' + RIGHT (Cd_seria,2)*/Cd_seria + ' ' + Np_number, cast(Dd_vidan as DATE) Dd_vidan,
	   Cd_kem_vidan, '-','-','-', fIndex, Cregion, Cgorod, CStreet, BuildingNumber, FlatNumber, ctelefon, cSotTel
from
(
select distinct cast(dd_pod_zayav as Date) dd_pod_zayav,Clastname, Cfirstname, Cotch,lSex+1 as lSex, cast(Dd_birth as DATE) Dd_birth, 
	            Cplacebirth, ctelefon, cSotTel,Fac.Cshort_name_fac,Spec_stud.Cname_spec,
				dbo.Person.nCode,grazd.Ik_grazd,c_grazd,NNyear,cshort_sdach,Cname_form_ed,CType_kat
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,ABIT_Vstup_exam,
	 ABIT_VidSdachi,grazd,Form_ed,Kat_zach,TypeKatZach
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Vstup_exam.ik_sdach = ABIT_VidSdachi.ik_sdach
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Person.Ik_grazd = grazd.ik_grazd
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
--and Relation_spec_fac.Ik_form_ed = 1									   --очники
and ik_kat_zaved = 3					   --СПО
and Kat_zach.ik_type_kat = 1			  --общий конкурс
and dbo.Student.nCode = ABIT_postup.nCode
and NNyear=2012
) stud
left join (select * from Doc_stud where Ik_vid_doc in (4,11,12)) docs
on stud.nCode = docs.nCode

left join (select nCode,fIndex,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on stud.nCode = pr.nCode
where ik_grazd <> 2
order by Cname_spec,Clastname, Cfirstname, Cotch

