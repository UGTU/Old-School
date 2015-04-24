--расширим поле с названием документа
/*alter table documents alter column cvid_doc varchar(500) not null

insert into Kat_zach(bit_Lgota,Cname_kat_zach,ik_type_kat,IsRussOlimpWinner)
values(1, 'особое право', 1, 0)

update Kat_zach set [OutDate]=cast('01.01.2015' as datetime)
where Ik_kat_zach in (4,5,6,7,13,20,21,23,31)

ALTER procedure [dbo].[ABIT_Add_Diapazon]
@ik_spec_fac int,		
@NNYear int,			--код года поступления
@MestBudjet int,		--кол-во мест бюджет
@MestCKP int,			--кол-во мест ЦКП
@MestLgot int,			--количество мест льготников
@MestKontrakt int,		--количество мест контрактников
@lRussian bit,			--учитывается экзамен по русскому языку
@nnrecord int output	--код нового добавленного набора
as
begin
insert into ABIT_Diapazon_spec_fac
(ik_spec_fac,NNYear,MestBudjet,MestCKP, Ready, lRussian, MestLgot, MestKontrakt)
values
(@ik_spec_fac, @NNYear,@MestBudjet,@MestCKP, 1, @lRussian, @MestLgot, @MestKontrakt)
set @nnrecord = @@Identity
  commit;
end;
GO

ALTER procedure [dbo].[ABIT_Edit_Diapazon]
@ik_spec_fac int,		
@NNYear int,			--код года поступления
@MestBudjet int,		--кол-во мест бюджет
@MestCKP int,			--кол-во мест ЦКП
@MestLgot int,			--кол-во мест льготников
@MestKontrakt int,		--количество мест контрактников
@NNrecord int,			--код набора
@lRussian bit			--учитывать экзамен по русскому языку
as
update ABIT_Diapazon_spec_fac
set
ik_spec_fac=@ik_spec_fac,
NNYear=@NNYear,
MestCKP=@MestCKP,
MestBudjet=@MestBudjet,
MestLgot=@MestLgot,
MestKontrakt = @MestKontrakt,
lRussian=@lRussian
where NNrecord=@NNrecord
GO
-------------------------------------------------------------------------------------------------------------------------
ALTER FUNCTION [dbo].[Abit_StatisticUniqFact] 
(@nnyear int,
@idreport int,
@day_beg datetime,
@kol int,
@isreal int)
RETURNS @Result TABLE
   (nnrecord        int             NULL,
    date            datetime        NULL,
    cShort_spec		varchar(100)	NULL,
	CShort_name_fac varchar(100)	NULL,
	[1]      		INT				NULL,	--общий конкурс
	[2]     		INT				NULL,	--ЦКП
	[3]     		INT				NULL,	--особое право
	[4]     		INT				NULL	--контракт
   ) 
AS
BEGIN
declare @i int
declare @day datetime
set @i=1
set @day=@day_beg

while @i<=@kol
begin

	INSERT INTO @Result(nnrecord,date,cShort_spec,CShort_name_fac,[1],[2],[3],[4])
	select distinct ADSF1.nnrecord,@day date,
       rtrim(cShort_spec) as cShort_spec,
       rtrim(CShort_name_fac) as CShort_name_fac,
--общий конкурс
(select count(NN_abit)
	 from 
		(SELECT NN_abit,isMain,nCode, dd_pod_zayav,dd_vozvr_zayav, nnrecord FROM ABIT_postup WHERE ik_zach not IN (9)
             AND ik_kat_zach IN
			(SELECT ik_kat_zach FROM kat_zach WHERE ik_type_kat=1) 
			AND ((@isreal=2)or((Realy_postup=@isreal)and(ik_kat_zach not in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))or
			((Realy_postup!=@isreal)and(ik_kat_zach in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))) 
			AND nnrecord IN(SELECT nnrecord FROM ABIT_Diapazon_spec_fac WHERE NNyear=@NNyear))ABIT_postup
  where (ABIT_postup.dd_pod_zayav<=@day)
   and ((ABIT_postup.dd_vozvr_zayav>@day)or(ABIT_postup.dd_vozvr_zayav is NULL))
   and (ABIT_postup.nnrecord=ADSF1.nnrecord)
   and isMain = 1
) as [1],
--ЦКП
(
	select count(NN_abit)
	 from 
		(SELECT NN_abit,isMain,nCode, dd_pod_zayav,dd_vozvr_zayav, nnrecord FROM ABIT_postup WHERE ik_zach not IN (9)
             AND ik_kat_zach IN
			(SELECT ik_kat_zach FROM kat_zach WHERE ik_type_kat=2) 
			AND ((@isreal=2)or((Realy_postup=@isreal)and(ik_kat_zach not in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))or
			((Realy_postup!=@isreal)and(ik_kat_zach in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))) 
			AND nnrecord IN (SELECT nnrecord FROM ABIT_Diapazon_spec_fac WHERE NNyear=@NNyear))ABIT_postup
  where ABIT_postup.dd_pod_zayav<=@day
   and ((ABIT_postup.dd_vozvr_zayav>@day)or(ABIT_postup.dd_vozvr_zayav is NULL))
   and ABIT_postup.nnrecord=ADSF1.nnrecord
   and isMain = 1
) as [2],
--Особое право
(
	select count(NN_abit)
	 from 
		(SELECT NN_abit,isMain,nCode, dd_pod_zayav,dd_vozvr_zayav, nnrecord FROM ABIT_postup WHERE ik_zach not IN (9)
             AND ik_kat_zach IN
			(32) 
			AND ((@isreal=2)or((Realy_postup=@isreal)and(ik_kat_zach not in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))or
			((Realy_postup!=@isreal)and(ik_kat_zach in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))) 
			AND nnrecord IN (SELECT nnrecord FROM ABIT_Diapazon_spec_fac WHERE NNyear=@NNyear))ABIT_postup
  where ABIT_postup.dd_pod_zayav<=@day
   and ((ABIT_postup.dd_vozvr_zayav>@day)or(ABIT_postup.dd_vozvr_zayav is NULL))
   and ABIT_postup.nnrecord=ADSF1.nnrecord
   and isMain = 1
) as [3],
--Контракт
(
	select count(NN_abit)
	 from 
		(SELECT NN_abit,isMain,nCode, dd_pod_zayav,dd_vozvr_zayav, nnrecord FROM ABIT_postup WHERE ik_zach not IN (9)
             AND ik_kat_zach IN
			(SELECT ik_kat_zach FROM kat_zach WHERE ik_type_kat=3) and @isreal!=0 AND nnrecord IN
			(SELECT nnrecord FROM ABIT_Diapazon_spec_fac WHERE NNyear=@NNyear))ABIT_postup
  where ABIT_postup.dd_pod_zayav<=@day
   and ((ABIT_postup.dd_vozvr_zayav>@day)or(ABIT_postup.dd_vozvr_zayav is NULL))
   and ABIT_postup.nnrecord=ADSF1.nnrecord
     and isMain = 1
) as [4]

from ABIT_Diapazon_spec_fac ADSF1 
  Left join 
	(SELECT ik_spec_fac,cShort_spec,CShort_name_fac
	 FROM
		Relation_spec_fac RSF1
		INNER JOIN
		 Spec_stud SS1 on SS1.ik_spec=RSF1.ik_spec
		INNER JOIN fac F1 on F1.ik_fac=RSF1.ik_fac)RSF1
   on RSF1.ik_spec_fac=ADSF1.ik_spec_fac
  
where (ADSF1.nnyear=@nnyear) and 
ADSF1.ik_spec_fac in (select ik_spec_fac
                     from dbo.ABIT_Report_spec
                     where IDReport=@idreport)
group by ADSF1.nnrecord,cShort_spec,CShort_name_fac
order by cShort_spec,date
set @day=DATEADD(day, 1, @day)
set @i=@i+1
end

RETURN
END
GO


ALTER FUNCTION [dbo].[Abit_StatisticFact] 
(@nnyear int,
@idreport int,
@day_beg datetime,
@kol int,
@isreal int)
RETURNS @Result TABLE
   (nnrecord        int             NULL,
    date            datetime        NULL,
    cShort_spec		varchar(100)	NULL,
	CShort_name_fac varchar(100)	NULL,
	[1]      		INT				NULL,	--общий конкурс
	[2]     		INT				NULL,	--ЦКП
	[3]     		INT				NULL,	--Особое право
	[4]     		INT				NULL	--Контракт
   ) 
AS
BEGIN
declare @i int
declare @day datetime
set @i=1
set @day=@day_beg

while @i<=@kol
begin

	INSERT INTO @Result(nnrecord,date,cShort_spec,CShort_name_fac,[1],[2],[3],[4])
	select distinct ADSF1.nnrecord,@day date,
       rtrim(cShort_spec) as cShort_spec,
       rtrim(CShort_name_fac) as CShort_name_fac,
--общий конкурс
(select count(NN_abit)
	 from 
		(SELECT NN_abit, dd_pod_zayav,dd_vozvr_zayav, nnrecord FROM ABIT_postup WHERE ik_zach not IN (9)
             AND ik_kat_zach IN
			(SELECT ik_kat_zach FROM kat_zach WHERE ik_type_kat=1) 
			AND ((@isreal=2)or((Realy_postup=@isreal)and(ik_kat_zach not in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))or
			((Realy_postup!=@isreal)and(ik_kat_zach in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))) 
			AND nnrecord IN(SELECT nnrecord FROM ABIT_Diapazon_spec_fac WHERE NNyear=@NNyear))ABIT_postup
  where (ABIT_postup.dd_pod_zayav<=@day)
   and ((ABIT_postup.dd_vozvr_zayav>@day)or(ABIT_postup.dd_vozvr_zayav is NULL))
   and (ABIT_postup.nnrecord=ADSF1.nnrecord)
) as [1],
--ЦКП
(
	select count(NN_abit)
	 from 
		(SELECT NN_abit, dd_pod_zayav,dd_vozvr_zayav, nnrecord FROM ABIT_postup WHERE ik_zach not IN (9)
             AND ik_kat_zach IN
			(SELECT ik_kat_zach FROM kat_zach WHERE ik_type_kat=2) 
			AND ((@isreal=2)or((Realy_postup=@isreal)and(ik_kat_zach not in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))or
			((Realy_postup!=@isreal)and(ik_kat_zach in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))) 
			AND nnrecord IN (SELECT nnrecord FROM ABIT_Diapazon_spec_fac WHERE NNyear=@NNyear))ABIT_postup
  where ABIT_postup.dd_pod_zayav<=@day
   and ((ABIT_postup.dd_vozvr_zayav>@day)or(ABIT_postup.dd_vozvr_zayav is NULL))
   and ABIT_postup.nnrecord=ADSF1.nnrecord
) as [2],
--Особое право
(
	select count(NN_abit)
	 from 
		(SELECT NN_abit, dd_pod_zayav,dd_vozvr_zayav, nnrecord FROM ABIT_postup WHERE ik_zach not IN (9)
             AND ik_kat_zach IN
			(32) 
			AND ((@isreal=2)or((Realy_postup=@isreal)and(ik_kat_zach not in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))or
			((Realy_postup!=@isreal)and(ik_kat_zach in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))) 
			AND nnrecord IN (SELECT nnrecord FROM ABIT_Diapazon_spec_fac WHERE NNyear=@NNyear))ABIT_postup
  where ABIT_postup.dd_pod_zayav<=@day
   and ((ABIT_postup.dd_vozvr_zayav>@day)or(ABIT_postup.dd_vozvr_zayav is NULL))
   and ABIT_postup.nnrecord=ADSF1.nnrecord
) as [3],
--Контракт
(
	select count(NN_abit)
	 from 
		(SELECT NN_abit, dd_pod_zayav,dd_vozvr_zayav, nnrecord FROM ABIT_postup WHERE ik_zach not IN (9)
             AND ik_kat_zach IN
			(SELECT ik_kat_zach FROM kat_zach WHERE ik_type_kat=3) and @isreal!=0 AND nnrecord IN
			(SELECT nnrecord FROM ABIT_Diapazon_spec_fac WHERE NNyear=@NNyear))ABIT_postup
  where ABIT_postup.dd_pod_zayav<=@day
   and ((ABIT_postup.dd_vozvr_zayav>@day)or(ABIT_postup.dd_vozvr_zayav is NULL))
   and ABIT_postup.nnrecord=ADSF1.nnrecord
) as [4]

from ABIT_Diapazon_spec_fac ADSF1 
  Left join 
	(SELECT ik_spec_fac,cShort_spec,CShort_name_fac
	 FROM
		Relation_spec_fac RSF1
		INNER JOIN
		 Spec_stud SS1 on SS1.ik_spec=RSF1.ik_spec
		INNER JOIN fac F1 on F1.ik_fac=RSF1.ik_fac)RSF1
   on RSF1.ik_spec_fac=ADSF1.ik_spec_fac
  
where (ADSF1.nnyear=@nnyear) and 
ADSF1.ik_spec_fac in (select ik_spec_fac
                     from dbo.ABIT_Report_spec
                     where IDReport=@idreport)
group by ADSF1.nnrecord,cShort_spec,CShort_name_fac
order by cShort_spec,date
set @day=DATEADD(day, 1, @day)
set @i=@i+1
end

RETURN
END
GO


ALTER    FUNCTION [dbo].[ABIT_GetNaborList](@nnyear int)
RETURNS @Result TABLE
   (
	NNrecord		INT,
	ik_spec_fac		INT,
	ik_fac			INT,
	fac				VARCHAR(150), 
	SF				VARCHAR(150),
	[budj]			VARCHAR(100),
	[ckp]			VARCHAR(100),
	[lgot]			VARCHAR(100),
	[kont]			VARCHAR(100),
	MestBudjet		INT,
	MestCKP			INT,
	MestLgot		INT, 
	MestKontrakt	INT,
	nnyear			INT,
	lRussian		BIT,	
	factBudjet		INT,
	factCKP			INT,
	factLgot		INT,
	factKontrakt	INT
) 

AS

BEGIN
DECLARE @idreport int
SET @idreport=7

DECLARE @day datetime
SET @day=GETDATE()

declare @daysCount int
set @daysCount=1

declare @isreal int
set @isreal=2

	INSERT INTO @Result
	select 
	ABIT_Diapazon_spec_fac.NNrecord,
	ABIT_Diapazon_spec_fac.ik_spec_fac,
	Relation_spec_fac.ik_fac,
	PostupCount.CShort_name_fac, 
	ShortNameFormEduc+Cname_spec,
	LTRIM(STR(ABIT_Diapazon_spec_fac.MestBudjet))+' / '+LTRIM(STR(PostupCount.[1])) +' / '+LTRIM(STR(UnicPostupCount.[1])),
	LTRIM(STR(ABIT_Diapazon_spec_fac.MestCKP))+' / '+LTRIM(STR(PostupCount.[2])) +' / '+LTRIM(STR(UnicPostupCount.[2])),
	LTRIM(STR(ABIT_Diapazon_spec_fac.MestLgot))+' / '+LTRIM(STR(PostupCount.[3])) +' / '+LTRIM(STR(UnicPostupCount.[3])),
	LTRIM(STR(ABIT_Diapazon_spec_fac.MestKontrakt))+' / '+LTRIM(STR(PostupCount.[4])) +' / '+LTRIM(STR(UnicPostupCount.[4])),
	ABIT_Diapazon_spec_fac.MestBudjet,
	ABIT_Diapazon_spec_fac.MestCKP,
	ABIT_Diapazon_spec_fac.MestLgot,
	ABIT_Diapazon_spec_fac.MestKontrakt, 
	@nnyear,
	lRussian,
	PostupCount.[1],
	PostupCount.[2],
	PostupCount.[3],
	PostupCount.[4]
	from 
		 ABIT_Diapazon_spec_fac,
		dbo.GetSpecAbitPermissionsFromRelTable() PermissionSpecList,
		[dbo].[Abit_StatisticFact](@nnyear,@idreport,@day,@daysCount,@isreal) AS PostupCount,
		[dbo].[Abit_StatisticUniqFact](@nnyear,@idreport,@day,@daysCount,@isreal) AS UnicPostupCount,
		dbo.Relation_spec_fac,
		dbo.Spec_stud,
		[dbo].[ABIT_GetFormEducInfo]() as FormEduc
WHERE ABIT_Diapazon_spec_fac.NNyear=@nnyear
	AND ABIT_Diapazon_spec_fac.ik_spec_fac=PermissionSpecList.ik_spec_fac
	AND ABIT_Diapazon_spec_fac.NNrecord=PostupCount.NNrecord
	AND ABIT_Diapazon_spec_fac.NNrecord=UnicPostupCount.NNrecord
	AND ABIT_Diapazon_spec_fac.ik_spec_fac=Relation_spec_fac.ik_spec_fac
	AND Relation_spec_fac.ik_spec=Spec_stud.ik_spec
	AND Relation_spec_fac.Ik_form_ed=FormEduc.Ik_form_ed
	
order by 	PostupCount.CShort_name_fac, PostupCount.cShort_spec
RETURN 
END
GO

ALTER    PROCEDURE [dbo].[AppendDoc]
@ncode			INT,
@ik_vid_doc		int,
@sd_seria		varchar(10),
@np_number		varchar(15),
@dd_vidan		datetime,
@cd_kem_vidan	varchar(500),
@isreal			bit,
@addinfo		varchar(max),
@balls			int = null,
@ikDisc			int = null
AS
BEGIN
  declare @ik_doc int

  if @ikDisc = -1 set @ikDisc = null

 INSERT INTO Doc_stud(Dd_vidan,Cd_kem_vidan,Ik_vid_doc,Np_number,Cd_seria,nCode, isreal, AdditionalInfo)
 VALUES(@dd_vidan, @cd_kem_vidan,@ik_vid_doc,@np_number,@sd_seria,@ncode, @isreal, @addinfo)
   select @ik_doc = @@IDENTITY
 
 if @balls <> 0
   insert into Abit_Bonuses(balls,ik_disc,ik_doc)
   values(@balls, @ikDisc, @ik_doc)
END
GO

--drop PROCEDURE [dbo].[SelDocuments]

alter function [dbo].[SelStudDocuments]
(@code numeric)
RETURNS @Result TABLE
  (
    IK_doc			int,
	cvid_doc		varchar(500),
	ik_vid_doc		int,
	cd_seria		varchar(10),
	np_number		varchar(15),
	dd_vidan		datetime,
	cd_kem_vidan	varchar(500),
	isreal			bit,
	addinfo			varchar(500),
	balls			int,
	ik_disc			int,
	сname_disc		varchar(50)
 )
AS
Begin 
  insert into @Result
  SELECT 
	Doc_stud.IK_doc,
	documents.cvid_doc,	
	Doc_stud.Ik_vid_doc,                        --код вида документа
	Doc_stud.Cd_seria,
	Doc_stud.Np_number,  
	Doc_stud.Dd_vidan, 
	Doc_stud.Cd_kem_vidan,
	Doc_stud.isreal,
	Doc_stud.AdditionalInfo,
	Abit_Bonuses.balls,
	ABIT_Disc.ik_disc,
	ABIT_Disc.сname_disc
FROM Doc_stud inner join documents on Doc_stud.Ik_vid_doc = documents.ik_vid_doc
  left join Abit_Bonuses on Abit_Bonuses.ik_doc = Doc_stud.Ik_doc
  left join ABIT_Disc on ABIT_Disc.ik_disc = Abit_Bonuses.ik_disc
WHERE Doc_stud.nCode=@code

RETURN
END
GO

update Doc_stud set isreal = 0

ALTER    PROCEDURE [dbo].[EditDoc]
@ik_doc INT, 
@vid INT, 
@datevidan DATETIME, 
@kemvidan VARCHAR(500), 
@number VARCHAR(15), 
@seria VARCHAR(10),
@isreal			bit,
@addinfo		varchar(max),
@balls			int = null,
@ikDisc			int = null
AS
 declare @ik_ball_doc int 

 UPDATE Doc_stud
 SET dd_vidan=@datevidan, cd_kem_vidan=@kemvidan, ik_vid_doc=@vid, np_number=@number, cd_seria=@seria,
	 isreal = @isreal, AdditionalInfo = @addinfo
 WHERE Ik_doc = @ik_doc 

 if (select count(ik_doc) from Abit_Bonuses where Ik_doc = @ik_doc)>0
 begin
   if @balls = 0 delete from Abit_Bonuses where Ik_doc = @ik_doc
   else update Abit_Bonuses set balls = @balls, ik_disc = @ikDisc where Ik_doc = @ik_doc 
 end
 else
   if  @balls > 0 insert into Abit_Bonuses(balls,ik_disc,ik_doc) values(@balls,@ikDisc,@ik_doc)
--exec AppendDocs 1,
GO

alter FUNCTION [dbo].[Stud_Document] 
(@ik_doc int)
RETURNS @Result TABLE
  (
	ik_vid_doc		int,
	cd_seria		varchar(10),
	np_number		varchar(15),
	dd_vidan		datetime,
	cd_kem_vidan	varchar(500),
	isreal			bit,
	addinfo			varchar(max),
	balls			int,
	ikDisc			int
 )
AS
BEGIN
  INSERT INTO @Result(ik_vid_doc,cd_seria,np_number,dd_vidan,cd_kem_vidan,isreal,addinfo,balls,ikDisc)
    select ik_vid_doc,cd_seria,np_number,dd_vidan,cd_kem_vidan,isreal,AdditionalInfo,balls,ik_disc
	from Doc_stud left join Abit_Bonuses on Doc_stud.Ik_doc = Abit_Bonuses.ik_doc
	where Doc_stud.Ik_doc = @ik_doc
RETURN
END
GO

--Выдать права на функцию 

ALTER    FUNCTION [dbo].[ABIT_GetAbitPostupList](@nnyear int)
RETURNS @Result TABLE
   (
	RegNomer							INT,
	fio									VARCHAR(150),
	nn_abit								INT,
	cname_spec							VARCHAR(150),
	Cshort_name_fac						VARCHAR(100),
	zach								VARCHAR(100),
	post								VARCHAR(100),
	dd_pod_zayav						DATETIME,
	ik_spec								INT,
	ik_fac								INT,
	nnrecord							INT,
	ik_spec_fac							INT,
	sum_ball							INT,
	sredBall							decimal(5,2),
	nnyear								INT,
	Realy_postup						BIT,
	cmedal								VARCHAR(100),
	ik_type_zach						INT,
	IsMain								BIT,
	Ik_form_ed							INT,
	ik_type_kat							INT
) 

AS
BEGIN

INSERT INTO @Result
select 
RegNomer,
fio,
ABIT_postup.nn_abit,
Cshort_spec,
Cshort_name_fac,
rtrim(Cname_kat_zach) as zach,
rtrim(cname_zach) as post,
dd_pod_zayav,
Relation_spec_fac.ik_spec,
fac.ik_fac,
ABIT_postup.nnrecord as nnrecord,
Relation_spec_fac.ik_spec_fac,
sum_ball,
ISNULL(sredBall, ABIT_postup.SchoolAverMark) sredBall,
@nnyear as nnyear,
Realy_postup,
cmedal,
ik_type_zach,
IsMain,
Ik_form_ed,
ik_type_kat
from
	(SELECT * FROM ABIT_postup )ABIT_postup
	 INNER JOIN 
	(SELECT NNrecord, ik_spec_fac FROM ABIT_Diapazon_spec_fac WHERE nnyear=@nnyear
		and ik_spec_fac IN (select ik_spec_fac from dbo.GetSpecAbitPermissionsFromRelTable() ))ABIT_Diapazon_spec_fac
	  on ABIT_Diapazon_spec_fac.NNrecord= ABIT_postup.NNrecord
	INNER JOIN Relation_spec_fac
	  on ABIT_Diapazon_spec_fac.ik_spec_fac=Relation_spec_fac.ik_spec_fac
	INNER JOIN  spec_stud 
	  on spec_stud.ik_spec=Relation_spec_fac.ik_spec
	INNER JOIN fac 
	  on fac.ik_fac=Relation_spec_fac.ik_fac
	INNER JOIN  
	(SELECT rtrim(clastname) + ' ' + rtrim(cfirstname) + ' ' + rtrim(isnull(cotch,'')) AS fio, nCode, ik_medal
	  FROM stud WHERE nCode IN 
		(SELECT nCode FROM ABIT_postup ))stud 
	  on stud.ncode= ABIT_postup.ncode
	INNER JOIN  dbo.medal_abit
	  on stud.ik_medal=medal_abit.ik_medal
	INNER JOIN  ABIT_sost_zach
	  on ABIT_postup.ik_zach=ABIT_sost_zach.ik_zach
	INNER JOIN  Kat_zach
	  on Kat_zach.ik_kat_zach= ABIT_postup.ik_kat_zach
	LEFT JOIN
		(select ABIT_postup.nn_abit,  isnull(sum_ball,0) + isnull(bonus_ball.balls,0) as sum_ball, isnull(cast(sredBall as numeric(8,1)),0) as sredBall
		 from ABIT_postup 
		 inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
		 inner join dbo.ABIT_sost_zach on ABIT_sost_zach.ik_zach = ABIT_postup.ik_zach
		 left join
			(select ABIT_postup.nCode, ABIT_postup.nn_abit, sum(cosenka) as sum_ball, avg(CONVERT(decimal(5,2),cosenka)) as sredBall 
			 from dbo.ABIT_Vstup_exam 
			 inner join ABIT_postup on ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
			 GROUP BY ABIT_postup.nCode, ABIT_postup.nn_abit) sum_ball on (sum_ball.NN_abit = ABIT_postup.nn_abit)   
		 left join 
			(select Doc_stud.nCode, Abit_Bonuses.balls, Abit_Bonuses.ik_disc
		     from Doc_stud inner join Abit_Bonuses on Abit_Bonuses.ik_doc = Doc_stud.Ik_doc) bonus_ball
		     on bonus_ball.nCode = ABIT_postup.nCode
			 and ((bonus_ball.ik_disc is null)or(bonus_ball.ik_disc in (select ik_disc from ABIT_Vstup_exam where NN_abit = ABIT_postup.NN_abit)))
		 where nnyear=@nnyear
			and ik_type_zach<>3) as SummBall
	ON SummBall.nn_abit=ABIT_postup.nn_abit
	order by dd_pod_zayav desc, cname_spec, RegNomer desc, fio
RETURN 
END

ALTER PROCEDURE [dbo].[ABIT_Get_sdacha_abit] 
@NNyear INT,								--год набора
@Ik_kat_zach int = null
AS
Select 
*
from dbo.ABIT_VidSdachi
--фильтруем, чтобы не отображать устаревшие данные
where ((Year(OutDate)>@NNyear) or (OutDate IS NULL))
and((ABIT_VidSdachi.ik_type_kat = (select ik_type_kat from Kat_zach where Ik_kat_zach = @Ik_kat_zach))or(ABIT_VidSdachi.ik_type_kat is null)or(@Ik_kat_zach is null))
order by cname_sdach
GO


  update [UGTU_ACTTEST].dbo.Strana set [UGTU_ACTTEST].dbo.Strana.[c_grazd] = (select st.c_grazd 
												 from [UGTU].dbo.Strana st 
												 where st.Ik_strana = [UGTU_ACTTEST].dbo.Strana.Ik_strana)

  update [UGTU_TEST].dbo.Strana set [UGTU_TEST].dbo.Strana.ik_FB = (select st.ik_FB 
												 from [UGTU].dbo.Strana st 
												 where st.Ik_strana = [UGTU_TEST].dbo.Strana.Ik_strana)
  
*/

