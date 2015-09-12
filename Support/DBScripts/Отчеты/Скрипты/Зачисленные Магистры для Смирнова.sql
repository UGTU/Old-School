--ВСЕ ПОЛЯ В EXCEL СДЕЛАТЬ ТЕКСТОВЫМИ!

select distinct 
	   Cshort_name_fac,
	   Cname_spec,
	   cName_direction,
 	   PersonFullName,
	   iif(lSex = 0,'Ж','М') lSex,
	   Cname_form_ed,
	   cEmail
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
		   CType_kat,
		   ABIT_postup.ik_prikaz_zach,
		   Person.PersonFullName
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
	and Direction.ik_direction = 3
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
	--and ABIT_postup.dd_zachisl is null																--вот тут регулируются волны поступления!
	and Relation_spec_fac.Ik_form_ed = 1									--очники
	and TypeKatZach.ik_type_kat in (1,2,12)									--не контракт
	and Relation_spec_fac.ik_fac <> 31										--не колледжи
	and dbo.Student.nCode = ABIT_postup.nCode
	and NNyear=year(GETDATE())
) stud

order by  Cshort_name_fac,
	   Cname_spec,
	   Cname_form_ed,
	   cName_direction,
 	   PersonFullName
