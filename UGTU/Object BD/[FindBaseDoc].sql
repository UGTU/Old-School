USE [UGTU_ACTTEST]
GO

/****** Object:  StoredProcedure [dbo].[FindBaseDoc]    Script Date: 28.05.2015 16:30:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--EXEC	[dbo].[[FindBaseDoc]] @Ik_destination = 3 ,
ALTER   procedure [dbo].[FindBaseDoc](@Ik_destination INT,@Ik_StudGrup INT)
as
select  cShortNameDestination +' (¹'+CAST(Document.NumberDoc as varchar(10)) +' - '+ CAST(Document.Num_podrazd as varchar(10))
+' '+ convert(nvarchar(MAX), Document.DateReady, 4) +')'[cNameOsn],Document.Ik_Document,Addressee_Doc.[ik_personAddress]
from  Destination
inner join Document
on Destination.Ik_destination = Document.Ik_destination
inner join StudGrup 
on Document.Ik_studGrup=StudGrup.Ik_studGrup
inner join 
(select Destination2.Ik_destination
from Destination
		inner join Base_Destination 
		on Destination.Ik_destination=Base_Destination.Ik_destination1
				inner join Destination Destination2
				on Base_Destination.Ik_destination2=Destination2.Ik_destination
				Where Destination.Ik_destination=@Ik_destination
				) doc
on Destination.Ik_destination=doc.Ik_destination 
left join DocumentBase 
on Document.ik_Document=DocumentBase.Ik_Document_reference
left join Document Document2
on DocumentBase.Ik_Document_base=Document2.Ik_Document
left join Addressee_Doc
on Document.Ik_Document=Addressee_Doc.Ik_Document
Where StudGrup.Ik_studGrup=@Ik_StudGrup and Document.DateReady is not null and Document2.Ik_Document is null

--select cNameDestination+' (¹'+ NumberDoc+' - '+Num_podrazd+' '+ iif(DAY(DateReady)>9,'0'+DAY(DateReady),DAY(DateReady))+
--'.'+ iif(Month(DateReady)>9,'0'+Month(DateReady),Month(DateReady))+'.'+Year(DateReady)+')'[cNameOsn],Ik_Document

--select cNameDestination+' (¹'+ CAST(NumberDoc as varchar(10))+' - '+ CAST(Num_podrazd as varchar(10))+' '+ CAST(DateReady as varchar(10))
--+')'[cNameOsn],Ik_Document
GO


