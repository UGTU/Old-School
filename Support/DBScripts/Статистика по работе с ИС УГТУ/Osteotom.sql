Select 
 Cname_spec, Cname_fac , Cname_grup, Count (distinct Ik_studGrup) Kolichestvo

 from  Person AS per INNER JOIN 

 Stud AS St  ON St.nCode = per.nCode INNER JOIN  Zach AS Za On Za.nCode = St.nCode INNER JOIN 
		     
  StudGrup AS Sg On Sg.ik_zach = Za.Ik_zach INNER JOIN  Grup AS Gr On Gr.Ik_grup= Sg.Ik_grup  INNER JOIN 

   Relation_spec_fac as Rs on Rs.ik_spec_fac = Gr.ik_spec_fac   INNER JOIN EducationBranch as Eb on eb.ik_spec = Rs.ik_spec INNER JOIN 

	Fac as Fa On fa.Ik_fac = Rs.ik_fac INNER JOIN  Vedomost AS Vd On vd.ik_upContent = ik_upContent and vd.Ik_grup = gr.Ik_grup LEFT JOIN

	 Uspev as us on us.Ik_ved = vd.Ik_ved and za.Ik_zach = us.Ik_zach LEFT JOIN Content_UchPl as Cu on cu.ik_upContent = vd.ik_upContent LEFT JOIN

	  Sv_disc as sd On sd.ik_disc_uch_plan =cu.ik_disc_uch_plan LEFT JOIN  Discpln as ds on ds.iK_disc = sd.ik_disc
	  

        WHERE DateExit >= '2016-01-12' 
		and n_sem <  iif(DATEPART(month, GETDATE())<=8, (DATEPART(year, GETDATE())-nYear_post)*2 , (DATEPART(year, GETDATE())-nYear_post)*2+1)
		and Cosenca is null	
		and Ik_prikazOtch is null	
		and cu.	n_module is null	
		GROUP BY Sg.Ik_grup, Cname_grup, Cname_spec, Cname_fac	
		Order by Cname_spec, Cname_grup, Kolichestvo asc