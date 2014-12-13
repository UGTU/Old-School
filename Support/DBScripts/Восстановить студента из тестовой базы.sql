declare @inserted_stud int 
declare @old_zach int
declare @new_ikstudgrup int

insert into [UGTU].[dbo].Person (Clastname, Cfirstname, Cotch, Dd_birth, Cplacebirth, Linval, Ldeti, Lrab, lSex, Lobchegit, cSotTel, ctelefon, cEmail, Photo, Ik_grazd, Ik_sem_pol, cInn, cStrax, ik_voen_zvanie,
	   itab_n, ik_nac, PersonGUID)
select Clastname, Cfirstname, Cotch, Dd_birth, Cplacebirth, Linval, Ldeti, Lrab, lSex, Lobchegit, cSotTel, ctelefon, cEmail, Photo, Ik_grazd, Ik_sem_pol, cInn, cStrax, ik_voen_zvanie,
	   itab_n, ik_nac, PersonGUID
from [UGTURealTest].[dbo].Person where nCode = 16437

SET @inserted_stud = IDENT_CURRENT('Person') --57350

--select @inserted_stud

declare @inserted_abit int 

insert into ABIT_postup(dd_online,dd_pod_zayav,dd_vozvr_zayav,dd_vvoda_zayav,ik_kat_zach,ik_zach,IsMain,nCode,NNrecord,Realy_postup,RegNomer,SchoolAverMark)
select dd_online,dd_pod_zayav,dd_vozvr_zayav,dd_vvoda_zayav,ik_kat_zach,ik_zach,IsMain,57350,NNrecord,Realy_postup,RegNomer,SchoolAverMark
from [UGTURealTest].[dbo].ABIT_postup where nCode=16437

SET @inserted_abit = IDENT_CURRENT('ABIT_postup') --34469

--select @inserted_abit

insert into [UGTU].[dbo].student(cDolgnost,Cdopsved,cLgot,cOsnovan,ik_medal,Ik_ob_rab,Ik_podg,ik_pred,Ik_special_uchet,Ik_vid_pens,Ik_zaved,nCode,Ngodokon,StazMonth,StazYear)
select cDolgnost,Cdopsved,cLgot,cOsnovan,ik_medal,Ik_ob_rab,Ik_podg,ik_pred,Ik_special_uchet,Ik_vid_pens,Ik_zaved,57350,Ngodokon,StazMonth,StazYear
from  [UGTURealTest].[dbo].student where nCode = 16437

insert into Doc_stud(Cd_kem_vidan,Cd_seria,Dd_vidan,Ik_vid_doc,nCode,Np_number)
select Cd_kem_vidan,Cd_seria,Dd_vidan,Ik_vid_doc,57350,Np_number
from [UGTURealTest].[dbo].Doc_stud where nCode = 16437

insert into PersonAddress(DateBegin,DateEnd,ik_address,ik_AddressType,nCode)
select DateBegin,DateEnd,ik_address,ik_AddressType,57350 
from [UGTURealTest].[dbo].PersonAddress where nCode=16437

declare @inserted_zach int

insert into [UGTU].[dbo].Zach(nCode,Nn_zach)
select 57350,Nn_zach
from [UGTURealTest].[dbo].Zach where nCode = 16437

SET @inserted_zach = IDENT_CURRENT('Zach') --27514

select @inserted_zach

select @old_zach=ik_zach from [UGTURealTest].[dbo].Zach where nCode = 16437 --8201

insert into StudGrup(cObosnOtch,cObosnZach,Ik_grup,ik_kat_zach,ik_pricOtch,ik_pricZach,Ik_prikazOtch,Ik_prikazZach,Ik_zach)
select cObosnOtch,cObosnZach,Ik_grup,ik_kat_zach,ik_pricOtch,ik_pricZach,Ik_prikazOtch,Ik_prikazZach,27514
from [UGTURealTest].[dbo].StudGrup where Ik_zach= 8201

select @new_ikstudgrup = Ik_studGrup  --34318
from StudGrup where Ik_zach = 27514

--отключить триггеры для Uspev про Направления и закрытую ведомость
insert into Uspev(Ik_ved,Ik_zach,Cosenca,i_balls,PropCount,UserName,Uvag_PropCount)
select Ik_ved,27514,Cosenca,i_balls,PropCount,UserName,Uvag_PropCount
from [UGTURealTest].[dbo].Uspev where Ik_zach = 8201

select * from Uspev where Ik_zach=27514

select * from Vedomost where Ik_ved in (select Ik_ved
from [UGTURealTest].[dbo].Uspev where Ik_zach = 8201)
