INSERT INTO UGTU_TEST.[Import].[KafTeachers]([TypeWorkName],[PostName],[EmployeeGUID],[FirstName],[LastName],[Otch],[DepartmentGUID],
	[PostGUID],[DateBegin],[DateEnd],[StaffCount],[HourCount], idFactStaffHistory,Login,isPPS,itab_n,[BirthDate], [idEmployee])
SELECT [TypeWorkName],Post.[PostName],Employee.GUID,[FirstName],[LastName],[Otch],
	Dep.DepartmentGUID,Post.[PostGUID],[FactStaffWithHistory].DateBegin,[FactStaffWithHistory].DateEnd,[StaffCount],[HourCount], 
	idFactStaffHistory, EmployeeLogin,Category.IsPPS,itab_n,[BirthDate], Employee.id
FROM KADR.[dbo].[FactStaffWithHistory]
INNER JOIN KADR.dbo.PlanStaff ON [FactStaffWithHistory].idPlanStaff=PlanStaff.id
INNER JOIN KADR.dbo.Post ON PlanStaff.idPost=Post.id
INNER JOIN KADR.dbo.WorkType ON [FactStaffWithHistory].idTypeWork=WorkType.id
INNER JOIN KADR.dbo.Employee ON [FactStaffWithHistory].idEmployee=Employee.id
INNER JOIN KADR.dbo.Dep ON PlanStaff.idDepartment=Dep.id
INNER JOIN KADR.dbo.Category ON Post.idCategory=Category.id
Where KADR.[dbo].[FactStaffWithHistory].idFactStaffHistory not in (select  idFactStaffHistory from UGTU_TEST.[Import].[KafTeachers])

update UGTU_TEST.[Import].[KafTeachers]
	set [TypeWorkName]=KADR.dbo.WorkType.[TypeWorkName],
	[PostName]=KADR.dbo.Post.[PostName],
	[EmployeeGUID] = Employee.GUID,
	[FirstName]=KADR.dbo.Employee.[FirstName],
	[LastName] = KADR.dbo.Employee.[LastName],
	[Otch] = KADR.dbo.Employee.[Otch],
	[DepartmentGUID] = Dep.DepartmentGUID,
	[PostGUID] = KADR.dbo.Post.[PostGUID],
	[DateBegin]=KADR.[dbo].[FactStaffWithHistory].DateBegin,
	[DateEnd] = [FactStaffWithHistory].DateEnd,
	[StaffCount] = KADR.[dbo].[FactStaffWithHistory].[StaffCount],
	[HourCount] = KADR.[dbo].[FactStaffWithHistory].[HourCount], 
	idFactStaffHistory = KADR.[dbo].[FactStaffWithHistory].idFactStaffHistory, 
	Login = EmployeeLogin,
	isPPS = Category.IsPPS,
	itab_n = KADR.dbo.Employee.itab_n,
	[BirthDate] = KADR.dbo.Employee.[BirthDate],
	idEmployee=KADR.dbo.Employee.id
FROM KADR.[dbo].[FactStaffWithHistory]
INNER JOIN KADR.dbo.PlanStaff ON [FactStaffWithHistory].idPlanStaff=PlanStaff.id
INNER JOIN KADR.dbo.Post ON PlanStaff.idPost=Post.id
INNER JOIN KADR.dbo.WorkType ON [FactStaffWithHistory].idTypeWork=WorkType.id
INNER JOIN KADR.dbo.Employee ON [FactStaffWithHistory].idEmployee=Employee.id
INNER JOIN KADR.dbo.Dep ON PlanStaff.idDepartment=Dep.id
INNER JOIN KADR.dbo.Category ON Post.idCategory=Category.id
Where KADR.[dbo].[FactStaffWithHistory].idFactStaffHistory =  UGTU_TEST.[Import].[KafTeachers].idFactStaffHistory

INSERT INTO UGTU_TEST.[Import].[KafTeachers]([TypeWorkName],[PostName],[EmployeeGUID],[FirstName],[LastName],[Otch],[DepartmentGUID],
	[PostGUID],[DateBegin],[DateEnd],[StaffCount],[HourCount], idFactStaffHistory,Login,isPPS,itab_n,[BirthDate], [idEmployee])

SELECT [TypeWorkName],'' [PostName],Employee.GUID,[FirstName],[LastName],[Otch],
	Dep.DepartmentGUID,null as [PostGUID],[FactStaffWithHistory].DateBegin,[FactStaffWithHistory].DateEnd,[StaffCount],[HourCount], 
	idFactStaffHistory, EmployeeLogin,1 IsPPS,itab_n,[BirthDate], Employee.id
FROM KADR.[dbo].[FactStaffWithHistory]
INNER JOIN KADR.dbo.WorkType ON [FactStaffWithHistory].idTypeWork=WorkType.id
INNER JOIN KADR.dbo.Employee ON [FactStaffWithHistory].idEmployee=Employee.id
INNER JOIN KADR.dbo.Dep ON [FactStaffWithHistory].idDepartment=Dep.id

Where KADR.[dbo].[FactStaffWithHistory].idFactStaffHistory not in (select  idFactStaffHistory from UGTU_TEST.[Import].[KafTeachers]) and DateEnd>GetDate()

update UGTU_TEST.[Import].[KafTeachers]

set [TypeWorkName] = KADR.dbo.WorkType.[TypeWorkName],
[PostName]='',
[EmployeeGUID]= Employee.GUID,
[FirstName] =KADR.dbo.Employee.[FirstName],
[LastName]=KADR.dbo.Employee.[LastName],
[Otch] = KADR.dbo.Employee.[Otch],
[DepartmentGUID] = Dep.DepartmentGUID,
	[PostGUID] = NULL, 
	[DateBegin] =KADR.[dbo].[FactStaffWithHistory].DateBegin,
	[DateEnd]= [FactStaffWithHistory].DateEnd,
	[StaffCount] = KADR.[dbo].[FactStaffWithHistory].[StaffCount],
	[HourCount] = KADR.[dbo].[FactStaffWithHistory].[HourCount], 
	idFactStaffHistory=KADR.[dbo].[FactStaffWithHistory].idFactStaffHistory, 
	Login = EmployeeLogin,
	isPPS = 1,
	itab_n = KADR.dbo.Employee.[itab_n],
	[BirthDate] = KADR.dbo.Employee.[BirthDate],
	[idEmployee] =KADR.dbo.Employee.id
FROM KADR.[dbo].[FactStaffWithHistory]
INNER JOIN KADR.dbo.WorkType ON [FactStaffWithHistory].idTypeWork=WorkType.id
INNER JOIN KADR.dbo.Employee ON [FactStaffWithHistory].idEmployee=Employee.id
INNER JOIN KADR.dbo.Dep ON [FactStaffWithHistory].idDepartment=Dep.id
Where KADR.[dbo].[FactStaffWithHistory].idFactStaffHistory =  UGTU_TEST.[Import].[KafTeachers].idFactStaffHistory

