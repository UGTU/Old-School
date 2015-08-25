USE [UGTU_ACTTEST]
GO

/****** Object:  View [dbo].[ViewGroupStud]    Script Date: 18.08.2015 14:22:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









--SELECT * FROM [dbo].[GetGroupStudForPeriod](1565,GETDATE())--1641
--выбирает ступисок студентов группы на переданую дату
--select * from [ViewGroupStud] where Ik_grup=1565
ALTER view [dbo].[ViewGroupStud]
as
SELECT  Person.PersonFullName, Person.PersonSmallName, Person.nCode, StudGrup.ik_zach, StudGrup.ik_kat_zach ,StudGrup.Ik_studGrup,StudGrup.Ik_grup ,  PersonAddress.ik_personAddress AS  ik_persAddr,
PersonAddress.ik_AddressType  
FROM            dbo.Person INNER JOIN
                         dbo.Student ON dbo.Person.nCode = dbo.Student.nCode INNER JOIN
						 dbo.Zach ON Student.nCode=Zach.nCode INNER JOIN
                         dbo.StudGrup ON Zach.Ik_zach=StudGrup.Ik_zach INNER JOIN
                         dbo.Prikaz PrikazZach ON dbo.StudGrup.Ik_prikazZach = PrikazZach.Ik_prikaz LEFT JOIN
						 
						 dbo.Prikaz PrikazOtch ON  dbo.StudGrup.Ik_prikazOtch = PrikazOtch.Ik_prikaz --INNER JOIN
                         --dbo.StudGrupAcadem ON dbo.StudGrup.Ik_studGrup = dbo.StudGrupAcadem.ik_studGrupNew AND dbo.StudGrup.Ik_studGrup = dbo.StudGrupAcadem.ik_studGrup
						 inner join 
						 PersonAddress 
						 on Person.nCode=PersonAddress.nCode
						 inner join
						 (select Person.nCode, min (PersonAddress.ik_AddressType)[ik_AddressType]
						    from
						 Person inner join PersonAddress
						 on Person.nCode=PersonAddress.nCode
						 group by Person.nCode
						 )g
						 on Person.nCode=g.nCode
						 where PersonAddress.ik_AddressType=g.ik_AddressType and 
		 PrikazZach.Dd_prikazVst < GetDate() AND (PrikazOtch.Dd_prikazVst > GetDate() OR PrikazOtch.Dd_prikazVst IS NULL)
		 



GO


