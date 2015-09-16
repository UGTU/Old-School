USE [UGTU_ACTTEST]
GO
/****** Object:  StoredProcedure [dbo].[DocInfoSpravBuild]    Script Date: 24.07.2015 10:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






--EXEC	[dbo].[DebtSpravBuild] @Ik_document = 302
Alter   procedure [dbo].[DebtSpravBuild](@Ik_document INT)
as
	SELECT vz.cName_vid_zanyat,n_sem,cName_disc
		FROM Document 
				inner join AkademNeuspev an
					on Document.Ik_Document=  an.Ik_Document
						inner join Debt d
							on an.Ik_Document =d.Ik_Document
								inner join Content_UchPl cup
									on d.Ik_upContent=cup.ik_upContent 
										inner join vid_zaniat vz
											on cup.ik_vid_zanyat=vz.iK_vid_zanyat
												inner join sv_disc sd
													on cup.ik_disc_uch_plan=sd.ik_disc_uch_plan
														inner join discpln
															on sd.ik_disc=discpln.iK_disc


												

			WHERE  Document.[Ik_document]=@Ik_document






