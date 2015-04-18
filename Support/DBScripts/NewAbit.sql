--�������� ���� � ��������� ���������
/*alter table documents alter column cvid_doc varchar(500) not null

insert into Kat_zach(bit_Lgota,Cname_kat_zach,ik_type_kat,IsRussOlimpWinner)
values(1, '������ �����', 1, 0)

update Kat_zach set [OutDate]=cast('01.01.2015' as datetime)
where Ik_kat_zach in (4,5,6,7,13,20,21,23,31)

ALTER procedure [dbo].[ABIT_Add_Diapazon]
@ik_spec_fac int,		
@NNYear int,			--��� ���� �����������
@MestBudjet int,		--���-�� ���� ������
@MestCKP int,			--���-�� ���� ���
@MestLgot int,			--���������� ���� ����������
@MestKontrakt int,		--���������� ���� �������������
@lRussian bit,			--����������� ������� �� �������� �����
@nnrecord int output	--��� ������ ������������ ������
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
@NNYear int,			--��� ���� �����������
@MestBudjet int,		--���-�� ���� ������
@MestCKP int,			--���-�� ���� ���
@MestLgot int,			--���-�� ���� ����������
@MestKontrakt int,		--���������� ���� �������������
@NNrecord int,			--��� ������
@lRussian bit			--��������� ������� �� �������� �����
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
	[1]      		INT				NULL,	--����� �������
	[2]     		INT				NULL,	--���
	[3]     		INT				NULL,	--������ �����
	[4]     		INT				NULL	--��������
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
--����� �������
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
--���
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
--������ �����
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
--��������
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
	[1]      		INT				NULL,	--����� �������
	[2]     		INT				NULL,	--���
	[3]     		INT				NULL,	--������ �����
	[4]     		INT				NULL	--��������
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
--����� �������
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
--���
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
--������ �����
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
--��������
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
	�name_disc		varchar(50)
 )
AS
Begin 
  insert into @Result
  SELECT 
	Doc_stud.IK_doc,
	documents.cvid_doc,	
	Doc_stud.Ik_vid_doc,                        --��� ���� ���������
	Doc_stud.Cd_seria,
	Doc_stud.Np_number,  
	Doc_stud.Dd_vidan, 
	Doc_stud.Cd_kem_vidan,
	Doc_stud.isreal,
	Doc_stud.AdditionalInfo,
	Abit_Bonuses.balls,
	ABIT_Disc.ik_disc,
	ABIT_Disc.�name_disc
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

--������ ����� �� ������� 

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
@NNyear INT,								--��� ������
@Ik_kat_zach int = null
AS
Select 
*
from dbo.ABIT_VidSdachi
--���������, ����� �� ���������� ���������� ������
where ((Year(OutDate)>@NNyear) or (OutDate IS NULL))
and((ABIT_VidSdachi.ik_type_kat = (select ik_type_kat from Kat_zach where Ik_kat_zach = @Ik_kat_zach))or(ABIT_VidSdachi.ik_type_kat is null)or(@Ik_kat_zach is null))
order by cname_sdach
GO


  update [UGTU_TEST].dbo.Strana set [UGTU_TEST].dbo.Strana.[c_grazd] = (select st.c_grazd 
												 from [UGTU].dbo.Strana st 
												 where st.Ik_strana = [UGTU_TEST].dbo.Strana.Ik_strana)

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
INSERT [dbo].[Type_grazd] ([ik_type_grazd], [CTypeGrazd]) VALUES (2, N'�����������')
GO
INSERT [dbo].[Type_grazd] ([ik_type_grazd], [CTypeGrazd]) VALUES (1, N'����������')
GO
SET IDENTITY_INSERT [dbo].[Type_grazd] OFF
GO*/

---------------------------------------------------------------------------------------------------------------------------------------------
alter table Person drop FK_Person_grazd;

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
  SELECT Ik_strana as ik_grazd, c_grazd, ik_FB
  FROM Strana  
  Where c_grazd is not NULL
GO

---------------------------------------------------------------------------------------------------