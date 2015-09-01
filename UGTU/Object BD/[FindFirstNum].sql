--select * from [FindFirstNum](8)
Create function [dbo].[FindFirstNum]( @ik_dest int )
--RETURNS @Result TABLE
--(
--	MaxNum int
--)
returns int
AS
BEGIN
DECLARE @LastNum int = 0
	--insert into @Result(MaxNum)
Select @LastNum=iif (MAX(Distinct Num) is null,0,MAX(Num))  
from  Destination d
inner join TypeDest td
on d.Ik_TypeDest = td.Ik_TypeDest
inner join BeginNumDoc bnd
on td.Ik_TypeDest=bnd.Ik_TypeDest
inner join Room r
on bnd.ik_room = r.ik_room
inner join Relation_spec_fac rsf
on  r.ik_room=rsf.ik_room
where rsf.ik_spec_fac in (select * from [GetSpecPermissionsFromRelTable]()) 
and yearD=Year(GetDate()) and Ik_destination=@ik_dest

RETURN @LastNum
END






