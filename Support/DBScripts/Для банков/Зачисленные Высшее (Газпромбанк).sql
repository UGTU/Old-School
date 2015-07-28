--ÂÑÅ ÏÎËß Â EXCEL ÑÄÅËÀÒÜ ÒÅÊÑÒÎÂÛÌÈ!

select distinct 
	   Cshort_name_fac,
	   Cname_spec
       '',
	   43,
	   Clastname,
	   Cfirstname,
	   Cotch,
	   iif(lSex = 0,'Æ','Ì') lSex,
	   pr.Cstrana,
	   '' Pr_index,
	   pr.Cregion,
	   pr.Craion,
	   '' CGorod,
	   pr.Cgorod NPunkt,
	   pr.CStreet,
	   iif(pr.b_i>0,substring(pr.BuildingNumber,1,pr.b_i - 1),pr.BuildingNumber) dom,
	   iif(pr.b_i>0,substring(pr.BuildingNumber,pr.b_i,1),pr.StructNumber) korpus,
	   pr.FlatNumber,
	   docs.cvid_doc,
	   cast(Cd_seria as varchar(10)) Cd_seria,
	   cast(Np_number as varchar(20)) Np_number,
	   FORMAT(cast(Dd_vidan as DATE), 'd', 'de-de' ) Dd_vidan, 
	   Cd_kem_vidan,
	   Dd_birth,
	   Cplacebirth,
	   c_grazd,
	   cast(ctelefon as varchar(20)) dom_ctelefon,
	   '' SluzhTel,
	   iif(tel_i=1,substring(cSotTel,1,11),iif(substring(cSotTel,tel_i-1,1)='+', substring(cSotTel,tel_i-1,12),substring(cSotTel,tel_i,11))) SotTel,
	   cEmail,
	   '' KontInfo,
	   '' Name_Latin,
	   '' LastName_Latin,
	   '' LawParent,
	   '' CodeGorod,
	   '' IDUniver,
	   Cname_form_ed,
	   1 Course,
	   '' NumDoc
from
(
	select distinct cast(dd_pod_zayav as Date) dd_pod_zayav,
		   ltrim(rtrim(Clastname)) Clastname, 
		   ltrim(rtrim(Cfirstname)) Cfirstname, 
		   ltrim(rtrim(Cotch)) Cotch,
		   lSex, 
		   FORMAT(cast(Dd_birth as DATE), 'd', 'de-de' ) Dd_birth, 
		   Cplacebirth, 
		   ctelefon, 
		   REPLACE(REPLACE(REPLACE(REPLACE(cSotTel,' ',''),'-',''),'(',''),')','') cSotTel,
		   cSotTel SotTel,
		   PATINDEX('%[0-9]%',cSotTel) tel_i,
		   cEmail,
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
	--and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --çà÷èñëåííûå
	--and Relation_spec_fac.Ik_form_ed = 1									   --î÷íèêè
	and Relation_spec_fac.ik_fac <> 31										  --êîëëåäæè
	and dbo.Student.nCode = ABIT_postup.nCode
	and NNyear=year(GETDATE())
) stud
left join (select Doc_stud.*,documents.cvid_doc from Doc_stud, documents where documents.Ik_vid_doc = Doc_stud.Ik_vid_doc and IsIdentity = 1) docs
on stud.nCode = docs.nCode
left join (select nCode,fIndex,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Craion,Cstrana,Strana.Ik_strana,
		   PATINDEX('%[À-ÿ]%',BuildingNumber) b_i, PATINDEX('%[À-ÿ]%',StructNumber) s_i
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
