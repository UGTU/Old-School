select Nn_zach,  Count(distinct Ik_zach)
from dbo.Zach
where Nn_zach like '16%' and nCode<>3
group by Nn_zach
having Count(distinct Ik_zach)>1 
order by Nn_zach



go
SELECT [TREE_Stud_Search].*
  FROM 
  (SELECT [Ik_zach], MAX([Ik_studGrup]) [Ik_studGrup]
  FROM dbo.StudGrup
	GROUP BY [Ik_zach])LastGrup
  INNER JOIN
  [UGTU].[dbo].[TREE_Stud_Search] ON LastGrup.[Ik_studGrup]=[TREE_Stud_Search].[Ik_studGrup]
  inner join
  (select Nn_zach,  Count(distinct studgrup.Ik_zach) col
from dbo.Zach
inner join dbo.studgrup
  on Zach.ik_zach=studgrup.Ik_zach
where Nn_zach like '15%'
group by Nn_zach
having Count(distinct studgrup.Ik_zach)>1 
)duplicates
on duplicates.Nn_zach=[TREE_Stud_Search].Nn_zach
  order by [TREE_Stud_Search].Nn_zach

  go
   SELECT *
  FROM [UGTU].[dbo].Zach
  inner join dbo.studgrup
  on Zach.ik_zach=studgrup.Ik_zach
  where Nn_zach='162204'

  go
  SELECT *
  FROM [UGTU].[dbo].[TREE_Stud_Search]
  inner join
  (select Nn_zach,  Count(distinct Ik_zach) col
from dbo.Zach
where Nn_zach like '16%'
group by Nn_zach
having Count(distinct Ik_zach)>1 
order by Nn_zach)duplicates
on duplicates.Nn_zach=[TREE_Stud_Search].Nn_zach
  order by [TREE_Stud_Search].Nn_zach