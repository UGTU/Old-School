Select distinct cast(ABIT_postup.dd_pod_zayav as date), Clastname, Cfirstname, Cotch, lSex+1, cast(Dd_birth as date), Cplacebirth, c_grazd, cvid_doc, Cd_seria + ' ' + Np_number, Cd_seria, Np_number,
				cast(Dd_vidan as date), Cd_kem_vidan, cEmail, pr.Cstrana + ', ' + pr.Cregion + ', ' + pr.Cgorod + ', ' + pr.CStreet+' '+pr.BuildingNumber + ' - ' +pr.FlatNumber,
				pr.Cstrana, pr.Cregion, pr.Cgorod, pr.CStreet, pr.BuildingNumber, pr.StructNumber, pr.FlatNumber,
				--фактическое проживание
				fact.Cstrana + ', ' + fact.Cregion + ', ' + fact.Cgorod + ', ' + fact.CStreet+' '+fact.BuildingNumber + ' - ' +fact.FlatNumber,
				fact.Cstrana, fact.Cregion, fact.Cgorod, fact.CStreet, fact.BuildingNumber, fact.StructNumber, fact.FlatNumber,
				--временное проживание
				vrem.Cstrana + ', ' + vrem.Cregion + ', ' + vrem.Cgorod + ', ' + vrem.CStreet+' '+vrem.BuildingNumber + ' - ' +vrem.FlatNumber,
				vrem.Cstrana, vrem.Cregion, vrem.Cgorod, vrem.CStreet, vrem.BuildingNumber, vrem.StructNumber, vrem.FlatNumber,
				ctelefon, cSotTel,cSotTel


/*Person.nCode,Fac.Cname_fac, Spec_stud.Cname_spec, Clastname + ' ' + Cfirstname + ' ' + Cotch FIO, cvid_doc, Zaved_stud.cName_zaved, Ngodokon,Cname_type_zach,
	   rtrim(сname_disc) + ', ' + rtrim(cname_sdach) + ': ' + cast(cosenka as varchar(3)) +';', Cname_kat_zach, c_grazd, lSex, 2013 - year(Dd_birth)-1*/
from ABIT_postup 
inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join Relation_spec_fac on  ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Fac on Relation_spec_fac.ik_fac = fac.Ik_fac
inner join Spec_stud on Relation_spec_fac.ik_spec = Spec_stud.ik_spec
inner join Person  on Person.nCode = ABIT_postup.nCode
inner join Student on Person.nCode = Student.nCode
inner join ABIT_sost_zach on ABIT_sost_zach.ik_zach = ABIT_postup.ik_zach
inner join ABIT_type_zach on ABIT_type_zach.ik_type_zach = ABIT_sost_zach.ik_type_zach
inner join Kat_zach on Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
inner join grazd on grazd.ik_grazd = Person.Ik_grazd
left join Doc_stud on ABIT_postup.nCode = Doc_stud.nCode
left join documents on Doc_stud.ik_vid_doc = documents.ik_vid_doc
left join Zaved_stud on Student.Ik_zaved = Zaved_stud.ik_zaved
left join ABIT_Vstup_exam on ABIT_Vstup_exam.NN_abit = ABIT_postup.NN_abit
left join ABIT_Disc on ABIT_Disc.ik_disc = ABIT_Vstup_exam.ik_disc
left join ABIT_VidSdachi on ABIT_VidSdachi.ik_sdach = ABIT_Vstup_exam.ik_sdach
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on Person.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fact
on Person.nCode = fact.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on Person.nCode = vrem.nCode
where Fac.Ik_fac not in (15,17,21,23)	--не колледжи и не филиалы
  and NNyear = 2014						--За текущий год
  and ABIT_sost_zach.ik_type_zach = 2	--зачисленные
  and Relation_spec_fac.Ik_form_ed = 1	--очное
  and Kat_zach.ik_type_kat in (1,2)		--Бюджет + ЦКП
--  and IsEducational = 1				--образовательный документ
  and IsIdentity = 1
 -- and ABIT_postup.Realy_postup = 1
order by Clastname, Cfirstname, Cotch