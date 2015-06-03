select distinct Cshort_name_fac,Cname_spec,Cname_form_ed, 
	   dd_pod_zayav,
	   Clastname,
	   Cfirstname,
	   Cotch,
	   lSex,
	   Dd_birth, 
	   Cplacebirth,
	   c_grazd,
	   resident,
	   iif(len(Cd_seria)=4,substring(Cd_seria, 1, 2) + ' ' + substring(Cd_seria, 3, 2), Cd_seria) + ' ' + Np_number, 
	   FORMAT(cast(Dd_vidan as DATE), 'd', 'de-de' ) Dd_vidan, 
	   Cd_kem_vidan, 
	   '-' Pr_index,
	   pr.Cstrana,
	   pr.Cregion,
	   pr.Cgorod,
	   pr.CStreet,
	   pr.BuildingNumber,
	   pr.StructNumber,
	   pr.FlatNumber,
	   '-' Fact_index,
	   fac.Cstrana,
	   fac.Cregion,
	   fac.Cgorod,
	   fac.CStreet,
	   fac.BuildingNumber,
	   fac.StructNumber,
	   fac.FlatNumber,
	   iif(substring(cSotTel,1,1)='+', cSotTel, substring(cSotTel,1,11))
from
(
	select distinct cast(dd_pod_zayav as Date) dd_pod_zayav,
		   ltrim(rtrim(Clastname)) Clastname, 
		   ltrim(rtrim(Cfirstname)) Cfirstname, 
		   ltrim(rtrim(Cotch)) Cotch,
		   lSex+1 as lSex, 
		   FORMAT(cast(Dd_birth as DATE), 'd', 'de-de' ) Dd_birth, 
		   Cplacebirth, 
		   ctelefon, 
		   substring(REPLACE(REPLACE(REPLACE(REPLACE(cSotTel,' ',''),'-',''),'(',''),')',''),1,12) cSotTel,
		   Fac.Cshort_name_fac,
		   Spec_stud.Cname_spec,
		   Person.nCode,
		   Person.Ik_grazd,
		   Strana.Cstrana c_grazd,
		   Strana.ik_type_grazd resident,
		   NNyear,
		   Cname_form_ed,
		   CType_kat
	from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,
		 Strana,Form_ed,Kat_zach,TypeKatZach
	where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
	and Person.Ik_grazd = Strana.Ik_strana
	and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
	and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
	--and Relation_spec_fac.Ik_form_ed = 1									   --очники
	--and Relation_spec_fac.ik_fac not in (13,21,22,23)						   --не колледжи
	and dbo.Student.nCode = ABIT_postup.nCode
	and NNyear=year(GETDATE())-1
) stud
left join (select * from Doc_stud where Ik_vid_doc in (select Ik_vid_doc from documents where IsIdentity = 1)) docs
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
--where ik_grazd <> 2
order by  Clastname,Cfirstname,Cotch