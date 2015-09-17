USE [UGTU_ACTTEST]
GO

/****** Object:  UserDefinedFunction [dbo].[MaxNumDocument]    Script Date: 31.03.2015 11:09:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--select * from StudHistory(42062)
ALTER function [dbo].[MaxNumDocument](@DateBegin Datetime,@DateEnd Datetime)
RETURNS @Result TABLE
(
	MaxNum int
)
AS
BEGIN
	insert into @Result(MaxNum)
	Select MAX(NumberDoc)[MaxNum] From Document where DateCreate >=@DateBegin and DateCreate<=@DateEnd
RETURN
END



GO


