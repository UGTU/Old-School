ALTER PROCEDURE [dbo].[SelAtt]
@n_sem INT,
@ik_upContent INT,
--@iK_disc INT,
--@ik_vid_zanyat INT,
@ik_grup INT,
@nom_att INT   --����� ���������� ��������� � ���� ik_vid_exam
AS

  SELECT DISTINCT
	ik_ved,				--��� ���������
	cNumber_ved,		--����� ���������
	itab_n,				--��� �������
	Dd_exam,			--���� ��������
 	lClose,				--������� ��������
--	lPriznak_napr,		--������� �����������
	Ik_vid_exam,		--��� �������� (���������, ���������..)
	bitExam,			--���������� ��������
	bitZach,			--��� ������
	lVnosn
  FROM 
    (SELECT ik_ved, cNumber_ved, itab_n, Dd_exam, lClose, Ik_vid_exam, lVnosn,bitExam, bitZach
	FROM Vedomost	
	inner join Content_UchPl on Content_UchPl.ik_upContent = Vedomost.ik_upContent
	inner join vid_zaniat on vid_zaniat.ik_vid_zanyat=Content_UchPl.ik_vid_zanyat
	INNER JOIN TypeZanyat on TypeZanyat.ikTypeZanyat=vid_zaniat.ikTypeZanyat	
   WHERE Vedomost.ik_upContent=@ik_upContent AND Ik_grup=@ik_grup AND lPriznak_napr=0
	 and Ik_vid_exam =@nom_att ) ved
  /* (SELECT ik_ved, cNumber_ved, itab_n, Dd_exam, lClose, Ik_vid_exam, lVnosn FROM Vedomost		
   WHERE ik_upContent=dbo.SelIkCont(@ik_vid_zanyat, @n_sem, @ik_grup, @ik_disc)AND Ik_grup=@ik_grup AND lPriznak_napr=0
   and Ik_vid_exam =@nom_att ) ved,
	(SELECT ikTypeZanyat FROM dbo.vid_zaniat vz WHERE ik_vid_zanyat=@ik_vid_zanyat)vz
	INNER JOIN
	dbo.TypeZanyat tz
	N vz.ikTypeZanyat=tz.ikTypeZanyat*/

GO

ALTER   PROCEDURE [dbo].[SelBRSAtt]
@n_sem INT,
@ik_upContent INT,
--@ik_vid_zanyat INT,
@ik_grup INT,
@n_module INT   --����� ������ 
AS

  SELECT DISTINCT
	ik_ved,				--��� ���������
	cNumber_ved,		--����� ���������
	itab_n,		        --��� �������
	Dd_exam,			--���� ��������
 	lClose,				--������� ��������
--	lPriznak_napr,		--������� �����������
	Ik_vid_exam,		--��� �������� (���������, ���������..)
	bitExam,			--���������� ��������
	bitZach,			--��� ������
	lVnosn
  FROM 
	(SELECT ik_ved, cNumber_ved, itab_n, Dd_exam, lClose, Ik_vid_exam, lVnosn, Vedomost.ik_upContent,bitExam, bitZach
	 FROM Vedomost	Inner join 	dbo.Content_UchPl on Vedomost.ik_upContent = dbo.Content_UchPl.ik_upContent 
	 inner join vid_zaniat on Content_UchPl.ik_vid_zanyat = vid_zaniat.iK_vid_zanyat
	 inner join dbo.TypeZanyat on TypeZanyat.ikTypeZanyat = vid_zaniat.ikTypeZanyat
     WHERE Vedomost.ik_upContent=@ik_upContent) vz
  
  /*dbo.SelIkContBRS(@ik_vid_zanyat, @n_sem, @ik_grup, @ik_disc, @n_module)AND Ik_grup=@ik_grup AND lPriznak_napr=0
   and n_module =@n_module*/-- ) ved,
  /*(SELECT ikTypeZanyat FROM dbo.vid_zaniat vz WHERE ik_vid_zanyat=@ik_vid_zanyat)vz
	INNER JOIN
	dbo.TypeZanyat tz
	ON vz.ikTypeZanyat=tz.ikTypeZanyat*/

GO


