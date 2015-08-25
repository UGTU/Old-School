USE [UGTU_ACTTEST]
GO
/****** Object:  StoredProcedure [dbo].[StudGetInfForSprav]    Script Date: 17.08.2015 13:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC	[dbo].[StudGetInfForSprav] @Ik_studGrup = 37020
--EXEC	[dbo].[InfForGrup] @Ik_Grup = 1783
Alter   procedure [dbo].[InfForGrup](@Ik_grup  INT)
as

declare @Date DATETIME
SET @Date=DATEADD(day,30,GETDATE()) -- +30
declare @kurs INT
SET @kurs=year(@Date)-(select nYear_post from 
Grup   where Grup.Ik_grup =@Ik_grup) + iif(MONTH(@Date)>8,1,0)


	SELECT @kurs as kurs,iif(nYear_post+@kurs>year(@Date),@kurs*2-1,@kurs*2) as [dop_sem],-- данный рассчет для справки вызов с учетом подготовки документов за 30 дней
		   DAY(@Date) as sprDate, Month(@Date) as sprMonth, YEAR(@Date) as sprYear,
			Spec_stud.Cshort_spec, Spec_stud.Cname_spec, Cname_fac_rod_pad, fac.ik_fac,Dep_Index ,
			Podgot, fe.Cname_form_pril,Grup.Cname_grup, year(Grup.DateExit) YearGrupEnd,nYear_post,
			EducationBranch.Sh_spec,kz.NamePril, Cname_fac_small,fac.ik_fac,Grup.Ik_grup
		  from Grup
			inner join Relation_spec_fac rsf on Grup.ik_spec_fac = rsf.ik_spec_fac
			INNER JOIN Spec_stud ON rsf.ik_spec=Spec_stud.ik_spec
			INNER JOIN fac ON rsf.ik_fac=fac.ik_fac 
			Inner join Direction _dir On Spec_stud.ik_direction =_dir.ik_direction
			inner join EducationBranch on EducationBranch.ik_spec = rsf.ik_spec
			inner join Kat_zaved kz on rsf.ik_kat_zaved =kz.ik_kat_zaved
			Inner join Form_ed fe ON rsf.Ik_form_ed=fe.Ik_form_ed
			where Ik_grup=@Ik_grup



