/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT IdTeacher
  FROM [UGTU].[TeachersPlan].[IndividualPlans]  where DossolutionDate is null group by [IdTeacher] having count(id)>1
