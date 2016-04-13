update person set Clastname = SUBSTRING(Clastname,1,1)+'AAAAAA', Cfirstname = SUBSTRING(Cfirstname,1,1)+'AAAAAA', Cotch = SUBSTRING(Cotch,1,1)+'AAAAAA', [Cplacebirth]= 'место рождения',
Dd_birth = '01.01.1980', Photo = null, cSotTel = '905-555-55', ctelefon = '555-55-55', cEmail = '@mail.ru',cInn= null, cStrax = null

update Address set BuildingNumber = '1', FlatNumber = '1'

update Doc_stud set Np_number='00000000', Cd_seria = '0000000', [Cd_kem_vidan] = 'отделом УФМС'
/*delete from [dbo].[Addressee_Doc]
delete from [dbo].[PersonAddress]*/

update Zach set Nn_zach='111111'


update [dbo].[Uspev] set [Cosenca] = -1

update [Import].[KafTeachers] set [BirthDate] = '01.01.1970'

update [dbo].[Employee] set [itab_n]='000', [FirstName] = SUBSTRING([FirstName],2,1) + 'AAAAAA',
       [LastName] = SUBSTRING([LastName],2,1), [Otch] = SUBSTRING([Otch],2,1), [BirthDate] = '01.01.1980',
		[BirthPlace] = '', [SexBit] = 1 - [SexBit], [idGrazd] = 2, [EmployeeLogin] = '', [paspser] = '0000', 
		[paspnomer] = '000000', [paspdate] = '01.01.2011', [paspkem] = '', [inn] = '', [ssgps] = '',
		[medpolis] = '', [EmplHistSer] = '', [EmplHistNumber] = '', [EmplHistDate] = '01.01.2010',
		[email] = '@mail.ru', [paspCodeKem] = ''

delete from [dbo].[EmployeeHistory]

delete from [dbo].[OK_Fam]

update [dbo].[OK_Adress] set [Adress] = 'адрес присутствует', [DateReg] = '01.01.2010'
update [dbo].[Contract] set [ContractName] = '000'
update [dbo].[OK_phone] set [phone] = '00-00-00'
update [dbo].[PKCategorySalary] set [SalarySize] = 100
update [dbo].[PlanStaffSalary] set [SalarySize] = 100
update [dbo].[BonusHistory] set [BonusCount] = 100
update [dbo].[OK_DopInf] set [DopInf] = ''
update [dbo].[EducDocument] set [DocSeries] = '0000', [DocNumber] = '000000',
[DocDate] = '01.01.2010'

drop table [dbo].[_okold_ok_step]
drop table [dbo].[_okold_ok_zvan]
drop table [dbo].[_okold_okspr_dok]
drop table [dbo].[_okold_okspr_educ]
drop table [dbo].[_okold_okspr_ets]
drop table [dbo].[_okold_okspr_fak]
drop table [dbo].[_okold_okspr_form]
drop table [dbo].[_okold_okspr_gorod]
drop table [dbo].[_okold_okspr_grazd]
drop table [dbo].[_okold_okspr_harakter]
drop table [dbo].[_okold_okspr_holyday]
drop table [dbo].[_okold_okspr_kateg]
drop table [dbo].[_okold_okspr_kvalif]
drop table [dbo].[_okold_okspr_lang]
drop table [dbo].[_okold_okspr_memb]
drop table [dbo].[_okold_okspr_metric]
drop table [dbo].[_okold_okspr_nadb]
drop table [dbo].[_okold_okspr_nspec]
drop table [dbo].[_okold_okspr_otpvid]
drop table [dbo].[_okold_okspr_prof]
drop table [dbo].[_okold_okspr_prper]
drop table [dbo].[_okold_okspr_rayon]
drop table [dbo].[_okold_okspr_region]
drop table [dbo].[_okold_okspr_sempol]
drop table [dbo].[_okold_okspr_stag]
drop table [dbo].[_okold_okspr_step]
drop table [dbo].[_okold_okspr_strana]
drop table [dbo].[_okold_okspr_uvoln]
drop table [dbo].[_okold_okspr_vidnauk]
drop table [dbo].[_okold_okspr_vidper]
drop table [dbo].[_okold_okspr_vidpov]
drop table [dbo].[_okold_okspr_vidw]
drop table [dbo].[_okold_okspr_zvan]
drop table [dbo].[_okold_replacements]
drop table [dbo].[0post]

drop table [dbo].[Arch_OK_Attest]
drop table [dbo].[Arch_OK_Awards]
drop table [dbo].[Arch_OK_DopSved]
drop table [dbo].[Arch_OK_Educ]
drop table [dbo].[Arch_OK_Employe]
drop table [dbo].[Arch_OK_Fam]
drop table [dbo].[Arch_OK_Lang]
drop table [dbo].[Arch_OK_Lgota]
drop table [dbo].[Arch_OK_Live]
drop table [dbo].[Arch_OK_Nadbavka]
drop table [dbo].[Arch_OK_Otpusk]
drop table [dbo].[Arch_OK_PovQual]
drop table [dbo].[Arch_OK_ProfPodg]
drop table [dbo].[Arch_OK_Stag]
drop table [dbo].[Arch_OK_Step]
drop table [dbo].[Arch_OK_Work]
drop table [dbo].[Arch_OK_Zvan]