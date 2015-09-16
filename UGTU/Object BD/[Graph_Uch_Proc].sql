USE [UGTU_ACTTEST]
GO

/****** Object:  View [dbo].[Graph_Uch_Proc]    Script Date: 18.08.2015 10:00:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [dbo].[Graph_Uch_Proc]

AS
	Select vid_zaniat.iK_vid_zanyat, Content_UchPl.ik_upContent , nw.mask_week1,nw.mask_week2,nw.Num1,nw.Num2 ,Grup.Ik_grup, n_sem,
	 vid_zaniat.reason_call
	From dbo.Grup INNER JOIN
                         dbo.Uch_pl ON dbo.Grup.Ik_uch_plan = dbo.Uch_pl.ik_uch_plan INNER JOIN
                         dbo.sv_disc ON dbo.Uch_pl.ik_uch_plan = dbo.sv_disc.ik_uch_plan INNER JOIN
                         dbo.Content_UchPl ON dbo.sv_disc.ik_disc_uch_plan = dbo.Content_UchPl.ik_disc_uch_plan 
						 inner join vid_zaniat ON  Content_UchPl.ik_vid_zanyat=vid_zaniat.iK_vid_zanyat
						 inner join discpln ON  discpln.iK_disc=sv_disc.ik_disc
					--	 inner join StudGrup sg on sg.Ik_grup=Grup.Ik_grup
						 inner join nWeek nw ON Content_UchPl.ik_upContent=nw.ik_upContent
						  Where 
						 (vid_zaniat.ik_vid_zanyat=56 or
						 vid_zaniat.ik_vid_zanyat=31 or
						 vid_zaniat.ik_vid_zanyat=55)


GO