/*SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type_grazd](
	[ik_type_grazd] [int] IDENTITY(1,1) NOT NULL,
	[CTypeGrazd] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Type_grazd] PRIMARY KEY CLUSTERED 
(
	[ik_type_grazd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Type_grazd] ON 

GO
INSERT [dbo].[Type_grazd] ([ik_type_grazd], [CTypeGrazd]) VALUES (2, N'иностранное')
GO
INSERT [dbo].[Type_grazd] ([ik_type_grazd], [CTypeGrazd]) VALUES (1, N'российское')
GO
SET IDENTITY_INSERT [dbo].[Type_grazd] OFF
GO*/

---------------------------------------------------------------------------------------------------------------------------------------------
/*alter table Person drop FK_Person_grazd;

select ik_strana from Strana, Person,  grazd
where Person.Ik_grazd = grazd.ik_grazd 
  and Strana.c_grazd = grazd.c_grazd 

  select * from Person, grazd where Person.Ik_grazd = grazd.ik_grazd  and c_grazd not in (select c_grazd from Strana)

update Person set Ik_grazd = (select ik_strana from Strana, grazd where 
							  Strana.c_grazd = grazd.c_grazd 
							   and Person.Ik_grazd = grazd.ik_grazd)

update Person set Ik_grazd = -1 where Ik_grazd is null

ALTER TABLE Person
ADD CONSTRAINT fk_Person_Strana
FOREIGN KEY (Ik_grazd)
REFERENCES Strana(ik_strana)

drop table grazd

create VIEW [dbo].[grazd]
AS
  SELECT Ik_strana as ik_grazd, c_grazd, ik_FB, ik_type_grazd
  FROM Strana  
  Where c_grazd is not NULL
GO */

