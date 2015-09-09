Create function [dbo].[LastNumDocument](@DateBegin Datetime,@DateEnd Datetime, @numpodrazd varchar(10),@ik_dest int )
--RETURNS @Result TABLE(	MaxNum int
--)
Returns int
AS
BEGIN
DECLARE @Num int = 0

	--insert into @Result(MaxNum)
	Select @Num =  iif (MAX(NumberDoc)is null, 0,MAX(NumberDoc))From Document
	inner join Destination 
	on Document.Ik_destination=Destination.Ik_destination
	 where DateCreate >=@DateBegin and DateCreate<=@DateEnd
	and Document.Num_podrazd=@numpodrazd
	and [Ik_TypeDest] in (Select [Ik_TypeDest] from Destination where Ik_destination = @ik_dest );

RETURN @Num
END