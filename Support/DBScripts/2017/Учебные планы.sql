


  SET IDENTITY_INSERT [dbo].[vid_zaniat] ON 
INSERT INTO [dbo].[vid_zaniat]
           ([iK_vid_zanyat],[ikTypeZanyat]
           ,[iK_type_vz]
           ,[cName_vid_zanyat]
           ,[cshort_vid_zanyat]
           ,[lTema]
           ,[bit_priznak_decompose]
           ,[bit_nagr]
           ,[bit_must_be_in_uch_plan]
           ,[isAudit])
values (100,3, 3, 'Аудиторные занятия', 'Кол-во часов', 0, 0, 0, 1,1)

  SET IDENTITY_INSERT [dbo].[vid_zaniat] OFF


  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [UGTU].[dbo].[vid_zaniat]