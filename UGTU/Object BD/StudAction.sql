USE [UGTU_ACTTEST]
GO
/****** Object:  UserDefinedFunction [dbo].[StudAction]    Script Date: 07.05.2015 12:33:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--select * from [StudAction](33948, 8)
ALTER function [dbo].[StudAction](@Ik_studGrup INT,  @nsem int)
RETURNS @Result TABLE
(
	iK_vid_zanyat int

) 
AS
BEGIN
	insert into @Result(iK_vid_zanyat,ik_upContent, mask_week1,mask_week2,Num1,Num2)
	Select iK_vid_zanyat, ik_upContent , mask_week1,mask_week2,Num1,Num2 
	From Graph_Uch_Proc
RETURN
END

