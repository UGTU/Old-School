	select distinct
		Clastname, 
		Cfirstname, 
		Cotch,
		Zaved_stud.cName_zaved,
		ap.RegNomer,
		   --ABIT_sost_zach.cname_zach,
		   iif((select count(nCode) from ABIT_postup where ABIT_postup.nCode = ap.nCode and ABIT_postup.ik_zach = 6)>0, 'зачислен',
		     iif((select count(nCode) from ABIT_postup where ABIT_postup.nCode = ap.nCode and ABIT_postup.ik_zach = 1)>0,'текущее', 'забрал документы'))
	from dbo.Person,ABIT_postup ap,ABIT_Diapazon_spec_fac,dbo.Student,
		 Zaved_stud, ABIT_sost_zach
	where ap.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ap.NNrecord
	and Student.nCode = ap.nCode
	and Student.Ik_zaved = Zaved_stud.ik_zaved
	and ABIT_sost_zach.ik_zach = ap.ik_zach
	and NNyear=year(GETDATE())
	and ABIT_sost_zach.ik_zach in (1,3,6)
order by  Clastname,Cfirstname,Cotch

--select * from Abit_Geography_Gorod(2015,17,2) 
