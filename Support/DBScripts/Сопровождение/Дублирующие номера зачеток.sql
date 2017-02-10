select Nn_zach,  Count(distinct Ik_zach)
from dbo.Zach
where Nn_zach like '16%' and nCode<>3
group by Nn_zach
having Count(distinct Ik_zach)>1 
order by Nn_zach



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