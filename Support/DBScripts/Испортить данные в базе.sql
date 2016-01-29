update person set Clastname = SUBSTRING(Clastname,1,1)+'AAAAAA', Cfirstname = SUBSTRING(Cfirstname,1,1)+'AAAAAA', Cotch = SUBSTRING(Cotch,1,1)+'AAAAAA', [Cplacebirth]= 'место рождения',
Dd_birth = '01.01.1980', Photo = null, cSotTel = '905-555-55', ctelefon = '555-55-55', cEmail = '@mail.ru',cInn= null, cStrax = null

update Address set BuildingNumber = '1', FlatNumber = '1'

update Doc_stud set Np_number='00000000', Cd_seria = '0000000', [Cd_kem_vidan] = 'отделом УФМС'
/*delete from [dbo].[Addressee_Doc]
delete from [dbo].[PersonAddress]*/

update Zach set Nn_zach='111111'


delete from [dbo].[Uspev]