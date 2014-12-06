select max(Nn_zach), ABIT_Diapazon_spec_fac.NNrecord, Spec_stud.Cname_spec, Relation_spec_fac.ik_fac, fac.Cshort_name_fac, Abit_Zach_Diapazons.BeginDiapazon, Abit_Zach_Diapazons.EndDiapazon
from [dbo].[Zach] inner join ABIT_postup on ABIT_postup.nCode = [Zach].nCode 
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord  = ABIT_postup.NNrecord 
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Spec_stud.ik_spec = Relation_spec_fac.ik_spec
inner join fac on Relation_spec_fac.ik_fac = fac.Ik_fac
inner join Year_uch_pl on Year_uch_pl.year_value = ABIT_Diapazon_spec_fac.NNyear
left join Abit_Zach_Diapazons on Relation_spec_fac.ik_fac = Abit_Zach_Diapazons.ik_fac and Year_uch_pl.ik_year_uch_pl = Abit_Zach_Diapazons.ik_year
where ABIT_Diapazon_spec_fac.NNyear = 2013 and fac.ik_fac in (6,20)
group by ABIT_Diapazon_spec_fac.NNrecord, Spec_stud.Cname_spec, Relation_spec_fac.ik_fac, fac.Cshort_name_fac, Abit_Zach_Diapazons.BeginDiapazon, Abit_Zach_Diapazons.EndDiapazon
order by Relation_spec_fac.ik_fac

select max(Nn_zach), Relation_spec_fac.ik_fac, fac.Cshort_name_fac, Abit_Zach_Diapazons.BeginDiapazon, Abit_Zach_Diapazons.EndDiapazon
from [dbo].[Zach] inner join ABIT_postup on ABIT_postup.nCode = [Zach].nCode 
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord  = ABIT_postup.NNrecord 
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Spec_stud.ik_spec = Relation_spec_fac.ik_spec
inner join fac on Relation_spec_fac.ik_fac = fac.Ik_fac
inner join Year_uch_pl on Year_uch_pl.year_value = ABIT_Diapazon_spec_fac.NNyear
left join Abit_Zach_Diapazons on Relation_spec_fac.ik_fac = Abit_Zach_Diapazons.ik_fac and Year_uch_pl.ik_year_uch_pl = Abit_Zach_Diapazons.ik_year
where ABIT_Diapazon_spec_fac.NNyear = 2013 and fac.ik_fac not in (6,20)
group by Relation_spec_fac.ik_fac, fac.Cshort_name_fac, Abit_Zach_Diapazons.BeginDiapazon, Abit_Zach_Diapazons.EndDiapazon
order by Relation_spec_fac.ik_fac

-----------------------------------------------------------------------------------------------------------------------------------------------------------
select distinct [Zach].Ik_zach, Nn_zach, Relation_spec_fac.ik_fac, fac.Cshort_name_fac, Abit_Zach_Diapazons.BeginDiapazon, Abit_Zach_Diapazons.EndDiapazon		--»ÕË√
from [dbo].[Zach] inner join ABIT_postup on ABIT_postup.nCode = [Zach].nCode 
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord  = ABIT_postup.NNrecord 
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Spec_stud.ik_spec = Relation_spec_fac.ik_spec
inner join fac on Relation_spec_fac.ik_fac = fac.Ik_fac
inner join Year_uch_pl on Year_uch_pl.year_value = ABIT_Diapazon_spec_fac.NNyear
left join Abit_Zach_Diapazons on Relation_spec_fac.ik_fac = Abit_Zach_Diapazons.ik_fac and Year_uch_pl.ik_year_uch_pl = Abit_Zach_Diapazons.ik_year
where ABIT_Diapazon_spec_fac.NNyear = 2013 and ((fac.ik_fac = 1)or(ABIT_postup.NNrecord in (610,611,615,619,637,679)))
and ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)
order by Nn_zach

select distinct [Zach].Ik_zach, Nn_zach, Relation_spec_fac.ik_fac, fac.Cshort_name_fac, Abit_Zach_Diapazons.BeginDiapazon, Abit_Zach_Diapazons.EndDiapazon		--»ÌÃË“œ
from [dbo].[Zach] inner join ABIT_postup on ABIT_postup.nCode = [Zach].nCode 
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord  = ABIT_postup.NNrecord 
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join Spec_stud on Spec_stud.ik_spec = Relation_spec_fac.ik_spec
inner join fac on Relation_spec_fac.ik_fac = fac.Ik_fac
inner join Year_uch_pl on Year_uch_pl.year_value = ABIT_Diapazon_spec_fac.NNyear
left join Abit_Zach_Diapazons on Relation_spec_fac.ik_fac = Abit_Zach_Diapazons.ik_fac and Year_uch_pl.ik_year_uch_pl = Abit_Zach_Diapazons.ik_year
where ABIT_Diapazon_spec_fac.NNyear = 2013 and ((fac.ik_fac = 2)or(ABIT_postup.NNrecord in (608,609,636)))
and ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)
order by Nn_zach