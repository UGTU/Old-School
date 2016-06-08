--программисты
Select distinct [Employee].id, [Employee].LastName, [Employee].FirstName, [Employee].Otch,  
  Department.DepartmentName, Post.PostName, FactStaffHistory.StaffCount, isnull([OK_Educ].Spec,'не указано')
from [dbo].[Employee] 
inner join [dbo].[FactStaff] on [Employee].id = [FactStaff].[idEmployee]
inner join PlanStaff on PlanStaff.id = [FactStaff].[idPlanStaff]
inner join Department on Department.[id] = PlanStaff.[idDepartment]
inner join Post on Post.id = PlanStaff.idPost
inner join FactStaffHistory on FactStaffHistory.idFactStaff = [FactStaff].id
left join [dbo].[OK_Educ] on [OK_Educ].idEmployee = [Employee].id
left join [dbo].[EducDocument] on [OK_Educ].idEducDocument = [dbo].[EducDocument].[id]
where (([FactStaff].[DateEnd] is null)or([FactStaff].[DateEnd] > GetDate()))
and FactStaffHistory.DateBegin = (select max(DateBegin) from FactStaffHistory fs
								  where fs.idFactStaff = [FactStaff].id)
and (Department.id <> 469) and (Department.id <> 603) and (Department.id <> 49)and (Department.id <> 448)
and (Department.id <> 75) and (Department.id <> 58) and (Department.id <> 65) and (Department.id <> 149) 
and (Department.id <> 58) and (Department.id <> 470)and (Department.id <> 622) and (Department.id <> 73) 
 and (Department.id <> 478)  and (Department.id <> 475) and (Department.id <> 479) and (Department.id <> 387) 
 and (Department.id <> 630)  and (Department.id <> 477)and (Department.id <> 483)and (Department.id <> 517)
 and (Department.id <> 136)  and (Department.id <> 277)  and (Department.id <> 321) and (Department.id <> 309)
 and (Department.id <> 137)
and (
 (PlanStaff.[idDepartment] = 39)
or
 (Post.PostName like '%рограмми%')or(Post.PostName like '%нформати%')or(Post.PostName like '%лектрон%')or(Post.PostName like '%аладчи%')
or (Department.DepartmentName like '%информаци%')
)
order by Department.DepartmentName

--потенциальные программисты
Select distinct  [Employee].id, [Employee].LastName, [Employee].FirstName, [Employee].Otch,  
  Department.DepartmentName, Post.PostName, FactStaffHistory.StaffCount, isnull([OK_Educ].Spec,'не указано')
from [dbo].[Employee] 
inner join [dbo].[FactStaff] on [Employee].id = [FactStaff].[idEmployee]
inner join PlanStaff on PlanStaff.id = [FactStaff].[idPlanStaff]
inner join Department on Department.[id] = PlanStaff.[idDepartment]
inner join Post on Post.id = PlanStaff.idPost
inner join FactStaffHistory on FactStaffHistory.idFactStaff = [FactStaff].id
left join [dbo].[OK_Educ] on [OK_Educ].idEmployee = [Employee].id
left join [dbo].[EducDocument] on [OK_Educ].idEducDocument = [dbo].[EducDocument].[id]
where (([FactStaff].[DateEnd] is null)or([FactStaff].[DateEnd] > GetDate()))
and FactStaffHistory.DateBegin = (select max(DateBegin) from FactStaffHistory fs
								  where fs.idFactStaff = [FactStaff].id)
and 
 (PlanStaff.[idDepartment] <> 39)
and 
 ((Spec like '%нформаци%') or (Spec like '%истем%') or (Spec like '%рограмм%') or  (Spec like '%нформати%')  or  (Spec like '%ычислит%'))
and
 (Post.PostName not like '%рограмми%')
and  [Employee].id not in (Select [Employee].id
							from [dbo].[Employee] 
							inner join [dbo].[FactStaff] on [Employee].id = [FactStaff].[idEmployee]
							inner join PlanStaff on PlanStaff.id = [FactStaff].[idPlanStaff]
							inner join Department on Department.[id] = PlanStaff.[idDepartment]
							inner join Post on Post.id = PlanStaff.idPost
							inner join FactStaffHistory on FactStaffHistory.idFactStaff = [FactStaff].id
							left join [dbo].[OK_Educ] on [OK_Educ].idEmployee = [Employee].id
							left join [dbo].[EducDocument] on [OK_Educ].idEducDocument = [dbo].[EducDocument].[id]
							where (([FactStaff].[DateEnd] is null)or([FactStaff].[DateEnd] > GetDate()))
							and FactStaffHistory.DateBegin = (select max(DateBegin) from FactStaffHistory fs
															  where fs.idFactStaff = [FactStaff].id)
							and (Department.id <> 469) and (Department.id <> 603) and (Department.id <> 49)and (Department.id <> 448)
							and (Department.id <> 75) and (Department.id <> 58) and (Department.id <> 65) and (Department.id <> 149) 
							and (Department.id <> 58) and (Department.id <> 470)and (Department.id <> 622) and (Department.id <> 73) 
							 and (Department.id <> 478)  and (Department.id <> 475) and (Department.id <> 479) and (Department.id <> 387) 
							 and (Department.id <> 630)  and (Department.id <> 477)and (Department.id <> 483)and (Department.id <> 517)
							 and (Department.id <> 136)  and (Department.id <> 277)  and (Department.id <> 321) and (Department.id <> 309)
							 and (Department.id <> 137)
							and (
							 (PlanStaff.[idDepartment] = 39)
							or
							 (Post.PostName like '%рограмми%')or(Post.PostName like '%нформати%')or(Post.PostName like '%лектрон%')or(Post.PostName like '%аладчи%')
							or (Department.DepartmentName like '%информаци%')
							))
							order by [Employee].id, [Employee].LastName, [Employee].FirstName, [Employee].Otch