USE [UGTU_ACTTEST]
GO

/****** Object:  StoredProcedure [dbo].[StudInfoSpravBuild]    Script Date: 12.08.2015 12:53:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










--EXEC	[dbo].[AllAddrStudInGroup] @ik_grup=1565
Alter   procedure [dbo].[AllAddrStudInGroup](@ik_grup INT,@Ik_studGrup  INT,  @ik_AddressType INT)
as

declare @Date DATETIME
SET @Date=GETDATE()


	SELECT PersonSmallName,AddressTypeName,( sa.Cstrana+', '+  Cregion+ ', '+[cshort_type_gorod]+' '+ sa.Cgorod+', '+sa.cshort_type_street+' '+
			 CStreet+' '+sa.BuildingNumber + ', кв. '+ [FlatNumber])as[StudAddr],ik_personAddress 
		FROM StudAddress sa inner join
		GetGroupStudForPeriod(@ik_grup,@Date)  studgr
		on studgr.Ik_studGrup = sa.Ik_studGrup
		where sa.Ik_studGrup=@Ik_studGrup and ik_AddressType=@ik_AddressType











GO


