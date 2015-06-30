--select * from [StudHistForSpr](96)
CREATE procedure [dbo].[DestForStud](@ik_stud INT)

AS
declare @ik_f_e int
SET @ik_f_e  = (	Select Ik_form_ed From
	StudInfoForDocs  where Ik_studGrup = @ik_stud)
IF @ik_f_e = 1 
BEGIN
	Select Destination.ik_destination,[cShortNameDestination] From Destination where Ik_destination <> 3 
END
ELSE 
BEGIN
	Select Destination.ik_destination, [cShortNameDestination]From Destination 
END
--RETURN 

GO


