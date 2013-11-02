--select * from GetCountDepartSpisok(2007)
alter FUNCTION [dbo].[GetCountDepartSpisok]
(	
	@year_post	int
)
RETURNS @Result TABLE
(
	FIO		varchar(200),
	Spec	varchar(50),
	Bakal	varchar(50),
	Kategor varchar(50),
	Pasport	varchar(400),
	Addres  varchar(200)
)
AS
BEGIN
declare @FIO	 varchar(200)
declare @Spec	 varchar(50)
declare @Bakal	 varchar(50)
declare @Kategor varchar(50)
declare @Pasport varchar(400)
declare @Addres  varchar(200)
declare @street  int
declare @nCode	 numeric(18,0)

DECLARE Cursor1 CURSOR LOCAL FAST_FORWARD READ_ONLY FOR	
	Select distinct Clastname+' '+Cfirstname+' '+Cotch,Cshort_spec,
		cName_direction,CType_kat,
		Np_number+', '+Cd_seria+', '+Cd_kem_vidan+', '+CAST(Dd_vidan as varchar(11)),dbo.Stud.nCode,
		Ik_Street_prop
	From dbo.ABIT_postup,dbo.ABIT_Diapazon_spec_fac,dbo.Stud,dbo.Relation_spec_fac,dbo.Direction,
		dbo.Spec_stud,dbo.ABIT_sost_zach,dbo.TypeKatZach,dbo.Kat_zach,dbo.Doc_stud		
	Where dbo.ABIT_postup.NNrecord = dbo.ABIT_Diapazon_spec_fac.NNrecord
	and dbo.Stud.nCode = dbo.ABIT_postup.nCode
	and dbo.Spec_stud.ik_spec = dbo.Relation_spec_fac.ik_spec
	and dbo.Spec_stud.ik_direction = dbo.Direction.ik_direction
	and dbo.Relation_spec_fac.ik_spec_fac = dbo.ABIT_Diapazon_spec_fac.ik_spec_fac
	and dbo.ABIT_postup.ik_zach = dbo.ABIT_sost_zach.ik_zach
	and dbo.ABIT_postup.ik_kat_zach = dbo.Kat_zach.Ik_kat_zach
	and dbo.Kat_zach.ik_type_kat = dbo.TypeKatZach.ik_type_kat
	and dbo.Stud.nCode = dbo.Doc_stud.nCode
	and dbo.ABIT_Diapazon_spec_fac.NNyear = @year_post						--какого года
	and ik_type_zach = 2													--зачислен
	and Ik_vid_doc = 4														--паспорт
	OPEN Cursor1												
FETCH NEXT FROM Cursor1 INTO @FIO,@Spec,@Bakal,@Kategor,@Pasport,@nCode,@street
WHILE @@FETCH_STATUS = 0
 BEGIN 	

	if (@street is not null)
	begin
		select @Addres=Cstrana+', '+Cregion+', '+Craion+', '+Cgorod+', '+CStreet+', '+Build_prop+ISNULL(', '+Stroen_prop, '')+', '+Kvart_prop
		from dbo.Street,dbo.Strana,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Stud
		where dbo.Street.Ik_street = @street
		and dbo.Stud.nCode = @nCode
		and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		and dbo.Raion.Ik_region = dbo.Region.Ik_region
		and dbo.Region.Ik_strana = dbo.Strana.Ik_strana
	end
		else set @Addres='ќтсутствует в базе'
Insert into @Result values(@FIO,@Spec,@Bakal,@Kategor,@Pasport,@Addres)

FETCH NEXT FROM Cursor1 INTO @FIO,@Spec,@Bakal,@Kategor,@Pasport,@nCode,@street
END
CLOSE Cursor1
DEALLOCATE Cursor1

RETURN
END