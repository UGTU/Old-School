USE [UGTU_ACTTEST]
GO

/****** Object:  View [dbo].[CallSprView]    Script Date: 01.08.2015 9:46:39 ******/
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
vz.[iK_vid_zanyat],cup.ik_upContent, vz.reason_call,(DATEDIFF(day,cs.DateStartPeriod,cs.DateEndPeriod)+1) as Kol_day
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


