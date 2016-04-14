--select * from PFDU_GetKadrCounts(getDate())

alter FUNCTION [dbo].[PFDU_GetKadrCounts](@date date)
RETURNS @Result TABLE
   (
	  Code			int, 
	  NameValue		varchar(500),
	  KadrCount		int
   )
AS
BEGIN
  INSERT INTO @Result
  select 15, '����� ����������� �����������', count(distinct [dbo].[Employee].[id])
  from [dbo].[Employee], [dbo].[EmployeeDegree]
  where [dbo].[Employee].id = [dbo].[EmployeeDegree].idEmployee
    and [idDegree] = 2 
	and [degreeDate]<=@date
	and [dbo].[Employee].[id] in (select [idEmployee] from [dbo].[FactStaff] 
								  where ([DateEnd] is null)or([DateEnd] > @date))

  INSERT INTO @Result
  select 16, '����� ����������� ����������� �����������', count(distinct [dbo].[Employee].[id])
  from [dbo].[Employee], [dbo].[EmployeeDegree]
  where [dbo].[Employee].id = [dbo].[EmployeeDegree].idEmployee
    and [idDegree] = 2 
	and [degreeDate]<=@date
	and [idGrazd] <> 2
	and [dbo].[Employee].[id] in (select [idEmployee] from [dbo].[FactStaff] 
								  where ([DateEnd] is null)or([DateEnd] > @date))  

  INSERT INTO @Result
  select 19, '����� ����������� ���������� ��������������� ����������� (��� ������� ������������� � ���������� �� ��������� ���)', 
  count(distinct [dbo].[Employee].[id])
  from [dbo].[Employee], [dbo].[FactStaff], FactStaffHistory
  where [dbo].[Employee].[id] =  [dbo].[FactStaff].[idEmployee] 
  and FactStaffHistory.idFactStaff = [dbo].[FactStaff].id
  and (([DateEnd] is null)or([DateEnd] > @date))
  and FactStaffHistory.DateBegin = (select max(FH.DateBegin) from FactStaffHistory FH
	   where FH.DateBegin<=@date and FH.idFactStaff = [dbo].[FactStaff].id)
  and FactStaffHistory.idTypeWork not in (6)

  INSERT INTO @Result
  select 20, '����� ����������� ������������-������������������ ������� (��� ������� ������������� � ���������� �� ��������� ���)', 
  count(distinct [dbo].[Employee].[id])
  from [dbo].[Employee] inner join [dbo].[FactStaff] on [dbo].[Employee].[id] =  [dbo].[FactStaff].[idEmployee] 
  inner join FactStaffHistory on FactStaffHistory.idFactStaff = [dbo].[FactStaff].id
  left join PlanStaff on [dbo].[FactStaff].idPlanStaff = PlanStaff.id
  left join Post on PlanStaff.idPost = Post.id
  where (([dbo].[FactStaff].[DateEnd] is null)or([dbo].[FactStaff].[DateEnd] > @date))
  and FactStaffHistory.DateBegin = (select max(FH.DateBegin) from FactStaffHistory FH
	   where FH.DateBegin<=@date and FH.idFactStaff = [dbo].[FactStaff].id)
  and FactStaffHistory.idTypeWork not in (6)
  and Post.idCategory = 2

  INSERT INTO @Result
  select 21, '����� ����������� �������������� �������� (��� ������� ������������� � ���������� �� ��������� ���)', 
  count(distinct [dbo].[Employee].[id])
  from [dbo].[Employee] inner join [dbo].[FactStaff] on [dbo].[Employee].[id] =  [dbo].[FactStaff].[idEmployee] 
  inner join FactStaffHistory on FactStaffHistory.idFactStaff = [dbo].[FactStaff].id
  left join PlanStaff on [dbo].[FactStaff].idPlanStaff = PlanStaff.id
  left join Post on PlanStaff.idPost = Post.id
  where (([dbo].[FactStaff].[DateEnd] is null)or([dbo].[FactStaff].[DateEnd] > @date))
  and FactStaffHistory.DateBegin = (select max(FH.DateBegin) from FactStaffHistory FH
	   where FH.DateBegin<=@date and FH.idFactStaff = [dbo].[FactStaff].id)
  and FactStaffHistory.idTypeWork not in (6)
  and Post.idCategory = 0

  INSERT INTO @Result
  select 22, '����� ����������� ������� ���������� (��� ������� ������������� � ���������� �� ��������� ���)', 
  count(distinct [dbo].[Employee].[id])
  from [dbo].[Employee] inner join [dbo].[FactStaff] on [dbo].[Employee].[id] =  [dbo].[FactStaff].[idEmployee] 
  inner join FactStaffHistory on FactStaffHistory.idFactStaff = [dbo].[FactStaff].id
  left join PlanStaff on [dbo].[FactStaff].idPlanStaff = PlanStaff.id
  left join Post on PlanStaff.idPost = Post.id
  where (([dbo].[FactStaff].[DateEnd] is null)or([dbo].[FactStaff].[DateEnd] > @date))
  and FactStaffHistory.DateBegin = (select max(FH.DateBegin) from FactStaffHistory FH
	   where FH.DateBegin<=@date and FH.idFactStaff = [dbo].[FactStaff].id)
  and FactStaffHistory.idTypeWork not in (6)
  and Post.idCategory = 6

  INSERT INTO @Result
  select 23, '� ��� ����� ������� ����������� (��� ������� ������������� � ���������� �� ��������� ���)', 
  count(distinct [dbo].[Employee].[id])
  from [dbo].[Employee] inner join [dbo].[FactStaff] on [dbo].[Employee].[id] =  [dbo].[FactStaff].[idEmployee] 
  inner join FactStaffHistory on FactStaffHistory.idFactStaff = [dbo].[FactStaff].id
  left join PlanStaff on [dbo].[FactStaff].idPlanStaff = PlanStaff.id
  left join Post on PlanStaff.idPost = Post.id
  left join Category on Category.id = Post.idCategory
  where (([dbo].[FactStaff].[DateEnd] is null)or([dbo].[FactStaff].[DateEnd] > @date))
  and FactStaffHistory.DateBegin = (select max(FH.DateBegin) from FactStaffHistory FH
	   where FH.DateBegin<=@date and FH.idFactStaff = [dbo].[FactStaff].id)
  and FactStaffHistory.idTypeWork not in (6)
  and Post.idCategory = 6
  and Category.CategoryName like '%����%'

  INSERT INTO @Result
  select 24, '����� ����������� ���������������-��������������� ��������� (��� ������� ������������� � ���������� �� ��������� ���)', 
  count(distinct [dbo].[Employee].[id])
  from [dbo].[Employee] inner join [dbo].[FactStaff] on [dbo].[Employee].[id] =  [dbo].[FactStaff].[idEmployee] 
  inner join FactStaffHistory on FactStaffHistory.idFactStaff = [dbo].[FactStaff].id
  left join PlanStaff on [dbo].[FactStaff].idPlanStaff = PlanStaff.id
  left join Post on PlanStaff.idPost = Post.id
  where (([dbo].[FactStaff].[DateEnd] is null)or([dbo].[FactStaff].[DateEnd] > @date))
  and FactStaffHistory.DateBegin = (select max(FH.DateBegin) from FactStaffHistory FH
	   where FH.DateBegin<=@date and FH.idFactStaff = [dbo].[FactStaff].id)
  and FactStaffHistory.idTypeWork not in (6)
  and Post.idCategory = 1

  INSERT INTO @Result
  select 25, '����� ����������� ������-���������������� ��������� (��� ������� ������������� � ���������� �� ��������� ���)', 
  count(distinct [dbo].[Employee].[id])
  from [dbo].[Employee] inner join [dbo].[FactStaff] on [dbo].[Employee].[id] =  [dbo].[FactStaff].[idEmployee] 
  inner join FactStaffHistory on FactStaffHistory.idFactStaff = [dbo].[FactStaff].id
  left join PlanStaff on [dbo].[FactStaff].idPlanStaff = PlanStaff.id
  left join Post on PlanStaff.idPost = Post.id
  where (([dbo].[FactStaff].[DateEnd] is null)or([dbo].[FactStaff].[DateEnd] > @date))
  and FactStaffHistory.DateBegin = (select max(FH.DateBegin) from FactStaffHistory FH
	   where FH.DateBegin<=@date and FH.idFactStaff = [dbo].[FactStaff].id)
  and FactStaffHistory.idTypeWork not in (6)
  and Post.idCategory = 3

  INSERT INTO @Result
  select 26, '����� ����������� ������� �������������� ��������� (��� ������� ������������� � ���������� �� ��������� ���)', 
  count(distinct [dbo].[Employee].[id])
  from [dbo].[Employee] inner join [dbo].[FactStaff] on [dbo].[Employee].[id] =  [dbo].[FactStaff].[idEmployee] 
  inner join FactStaffHistory on FactStaffHistory.idFactStaff = [dbo].[FactStaff].id
  left join PlanStaff on [dbo].[FactStaff].idPlanStaff = PlanStaff.id
  left join Post on PlanStaff.idPost = Post.id
  where (([dbo].[FactStaff].[DateEnd] is null)or([dbo].[FactStaff].[DateEnd] > @date))
  and FactStaffHistory.DateBegin = (select max(FH.DateBegin) from FactStaffHistory FH
	   where FH.DateBegin<=@date and FH.idFactStaff = [dbo].[FactStaff].id)
  and FactStaffHistory.idTypeWork not in (6)
  and Post.idCategory = 4

RETURN 
END

GO
--select * from [PFDU_GetKadrCounts](getDate())