--select * from documents where (ik_type_grazd is null)or(ik_type_grazd=2)
--order by cvid_doc

---------------------------------------------------------------------------------------------------
/*alter table documents drop column IsOsoboePravo
alter table documents drop column IsPreimushestvo
alter table documents drop column IsWithoutExam

CREATE TABLE [dbo].[Doc_kat_zach](
	[ik_doc_kat] [int] IDENTITY(1,1) NOT NULL,
	[ik_vid_doc] [int] NOT NULL,
	[Ik_kat_zach] [int] NOT NULL,
	[NNyear] [int] NOT NULL,
 CONSTRAINT [PK_Doc_kat_zach] PRIMARY KEY CLUSTERED 
(
	[ik_doc_kat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[Doc_kat_zach] TO  SCHEMA OWNER 
GO
GRANT SELECT ON [dbo].[Doc_kat_zach] TO [UGTU\Ответственные секретари] AS [dbo]
GO
GRANT SELECT ON [dbo].[Doc_kat_zach] TO [UGTU\Учебный Отдел] AS [dbo]
GO
SET IDENTITY_INSERT [dbo].[Doc_kat_zach] ON 

GO
INSERT [dbo].[Doc_kat_zach] ([ik_doc_kat], [ik_vid_doc], [Ik_kat_zach], [NNyear]) VALUES (1, 40, 32, 2015)
GO
INSERT [dbo].[Doc_kat_zach] ([ik_doc_kat], [ik_vid_doc], [Ik_kat_zach], [NNyear]) VALUES (2, 41, 32, 2015)
GO
INSERT [dbo].[Doc_kat_zach] ([ik_doc_kat], [ik_vid_doc], [Ik_kat_zach], [NNyear]) VALUES (3, 31, 33, 2015)
GO
SET IDENTITY_INSERT [dbo].[Doc_kat_zach] OFF
GO
/****** Object:  Index [IX_Doc_kat_zach]    Script Date: 20.04.2015 9:04:51 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Doc_kat_zach] ON [dbo].[Doc_kat_zach]
(
	[Ik_kat_zach] ASC,
	[ik_vid_doc] ASC,
	[NNyear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doc_kat_zach]  WITH CHECK ADD  CONSTRAINT [FK_Doc_kat_zach_ABIT_Years] FOREIGN KEY([NNyear])
REFERENCES [dbo].[ABIT_Years] ([NNyear])
GO
ALTER TABLE [dbo].[Doc_kat_zach] CHECK CONSTRAINT [FK_Doc_kat_zach_ABIT_Years]
GO
ALTER TABLE [dbo].[Doc_kat_zach]  WITH CHECK ADD  CONSTRAINT [FK_Doc_kat_zach_documents] FOREIGN KEY([ik_vid_doc])
REFERENCES [dbo].[documents] ([ik_vid_doc])
GO
ALTER TABLE [dbo].[Doc_kat_zach] CHECK CONSTRAINT [FK_Doc_kat_zach_documents]
GO
ALTER TABLE [dbo].[Doc_kat_zach]  WITH CHECK ADD  CONSTRAINT [FK_Doc_kat_zach_Kat_zach] FOREIGN KEY([Ik_kat_zach])
REFERENCES [dbo].[Kat_zach] ([Ik_kat_zach])
GO
ALTER TABLE [dbo].[Doc_kat_zach] CHECK CONSTRAINT [FK_Doc_kat_zach_Kat_zach]
GO

--[ABIT_Get_Kat_zach] 2009
ALTER PROCEDURE [dbo].[ABIT_Get_Kat_zach] 
  @NNRecord INT			--год набора
AS
	declare @NNYear			int
	declare @MestBudjet		int
	declare @MestCKP		int
	declare @MestLgot		int

	declare @Result			table
	(
	  [Ik_kat_zach]			int,
	  [Cname_kat_zach]		varchar(50),
	  [ik_type_kat]			int
	)

	select @NNYear = NNyear, @MestBudjet = MestBudjet, @MestCKP = MestCKP, @MestLgot = MestLgot
	from ABIT_Diapazon_spec_fac where NNrecord = @NNRecord

	insert into @Result(Ik_kat_zach,Cname_kat_zach,ik_type_kat)
	Select Ik_kat_zach,Cname_kat_zach,ik_type_kat from Kat_zach
	--фильтруем, чтобы не отображать устаревшие данные
	where (Year(OutDate)>@NNyear) or (OutDate IS NULL)

	if @MestBudjet = 0 delete from @Result where ik_type_kat = 1
	if @MestCKP = 0 delete from @Result where Ik_kat_zach = 8		--целевой прием
	if @MestLgot = 0 delete from @Result where Ik_kat_zach = 32		--особое право

	select * from @Result
	order by Cname_kat_zach
GO*/

