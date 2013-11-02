set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


ALTER FUNCTION [dbo].[DistortDataSTR] 
(
	
	@string varchar(100)

)
RETURNS varchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @next varchar(100);

Set @next = CONVERT(varchar(1),@string)+'Te'

	-- Return the result of the function
	RETURN @next

END




set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


CREATE FUNCTION [dbo].[DistortDataINT] 
(
	
	@val int,
	@random int

)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @next int;

Set @next = @val+@random

	-- Return the result of the function
	RETURN @next

END

CREATE FUNCTION [dbo].[DistortDataSTRasINT] 
(
	
	@string varchar(100),
	@random int

)
RETURNS varchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @next varchar(100);
	DECLARE @tmp int;

Set @tmp = CONVERT(int,@string)+@random
Set @next  =CONVERT(varchar(100),@tmp) 

	-- Return the result of the function
	RETURN @next

END



Update Stud 
Set Stud.Kvart_fact = dbo.DistortDataSTR(Stud.Kvart_fact),
Stud.Build_fact = dbo.DistortDataSTR(Stud.Build_fact),
Stud.Stroen_prop = dbo.DistortDataSTR(Stud.Stroen_prop),
Stud.Kvart_prop = dbo.DistortDataSTR(Stud.Kvart_prop),
Stud.Build_prop = dbo.DistortDataSTR(Stud.Build_prop), 
CLastName = dbo.DistortDataSTR(CLastName),
CFirstName = dbo.DistortDataSTR(CFirstName),
Stud.DD_birth = dbo.DistortDataDate(Stud.DD_birth, Rand(100)),
Stud.COtch = dbo.DistortDataSTR(Stud.COtch),
Stud.CPlaceBirth = dbo.DistortDataSTR(Stud.CPlaceBirth),
Stud.Stroen_fact = dbo.DistortDataSTR(Stud.Stroen_fact),
Stud.ctelefon = dbo.DistortDataSTR(Stud.ctelefon),
Stud.cInn = dbo.DistortDataSTR(Stud.cInn),
Stud.cStrax = dbo.DistortDataSTR(Stud.cStrax),
Stud.cDolgnost = dbo.DistortDataSTR(Stud.cDolgnost),
Stud.Cdopsved = dbo.DistortDataSTR(Stud.Cdopsved)

Update Doc_stud
Set Dd_vidan = dbo.DistortDataDate(Dd_vidan, Rand(100)),
Cd_kem_vidan = dbo.DistortDataSTR(Cd_kem_vidan),
Np_number = dbo.DistortDataSTR(Np_number),
Cd_seria = dbo.DistortDataSTR(Cd_seria)

Update Abit_Vstup_Exam
Set Abit_Vstup_Exam.cosenka = dbo.DistortDataINT(Abit_Vstup_Exam.cosenka, Rand(100))

Update dbo.zach
Set dbo.Zach.nn_zach = RTRIM(dbo.Zach.nn_zach)+'00000'
where (len(RTRIM([nn_zach]))=1)

Update dbo.prepods
Set dbo.prepods.Clastname = dbo.DistortDataSTR(dbo.prepods.Clastname)

Update dbo.prepods
Set dbo.prepods.CfirstName = dbo.DistortDataSTR(dbo.prepods.CfirstName)

Update dbo.prepods
Set dbo.prepods.COtch = dbo.DistortDataSTR(dbo.prepods.COtch)
