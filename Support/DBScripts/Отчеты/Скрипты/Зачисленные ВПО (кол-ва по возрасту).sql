

declare @Ik_form_ed int
set @Ik_form_ed=2
select distinct
       YearAllOld--, IIF(Ik_form_ed=1,'Очное','Заочное') FormEd,IIF( CType_kat<3,'Бюджет','Договор')  CType_kat--, IIF(lSex=1,'Муж','Жен') Sex
	   ,COUNT(DISTINCT stud.nCode) Col
	    
from
(
	select distinct 
		   DATEDIFF(yy,Person.Dd_birth,GETDATE())YearAllOld
	from Person
) years
left join

(
	select distinct 
		   Cshort_name_fac, 
	   Cname_spec, Spec_stud.Sh_spec, ABIT_postup.nCode, Relation_spec_fac.ik_spec_fac, DATEDIFF(yy,Person.Dd_birth,GETDATE())YearOld,
	   TypeKatZach.ik_type_kat as CType_kat, lSex, Relation_spec_fac.Ik_form_ed
	from ABIT_postup,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac, Person,Kat_zach,TypeKatZach
	where ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and Relation_spec_fac.Ik_form_ed=@Ik_form_ed
	and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach IN (2)) 
	and Relation_spec_fac.ik_fac <> 31										
	and NNyear=year(GETDATE())
	and ABIT_postup.nCode=Person.nCode
	and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
	and TypeKatZach.ik_type_kat=3
--and lSex=0
) stud
on years.YearAllOld=stud.YearOld
where YearAllOld <30-- between 30 and 34--between 35 and 39--> 39--   --   

GROUP BY --Ik_form_ed,CType_kat, 
YearAllOld
--, lSex
--order by  YearCount



--30-34; 35-39; 40 и старше