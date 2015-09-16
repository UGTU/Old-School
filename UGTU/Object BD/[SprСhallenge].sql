USE [UGTU_ACTTEST]
GO

/****** Object:  StoredProcedure [dbo].[StudGetInfForSprav]    Script Date: 18.04.2015 11:25:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--EXEC	[dbo].[StudGetInfForSprav] @Ik_studGrup = 42062
Alter   procedure [dbo].[SprÑhallenge](@Ik_studGrup INT, @nums int, @ik_vidzan int)
as

declare @Date DATETIME
SET @Date=GETDATE()


	SELECT s.FIO, fe.Cname_form_pril, year(@Date)-nYear_post + iif(MONTH(@Date)>8,1,0) as kurs,ManagerSmallName,
nw.mask_week1,nw.mask_week2,nw.Num1,nw.Num2,
s.Cname_spec, e.Sh_spec,s.Cname_grup,fac.Cname_fac_small,d.Ik_Document
		FROM StudInfoForDocs s 
		inner join Form_ed fe on s.Ik_form_ed=fe.Ik_form_ed
		inner join Grup g on s.Ik_grup=g.Ik_grup
		inner join EducationBranch e on s.ik_spec=e.ik_spec
		inner join Fac fac on s.Ik_fac=fac.Ik_fac
		INNER JOIN Import.DepartmentMainData import_dmd ON fac.DepartmentGUID=import_dmd.DepartmentGUID 
		    inner join Document d on s.Ik_studGrup = d.Ik_studGrup
			inner join CallSpr cs on d.Ik_Document = cs.Ik_Document
		    inner join Content_UchPl cu on cs.Ik_upContent = cu.ik_upContent
			inner join sv_disc sv on cu.ik_disc_uch_plan=sv.ik_disc_uch_plan
			inner join [dbo].[discpln] _d on sv.ik_disc=_d.ik_disc
			inner join nWeek nw on cu.ik_upContent=nw.ik_upContent
			WHERE  d.[Ik_studGrup]=@Ik_studGrup and cu.n_sem=@nums and cu.ik_vid_zanyat=@ik_vidzan


GO


