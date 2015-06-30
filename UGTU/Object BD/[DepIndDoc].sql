USE [UGTU_ACTTEST]
GO

/****** Object:  UserDefinedFunction [dbo].[MaxNumDocument]    Script Date: 08.04.2015 14:17:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[DepIndDoc]( @ik_studGrup int)
RETURNS @Result TABLE
(
	Dep_Index varchar(10)
)
AS
BEGIN
	insert into @Result(Dep_Index)
	Select f.Dep_Index
	From StudGrup sg inner join Grup g
	ON sg.Ik_grup=g.Ik_grup
	inner join Relation_spec_fac rsp
	ON g.ik_spec_fac =rsp.ik_spec_fac
	inner join Fac f
	ON rsp.ik_fac=f.Ik_fac
	where sg.Ik_studGrup=@ik_studGrup
RETURN
END



GO


