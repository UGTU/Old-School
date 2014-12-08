declare @DepartmentName varchar(500)
declare @Cshort_name_fac varchar(500)
declare @fDateExit datetime
declare @DepartmentGUID uniqueidentifier
declare @ManagerDepartmentGUID uniqueidentifier
declare @ParentID int

--------------------------------институты------------------------------------------------------------------------------------
  
declare cur1 cursor for
   select DepartmentGUID,[DepartmentName],[DepartmentSmallName],[dateExit]
   from [dbo].[IMPORT_DepartmentMainData] 
   where idDepartmentType = 7 --институты
open cur1
fetch next from cur1 into @DepartmentGUID,@DepartmentName,@Cshort_name_fac, @fDateExit
while @@Fetch_Status = 0
begin
  
  if (select count(ik_fac) from fac where DepartmentGUID = @DepartmentGUID)=0  --если такого института еще нет
    insert into fac([Cname_fac],[Cshort_name_fac],[fDateExit],[DepartmentGUID])
	values(@DepartmentName,@Cshort_name_fac,@fDateExit,@DepartmentGUID)
  else
	  update fac set Cname_fac = @DepartmentName, Cshort_name_fac = @Cshort_name_fac, fDateExit = @fDateExit
	  where DepartmentGUID = @DepartmentGUID

  FETCH NEXT FROM cur1 INTO @DepartmentGUID,@DepartmentName,@Cshort_name_fac, @fDateExit
END     
CLOSE cur1
DEALLOCATE cur1 

--------------------------------кафедры---------------------------------------------------------------------------------------

declare cur1 cursor for
   select DepartmentGUID,[DepartmentName],[DepartmentSmallName],[dateExit],ManagerDepartmentGUID
   from [dbo].[IMPORT_DepartmentMainData] 
   where idDepartmentType = 6 --кафедры
open cur1
fetch next from cur1 into @DepartmentGUID,@DepartmentName,@Cshort_name_fac, @fDateExit,@ManagerDepartmentGUID
while @@Fetch_Status = 0
begin

  select @ParentID = ik_fac from fac where DepartmentGUID = @ManagerDepartmentGUID
  
  if (select count(ik_kaf) from kafedra where DepartmentGUID = @DepartmentGUID)=0  --если такой кафедры еще нет
    insert into kafedra([ik_fac],[cname_kaf],[cshort_name_kaf],[kDateExit],[DepartmentGUID])
	values(@ParentID,@DepartmentName,@Cshort_name_fac,@fDateExit,@DepartmentGUID)
  else
	  update kafedra set [ik_fac] = @ParentID,[cname_kaf] = @DepartmentName, [cshort_name_kaf] = @Cshort_name_fac, [kDateExit] = @fDateExit
	  where DepartmentGUID = @DepartmentGUID

  FETCH NEXT FROM cur1 INTO @DepartmentGUID,@DepartmentName,@Cshort_name_fac, @fDateExit,@ManagerDepartmentGUID
END     
CLOSE cur1
DEALLOCATE cur1 