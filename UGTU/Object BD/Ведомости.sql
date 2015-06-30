use [UGTU_ACTTEST]

GO

/****** Object:  StoredProcedure [dbo].[UspevSelVed]    Script Date: 08.11.2014 12:50:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetVedomostWithBRS]
@ik_group INT,
@ik_ved INT
AS

Select * FROM(
SELECT _zach.Ik_zach,(_person.Cfirstname+_person.Clastname+_person.Cotch)[FIO], _vid_zan.iK_vid_zanyat, _vid_zan.cName_vid_zanyat
FROM  Grup _grup inner join Vedomost _vedomost
	ON _grup.Ik_grup=_vedomost.Ik_ved
		inner join Content_UchPl _content
			ON _content.ik_upContent=_vedomost.ik_upContent
				inner join vid_zaniat _vid_zan
				ON _vid_zan.iK_vid_zanyat=_content.ik_vid_zanyat
					inner join Uspev _uspev 
					ON _vedomost.Ik_ved= _uspev.Ik_ved
						Inner join Zach _zach
						ON _zach.Ik_zach= _uspev.Ik_zach
							inner join Student _stud 
							ON _stud.nCode=_zach.nCode
								inner join Person _person 
								ON _person.nCode=_stud.nCode
									Left join Osenca _ocenca
										ON _ocenca.Cosenca=_uspev.Cosenca
										Where (_grup.Ik_grup=@ik_group)AND (_vedomost.Ik_ved=@ik_ved))ved
						Inner join 
		(select _zach.Ik_zach,SUM(_uspev.i_balls)[balls_modul]
		FROM Grup _grup inner join Vedomost _vedomost
		ON _grup.Ik_grup=_vedomost.Ik_grup
		inner join Content_UchPl _content
			ON _content.ik_upContent=_vedomost.ik_upContent
				inner join vid_zaniat _vid_zan
				ON _vid_zan.iK_vid_zanyat=_content.ik_vid_zanyat
					inner join Uspev _uspev 
					ON _vedomost.Ik_ved= _uspev.Ik_ved
						Inner join Zach _zach
						ON _zach.Ik_zach= _uspev.Ik_zach 
						Where (_content.ik_upContent=
								(Select _vedomost.Ik_ved
									FROM Vedomost _vedomost 
									Where _vedomost.Ik_ved=@ik_ved))
								AND(_vid_zan.iK_vid_zanyat=55)		
								GROUP BY _zach.Ik_zach ) summ_modul
			ON ved.Ik_zach=summ_modul.Ik_zach