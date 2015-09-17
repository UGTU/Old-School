select _d.cName_disc, _vid_zan.[cName_vid_zanyat],cu.n_sem
FROM 		  Content_UchPl cu 
			inner join sv_disc sv on cu.ik_disc_uch_plan=sv.ik_disc_uch_plan
			inner join [dbo].[discpln] _d on sv.ik_disc=_d.ik_disc
			inner join  Vedomost _vedomost
				ON cu.ik_upContent=_vedomost.ik_upContent
				left join Uspev _uspev 
					ON _vedomost.Ik_ved= _uspev.Ik_ved
						Left join Osenca _ocenca
						ON _ocenca.Cosenca=_uspev.Cosenca 
						Inner join Zach _zach
						ON _zach.Ik_zach= _uspev.Ik_zach
							inner join StudGrup sg 
								ON _zach.Ik_zach=sg.Ik_zach
									inner join vid_zaniat _vid_zan
									ON _vid_zan.iK_vid_zanyat=cu.ik_vid_zanyat
								inner join 

									(
									SELECT _content.ik_upContent
											FROM   Vedomost _vedomost
													inner join Content_UchPl _content
														ON _content.ik_upContent=_vedomost.ik_upContent
															inner join vid_zaniat _vid_zan
															ON _vid_zan.iK_vid_zanyat=_content.ik_vid_zanyat
																left join Uspev _uspev 
																ON _vedomost.Ik_ved= _uspev.Ik_ved
																	Inner join Zach _zach
																	ON _zach.Ik_zach= _uspev.Ik_zach
																			inner join StudGrup sg 
																			ON _zach.Ik_zach=sg.Ik_zach
																				Left join Osenca _ocenca
																					ON _ocenca.Cosenca=_uspev.Cosenca
																					
																						Where sg.Ik_studGrup=20436 and (_vid_zan.iK_vid_zanyat=6 or
																				_vid_zan.iK_vid_zanyat=7 or
																				_vid_zan.iK_vid_zanyat=8 )
																			
																							Group By _content.ik_upContent
																							Having Max(_ocenca.Cosenca)<=2 and Max(_ocenca.Cosenca)<>1
																							and Max(_ocenca.Cosenca)is not Null)g
																							on cu.ik_upContent =g.ik_upContent
																							where 
																				 _vedomost.dD_vydano < GETDATE() and  sg.Ik_studGrup=20436