/*
alter function [dbo].[SelectIndBalls]
(@year int)
RETURNS @Result TABLE
  (
    fio				varchar(500),
	cvid_doc		varchar(500),
	ik_fac			int, 
	Cshort_name_fac	varchar(500),
	ik_spec_fac		int, 
	Cshort_spec		varchar(20),
	cd_seria		varchar(10),
	np_number		varchar(15),
	balls			int,
	сname_disc		varchar(50)
 )
AS
Begin 
  insert into @Result(ik_fac, Cshort_name_fac, ik_spec_fac, Cshort_spec, fio, cvid_doc, cd_seria, np_number, balls, сname_disc)
  SELECT 
	Fac.Ik_fac,
	Fac.Cshort_name_fac,
	Relation_spec_fac.ik_spec_fac,
	EducationBranch.Cshort_spec,
	[Clastname] + ' ' + [Cfirstname] + ' ' + ISNULL([Cotch],''),
	documents.cvid_doc, 
	Doc_stud.Cd_seria, 
	Doc_stud.Np_number,
	Abit_Bonuses.balls,
	ABIT_Disc.сname_disc

  FROM ABIT_Diapazon_spec_fac inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	inner join Fac on fac.Ik_fac = Relation_spec_fac.ik_fac
	inner join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
	inner join ABIT_postup on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	inner join Person on Person.nCode = ABIT_postup.nCode
	inner join Doc_stud on Doc_stud.nCode = ABIT_postup.nCode
	inner join documents on Doc_stud.Ik_vid_doc = documents.ik_vid_doc
    inner join Abit_Bonuses on Abit_Bonuses.ik_doc = Doc_stud.Ik_doc
  left join ABIT_Disc on ABIT_Disc.ik_disc = Abit_Bonuses.ik_disc
  WHERE ABIT_Diapazon_spec_fac.NNyear=@year
    and ((ABIT_Disc.ik_disc is null)or(ABIT_Disc.ik_disc in (select ik_disc from ABIT_Vstup_exam where NN_abit = ABIT_postup.NN_abit)))
  order by [Clastname] + ' ' + [Cfirstname] + ' ' + ISNULL([Cotch],'')
RETURN
END
GO*/


