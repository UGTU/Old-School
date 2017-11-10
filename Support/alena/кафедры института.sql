/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT TOP 1000 [DepartmentGUID]
      ,[DepartmentName]
      ,[DepartmentSmallName]
      ,[DepartmentIndex]
      ,[idDepartmentType]
      ,[DepPhoneNumber]
      ,[ManagerSmallName]
      ,[ManagerName]
      ,[dateExit]
      ,[ManagerDepartmentGUID]
      ,[DateCreate]
      ,[idManagerFactStaffHistory]
  FROM [UGTU].[Import].[DepartmentMainData] where [ManagerDepartmentGUID]='05573F83-F047-4900-990C-B5154EFAD153' and (idDepartmentType=6 and dateExit is null or dateExit >getdate())
  --[DepartmentName] like '%институт экономики%' 