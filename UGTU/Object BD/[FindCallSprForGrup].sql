USE [UGTU_COPY]
GO

/****** Object:  StoredProcedure [dbo].[FindBaseDoc]    Script Date: 28.05.2015 16:30:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--EXEC	[dbo].[[FindBaseDoc]] @Ik_destination = 3 ,
Alter   procedure [dbo].[FindCallSprForGrup]( @ik_upContent int, @ik_studGrup int, @Ik_destination INT)
as
select Document.Ik_Document from
StudGrup
inner join Document
on StudGrup.Ik_studGrup=Document.Ik_studGrup
inner join CallSpr
on Document.Ik_Document=CallSpr.Ik_Document
Where Document.Ik_destination=@Ik_destination 
and CallSpr.Ik_upContent=@ik_upContent and
StudGrup.Ik_studGrup=@ik_studGrup
GO


