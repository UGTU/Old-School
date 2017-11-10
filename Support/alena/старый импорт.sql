declare @idFactStuffHistory int
declare @educatorId int
declare @kafEducatorId int
declare @kafId int
declare @stufCount int
declare rowCursor cursor for select idFactStaffHistory from [dekanatMMIS].[Import].[KafTeachers] k 
	where idFactStaffHistory not in (select idFactStaffHistory from [dekanatMMIS].[Import].[Educators])
	and k.isPPS=1 and (k.DateEnd is null or k.DateEnd > GETDATE())
open rowCursor
fetch next from rowCursor into @idFactStuffHistory
while @@FETCH_STATUS = 0
begin
	--
	insert into Преподаватели (
	   --[Код]
      [ФИО]
      ,[Фамилия]
      ,[Имя]
      ,[Отчество]
      ,[ДатаПоступления]
      ,[Логин]
      ,[Должность]
      ,[Звание]
      ,[Степень]
      ,[ПолМуж]
	)
	select 
	SUBSTRING( CONCAT(LastName,' ', SUBSTRING(FirstName,0,1),'. ',SUBSTRING(Otch,0,1),'.'),0,100)
	, SUBSTRING(LastName,0,50)
	, SUBSTRING(FirstName,0,50)
	,SUBSTRING(Otch,0,50)
	,DateBegin
	,SUBSTRING(Login,0,50)
	,SUBSTRING(PostName,0,50)
	,SUBSTRING(DegreeName,0,50)
	,SUBSTRING(RankName,0,50)
	,1
	from [dekanatMMIS].[Import].[KafTeachers] where idFactStaffHistory = @idFactStuffHistory
	--
	set @educatorId = @@IDENTITY
	set @kafId = (select КодКафедры from [dekanatMMIS].[Import].[Chairs] c inner join [dekanatMMIS].[Import].[KafTeachers] k on c.DepartmentGUID = k.DepartmentGUID where k.idFactStaffHistory = @idFactStuffHistory  )
	set @stufCount =( select StaffCount from [dekanatMMIS].[Import].[KafTeachers] where idFactStaffHistory = @idFactStuffHistory)
	--
	insert into ПреподавателиКафедры(
	   --[Код]
      [КодПреподавателя]
      ,[КодКафедры]
      ,[УчебныйГод]
      ,[Ставок]
	) values (
	 @educatorId, @kafId, CONCAT(year(getdate()),'-',year(getdate())+1), @stufCount)
	 set @kafEducatorId = @@IDENTITY
	 --
	insert into [dekanatMMIS].[Import].[Educators](
	[TypeWorkName]
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
      ,[КодПреподавателяКафедры]
	)select [TypeWorkName]
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
	  , @kafEducatorId
      from [dekanatMMIS].[Import].[KafTeachers] where idFactStaffHistory = @idFactStuffHistory
fetch next from rowCursor into @idFactStuffHistory
end
close rowCursor
DEALLOCATE  rowCursor