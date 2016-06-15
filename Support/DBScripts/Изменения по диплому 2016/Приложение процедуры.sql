go

CREATE TABLE [Import].[DepartmentHistory](
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



go

--[dbo].GetVipiscaCommonInf 1565
create PROC [dbo].GetVipiscaCommonInf
@ik_CurGroup INT				--код текущей группы  
AS
select [id], [DepartmentName], [DepartmentSmallName], [DateBegin]
 from [Import].[DepartmentHistory]
	INNER JOIN dbo.Grup ON [Ik_grup]=@ik_CurGroup
where [idDepartment]=1
	AND YEAR([DateBegin]) > [nYear_post] 
	AND [DateBegin]<[DateExit]

UNION
--последнее пред изменение отдела
select [id], [DepartmentName], [DepartmentSmallName], [DateBegin]
 from [Import].[DepartmentHistory]
	INNER JOIN (SELECT [idDepartment], MAX([DateBegin]) LastDateBegin
		FROM [Import].[DepartmentHistory]
			INNER JOIN dbo.Grup ON [Ik_grup]=@ik_CurGroup
		where YEAR([DateBegin]) < [nYear_post] 
		GROUP BY [idDepartment])LastChange
	ON [DepartmentHistory].[idDepartment]=LastChange.[idDepartment]
		AND [DepartmentHistory].[DateBegin]=LastChange.LastDateBegin
where [DepartmentHistory].[idDepartment]=1

ORDER BY [DateBegin] desc

go