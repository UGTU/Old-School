

declare @Ik_form_ed int
set @Ik_form_ed=2
select distinct
       Sh_spec +' - '+Cname_spec, Sh_spec,
	   COUNT(distinct stud.nCode) AllZayvlCount,
	   COUNT(distinct Zach.nCode) AllZachCount,	   
	   COUNT(distinct Zach.nCode) BaseCount,
	   0 as UglCount,
	   COUNT(distinct FedFinS.nCode) FedCount,
	   COUNT(distinct RegFinS.nCode) RegCount,
	   COUNT(distinct ContFinS.nCode) ContCount
	    
from
(
	select distinct 
		   Cshort_name_fac, 
	   Cname_spec, Spec_stud.Sh_spec, ABIT_postup.nCode, Relation_spec_fac.ik_spec_fac
	from ABIT_postup,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac
	where ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and Relation_spec_fac.Ik_form_ed=@Ik_form_ed
	and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach IN (1,2)) 
	and Relation_spec_fac.ik_fac = 31										
	and NNyear=year(GETDATE())
) stud
left join
(
	select nCode, Relation_spec_fac.ik_spec_fac
	from ABIT_postup,ABIT_Diapazon_spec_fac,Relation_spec_fac,[dbo].[EducationBranch], [dbo].[Kat_zach]
	where ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and NNyear=year(GETDATE())
	and Relation_spec_fac.ik_spec=[EducationBranch].ik_spec
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)  --зачисленные
	and Relation_spec_fac.ik_fac = 31											--колледжи
	and [Kat_zach].ik_type_kat is not null
	and Relation_spec_fac.Ik_form_ed=@Ik_form_ed
	and ABIT_postup.ik_kat_zach=[Kat_zach].ik_kat_zach
	and [EducationBranch].[ik_FinancingSource] IS NOT NULL

) Zach ON stud.ik_spec_fac=Zach.ik_spec_fac
left join
(
	select nCode, Relation_spec_fac.ik_spec_fac
	from ABIT_postup,ABIT_Diapazon_spec_fac,Relation_spec_fac,[dbo].[EducationBranch], [dbo].[Kat_zach]
	where ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and NNyear=year(GETDATE())
	and Relation_spec_fac.ik_spec=[EducationBranch].ik_spec
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)  --зачисленные
	and Relation_spec_fac.ik_fac = 31											--колледжи
	and [EducationBranch].[ik_FinancingSource]=1
	and Relation_spec_fac.Ik_form_ed=@Ik_form_ed
	and ABIT_postup.ik_kat_zach=[Kat_zach].ik_kat_zach
	and [Kat_zach].ik_type_kat<>3
) FedFinS
on stud.ik_spec_fac=FedFinS.ik_spec_fac

left join
(
	select nCode, Relation_spec_fac.ik_spec_fac
	from ABIT_postup,ABIT_Diapazon_spec_fac,Relation_spec_fac,[dbo].[EducationBranch], [dbo].[Kat_zach]
	where ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and NNyear=year(GETDATE())
	and Relation_spec_fac.ik_spec=[EducationBranch].ik_spec
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)  --зачисленные
	and Relation_spec_fac.ik_fac = 31											--колледжи
	and [EducationBranch].[ik_FinancingSource]=2
	and Relation_spec_fac.Ik_form_ed=@Ik_form_ed
	and ABIT_postup.ik_kat_zach=[Kat_zach].ik_kat_zach
	and [Kat_zach].ik_type_kat<>3
) RegFinS
on stud.ik_spec_fac=RegFinS.ik_spec_fac


left join
(
	select nCode, Relation_spec_fac.ik_spec_fac
	from ABIT_postup,ABIT_Diapazon_spec_fac,Relation_spec_fac,[dbo].[EducationBranch], [dbo].[Kat_zach]
	where ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and NNyear=year(GETDATE())
	and Relation_spec_fac.ik_spec=[EducationBranch].ik_spec
	and ABIT_postup.ik_kat_zach=[Kat_zach].ik_kat_zach
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)	--зачисленные
	and Relation_spec_fac.ik_fac = 31											--колледжи
	and [Kat_zach].ik_type_kat=3
	and Relation_spec_fac.Ik_form_ed=@Ik_form_ed
) ContFinS
on stud.ik_spec_fac=ContFinS.ik_spec_fac

GROUP BY Cshort_name_fac,
	   Cname_spec, Sh_spec
order by  Sh_spec +' - '+Cname_spec, Sh_spec
