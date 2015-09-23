USE [UGTU_COPY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetStudDebt]    Script Date: 15.09.2015 12:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from [GetStudDebt](30744)
--select * from [GetStudDebt](20436)
--select * from [GetStudDebt](42062)

ALTER FUNCTION [dbo].[GetStudDebt]
(	
	@ik_studGrup		int
)
RETURNS @result TABLE
(
	Ik_studGrup		int,
	ik_upContent	int,
	cName_disc		varchar(100),
	[cName_vid_zanyat]	varchar(100),
	n_sem	int,
	flag bit NULL
)
AS --select * from [SprAkadem] where Ik_studGrup=20436	
--select * from [SprAkadem] where Ik_studGrup=30744
BEGIN   
	insert into @Result(Ik_studGrup,ik_upContent, cName_disc,cName_vid_zanyat,n_sem)					
		select sg.Ik_studGrup, _content.ik_upContent, cName_disc, _vid_zan.[cName_vid_zanyat],_content.n_sem --, CAST (NULL as bit) flag
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
	
								inner join [dbo].[Uch_pl] up 
										on svd.ik_uch_plan=up.ik_uch_plan
										inner join Grup gr
										on gr.Ik_uch_plan=up.ik_uch_plan	
																		inner join 	

													(   SELECT _content.ik_upContent
														FROM   Vedomost _vedomost
														inner join Content_UchPl _content
														ON _content.ik_upContent=_vedomost.ik_upContent
														left join Uspev _uspev 
														ON _vedomost.Ik_ved= _uspev.Ik_ved
														Left join Osenca _ocenca
														ON _ocenca.Cosenca=_uspev.Cosenca
														inner join vid_zaniat _vid_zan                                               
														ON _vid_zan.iK_vid_zanyat=_content.ik_vid_zanyat
														inner join Zach z on _uspev.Ik_zach=z.Ik_zach
														inner join StudGrup sg on z.Ik_zach=sg.Ik_zach
														where (_vid_zan.iK_vid_zanyat=6 or
																				_vid_zan.iK_vid_zanyat=7 or
																				_vid_zan.iK_vid_zanyat=8
																				or
																				_vid_zan.iK_vid_zanyat=9
																				or
																				_vid_zan.iK_vid_zanyat=27 ) and Ik_studGrup=@ik_studGrup
																				
														group by _content.ik_upContent
														Having Max (_ocenca.Cosenca)=2 or Max (_ocenca.Cosenca)<1
													) gb1

							on _content.ik_upContent = gb1.ik_upContent
							inner join 	(
							select Grup.Ik_grup
									FROM StudGrup 
									   inner join Zach on StudGrup.Ik_zach = Zach.Ik_zach
										inner join Person on Zach.nCode = Person.nCode
										    inner join Grup on StudGrup.Ik_grup = Grup.Ik_grup
											where Ik_studGrup=@ik_studGrup) f
							on gr.Ik_grup=f.Ik_grup

	
										where 
										_vedomost.dD_vydano < GETDATE() 
										and sg.ik_studGrup=@ik_studGrup and
										(_vid_zan.iK_vid_zanyat=6 or
																				_vid_zan.iK_vid_zanyat=7 or
																				_vid_zan.iK_vid_zanyat=8
																				or
																				_vid_zan.iK_vid_zanyat=9
																				or
																				_vid_zan.iK_vid_zanyat=27 )
										
									
	RETURN
END
