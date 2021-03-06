/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT TOP 1000 [TypeWorkName]
      ,[PostName]
      ,[EmployeeGUID]
      ,[FirstName]
      ,[LastName]
      ,[Otch]
      ,[DepartmentGUID]
      ,[PostGUID]
      ,[DateBegin]
      ,[DateEnd]
      ,[StaffCount]
      ,[HourCount]
      ,[idFactStaffHistory]
      ,[Login]
      ,[isPPS]
      ,[DegreeName]
      ,[itab_n]
      ,[RankName]
      ,[DegreeSmallName]
      ,[BirthDate]
      ,[idEmployee]
      ,[DegreeScienceName]
      ,[PPSStuff]
      ,[HourlyLoad]
  FROM [UGTU].[Import].[KafTeachers] WHERE       
  (DepartmentGUID = '2aef3fd5-664d-e111-96a2-0018fe865bec') AND 
  (isPPS = 1) AND (DateEnd IS NULL OR
                         DateEnd > GETDATE()) 
ORDER BY LastName

