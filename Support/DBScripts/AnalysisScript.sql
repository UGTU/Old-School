select ABIT_postup.nCode, '[' + fac.Cshort_name_fac + ', ' + EducationBranch.Cname_spec + ']', [ABIT_sost_zach].cname_zach
from ABIT_postup inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join  fac on Relation_spec_fac.ik_fac = fac.ik_fac
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
inner join [dbo].[ABIT_sost_zach] on [ABIT_sost_zach].ik_zach = ABIT_postup.ik_zach
where ABIT_Diapazon_spec_fac.NNyear >= 2010
order by ABIT_postup.nCode

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from
(select ABIT_postup.nCode, ABIT_Diapazon_spec_fac.NNyear, fac.Cshort_name_fac,EducationBranch.Cname_spec, Form_ed.Cname_form_ed, TypeKatZach.CType_kat, sum_ball, cast(sredBall as numeric(8,1)) sredBall, ABIT_type_zach.Cname_type_zach,
  [Linval],[Ldeti],[Lrab],[lSex],[Lobchegit], grazd.c_grazd, sem_pol.csem_pol,  Voen_zvanie.Cvoen_zvanie,
  medal_abit.cmedal, pens.cvid_pens, Abit_podg.Cname_podg, [Ngodokon], Gorod.Cgorod Gorod_uchebn, typ_zaved.ctyp_zaved, ABIT_Diapazon_spec_fac.NNyear - [Ngodokon] as LEt_posle_obuch,
  Special_uchet.Cspecial_uchet, [ik_pred], [cLgot], [cDolgnost],
  isnull(pr.Cstrana, isnull(fact.Cstrana,vrem.Cstrana)) Cstrana, isnull(pr.Cregion, isnull(fact.Cregion,vrem.Cregion)) Cregion,
  isnull(pr.Cgorod, isnull(fact.Cgorod,vrem.Cgorod)) Cgorod,
  stud_hist.pricina, stud_hist.proc_okonch, stud_hist.year_out
from Person inner join ABIT_postup on Person.nCode = ABIT_postup.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
inner join student on student.nCode = Person.nCode
inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
inner join  fac on Relation_spec_fac.ik_fac = fac.ik_fac
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
inner join Form_ed on Form_ed.Ik_form_ed = Relation_spec_fac.Ik_form_ed
inner join [dbo].[ABIT_sost_zach] on [ABIT_sost_zach].ik_zach = ABIT_postup.ik_zach
inner join ABIT_type_zach on ABIT_type_zach.ik_type_zach = [ABIT_sost_zach].ik_type_zach
inner join Kat_zach on Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
inner join TypeKatZach on Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
left join grazd on Person.Ik_grazd = grazd.ik_grazd
left join sem_pol on sem_pol.ik_sem_pol = Person.Ik_sem_pol
left join Voen_zvanie on Voen_zvanie.Ik_voen_zvanie = Person.ik_voen_zvanie
left join medal_abit on medal_abit.ik_medal = Student.ik_medal
left join pens on Student.Ik_vid_pens = pens.ik_vid_pens
left join Abit_podg on Student.Ik_podg = Abit_podg.Ik_podg
left join Zaved_stud on Zaved_stud.ik_zaved = Student.Ik_zaved
left join Gorod on Zaved_stud.Ik_gorod = Gorod.Ik_gorod
left join typ_zaved on Zaved_stud.ik_typ_zaved = typ_zaved.ik_typ_zaved
left join Special_uchet on Special_uchet.Ik_special_uchet = Student.Ik_special_uchet
left join
	(select ABIT_postup.nCode, ABIT_postup.nn_abit, sum(cosenka) as sum_ball, avg(CONVERT(decimal(5,2),cosenka)) as sredBall 
	from dbo.ABIT_Vstup_exam 
	inner join ABIT_postup on ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
	GROUP BY ABIT_postup.nCode, ABIT_postup.nn_abit) sum_ball on sum_ball.NN_abit = ABIT_postup.nn_abit
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on Person.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fact
on Person.nCode = fact.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana,Raion.Ik_raion vremraion, Region.Ik_region
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem on Person.nCode = vrem.nCode
left join (select ncode, isnull(Pricina.Cname_pric, 'еще обучается') pricina, year(isnull(Prikaz.Dd_prikazVst, grup.DateExit)) year_out, 
  cast(iif(cast((year(isnull(Prikaz.Dd_prikazVst, grup.DateExit)) - grup.nYear_post) as numeric(8,0))/Relation_spec_fac.YearObuch*100<=100,cast((year(isnull(Prikaz.Dd_prikazVst, grup.DateExit)) - grup.nYear_post) as numeric(8,0))/Relation_spec_fac.YearObuch*100,100) as numeric(8,2)) proc_okonch
from
(select ncode, MAX(StudGrup.Ik_studGrup) as last_gr
from Zach inner join StudGrup on StudGrup.Ik_zach = Zach.Ik_zach
inner join grup on grup.Ik_grup = StudGrup.Ik_grup
group by ncode) stud
inner join StudGrup on StudGrup.Ik_studGrup = stud.last_gr
inner join grup on grup.Ik_grup = StudGrup.Ik_grup
inner join Relation_spec_fac on grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
left join Pricina on Pricina.Ik_pric = StudGrup.ik_pricOtch
left join Prikaz on Prikaz.Ik_prikaz = StudGrup.Ik_prikazOtch) stud_hist on stud_hist.nCode = Person.nCode
) tabl
--where pricina<>'еще обучается' and Cname_type_zach = 'зачислен'
order by nCode


select grup.*,  Relation_spec_fac.YearObuch, Ik_form_ed
from grup inner join Relation_spec_fac on grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
where YEAR(grup.DateExit) - grup.nYear_post <> Relation_spec_fac.YearObuch
 
select count(distinct Person.nCode), year(Prikaz.Dd_prikazVst) year_ot, iif(month(Prikaz.Dd_prikazVst)<9,year(Prikaz.Dd_prikazVst)-[nYear_post],year(Prikaz.Dd_prikazVst)-[nYear_post]+1) cour
from Person inner join Zach on Zach.nCode = Person.nCode
 inner join StudGrup on StudGrup.Ik_zach = Zach.Ik_zach
 inner join Grup on Grup.[Ik_grup] = StudGrup.Ik_grup
left join Prikaz on Prikaz.Ik_prikaz = StudGrup.Ik_prikazOtch
left join Pricina on Pricina.Ik_pric = StudGrup.ik_pricOtch
where Pricina.ikTypePric in (2,18) and Pricina.Ik_pric<>3
group by year(Prikaz.Dd_prikazVst), iif(month(Prikaz.Dd_prikazVst)<9,year(Prikaz.Dd_prikazVst)-[nYear_post],year(Prikaz.Dd_prikazVst)-[nYear_post]+1)
order by year_ot,cour


(select count(ABIT_postup.Nn_abit), count(distinct Zach.Ik_zach), ABIT_postup.nCode
from ABIT_postup
left join Zach on Zach.nCode = ABIT_postup.nCode
group by ABIT_postup.nCode)
