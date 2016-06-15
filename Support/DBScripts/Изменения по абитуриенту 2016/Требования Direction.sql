USE [UGTU]
GO

/****** Object:  Table [dbo].[DirectionRequirement]    Script Date: 23.03.2016 12:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DirectionRequirement](
	[ik_requirement] [int] IDENTITY(1,1) NOT NULL,
	[ik_Direction] [int] NOT NULL,
	[ik_requiredDirection] [int] NOT NULL,
 CONSTRAINT [PK_DirectionRequirement] PRIMARY KEY NONCLUSTERED 
(
	[ik_requirement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_DirectionRequirementClustered] UNIQUE CLUSTERED 
(
	[ik_Direction] ASC,
	[ik_requiredDirection] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[DirectionRequirement]  WITH CHECK ADD  CONSTRAINT [FK_DirectionRequirement_Direction] FOREIGN KEY([ik_Direction])
REFERENCES [dbo].[Direction] ([ik_direction])
GO

ALTER TABLE [dbo].[DirectionRequirement] CHECK CONSTRAINT [FK_DirectionRequirement_Direction]
GO

ALTER TABLE [dbo].[DirectionRequirement]  WITH CHECK ADD  CONSTRAINT [FK_DirectionRequirement_Direction1] FOREIGN KEY([ik_requiredDirection])
REFERENCES [dbo].[Direction] ([ik_direction])
GO

ALTER TABLE [dbo].[DirectionRequirement] CHECK CONSTRAINT [FK_DirectionRequirement_Direction1]
GO


GO

/****** Object:  Index [IX_DirectionRequirement]    Script Date: 23.03.2016 12:26:07 ******/
CREATE NONCLUSTERED INDEX [IX_DirectionRequirement] ON [dbo].[DirectionRequirement]
(
	[ik_requiredDirection] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


GO

/*TOP 100 PERCENT NULLIF (s.Ik_street, NULL) AS Ik_street, s.Ik_type_street, 
			ts.Ik_type_street AS Ik_type_street2, 
			s.ik_gorod ,rrsg.ik_gorod as ik_gorod2,
                      	Cstrana AS ������, Cregion ������, Craion AS �����, Cgorod AS [����� �����],
			ts.CType_Street AS [��� ���. ���.], 
                        s.CStreet AS [�������� ��� ���]
						
						Type_street,Gorod

23	PStreet	�����	Type_street,Gorod	Ctype_Street,cGorod	��� ���������� �����������,��������� �����	NULL	5	True	NULL
						*/


alter    VIEW [dbo].[PDirectionRequirement]
AS
SELECT     TOP 100 PERCENT NULLIF ([ik_requirement], NULL) AS [ik_requirement], 
			[DirectionRequirement].ik_requiredDirection ik_requiredDirection, requiredDirection.ik_direction as ik_requiredDirection2,
			[DirectionRequirement].ik_Direction ik_mainDirection, mainDirection.ik_direction as ik_mainDirection2,
            mainDirection.cName_direction [������� ���],  requiredDirection.cName_direction [���� ������� ���]         	
FROM 
	    [dbo].[DirectionRequirement]  
		INNER JOIN [dbo].[Direction] mainDirection ON [DirectionRequirement].ik_Direction = mainDirection.ik_direction
		INNER JOIN [dbo].[Direction] requiredDirection ON [DirectionRequirement].ik_requiredDirection = requiredDirection.ik_direction


ORDER BY [������� ���], [���� ������� ���]



go
INSERT INTO [dbo].[Sprav]
           ([cSprav]
           ,[SpravName]
           ,[CTableVn]
           ,[CPrKey]
           ,[TableVnName]
           ,[TabCount]
           ,[Visible])
		   values ('PDirectionRequirement','���������� � ���������������� ������',
			'Direction,Direction','cName_direction,cName_direction',
			'',2,1)