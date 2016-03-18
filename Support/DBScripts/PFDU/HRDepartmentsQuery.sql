use UGTU
go

select 
   1 as Tag,
   NULL as Parent,
   [DepartmentMainData].DepartmentGUID as "Department!1!UID",
   DepartmentName As "Department!1!Name", 
   DepartmentSmallName as "Department!1!DepartmentShortName", 
   ManagerName As "Department!1!ManagedBy",
   'Описание структурного подразделения' as "Department!1!Description",
   NULL as "Employee!2!ID",
   NULL as "Employee!2!LastName",
   NULL as "Employee!2!FirstName",
   NULL as "Employee!2!Patronimic",
   NULL as "Employee!2!Post",
   NULL as "Employee!2!Degree",
   NULL as "Employee!2!BirthDate",
   NULL as "Employee!2!IsTutorial",
   NULL as "Employee!2!Stake",
   NULL as "Employee!2!Description",   
   NULL as "Tutorial!3!Entry"   
   from [Import].[DepartmentMainData] where idDepartmentType = 6 and (dateExit is null or dateExit > GETDATE())
 --  and [DepartmentMainData].DepartmentGUID = '2434E8C5-43FB-48E5-A4AC-9A1179896B23' 
   union all
select 
   2,
   1,
   [DepartmentMainData].DepartmentGUID,
   DepartmentName, 
   DepartmentSmallName, 
   ManagerName,
   NULL,
   idEmployee,
   LastName,
   FirstName,
   Otch,
   PostName,
   DegreeSmallName,
   BirthDate,
   isPPS,
   StaffCount,
   'Информация о преподавателе',
   NULL  
   from [Import].[DepartmentMainData], [Import].KafTeachers where [DepartmentMainData].DepartmentGUID = [KafTeachers].DepartmentGUID
   and idDepartmentType = 6 and (dateExit is null or dateExit > GETDATE()) and (KafTeachers.DateEnd is null or KafTeachers.DateEnd > GETDATE())
--   and [DepartmentMainData].DepartmentGUID = '2434E8C5-43FB-48E5-A4AC-9A1179896B23' 
    union all
select distinct 3, 2,
   [DepartmentMainData].DepartmentGUID,
   NULL, 
   NULL, 
   NULL,
   NULL,
   t.idEmployee,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   TeachersPlan.CurricularLoad.DisciplineName
   FROM [Import].[DepartmentMainData] inner join [Import].[KafTeachers] t on [Import].[DepartmentMainData].DepartmentGUID = t.DepartmentGUID inner join 
						 TeachersPlan.IndividualPlans ip on ip.IdTeacher =t.idFactStaffHistory INNER JOIN
                         TeachersPlan.ImportCurricularLoad icl ON ip.Id = icl.IDIndividualPlan INNER JOIN
                         TeachersPlan.CurricularLoad ON icl.IDImportCurricularLoad = TeachersPlan.CurricularLoad.IDImportCurricularLoad AND 
                         icl.IDImportCurricularLoad = TeachersPlan.CurricularLoad.IDImportCurricularLoad and
						 icl.DateImport = (select Max(DateImport) from TeachersPlan.ImportCurricularLoad where ImportCurricularLoad.IDIndividualPlan = ip.id)
		WHERE (GETDATE() BETWEEN ip.StartDate AND ip.EndDate) 
	          and ip.DossolutionDate IS NULL and [DepartmentMainData].DepartmentGUID = t.DepartmentGUID
   and idDepartmentType = 6 and (dateExit is null or dateExit > GETDATE()) and (t.DateEnd is null or t.DateEnd > GETDATE()) and (TeachersPlan.CurricularLoad.DisciplineName <> '') and (TeachersPlan.CurricularLoad.Groups != '')
  --and [DepartmentMainData].DepartmentGUID = '2434E8C5-43FB-48E5-A4AC-9A1179896B23' 
   ORDER BY [Department!1!UID], [Employee!2!ID]
   for xml explicit, root('Departments')

   
   
   