USE [UGTU]
GO

/****** Object:  Table [dbo].[DepartmentHistory]    Script Date: 29.03.2016 14:45:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE UGTU.[Import].[DepartmentHistory](
	[id] [int] NOT NULL,
	[idDepartment] [int] NOT NULL,
	[DateBegin] [datetime] NOT NULL CONSTRAINT [DF_DepartmentHistory_DateBegin]  DEFAULT (getdate()),
	[DepartmentName] [varchar](500) NOT NULL,
	[DepartmentSmallName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DepartmentHistory] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_DepartmentHistoryUnique] UNIQUE CLUSTERED 
(
	[idDepartment] ASC,
	[DateBegin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


