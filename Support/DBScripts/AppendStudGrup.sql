ALTER           PROCEDURE [dbo].[AppendStudGrup]
@flag INT,
@grup INT, 
@zach INT,
@KatZach INT,
@prikzach INT = NULL,
@priczach INT,
@prikOtch INT = NULL,
@pricOtch INT = NULL,
@cObosnZach VARCHAR(500) = NULL,
@cObosnOtch VARCHAR(500) = NULL,
@ik_stud_grup	int=null
AS
  --���������� �����������
  IF @flag=1 
  BEGIN
    --if @prikzach is null
      select @prikzach = ik_prikaz_zach from ABIT_postup where ncode = (select nCode from Zach where ik_zach = @zach)
	  and ik_prikaz_zach is not null
    
	INSERT INTO studgrup(Ik_grup, Ik_zach, ik_kat_zach, Ik_prikazZach, ik_pricZach, cObosnZach,
			Ik_prikazOtch, ik_pricOtch, cObosnOtch)
    VALUES( @grup, @zach, @KatZach, @prikzach, @priczach, @cObosnZach, @prikOtch, @pricOtch, @cObosnOtch)
  RETURN @@IDENTITY
  END

IF @flag=0 
BEGIN
  UPDATE studgrup
  SET ik_kat_zach=@KatZach, Ik_prikazZach=@prikzach, 
     ik_pricZach=@priczach, Ik_prikazOtch=@prikOtch, cObosnZach=@cObosnZach,
     ik_pricOtch=@pricOtch, cObosnOtch=@cObosnOtch 
  WHERE Ik_studGrup = @ik_stud_grup--Ik_grup=@grup and Ik_zach=@zach 
END


IF @flag=-1 
  BEGIN
	 DELETE FROM studgrup
	 WHERE Ik_grup=@grup and Ik_zach=@zach 
  END

--������� �������� � ������ ������
--� ���� ������ ������� ������ ������������ ��������, � �������� @grup- ��� ����� ������
--@prikOtch-������ �� ���������� �� ������ ������,
--@prikzach - ������ � ���������� � ����� ������
IF  @flag=2
BEGIN
--���� � ����� ������ ������� ��� ��� ��������, ����������
 IF EXISTS (SELECT 'TRUE' FROM 
			dbo.studGrup
			WHERE  Ik_zach=@zach  AND ik_grup=@grup and studGrup.Ik_prikazOtch is null)
 BEGIN
 	RAISERROR('������� � ��� ������ ��� ��������. �������� ��������.',16,1);
	END
 ELSE
 BEGIN
 BEGIN TRAN
--��������� �������� �� ������� ������
 	UPDATE studgrup
 	SET Ik_prikazOtch=@prikOtch, 
     	ik_pricOtch=@pricOtch, cObosnOtch=@cObosnOtch 
 	WHERE Ik_zach=@zach and ik_pricOtch is null and Ik_prikazOtch is null 

--��������� � ����� ������
 INSERT INTO studgrup(Ik_grup, Ik_zach, ik_kat_zach, Ik_prikazZach, ik_pricZach, cObosnZach)
 VALUES( @grup, @zach, @KatZach, @prikzach, @priczach, @cObosnZach)

 COMMIT TRAN
  RETURN @@IDENTITY
END
END

IF @flag=3 
  BEGIN
 UPDATE studgrup
 SET ik_kat_zach=@KatZach, Ik_prikazZach=@prikzach, 
     ik_pricZach=@priczach, Ik_prikazOtch=@prikOtch, cObosnZach=@cObosnZach,
     ik_pricOtch=@pricOtch, cObosnOtch=@cObosnOtch 
 WHERE Ik_studGrup=@ik_stud_grup 
  END






GO