/*
ALTER procedure [dbo].[ABIT_GetAbitListForZachisl] 
@nnyear int
as
BEGIN
	select 
	abit_sp.nn_abit,
	ik_kat_zach,
	abit_sp.nCode,
	RegNomer,
	fio,
	cname_spec,
	Cshort_name_fac,
	Cname_fac,
	Cshort_spec,
	Cshort_spec AS Sh_spec,
	cname_kat_zach,
	cname_zach,
	nnrecord,
	NNyear,
	ik_spec,ik_fac,
	abit_sp.ik_spec_fac, --тут
	Nn_zach,
	Zach.Ik_zach as BookKey,                      
	StudGrup.Ik_grup,
	StudGrup.Ik_prikazzach,
	StudGrup.Ik_priczach,
	Zach.Ik_zach as Ik_zachStud,
	Cname_grup,
	Cname_lang,
    isnull(SummBall,0) + isnull(bonus_ball.balls,0) as SummBall, 
	convert(varchar(10),MinBall) as MinBall,
	ISNULL(convert(varchar(10),SredBall), convert(varchar(10),SchoolAverMark)) SredBall,
	ik_type_zach,
	ik_type_kat,
	bit_NotMinim,
	abit_sp.ik_zach, --тут
	cName_zaved,
	ik_direction,
	ik_doc_edu,
	ik_doc_ident,
	notExam

	from
	(select ABIT_postup.nn_abit, ABIT_postup.ik_kat_zach, ABIT_postup.nCode, ABIT_postup.RegNomer, rtrim(clastname)+' '+rtrim(cfirstname)+' '+rtrim(isnull(cotch,'')) as fio,
	 cname_spec, Cshort_name_fac, Cname_fac, Cshort_spec, Cshort_spec AS Sh_spec, cname_kat_zach, cname_zach, ABIT_Diapazon_spec_fac.nnrecord, @NNyear as NNyear, EducationBranch.ik_spec,Fac.ik_fac,
	relation_spec_fac.ik_spec_fac, ABIT_sost_zach.ik_type_zach, ik_type_kat, ABIT_postup.ik_zach, cName_zaved, ik_direction,SchoolAverMark 
	from GetSpecAbitPermissionsFromRelTable() as AbitPermissions, ABIT_Diapazon_spec_fac, relation_spec_fac, Fac, EducationBranch, ABIT_postup, ABIT_sost_zach, Kat_zach, Zaved_stud, Student,Person
	where AbitPermissions.ik_spec_fac = relation_spec_fac.ik_spec_fac and relation_spec_fac.ik_spec_fac = ABIT_Diapazon_spec_fac.ik_spec_fac
	and relation_spec_fac.ik_fac = Fac.Ik_fac and relation_spec_fac.ik_spec = EducationBranch.ik_spec
	and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord and ABIT_postup.ik_zach = ABIT_sost_zach.ik_zach and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	and Student.nCode = ABIT_postup.nCode and Student.Ik_zaved = Zaved_stud.ik_zaved and Student.nCode = Person.nCode
	and NNyear=@NNyear
	and Realy_postup=1  
	and ik_type_zach<>3) abit_sp
 
--ВЫБИРАЕМ СУММУ БАЛЛОВ
left JOIN
(SELECT SummBall, MinBall, SredBall, ABIT_Vstup_exam.NN_abit
	FROM 
	(select nn_abit, sum(cosenka) as SummBall, min(cosenka) as MinBall, AVG(cosenka) as SredBall 
	  from dbo.ABIT_Vstup_exam where ((ik_disc<>3) 
		AND nn_abit IN (SELECT nn_abit FROM ABIT_postup WHERE NNrecord IN
			(SELECT NNrecord FROM ABIT_Diapazon_spec_fac WHERE nnyear=@nnyear))
-- учитываем оценку по русскому языку для всех специальностей, у кот-х есть бит lrussian
			or (ik_disc=3 and nn_abit IN
		(SELECT nn_abit FROM ABIT_postup WHERE NNrecord IN
			(SELECT NNrecord FROM ABIT_Diapazon_spec_fac WHERE nnyear=@nnyear and lRussian=1))))
	  GROUP BY nn_abit)ABIT_Vstup_exam 
	)BallS
ON abit_sp.NN_abit=BallS.NN_abit
left join 
			(select Doc_stud.nCode, Abit_Bonuses.balls, Abit_Bonuses.ik_disc
		     from Doc_stud inner join Abit_Bonuses on Abit_Bonuses.ik_doc = Doc_stud.Ik_doc) bonus_ball
		     on bonus_ball.nCode = abit_sp.nCode
			 and ((bonus_ball.ik_disc is null)or(bonus_ball.ik_disc in (select ik_disc from ABIT_Vstup_exam where NN_abit = abit_sp.NN_abit)))
--ищем несданные экзамены 
left join
(
  select NN_abit, count(ik_disc) as notExam
  from ABIT_postup ap,ABIT_Diapazon_Disc,ABIT_Diapazon_spec_fac
  where ap.NNrecord = ABIT_Diapazon_Disc.NNrecord
  and ABIT_Diapazon_spec_fac.NNrecord = ap.NNrecord
  and NNyear = @nnyear and ik_disc not in (select ik_disc from ABIT_Vstup_exam
										where NN_abit = ap.NN_abit and cosenka > 0)
  group by NN_abit

) hasExam on abit_sp.NN_abit=hasExam.NN_abit

--ВЫБИРАЕМ НЕОБЯЗАТЕЛЬНЫЕ ДАННЫЕ
--ИН. ЯЗЫК
LEFT JOIN
(SELECT MAX(Ik_lang) Ik_lang, nCode 
	FROM Lang_stud
	GROUP BY nCode)Lang_stud
ON Lang_stud.nCode=abit_sp.nCode 
LEFT JOIN 
Lang ON Lang_stud.Ik_lang=Lang.Ik_lang 

--

--№ ЗАЧЕТКИ И ГРУППУ
LEFT JOIN Zach ON Zach.ncode=abit_sp.ncode
LEFT JOIN 
(SELECT StudGrup.Ik_grup, StudGrup.Ik_zach, Ik_prikazZach, ik_pricZach
	FROM dbo.StudGrup, dbo.Prikaz,
		(SELECT MIN(Dd_prikaz) as Dd_prikaz, Ik_grup, Ik_zach
		FROM StudGrup, dbo.Prikaz
		WHERE StudGrup.Ik_prikazZach=Prikaz.Ik_prikaz 
		GROUP BY Ik_grup, Ik_zach)FirstGroup

	WHERE StudGrup.Ik_prikazZach=Prikaz.Ik_prikaz
		AND StudGrup.Ik_grup=FirstGroup.Ik_grup 
		AND StudGrup.Ik_zach=FirstGroup.Ik_zach 
		AND Prikaz.Dd_prikaz=FirstGroup.Dd_prikaz
)StudGrup
 ON Zach.Ik_zach=StudGrup.Ik_zach
LEFT JOIN Grup ON Grup.Ik_grup=StudGrup.Ik_grup
LEFT JOIN (SELECT distinct NN_abit, 1 as bit_NotMinim FROM 
		   dbo.ABIT_postup 
		   WHERE NN_abit not in (select NN_abit from dbo.Abit_GetAbitListWithMinBall(@nnyear,0,0))) ABIT_Minimum
  on ABIT_Minimum.NN_abit=abit_sp.NN_abit

LEFT JOIN (select nCode,Doc_stud.Ik_doc ik_doc_edu from Doc_stud, documents 
		   where Doc_stud.Ik_vid_doc = documents.ik_vid_doc and IsEducational = 1) eduDuc on eduDuc.nCode = abit_sp.nCode

LEFT JOIN (select nCode,Doc_stud.Ik_doc ik_doc_ident from Doc_stud, documents 
		   where Doc_stud.Ik_vid_doc = documents.ik_vid_doc and IsIdentity = 1) identDuc on identDuc.nCode = abit_sp.nCode
		   
order by Cname_fac,cname_spec,fio
END
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
*/

