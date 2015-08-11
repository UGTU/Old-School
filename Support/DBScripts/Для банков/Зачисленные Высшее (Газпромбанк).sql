--ВСЕ ПОЛЯ В EXCEL СДЕЛАТЬ ТЕКСТОВЫМИ!

select distinct 
	   Cshort_name_fac,
	   Cname_spec,
	   cName_direction,
       '',
	   43,
	   Clastname,
	   Cfirstname,
	   Cotch,
	   iif(lSex = 0,'Ж','М') lSex,
	   isnull(pr.Cstrana,vrem.Cstrana) strana,
	   '' Pr_index,
	   isnull(pr.Cregion,vrem.Cregion) region,
	   isnull(pr.Craion,vrem.Craion) raion,
	   '' Gorod,
	    isnull(pr.Cgorod,vrem.Cgorod) NPunkt,
	   isnull(pr.CStreet,vrem.CStreet) Street,
	   isnull(iif(pr.b_i>0,substring(pr.BuildingNumber,1,pr.b_i - 1),pr.BuildingNumber),iif(vrem.b_i>0,substring(vrem.BuildingNumber,1,pr.b_i - 1),vrem.BuildingNumber)) dom,
	   isnull(iif(pr.b_i>0,substring(pr.BuildingNumber,pr.b_i,1),pr.StructNumber),iif(vrem.b_i>0,substring(vrem.BuildingNumber,vrem.b_i,1),vrem.StructNumber)) korpus,
	   isnull(pr.FlatNumber,vrem.FlatNumber) FlatNumber,
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
		   Direction.cName_direction,
		   Person.nCode,
		   Person.Ik_grazd,
		   Strana.Cstrana c_grazd,
		   Strana.ik_type_grazd resident,
		   NNyear,
		   Cname_form_ed,
		   CType_kat
	from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,
		 Strana,Form_ed,Kat_zach,TypeKatZach,Direction
	where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
	and Person.Ik_grazd = Strana.Ik_strana
	and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
	and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
	and Spec_stud.ik_direction = Direction.ik_direction
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
	and ABIT_postup.dd_zachisl is null																--вот тут регулируются волны поступления!
	and Relation_spec_fac.Ik_form_ed = 1									--очники
	and TypeKatZach.ik_type_kat in (1,2,12)									--не контракт
	and Relation_spec_fac.ik_fac <> 31										--не колледжи
	and dbo.Student.nCode = ABIT_postup.nCode
	and NNyear=year(GETDATE())
) stud
left join (select Doc_stud.*,documents.cvid_doc from Doc_stud, documents where documents.Ik_vid_doc = Doc_stud.Ik_vid_doc and IsIdentity = 1) docs
on stud.nCode = docs.nCode
left join (select nCode,fIndex,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Craion,Cstrana,Strana.Ik_strana,
		   PATINDEX('%[А-я]%',BuildingNumber) b_i, PATINDEX('%[А-я]%',StructNumber) s_i
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
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Craion,Cstrana,Strana.Ik_strana,
		   PATINDEX('%[А-я]%',BuildingNumber) b_i
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on stud.nCode = vrem.nCode
--where (pr.Cstrana is null)and(vrem.Cstrana is null)
--where Dd_vidan is null
order by  Clastname,Cfirstname,Cotch
