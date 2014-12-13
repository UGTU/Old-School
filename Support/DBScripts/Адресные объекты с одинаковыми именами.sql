select Gorod.Ik_gorod, Gorod.Cgorod, raion.Ik_raion, raion.Craion, Region.Ik_region,Region.Cregion,c_name.*
from Gorod, raion,region,
(select count(Cgorod) numb,Cgorod
				 from Gorod group by Cgorod) c_name 
where Gorod.Ik_raion = Raion.Ik_raion
and  Raion.Ik_region = Region.Ik_region
and Gorod.Cgorod = c_name.Cgorod
and numb>1
order by  Gorod.Cgorod

select raion.Ik_raion,  raion.Craion, Region.Ik_region,Region.Cregion,c_name.*
from raion,region,
(select count(Craion) numb,Craion
				 from raion group by Craion) c_name 
where Raion.Ik_region = Region.Ik_region
and raion.Craion = c_name.Craion
and numb>1
order by  raion.Craion