/*
create function [dbo].[SelectNetworkAbit]
(@year int)
RETURNS @Result TABLE
  (
   
	ik_fac			int, 
	Cshort_name_fac	varchar(500),
	ik_spec_fac		int, 
	Cshort_spec		varchar(20),
	fio				varchar(500),
	Cname_kat_zach	varchar(50),
	cSotTel			varchar(500),
	ctelefon		varchar(20),
	balls			int
 )
AS
Begin 
  insert into @Result(ik_fac, Cshort_name_fac, ik_spec_fac, Cshort_spec, fio, Cname_kat_zach, cSotTel, ctelefon, balls)
  SELECT 
	Fac.Ik_fac,
	Fac.Cshort_name_fac,
	Relation_spec_fac.ik_spec_fac,
	EducationBranch.Cshort_spec,
	[Clastname] + ' ' + [Cfirstname] + ' ' + ISNULL([Cotch],''),
	Cname_kat_zach,
	cSotTel, 
	ctelefon,
	SummBall
  FROM ABIT_Diapazon_spec_fac inner join Relation_spec_fac on ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	inner join Fac on fac.Ik_fac = Relation_spec_fac.ik_fac
	inner join EducationBranch on Relation_spec_fac.ik_spec = EducationBranch.ik_spec
	inner join ABIT_postup on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	inner join Kat_zach on Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
	inner join Person on Person.nCode = ABIT_postup.nCode
	left JOIN
	(select nn_abit, sum(cosenka) as SummBall, min(cosenka) as MinBall, AVG(cosenka) as SredBall 
	  from dbo.ABIT_Vstup_exam where nn_abit IN (SELECT nn_abit FROM ABIT_postup WHERE NNrecord IN
			(SELECT NNrecord FROM ABIT_Diapazon_spec_fac WHERE nnyear=@year))
	  GROUP BY nn_abit
	) BallS on BallS.NN_abit = ABIT_postup.NN_abit
  WHERE ABIT_Diapazon_spec_fac.NNyear=@year
    and ABIT_postup.ik_zach = 9
  order by [Clastname] + ' ' + [Cfirstname] + ' ' + ISNULL([Cotch],'')
RETURN
END
GO

select * from SelectNetworkAbit(2015) */
