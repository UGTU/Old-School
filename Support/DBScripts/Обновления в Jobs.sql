update Fac
set [Cname_fac] = [DepartmentName],
[Cshort_name_fac] =[DepartmentSmallName],
[fDateExit] = [dateExit],
[Dep_Index] = [DepartmentIndex]
from Import.DepartmentMainData
where Import.DepartmentMainData.DepartmentGUID = Fac.DepartmentGUID

update kafedra
set cname_kaf = [DepartmentName],
cshort_name_kaf =[DepartmentSmallName],
kDateExit = [dateExit],
[ik_fac] = (select ik_fac from Fac where Fac.DepartmentGUID = Import.DepartmentMainData.ManagerDepartmentGUID)
from Import.DepartmentMainData
where Import.DepartmentMainData.DepartmentGUID = kafedra.DepartmentGUID
and idDepartmentType in (6)

update kafedra
set cname_kaf = [DepartmentName],
cshort_name_kaf =[DepartmentSmallName],
kDateExit = [dateExit],
[ik_fac] = 31
from Import.DepartmentMainData
where Import.DepartmentMainData.DepartmentGUID = kafedra.DepartmentGUID
and idDepartmentType in (8,9)

insert into kafedra(cname_kaf,cshort_name_kaf,ik_fac, DepartmentGUID, kDateExit)
  select [DepartmentName],[DepartmentSmallName],Fac.Ik_fac,Import.DepartmentMainData.[DepartmentGUID],[dateExit]
  from Import.DepartmentMainData,Fac 
  where idDepartmentType in (6)
  and Fac.DepartmentGUID = Import.DepartmentMainData.ManagerDepartmentGUID
  and Import.DepartmentMainData.DepartmentGUID not in (select DepartmentGUID from kafedra where DepartmentGUID is not null)
 
 insert into kafedra(cname_kaf,cshort_name_kaf,ik_fac, DepartmentGUID, kDateExit)
  select [DepartmentName],[DepartmentSmallName],31,Import.DepartmentMainData.[DepartmentGUID],[dateExit]
  from Import.DepartmentMainData
  where idDepartmentType in (8,9)
  and Import.DepartmentMainData.DepartmentGUID not in (select DepartmentGUID from kafedra where DepartmentGUID is not null)

insert into Fac(Cname_fac,Cshort_name_fac,Dep_Index, DepartmentGUID, fDateExit)
  select [DepartmentName],[DepartmentSmallName],[DepartmentIndex],[DepartmentGUID],[dateExit]
  from Import.DepartmentMainData where idDepartmentType in (7,8,9)
  and Import.DepartmentMainData.DepartmentGUID not in (select DepartmentGUID from Fac)

alter table kafedra alter column cname_kaf varchar(500) not null

--and Import.KafTeachers.[LastName] = person.Clastname
--and Import.KafTeachers.FirstName = Person.Cfirstname
--and Import.KafTeachers.Otch = Person.Cotch
--and DateEnd is null

delete from Prepod_semester_time_constraint

declare  @Clastname varchar(30)
declare  @Cfirstname varchar(30)
declare  @Cotch varchar(30)
declare  @con int
declare  @main int
declare  @main_code int
DECLARE Cursor1 CURSOR LOCAL FAST_FORWARD READ_ONLY FOR 
	select * from
	(Select Clastname, Cfirstname, Cotch, count(distinct person.nCode) con
	from person, Prepod 
	where person.nCode = Prepod.nCode
	group by Clastname, Cfirstname, Cotch) prep where con>1
OPEN Cursor1
FETCH NEXT FROM Cursor1 INTO @Clastname, @Cfirstname, @Cotch, @con
WHILE @@FETCH_STATUS = 0
BEGIN 
  select @main = min(Prepod.itab_n) from Prepod,Person where Person.nCode = Prepod.nCode
  and Clastname = @Clastname and Cfirstname = @Cfirstname and Cotch = @Cotch

  select @main_code =  nCode from Prepod where itab_n = @main

  --обновляем ссылки на кафедрах
  update Relation_kafedra_prep set itab_n = @main
  where itab_n in (select Prepod.itab_n from Prepod,Person where Person.nCode = Prepod.nCode
  and Clastname = @Clastname and Cfirstname = @Cfirstname and Cotch = @Cotch)
  and ik_kaf not in (select ik_kaf from Relation_kafedra_prep where itab_n = @main)

  delete from Relation_kafedra_prep where itab_n in (select Prepod.itab_n from Prepod,Person where Person.nCode = Prepod.nCode
													 and Clastname = @Clastname and Cfirstname = @Cfirstname and Cotch = @Cotch)
  and itab_n<>@main

  --обновляем ссылки на ведомостях
  update Vedomost set itab_n = @main
  where itab_n in (select Prepod.itab_n from Prepod,Person where Person.nCode = Prepod.nCode
  and Clastname = @Clastname and Cfirstname = @Cfirstname and Cotch = @Cotch)

  delete from Prepod where nCode in (select nCode from Person where Clastname = @Clastname and Cfirstname = @Cfirstname and Cotch = @Cotch)
  and nCode <> @main_code

FETCH NEXT FROM Cursor1 INTO @Clastname, @Cfirstname, @Cotch, @con
END    

CLOSE Cursor1
DEALLOCATE Cursor1

select * from Vedomost where Itab_n is null order by dD_vydano


