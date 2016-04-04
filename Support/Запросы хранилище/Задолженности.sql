	select CONVERT(VARCHAR(10),GETDATE(),104)

SELECT DISTINCT  dbo.Fac.Cshort_name_fac, Cname_spec, Grup.Cname_grup, MAX(Uspev.Cosenca) AS Cosenca, Content_UchPl.n_sem, NULL as id_teacher, sv_disc.ik_disc, Uch_pl.ik_spec, Uch_pl.ik_form_ed,
Content_UchPl.ik_kaf, discpln.DiplDiscName,
Student.nCode, TypeDirection.id_type_direction, Fac.Ik_fac, Content_UchPl.ik_vid_zanyat, Grup.Ik_grup, Kat_zach.ik_type_kat,

vid_zaniat.cName_vid_zanyat, Kat_zach.Cname_kat_zach,


dbo.Lang.Cname_lang, dbo.medal_abit.cmedal, dbo.Zaved_stud.cName_zaved, CONVERT(VARCHAR(10),dbo.Person.Dd_birth,104), dbo.Person.Linval, dbo.Person.Ldeti, dbo.Person.Lrab, dbo.Person.lSex, dbo.Person.Lobchegit, 
                         dbo.Kat_zaved.cKat_Zaved, dbo.typ_zaved.ctyp_zaved, dbo.Region.Cregion, dbo.sem_pol.csem_pol, dbo.type_gorod.cshort_type_gorod, dbo.type_gorod.ctype_gorod, dbo.Raion.Craion, dbo.Gorod.Cgorod, 
                         dbo.Strana.Cstrana,

						 dbo.Direction.cName_direction, TypeDirection.NameTypeDirection, Cshort_spec, dbo.Relation_spec_fac.YearObuch, dbo.VidGosTabl.NameVid, 
                         dbo.Form_ed.Cname_form_ed, dbo.Fac.Cname_fac

FROM Content_UchPl INNER JOIN
Vedomost ON Content_UchPl.ik_upContent = Vedomost.ik_upContent INNER JOIN
Uspev ON Vedomost.Ik_ved = Uspev.Ik_ved INNER JOIN
vid_zaniat ON Content_UchPl.ik_vid_zanyat = vid_zaniat.iK_vid_zanyat INNER JOIN
TypeZanyat ON vid_zaniat.ikTypeZanyat = TypeZanyat.ikTypeZanyat INNER JOIN
sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan INNER JOIN
Uch_pl ON sv_disc.ik_uch_plan = Uch_pl.ik_uch_plan INNER JOIN
StudGrup ON Uspev.Ik_zach = StudGrup.Ik_zach INNER JOIN
Zach ON Uspev.Ik_zach = Zach.Ik_zach AND StudGrup.Ik_zach = Zach.Ik_zach INNER JOIN
Student ON Zach.nCode = Student.nCode INNER JOIN
Grup ON Vedomost.Ik_grup = Grup.Ik_grup AND Uch_pl.ik_uch_plan = Grup.Ik_uch_plan AND StudGrup.Ik_grup = Grup.Ik_grup INNER JOIN
Kat_zach ON StudGrup.ik_kat_zach = Kat_zach.Ik_kat_zach inner join
discpln ON discpln.iK_disc = sv_disc.ik_disc


