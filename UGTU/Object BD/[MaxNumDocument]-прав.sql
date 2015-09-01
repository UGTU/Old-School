USE [UGTU_ACTTEST]
GO

/****** Object:  UserDefinedFunction [dbo].[MaxNumDocument]    Script Date: 28.05.2015 16:46:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







--select * from  [MaxNumDocument]('01.09.2015','01.10.2015','60/01',7)
Create function [dbo].[MaxNumDocument](@DateBegin Datetime,@DateEnd Datetime, @numpodrazd varchar(10),@ik_dest int )
RETURNS @Result TABLE
(
	MaxNum int
)
AS
BEGIN
	
	IF @ik_dest = 1 or  @ik_dest = 2 or @ik_dest = 8
BEGIN
	insert into @Result(MaxNum)
	Select iif (MAX(NumberDoc)is null,0,MAX(NumberDoc))[MaxNum] From Document where DateCreate >=@DateBegin and DateCreate<=@DateEnd
	and (Ik_destination=1 or Ik_destination=2 or Ik_destination=8) and Document.Num_podrazd=@numpodrazd
END

	IF @ik_dest = 3
BEGIN
	insert into @Result(MaxNum)
	Select iif (MAX(NumberDoc)is null,0,MAX(NumberDoc))[MaxNum] From Document where DateCreate >=@DateBegin and DateCreate<=@DateEnd
	and (Ik_destination=3) and Document.Num_podrazd=@numpodrazd
END
	IF @ik_dest = 7
BEGIN
	insert into @Result(MaxNum)
	Select iif (MAX(NumberDoc)is null,0,MAX(NumberDoc))[MaxNum] From Document where DateCreate >=@DateBegin and DateCreate<=@DateEnd
	and (Ik_destination=7) 
END
	IF @ik_dest = 4 or  @ik_dest = 5 or @ik_dest = 6
BEGIN
	insert into @Result(MaxNum)
	Select iif (MAX(NumberDoc)is null,0,MAX(NumberDoc))[MaxNum] From Document where DateCreate >=@DateBegin and DateCreate<=@DateEnd
	and (Ik_destination=4 or Ik_destination=5 or Ik_destination=6) and Document.Num_podrazd=@numpodrazd
END
RETURN
END





GO


