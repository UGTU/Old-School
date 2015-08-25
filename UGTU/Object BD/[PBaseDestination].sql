USE [UGTU_ACTTEST]
GO

/****** Object:  View [dbo].[PStreet]    Script Date: 21.08.2015 11:47:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


Alter    VIEW [dbo].[PBaseDestination] 
AS
select bd.ik_basedest, 
bd.Ik_destination2 as Ik_osn1, d2.Ik_destination [ik_osn],
bd.Ik_destination1, d1.Ik_destination,
d1.cNameDestination as Назначение,d2.cNameDestination  as Основание
from Destination d1
		inner join Base_Destination bd
		on d1.Ik_destination=bd.Ik_destination1
				inner join Destination d2
				on bd.Ik_destination2=d2.Ik_destination