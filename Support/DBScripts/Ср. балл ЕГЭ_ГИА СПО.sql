select NNyear, EducationBranch.Cname_spec,[cname_sdach], sum(cosenka),count(distinct id), count(distinct ABIT_postup.nCode),
COUNT(distinct ABIT_Diapazon_Disc.ik_disc_nabor),
       cast(cast(sum(cosenka) as numeric(8,2))/cast(count(distinct id) as numeric(8,2)) as numeric(8,2))
from ABIT_postup inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
inner join Kat_zach on Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
inner join ABIT_Vstup_exam on ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
inner join ABIT_VidSdachi on [ABIT_Vstup_exam].ik_sdach = ABIT_VidSdachi.ik_sdach
inner join ABIT_Diapazon_Disc on ABIT_Diapazon_Disc.ik_disc = ABIT_Vstup_exam.ik_disc and ABIT_Diapazon_spec_fac.NNrecord = ABIT_Diapazon_Disc.NNrecord
where ABIT_VidSdachi.ik_sdach in (5,8, 11) --ЕГЭ + ГИА
and EducationBranch.ik_direction = 5
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and cosenka is not NULL
and NNyear >= 2012
and Kat_zach.ik_type_kat = 3 --бюджетники
group by EducationBranch.Cname_spec, NNyear,[cname_sdach]
order by NNyear, EducationBranch.Cname_spec

--order by cosenka



select NNyear, EducationBranch.Cname_spec, EducationBranch.ik_spec, sum(SchoolAverMark),count(distinct ABIT_postup.nCode),
	   cast(cast(sum(SchoolAverMark) as numeric(8,2))/cast(count(distinct ABIT_postup.nCode) as numeric(8,2)) as numeric(8,2))
from ABIT_postup inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
inner join Kat_zach on Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
where EducationBranch.ik_direction = 5
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and NNyear >= 2012
and (SchoolAverMark is not null) and (SchoolAverMark > 0)
and Kat_zach.ik_type_kat = 3 --бюджетники
group by EducationBranch.Cname_spec, EducationBranch.ik_spec, NNyear
order by NNyear, EducationBranch.Cname_spec



select NNyear, EducationBranch.Cname_spec, EducationBranch.ik_spec, SchoolAverMark, ABIT_postup.nCode
from ABIT_postup inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
inner join Fac on Relation_spec_fac.ik_fac = Fac.Ik_fac
inner join Kat_zach on Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
where EducationBranch.ik_direction = 5
--and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
and NNyear = 2014
and EducationBranch.ik_spec = 354673
--and SchoolAverMark is not null
--and Kat_zach.ik_type_kat = 3 --бюджетники
order by NNyear, EducationBranch.Cname_spec

select nn_abit, sum(cosenka) as SummBall, min(cosenka) as MinBall, AVG(cosenka) as SredBall 
	 from dbo.ABIT_Vstup_exam 
	 where nn_abit IN 
	 (SELECT nn_abit FROM ABIT_postup WHERE NNrecord IN (SELECT NNrecord 
														   FROM ABIT_Diapazon_spec_fac WHERE nnyear=2014 
														   and ik_spec_fac in (select ik_spec_fac 
														                       from Relation_spec_fac 
																			   where ik_spec = 354673)))
group by nn_abit