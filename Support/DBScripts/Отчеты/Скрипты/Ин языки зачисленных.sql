
select Cname_fac[‘акультет],Cshort_spec[—пециальность],CType_kat, Form_ed.Cname_form_ed, Direction.cName_direction,Clastname+' '+Cfirstname+' '+Cotch fio, 
       ISNULL(Cname_lang,'')[язык] from 
	dbo.Person p inner join dbo.Student s on s.nCode=p.nCode
	inner join dbo.ABIT_postup ap on ap.nCode=p.nCode
	inner join dbo.ABIT_sost_zach sz on ap.ik_zach=sz.ik_zach
	inner join dbo.ABIT_Diapazon_spec_fac adsf on adsf.NNrecord=ap.NNrecord
	inner join dbo.Relation_spec_fac rsf on rsf.ik_spec_fac=adsf.ik_spec_fac
	inner join dbo.Fac f on f.Ik_fac=rsf.ik_fac
	inner join dbo.Spec_stud ss on ss.ik_spec=rsf.ik_spec
	inner join Kat_zach on Kat_zach.Ik_kat_zach = ap.ik_kat_zach
	inner join TypeKatZach on Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
	inner join dbo.Form_ed on rsf.Ik_form_ed=Form_ed.Ik_form_ed
	inner join dbo.Direction on Direction.ik_direction=ss.ik_direction
	LEFT join dbo.Lang_stud ls on ls.nCode=p.nCode
	left join dbo.Lang l on l.Ik_lang=ls.Ik_lang 
	where adsf.NNyear=2015 
	  and ap.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach=2)	--зачислен
	 -- and f.Ik_fac = 6   --‘Ѕќ
	order by Form_ed.Cname_form_ed,Cshort_name_fac,Cshort_spec, Direction.cName_direction, Cname_lang,fio
