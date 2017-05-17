USE [UGTU]
GO
  SET IDENTITY_INSERT [dbo].[Person] ON 



INSERT INTO [dbo].[Person]
           ([nCode],[Clastname]
           ,[Cfirstname]
           ,[Cotch]
           ,[Dd_birth]
           ,[Cplacebirth]
           ,[Linval]
           ,[Ldeti]
           ,[Lrab]
           ,[lSex]
           ,[Lobchegit]
           ,[cSotTel]
           ,[ctelefon]
           ,[cEmail]
           ,[Photo]
           ,[Ik_grazd]
           ,[Ik_sem_pol]
           ,[cInn]
           ,[cStrax]
           ,[ik_voen_zvanie]
           ,[itab_n]
           ,[ik_nac]
           ,[PersonGUID])
     select 44659,[Clastname]
           ,[Cfirstname]
           ,[Cotch]
           ,[Dd_birth]
           ,[Cplacebirth]
           ,[Linval]
           ,[Ldeti]
           ,[Lrab]
           ,[lSex]
           ,[Lobchegit]
           ,[cSotTel]
           ,[ctelefon]
           ,[cEmail]
           ,[Photo]
           ,[Ik_grazd]
           ,[Ik_sem_pol]
           ,[cInn]
           ,[cStrax]
           ,[ik_voen_zvanie]
           ,[itab_n]
           ,[ik_nac]
           ,[PersonGUID]
		   from
		   [UgtuUgtu].[dbo].Person
  where nCode=44659
  SET IDENTITY_INSERT [dbo].[Person] OFF

  go
  
INSERT INTO [dbo].[Student]
           ([nCode]
           ,[Nn_abit]
           ,[ik_medal]
           ,[Ik_vid_pens]
           ,[Ik_podg]
           ,[Ik_ob_rab]
           ,[Ik_special_uchet]
           ,[Ik_zaved]
           ,[Ngodokon]
           ,[Cdopsved]
           ,[ik_pred]
           ,[cDolgnost]
           ,[StazYear]
           ,[StazMonth]
           ,[cLgot]
           ,[cOsnovan])
		   select [nCode]
           ,[Nn_abit]
           ,[ik_medal]
           ,[Ik_vid_pens]
           ,[Ik_podg]
           ,[Ik_ob_rab]
           ,[Ik_special_uchet]
           ,[Ik_zaved]
           ,[Ngodokon]
           ,[Cdopsved]
           ,[ik_pred]
           ,[cDolgnost]
           ,[StazYear]
           ,[StazMonth]
           ,[cLgot]
           ,[cOsnovan] from [UgtuUgtu].[dbo].Student
  where nCode=44659


go
		   
  SET IDENTITY_INSERT [dbo].[Zach] ON 

  INSERT INTO [dbo].[Zach]
           ([Ik_zach],[Nn_zach]
           ,[nCode])
		   select [Ik_zach],[Nn_zach]
           ,[nCode] from [UgtuUgtu].[dbo].Zach
		    where nCode=44659

  SET IDENTITY_INSERT [dbo].[Zach] ON 


select * from [UgtuUgtu].[dbo].Zach
		    where nCode=44659 --24466 - старый код зачетки


  go

  INSERT INTO [dbo].[StudGrup]
           ([Ik_grup]
           ,[Ik_zach]
           ,[ik_kat_zach]
           ,[Ik_prikazZach]
           ,[ik_pricZach]
           ,[cObosnZach]
           ,[Ik_prikazOtch]
           ,[ik_pricOtch]
           ,[cObosnOtch])
select [Ik_grup]
           ,[Ik_zach]
           ,[ik_kat_zach]
           ,[Ik_prikazZach]
           ,[ik_pricZach]
           ,[cObosnZach]
           ,[Ik_prikazOtch]
           ,[ik_pricOtch]
           ,[cObosnOtch] from [UgtuUgtu].[dbo].StudGrup where [Ik_zach]=24466
go
		
INSERT INTO [dbo].[Uspev]
           ([Ik_ved]
           ,[Ik_zach]
           ,[Cosenca]
           ,[PropCount]
           ,[UserName]
           ,[i_balls]
           ,[Uvag_PropCount])
        
select [Ik_ved]
           ,[Ik_zach]
           ,[Cosenca]
           ,[PropCount]
           ,[UserName]
           ,[i_balls]
           ,[Uvag_PropCount] from [UgtuUgtu].[dbo].Uspev where [Ik_zach]=24466


go
		 
INSERT INTO [dbo].[UspevDocument]
           ([ik_zach]
           ,[ik_upContent])		   
select [ik_zach]
           ,[ik_upContent] from [UgtuUgtu].[dbo].UspevDocument where [Ik_zach]=24466



