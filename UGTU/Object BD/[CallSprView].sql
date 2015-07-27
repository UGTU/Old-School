USE [UGTU_ACTTEST]
GO

/****** Object:  View [dbo].[CallSprView]    Script Date: 25.07.2015 15:40:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER view [dbo].[CallSprView]

AS
	Select d.[Ik_Document],[Ik_Transfer],dest.[Ik_destination],sg.[Ik_studGrup],[DateReady],[NumberDoc],
[DateCreate],[Num_podrazd],DAY([DateStartPeriod]) as dayb, Month([DateStartPeriod]) as monthb,
Year([DateStartPeriod]) as yearb,
DAY([DateEndPeriod]) as daye, Month([DateEndPeriod]) as monthe,
Year([DateEndPeriod]) as yeare,[n_sem],
dest.cNameDestination,[cName_vid_zanyat],
vz.[iK_vid_zanyat],cup.ik_upContent, vz.reason_call
	From  Document d inner join StudGrup sg
	on d.Ik_studGrup=sg.Ik_studGrup
	inner join CallSpr  cs 
	on d.Ik_Document=cs.Ik_Document
	inner join Content_UchPl cup 
	on cup.ik_upContent=cs.Ik_upContent
	inner join vid_zaniat vz
	on cup.ik_vid_zanyat = vz.iK_vid_zanyat
	inner join Destination dest
	on dest.Ik_destination=d.Ik_destination




GO