INNER JOIN
                         dbo.medal_abit ON dbo.Student.ik_medal = dbo.medal_abit.ik_medal INNER JOIN
                         dbo.Lang_stud ON dbo.Student.nCode = dbo.Lang_stud.nCode INNER JOIN
                         dbo.Lang ON dbo.Lang_stud.Ik_lang = dbo.Lang.Ik_lang INNER JOIN
                         dbo.Person ON dbo.Student.nCode = dbo.Person.nCode AND dbo.Lang_stud.nCode = dbo.Person.nCode INNER JOIN
                         dbo.sem_pol ON dbo.Person.Ik_sem_pol = dbo.sem_pol.ik_sem_pol INNER JOIN
                         dbo.Zaved_stud ON dbo.Student.Ik_zaved = dbo.Zaved_stud.ik_zaved INNER JOIN
                         dbo.typ_zaved ON dbo.Zaved_stud.ik_typ_zaved = dbo.typ_zaved.ik_typ_zaved INNER JOIN
                         dbo.Kat_zaved ON dbo.typ_zaved.ik_kat_zaved = dbo.Kat_zaved.ik_kat_zaved INNER JOIN
                         dbo.Gorod ON dbo.Zaved_stud.Ik_gorod = dbo.Gorod.Ik_gorod INNER JOIN
                         dbo.Raion ON dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion INNER JOIN
                         dbo.Region ON dbo.Raion.Ik_region = dbo.Region.Ik_region INNER JOIN
                         dbo.Strana ON dbo.Person.Ik_grazd = dbo.Strana.Ik_strana AND dbo.Region.Ik_strana = dbo.Strana.Ik_strana INNER JOIN
                         dbo.type_gorod ON dbo.Gorod.ik_type_gorod = dbo.type_gorod.ik_type_gorod INNER JOIN

                        dbo.Relation_spec_fac ON Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac INNER JOIN
						dbo.EducationBranch SpecStud ON Relation_spec_fac.ik_spec=SpecStud.ik_spec INNER JOIN
                         dbo.Fac ON dbo.Relation_spec_fac.ik_fac = dbo.Fac.Ik_fac INNER JOIN
                         dbo.Form_ed ON dbo.Relation_spec_fac.Ik_form_ed = dbo.Form_ed.Ik_form_ed INNER JOIN
                         dbo.Direction ON SpecStud.ik_direction = dbo.Direction.ik_direction INNER JOIN
                         dbo.VidGosTabl ON dbo.Relation_spec_fac.VidGos = dbo.VidGosTabl.VidGos
						 INNER JOIN
						TypeDirection ON Direction.id_type_direction = TypeDirection.id_type_direction 
WHERE (Grup.DateExit > GETDATE() OR Grup.DateExit IS NULL) AND (StudGrup.Ik_prikazOtch IS NULL)
AND (Content_UchPl.n_module IS NULL) AND (Vedomost.lClose = 1)
--AND Student.nCode = 32731

GROUP BY Content_UchPl.n_module, Content_UchPl.n_sem, sv_disc.ik_disc,
Uch_pl.ik_spec, Uch_pl.ik_form_ed, Content_UchPl.ik_kaf, Student.nCode, TypeDirection.id_type_direction, Fac.Ik_fac,
Content_UchPl.ik_vid_zanyat, Grup.Ik_grup, Kat_zach.ik_type_kat, discpln.DiplDiscName

, vid_zaniat.cName_vid_zanyat, Kat_zach.Cname_kat_zach

,dbo.Lang.Cname_lang, dbo.medal_abit.cmedal, dbo.Zaved_stud.cName_zaved, dbo.Person.Dd_birth, dbo.Person.Linval, dbo.Person.Ldeti, dbo.Person.Lrab, dbo.Person.lSex, dbo.Person.Lobchegit, 
                         dbo.Kat_zaved.cKat_Zaved, dbo.typ_zaved.ctyp_zaved, dbo.Region.Cregion, dbo.sem_pol.csem_pol, dbo.type_gorod.cshort_type_gorod, dbo.type_gorod.ctype_gorod, dbo.Raion.Craion, dbo.Gorod.Cgorod, 
                         dbo.Strana.Cstrana,

						 Grup.Cname_grup, dbo.Direction.cName_direction, TypeDirection.NameTypeDirection, dbo.Grup.Cname_grup, Cname_spec, Cshort_spec, dbo.Relation_spec_fac.YearObuch, dbo.VidGosTabl.NameVid, 
                         dbo.Form_ed.Cname_form_ed, dbo.Fac.Cname_fac, dbo.Fac.Cshort_name_fac
HAVING (MAX(Uspev.Cosenca) < 1 OR MAX(Uspev.Cosenca) = 2 ) 

order by dbo.Fac.Cshort_name_fac, Cname_spec, Grup.Cname_grup, Student.nCode, Content_UchPl.n_sem

--AND (Vedomost.lClose = 1)
--AND uch_pl.ik_form_ed = 1 —(Uch_pl.IsBRSPlan = 0) and