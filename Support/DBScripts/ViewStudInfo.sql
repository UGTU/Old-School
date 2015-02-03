--select * from [dbo].[StudInfoWithCourse](21107)

create view [dbo].[StudInfo]

AS

	select nCode,Clastname,Cfirstname,Cotch, Course, Cname_grup,Cname_form_ed,CType_kat, ctelefon, cSotTel, Cname_fac,Cname_spec,ManagerName,PrikazOtch
	from
	(
		SELECT Person.nCode, Clastname, Cfirstname,Cotch, ctelefon, cSotTel, max(Ik_studGrup) Ik_studGrup   --выбираем только самую последнюю запись о движении студента
		from Person inner join Zach on Person.nCode = Zach.nCode
		inner join StudGrup on StudGrup.Ik_zach = Zach.Ik_zach
		group by  Person.nCode,Clastname,Cfirstname,Cotch, ctelefon, cSotTel
	) last_st
	inner join
	(
		  Select YEAR(getdate())-nYear_post+iif(month(getdate())>8,1,0)-iif(YEAR(getdate())>year(grup.DateExit),YEAR(getdate())-year(grup.DateExit),0) Course,
				 Cname_grup,Cname_form_ed,CType_kat, Cname_fac,Cname_spec,ManagerName,Prikaz.Dd_prikazVst PrikazOtch, Ik_studGrup
		  from StudGrup
			inner join Grup on Grup.Ik_grup = StudGrup.Ik_grup
			inner join Kat_zach on StudGrup.ik_kat_zach = Kat_zach.Ik_kat_zach
			inner join TypeKatZach on TypeKatZach.ik_type_kat = Kat_zach.ik_type_kat
			inner join Relation_spec_fac rsf on rsf.ik_spec_fac = Grup.ik_spec_fac
			inner join Form_ed on Form_ed.Ik_form_ed = rsf.Ik_form_ed
			inner join Fac on rsf.ik_fac = Fac.Ik_fac
			inner join EducationBranch on EducationBranch.ik_spec = rsf.ik_spec
			left join Import.DepartmentMainData dmd on dmd.DepartmentGUID = Fac.DepartmentGUID
			left join Prikaz on StudGrup.Ik_prikazOtch = Prikaz.Ik_prikaz) gr_prop
			on gr_prop.Ik_studGrup = last_st.Ik_studGrup
