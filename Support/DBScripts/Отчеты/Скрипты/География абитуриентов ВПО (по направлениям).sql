DECLARE @temp_abit	TABLE
	(
		FIO				varchar(500),
		Cshort_name_fac	varchar(100),
		ik_type_kat		int,
		CType_kat		varchar(50),
		Ik_form_ed		int,
		Cname_form_ed	varchar(50),
		cName_direction varchar(200),
		ik_spec			int,
		Cname_spec		varchar(500),
		p_region		int,
		f_region		int,
		v_region		int,
		name_region		varchar(500),
		name_strana		varchar(500)
	)
insert into @temp_abit
--абитуриенты
select FIO,Cshort_name_fac,ik_type_kat,CType_kat,Ik_form_ed,Cname_form_ed,cName_direction,ik_spec,Cname_spec,pr.Ik_region, fac.Ik_region, vrem.Ik_region,'',''
from
(

Select distinct Fac.Cshort_name_fac,Spec_stud.Cname_spec, Clastname + ' ' + Cfirstname + ' ' + Cotch FIO, Spec_stud.ik_spec,
	   dbo.Person.nCode,NNyear,cshort_sdach,CType_kat,TypeKatZach.ik_type_kat,Form_ed.Ik_form_ed,Form_ed.Cname_form_ed, Direction.cName_direction, Direction.cShort_name_direction
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,ABIT_Vstup_exam,
	 ABIT_VidSdachi,Kat_zach,TypeKatZach, Form_ed, dbo.Direction
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Vstup_exam.ik_sdach = ABIT_VidSdachi.ik_sdach
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Form_ed.Ik_form_ed = Relation_spec_fac.Ik_form_ed
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Spec_stud.ik_direction in (1,2,3)				--ВПО
and ABIT_postup.ik_zach =(6)				--исключая переведенных, забравших док-ты, и сетевых
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and dbo.Student.nCode = ABIT_postup.nCode
and ABIT_postup.nCode not in (select nCode from Zach)
and NNyear=YEAR(GETDATE())
and Spec_stud.ik_direction=Direction.ik_direction
) Allstud
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on Allstud.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fac
on Allstud.nCode = fac.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on Allstud.nCode = vrem.nCode

update @temp_abit set p_region = f_region where p_region is null

update @temp_abit set p_region = v_region where p_region is null

update @temp_abit set name_region = (select Cregion from Region where Ik_region = p_region)

update @temp_abit set name_strana = (select Strana.Cstrana from Strana,Region where Strana.Ik_strana = Region.Ik_strana and Region.Ik_region  = p_region)

select Cshort_name_fac,ik_spec,Cname_spec,Ik_form_ed,Cname_form_ed,cName_direction,ik_type_kat,CType_kat,p_region,name_region,name_strana,count(FIO)
from @temp_abit
group by ik_type_kat,CType_kat,Ik_form_ed,Cname_form_ed,ik_spec,Cname_spec,cName_direction,Cshort_name_fac,p_region, name_region,name_strana
order by Cshort_name_fac,Cname_spec, Cname_form_ed, CType_kat, p_region