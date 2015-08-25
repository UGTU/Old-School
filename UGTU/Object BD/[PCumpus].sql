USE [UGTU_ACTTEST]
GO

/****** Object:  View [dbo].[PStreet]    Script Date: 21.08.2015 14:24:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


Create    VIEW [dbo].[PCumpus]
AS
SELECT     TOP 100 PERCENT NULLIF (s.Ik_street, NULL) AS Ik_street, s.Ik_type_street, 
			ts.Ik_type_street AS Ik_type_street2, 
			s.ik_gorod ,rrsg.ik_gorod as ik_gorod2,
                      	Cstrana AS Страна, Cregion Регион, Craion AS Район, Cgorod AS [Насел пункт],
			ts.CType_Street AS [Вид гор. обр.], 
                        s.CStreet AS [Название гор. обр.]
FROM 
	(Select a.ik_address, Cgorod, CIndex, Craion, Cregion, Cstrana,CStreet,BuildingNumber 
	From
	(Select Ik_street,s.CStreet, Cgorod, CIndex, Craion, Cregion, Cstrana From
	  (SELECT ik_gorod, Cgorod, CIndex, Craion, Cregion, Cstrana FROM
	    (SELECT Ik_raion,Craion, Cregion, Cstrana FROM
	      (SELECT Ik_region, Cregion, Cstrana
		FROM dbo.Strana st
		INNER JOIN dbo.Region rg ON st.Ik_strana = rg.Ik_strana) rs 
	       INNER JOIN dbo.Raion r ON rs.Ik_region = r.Ik_region) rrs
	     INNER JOIN dbo.Gorod g ON g.Ik_raion = rrs.Ik_raion) rrsg
	  INNER JOIN dbo.Street s ON rrsg.ik_gorod=s.ik_gorod
	INNER JOIN dbo.Type_street ts ON ts.Ik_type_street = s.Ik_type_street )rrsgs
	inner join Address a on a.Ik_street=rrsgs.Ik_street)
	inner join
--ORDER BY Регион--, Cregion, Craion, Cgorod, ts.CType_Street, s.CStreet

GO