select * from Person, Prepod
where Person.nCode = Prepod.nCode
order by Clastname, Cfirstname, Cotch

INSERT INTO UGTU.[Import].[KafTeachers]([TypeWorkName],[PostName],[EmployeeGUID],[FirstName],[LastName],[Otch],[DepartmentGUID],
	[PostGUID],[DateBegin],[DateEnd],[StaffCount],[HourCount], idFactStaffHistory,Login,isPPS,itab_n)
SELECT [TypeWorkName],[PostName],Employee.GUID,[FirstName],[LastName],[Otch],
	Dep.DepartmentGUID,[PostGUID],[FactStaffWithHistory].DateBegin,[FactStaffWithHistory].DateEnd,[StaffCount],[HourCount], 
	idFactStaffHistory, EmployeeLogin,Category.IsPPS,itab_n
FROM KADR.[dbo].[FactStaffWithHistory]
INNER JOIN KADR.dbo.PlanStaff ON [FactStaffWithHistory].idPlanStaff=PlanStaff.id
INNER JOIN KADR.dbo.Post ON PlanStaff.idPost=Post.id
INNER JOIN KADR.dbo.WorkType ON [FactStaffWithHistory].idTypeWork=WorkType.id
INNER JOIN KADR.dbo.Employee ON [FactStaffWithHistory].idEmployee=Employee.id
INNER JOIN KADR.dbo.Dep ON PlanStaff.idDepartment=Dep.id
INNER JOIN KADR.dbo.Category ON Post.idCategory=Category.id
Where KADR.[dbo].[FactStaffWithHistory]. idFactStaffHistory not in (select  idFactStaffHistory from UGTU.[Import].[KafTeachers])

update UGTU.[Import].[KafTeachers]
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
	itab_n = KADR.dbo.Employee.itab_n
FROM KADR.[dbo].[FactStaffWithHistory]
INNER JOIN KADR.dbo.PlanStaff ON [FactStaffWithHistory].idPlanStaff=PlanStaff.id
INNER JOIN KADR.dbo.Post ON PlanStaff.idPost=Post.id
INNER JOIN KADR.dbo.WorkType ON [FactStaffWithHistory].idTypeWork=WorkType.id
INNER JOIN KADR.dbo.Employee ON [FactStaffWithHistory].idEmployee=Employee.id
INNER JOIN KADR.dbo.Dep ON PlanStaff.idDepartment=Dep.id
INNER JOIN KADR.dbo.Category ON Post.idCategory=Category.id
Where KADR.[dbo].[FactStaffWithHistory]. idFactStaffHistory =  UGTU.[Import].[KafTeachers].idFactStaffHistory


update UGTU.[Import].[KafTeachers]
set UGTU.[Import].[KafTeachers].DegreeName = KADR.dbo.Degree.DegreeName
from KADR.dbo.Employee
left join KADR.dbo.EmployeeDegree on KADR.dbo.EmployeeDegree.idEmployee = KADR.dbo.Employee.id
left join KADR.dbo.Degree on KADR.dbo.EmployeeDegree.idDegree = KADR.dbo.Degree.id
where KADR.dbo.Employee.GUID = UGTU.[Import].[KafTeachers].EmployeeGUID

select Vedomost.Itab_n, Vedomost.dD_vydano, p.Clastname, p.Cfirstname, p.Cotch
from Vedomost, Person p, Prepod
where Vedomost.Itab_n = Prepod.itab_n and Prepod.nCode = p.nCode
and (select count(idFactStaffHistory) from Import.KafTeachers where LastName = p.Clastname and FirstName = p.Cfirstname and Otch = p.Cotch)=0
order by Vedomost.dD_vydano

update Vedomost set Itab_n = Import.KafTeachers.itab_n
from Import.KafTeachers, Person
where Person.itab_n = Vedomost.Itab_n
and Person.Clastname = Import.KafTeachers.LastName
and Person.Cfirstname = Import.KafTeachers.FirstName
and Person.Cotch = Import.KafTeachers.Otch

update Vedomost set Itab_n = null
where Ik_ved in (select ik_ved from Vedomost, Person p, Prepod
				 where Vedomost.Itab_n = Prepod.itab_n and Prepod.nCode = p.nCode
				 and (select count(idFactStaffHistory) from Import.KafTeachers where LastName = p.Clastname and FirstName = p.Cfirstname and Otch = p.Cotch)=0)

select * from Import.KafTeachers where LastName = 'Соколова'

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
	itab_n = KADR.dbo.Employee.itab_n
FROM KADR.[dbo].[FactStaffWithHistory]
INNER JOIN KADR.dbo.PlanStaff ON [FactStaffWithHistory].idPlanStaff=PlanStaff.id
INNER JOIN KADR.dbo.Post ON PlanStaff.idPost=Post.id
INNER JOIN KADR.dbo.WorkType ON [FactStaffWithHistory].idTypeWork=WorkType.id
INNER JOIN KADR.dbo.Employee ON [FactStaffWithHistory].idEmployee=Employee.id
INNER JOIN KADR.dbo.Dep ON PlanStaff.idDepartment=Dep.id
INNER JOIN KADR.dbo.Category ON Post.idCategory=Category.id
Where KADR.[dbo].[FactStaffWithHistory]. idFactStaffHistory =  UGTU_TEST.[Import].[KafTeachers].idFactStaffHistory