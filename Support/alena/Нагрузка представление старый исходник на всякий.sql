USE [UGTU]
GO

/****** Object:  View [TeachersPlan].[���������]    Script Date: 19.10.2016 11:54:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















CREATE view [TeachersPlan].[���������]
(���,
��������,
idFactStaffHistory,
IDImportCurricularLoad,
IDCurricularLoad,
IDDisciplineLoad,
DepartmentGUID,
[����������],
	[����������������],
	[���������],
	[������������],
	[������������],
	[����������],
	[�����������],
	[�����������],
	[���������],
	[����],
	[�������],
	[������],
	[����],
	[����������],
	[������],
	[���������],
	[������],
	[����������],
	[���������],
	[���������],
	[�����],
	[�����������],
	[���],
	[����������������],
	[�������������],
	[�����������],
	[���������������],
	[���������],
	[����������������������������],
	[��������������������������],
	[�����������������],
	[����������],
	[�������������],
	[�����],
	[���������],
	[������������������],
	[�������������],
	[�����������],
	[����������������],
	[�������������],
	[�����������],
	[����������],
	[������],
	[���������],
	[����������],
	[�����������],
	[����������],
	[������],
	[��������],
	[��������������],
	[��������],
	[������������],
	[�������],
	[����],
	[���],
	[�����������],
	[�������],
	[�����],
	[�������������],
	[�������������],
	[�����������������],
	[������������],
	[�������������],
	[���������������������],
	[��������������������],
	[��������������],
	[������������������],
	[���������������],
	[�������������������],
	[��������],
	[����������],
	[��������������������������],
	[����],
	[�������������],
	[���������],
	[��������] ,
	[��������������������] ,
	[����������������] ,
	[����������������] ,
	[���������������] ,
	[�����������������] ,
	[����������������������] ,
	[��������������������],
	[���������������],
	[����������������������])

	AS 
	SELECT distinct
	[TeachersPlan].[IndividualPlans].[Period],
	IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,'�','�') as ��������,
	max_Curricular.idFactStaffHistory,
	max_Curricular.IDImportCurricularLoad,
	CurricularLoad.IDCurricularLoad,
	DisciplineLoad.IDDisciplineLoad,
	KafTeachers.DepartmentGUID,
	Import.KafTeachers.DepartmentGUID as [����������],
	temp.���������������� as [����������������],
	null as [���������],
	null as [������������],
	null as[������������],
	IIF (TeachersPlan.IndividualPlans.StartDate='2015-09-01','2015-2016', '2016-2017') as [����������],
	null as [�����������],
	null as [�����������],
	null as [���������],
	TeachersPlan.CurricularLoad.Courses, 
	TeachersPlan.CurricularLoad.Semestr,
	null as [������],
	null as [����],
	TeachersPlan.CurricularLoad .DisciplineName,
	TeachersPlan.CurricularLoad.Groups,
	TeachersPlan.CurricularLoad.Students,
	TeachersPlan.CurricularLoad.Weeks,
	case TeachersPlan.DisciplineLoad.IDTypeLoad 
	when 1 then '���'
	when 2 then '��'
	when 3 then '���'
	when 4 then '��1'
	when 5 then '���'
	when 6 then '���'
	when 7 then '���'
	when 8 then '������'
	when 9 then '��'
	when 10 then '��'
	when 11 then '��������'
	when 12 then '������'
	when 13 then '������� ��������'
	when 14 then '���������������� ��������'
	when 15 then '���'
	when 16 then '������'
	when 17 then '���'
	when 18 then '�����'
	end as [����������],
	[TeachersPlan].[DisciplineLoad].[Quantity],
	[TeachersPlan].[DisciplineLoad].[factQuantity],
IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,[TeachersPlan].[DisciplineLoad].[Quantity],[TeachersPlan].[DisciplineLoad].[factQuantity]) as[�����],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad=1,'���',IIF (TeachersPlan.DisciplineLoad.IDTypeLoad= 6,'���',null)) as[�����������],
	null as [���],
	null as [����������������],
	Import.KafTeachers.LastName as [�������������],
	null as [�����������],
	null as [���������������],
	null as [���������],
	null as [����������������������������],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad=16,IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,cast([TeachersPlan].[DisciplineLoad].[Quantity] as float), cast([TeachersPlan].[DisciplineLoad].[factQuantity]as float)),null)  as [��������������������������],
	null as [�����������������],
	null as [����������],
	null as [�������������],
	null as [�����],
	null as [���������],
	Import.KafTeachers.EmployeeGuid as [������������������],
	null as [�������������],
	null as [�����������],
	null as [����������������],
	TeachersPlan.CurricularLoad.IDCurricularLoad AS [�������������],	 
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad in (1,2,3,4,5,6,9,10,11,12,15,17),IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,cast([TeachersPlan].[DisciplineLoad].[Quantity] as float), cast([TeachersPlan].[DisciplineLoad].[factQuantity]as float)),null) as [�����������],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad in (7,8,13,14,16,18) ,IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,cast([TeachersPlan].[DisciplineLoad].[Quantity] as float), cast([TeachersPlan].[DisciplineLoad].[factQuantity]as float)),null) as	[����������],
	null as [������],
	null as [���������],
	null as [����������],
	null as [�����������],
	null as [����������],
	null as [������],
	null as [��������],
	null as [��������������],
	null as [��������],
	null as [������������],
	null as	[�������],
	null as [����],
	null as	[���],
	null as [�����������],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad=1,1,null) as [�������],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad=6,1,null) as [�����],
	null as[�������������],
	null as [�������������],
	null as [�����������������],
	null as  [������������],
	null as  [�������������],
	null as  [���������������������],
	null as  [��������������������],
	null as  [��������������],
	null as  [������������������],
	null as  [���������������],
	null as  [�������������������],
	null as  [��������],
	null as  [����������],
	IIF (TeachersPlan.DisciplineLoad.IDTypeLoad=4,IIF ([TeachersPlan].[DisciplineLoad].[Quantity] is not null,cast([TeachersPlan].[DisciplineLoad].[Quantity] as float), cast([TeachersPlan].[DisciplineLoad].[factQuantity]as float)),null) as  [��������������������������],
	null as  [����],
	null as  [�������������],
	null as  [���������],
	null as  [��������],
	null as  [��������������������],
	null as  [����������������],
	null as  [����������������],
	null as  [���������������],
	null as  [�����������������],
	null as  [����������������������],
	null as  [��������������������],
	null as  [���������������],
	null as  [����������������������]
	
	FROM 
	Import.KafTeachers 
    inner join 
	  (select distinct [����������������], [����������],[dekanatMMIS].[Import].[Educators].[DepartmentGUID], [dekanatMMIS].[Import].[Educators].[EmployeeGUID]  
	   from [dekanatMMIS].[dbo].[��������������������] 
	   inner join 	[dekanatMMIS].[Import].[Educators] on [dekanatMMIS].[dbo].[��������������������].[���] = [dekanatMMIS].[Import].[Educators].[�����������������������]
      ) temp on temp.DepartmentGUID = Import.KafTeachers.DepartmentGUID and temp.EmployeeGUID = Import.KafTeachers.EmployeeGUID

	inner join TeachersPlan.IndividualPlans on Import.KafTeachers.idFactStaffHistory =TeachersPlan.IndividualPlans.IdTeacher 
	inner join TeachersPlan.ImportCurricularLoad on TeachersPlan.IndividualPlans.Id = TeachersPlan.ImportCurricularLoad.IDIndividualPlan 
	inner join TeachersPlan.CurricularLoad  on TeachersPlan.ImportCurricularLoad.IDImportCurricularLoad= TeachersPlan.CurricularLoad.IDImportCurricularLoad 
	inner join TeachersPlan.DisciplineLoad ON TeachersPlan.CurricularLoad.IDCurricularLoad=TeachersPlan.DisciplineLoad.IDCurricularLoad 
	inner JOIN TeachersPlan.TypeLoad ON TeachersPlan.DisciplineLoad.IDTypeLoad = TeachersPlan.TypeLoad.IDTypeLoad
	inner join 
	  (select max(TeachersPlan.ImportCurricularLoad.IDImportCurricularLoad) as  IDImportCurricularLoad, (TeachersPlan.IndividualPlans.[Id]) as [Id],
	   [dekanatMMIS].[Import].[Educators].idFactStaffHistory
	   from [dekanatMMIS].[Import].[Educators] 
	  inner join
	   TeachersPlan.IndividualPlans on [dekanatMMIS].[Import].[Educators].idFactStaffHistory = TeachersPlan.IndividualPlans.IdTeacher
			   inner join TeachersPlan.ImportCurricularLoad on TeachersPlan.ImportCurricularLoad.IDIndividualPlan = TeachersPlan.IndividualPlans.Id
			   --inner join [dekanatMMIS].[dbo].[��������������������] on [dekanatMMIS].[dbo].[��������������������].[���] = [dekanatMMIS].[Import].[Educators].[�����������������������]
			   group by  [dekanatMMIS].[Import].[Educators].idFactStaffHistory, [Id]
			   
			  ) max_Curricular on max_Curricular.idFactStaffHistory = Import.KafTeachers.idFactStaffHistory
			   and max_Curricular.IDImportCurricularLoad = TeachersPlan.ImportCurricularLoad.IDImportCurricularLoad 















GO


