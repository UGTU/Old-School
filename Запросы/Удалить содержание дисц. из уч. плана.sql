
delete from Content_UchPl where ik_upContent in (select ik_upContent from Content_UchPl, sv_disc,Grup,Relation_spec_fac
					   where Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan
					   and sv_disc.ik_uch_plan = Grup.Ik_uch_plan and Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
					   and Grup.nYear_post = 2011 and Relation_spec_fac.ik_fac = 18
					   and sv_disc.ik_disc = 2023 and Content_UchPl.ik_vid_zanyat = 6)
			and ik_upContent not in (select ik_upContent from Vedomost)