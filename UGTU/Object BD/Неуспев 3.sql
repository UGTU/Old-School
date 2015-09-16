									
				select _d.cName_disc, _vid_zan.[cName_vid_zanyat],_content.n_sem
				from 
				 Content_UchPl _content 
			inner join sv_disc svd on _content.ik_disc_uch_plan=svd.ik_disc_uch_plan
			inner join [dbo].[discpln] _d on svd.ik_disc=_d.ik_disc
			inner join  Vedomost _vedomost
				ON _content.ik_upContent=_vedomost.ik_upContent
				left join Uspev _uspev 
					ON _vedomost.Ik_ved= _uspev.Ik_ved
						Left join Osenca _ocenca
						ON _ocenca.Cosenca=_uspev.Cosenca 
						Inner join Zach _zach
						ON _zach.Ik_zach= _uspev.Ik_zach
							inner join StudGrup sg 
								ON _zach.Ik_zach=sg.Ik_zach
									inner join vid_zaniat _vid_zan
									ON _vid_zan.iK_vid_zanyat=_content.ik_vid_zanyat
								inner join 			
									(select _content.n_sem,_content.ik_upContent
										from Content_UchPl _content inner join [dbo].[sv_disc] svd
										on _content.ik_disc_uch_plan =	svd.ik_disc_uch_plan
										inner join vid_zaniat _vid_zan
										ON _vid_zan.iK_vid_zanyat=_content.ik_vid_zanyat
										inner join
											(		Select 	svd.ik_disc_uch_plan,svd.ViborGroup
													From Content_UchPl _content inner join [dbo].[sv_disc] svd
													on _content.ik_disc_uch_plan =	svd.ik_disc_uch_plan
													inner join vid_zaniat _vid_zan
													ON _vid_zan.iK_vid_zanyat=_content.ik_vid_zanyat
													inner join		
														(SELECT _content.ik_upContent,Max (_ocenca.Cosenca)[Cosenca]
														FROM   Vedomost _vedomost
														inner join Content_UchPl _content
														ON _content.ik_upContent=_vedomost.ik_upContent
														left join Uspev _uspev 
														ON _vedomost.Ik_ved= _uspev.Ik_ved
														Left join Osenca _ocenca
														ON _ocenca.Cosenca=_uspev.Cosenca
														inner join vid_zaniat _vid_zan
														ON _vid_zan.iK_vid_zanyat=_content.ik_vid_zanyat
														where (_vid_zan.iK_vid_zanyat=6 or
																				_vid_zan.iK_vid_zanyat=7 or
																				_vid_zan.iK_vid_zanyat=8 )
																				
														group by _content.ik_upContent) gb1
													on _content.ik_upContent =gb1.ik_upContent
													Where  gb1.Cosenca<=2 and gb1.Cosenca<>1 and gb1.Cosenca is not Null and
																			(_vid_zan.iK_vid_zanyat=6 or
																				_vid_zan.iK_vid_zanyat=7 or
																				_vid_zan.iK_vid_zanyat=8 )
											group by svd.ik_disc_uch_plan, svd.ViborGroup)gb2
										on svd.ik_disc_uch_plan=gb2.ik_disc_uch_plan
										where svd.ViborGroup=gb2.ViborGroup and
											(_vid_zan.iK_vid_zanyat=6 or
																				_vid_zan.iK_vid_zanyat=7 or
																				_vid_zan.iK_vid_zanyat=8 )
										group by _content.ik_upContent,_content.n_sem)gb3
										on _content.ik_upContent=gb3.ik_upContent
										where _vedomost.dD_vydano < GETDATE() and  sg.Ik_studGrup=42062--20436 
							-- проверить равняется ли выбор тру?
							--соеднить с предметами не по выбору
							--grup дисципл lvibor