USE [UGTU_ACTTEST]
GO

/****** Object:  View [dbo].[StudInfoForDocs]    Script Date: 13.05.2015 11:17:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




--select * from [StudInfoForDocs]
ALTER view [dbo].[StudInfoForDocs]

AS

	select last_st.Ik_studGrup,nCode, [FIO], Ik_grup, Cname_grup,Ik_form_ed,Cname_form_ed, ctelefon, cSotTel,Ik_fac, Cname_fac,ik_spec,Cname_spec,
	cName_direction,ik_direction
	from
	(
		SELECT Person.nCode, Clastname+' '+Cfirstname+' '+ Cotch [FIO], ctelefon, cSotTel, max(Ik_studGrup) Ik_studGrup   --выбираем только самую последнюю запись о движении студента
		from Person inner join Zach on Person.nCode = Zach.nCode
		inner join StudGrup on StudGrup.Ik_zach = Zach.Ik_zach
		group by  Person.nCode,Clastname,Cfirstname,Cotch, ctelefon, cSotTel
	) last_st
	inner join
	(
		  Select 
				 Cname_grup,Grup.Ik_grup,Form_ed.Ik_form_ed,Cname_form_ed,Fac.Ik_fac, Cname_fac,EducationBranch.ik_spec,EducationBranch.Cname_spec, Ik_studGrup,_dir.cName_direction, _dir.ik_direction
				
		  from StudGrup
			inner join Grup on Grup.Ik_grup = StudGrup.Ik_grup
			inner join Kat_zach on StudGrup.ik_kat_zach = Kat_zach.Ik_kat_zach
			inner join TypeKatZach on TypeKatZach.ik_type_kat = Kat_zach.ik_type_kat
			inner join Relation_spec_fac rsf on rsf.ik_spec_fac = Grup.ik_spec_fac
			inner join Form_ed on Form_ed.Ik_form_ed = rsf.Ik_form_ed
			inner join Fac on rsf.ik_fac = Fac.Ik_fac
			INNER JOIN Spec_stud ON rsf.ik_spec=Spec_stud.ik_spec
			inner join Direction _dir on Spec_stud.ik_direction =_dir.ik_direction
			inner join EducationBranch on EducationBranch.ik_spec = rsf.ik_spec

			) gr_prop
			on gr_prop.Ik_studGrup = last_st.Ik_studGrup



GO


