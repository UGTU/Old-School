USE [UGTU_ACTTEST]
GO

/****** Object:  UserDefinedFunction [dbo].[GetGroupStudForPeriod]    Script Date: 12.08.2015 13:31:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







--SELECT * FROM [dbo].[GetGroupStudForPeriod](1565,GETDATE())--1641
--выбирает ступисок студентов группы на переданую дату
ALTER  FUNCTION [dbo].[GetGroupStudForPeriod](@ik_group int, @Date DATETIME)
RETURNS  TABLE 

AS
RETURN
(SELECT  Person.PersonFullName, Person.PersonSmallName, Person.nCode, StudGrup.ik_zach, StudGrup.ik_kat_zach ,StudGrup.Ik_studGrup     
FROM            dbo.Person INNER JOIN
                         dbo.Student ON dbo.Person.nCode = dbo.Student.nCode INNER JOIN
						 dbo.Zach ON Student.nCode=Zach.nCode INNER JOIN
                         dbo.StudGrup ON Zach.Ik_zach=StudGrup.Ik_zach INNER JOIN
                         dbo.Prikaz PrikazZach ON dbo.StudGrup.Ik_prikazZach = PrikazZach.Ik_prikaz LEFT JOIN
						 
						 dbo.Prikaz PrikazOtch ON  dbo.StudGrup.Ik_prikazOtch = PrikazOtch.Ik_prikaz --INNER JOIN
                         --dbo.StudGrupAcadem ON dbo.StudGrup.Ik_studGrup = dbo.StudGrupAcadem.ik_studGrupNew AND dbo.StudGrup.Ik_studGrup = dbo.StudGrupAcadem.ik_studGrup
		WHERE StudGrup.Ik_grup=@ik_group
			AND PrikazZach.Dd_prikazVst < @Date AND (PrikazOtch.Dd_prikazVst > @Date OR PrikazOtch.Dd_prikazVst IS NULL)

)

GO


