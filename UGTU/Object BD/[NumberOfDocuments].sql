
--select * from [NumberOfDocuments]('01.09.2014','01.09.2015')
Alter function [dbo].[NumberOfDocuments](@DateBegin Datetime,@DateEnd Datetime)
RETURNS @Result TABLE
(
	NumApplication int,
	Num�onsideration int
)
AS
BEGIN

	insert into @Result(NumApplication,Num�onsideration)
	Select * 
	from
	(Select Count(Ik_Document) as NumApplication From MagazineDocs where DatePod >=@DateBegin and DatePod<=@DateEnd
	 and DateCreate IS NULL and  ik_spec_fac in (select * from [GetSpecPermissionsFromRelTable]()))m
	cross join
	(Select Count(Ik_Document) as Num�onsideration From MagazineDocs where DatePod >=@DateBegin and DatePod<=@DateEnd
	and  ik_spec_fac in (select * from [GetSpecPermissionsFromRelTable]()) and DateReady IS NULL)n
RETURN
END