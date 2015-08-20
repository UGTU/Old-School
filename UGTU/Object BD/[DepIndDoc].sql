USE [UGTU_ACTTEST]
GO

/****** Object:  UserDefinedFunction [dbo].[DepIndDoc]    Script Date: 17.08.2015 15:07:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER function [dbo].[DepIndDoc]( @ik_Grup int)
RETURNS @Result TABLE
(
	Dep_Index varchar(10)
)
AS
BEGIN
	insert into @Result(Dep_Index)
	Select f.Dep_Index  
	from Grup g
	inner join Relation_spec_fac rsp
	ON g.ik_spec_fac =rsp.ik_spec_fac
	inner join Fac f
	ON rsp.ik_fac=f.Ik_fac
	where g.Ik_Grup=@ik_Grup
RETURN
END




GO


