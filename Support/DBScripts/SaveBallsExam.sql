
--select * from GetSmallVedForGrup(3973)

--выбирает ведомость для экзаменов и зачетов для вывода на форму
ALTER     FUNCTION [dbo].[GetSmallVedForGrup](@ik_ved int)
RETURNS @Result TABLE
   (StudName        VARCHAR(60)   NOT NULL,
    Nn_zach 		varchar(6) NOT NULL,
    KatZach         VARCHAR(2) NOT NULL,
    ik_zach			INT NOT NULL,
    dopusc		 	BIT NULL,	
    Cosenca			INT NULL,
    cTema			VARCHAR(2000) NULL,
	IsPassed		BIT,
	i_balls			int null				
     ) 
AS
BEGIN

DECLARE @ik_grup INT
SELECT @ik_grup=(SELECT ik_grup FROM Vedomost WHERE ik_ved=@ik_ved)

 INSERT INTO @Result(StudName, Nn_zach, KatZach, ik_zach,dopusc,Cosenca, i_balls, cTema)
  SELECT 
	NULLIF(StudName,NULL) AS StudName,
	NULLIF(Nn_zach,NULL) AS Nn_zach,
	NULLIF(KatZach,NULL) AS KatZach,
	s.ik_zach,
	NULL as dopusc,
	u.Cosenca  Cosenca,
	u.i_balls i_balls,
	KPTheme AS cTema
  FROM
--выбираем успеваемость 
   (SELECT Cosenca, Ik_zach, ik_ved, i_balls  FROM Uspev u WHERE Ik_ved=@Ik_ved) u INNER JOIN
   dbo.Vedomost ON Vedomost.Ik_ved=@Ik_ved INNER JOIN
	dbo.GetGrupStud(@ik_grup) as s ON u.ik_zach=s.ik_zach 
	LEFT JOIN dbo.UspevDocument 
		ON UspevDocument.ik_upContent=Vedomost.ik_upContent 
			AND UspevDocument.ik_zach=s.ik_zach
	left join dbo.UspevKPTheme ON UspevDocument.idUspevDocs=UspevKPTheme.idUspevDocs 	
	--where 
    ORDER BY StudName



--допущенные
	UPDATE @Result
	SET dopusc=1
	WHERE Cosenca>-2

--недопущенные
	UPDATE @Result
	SET dopusc=0
	WHERE Cosenca<-1


--удаляем оценки <-1
	UPDATE @Result
	SET Cosenca=NULL
	WHERE Cosenca<=-1

--Сдавшие
	UPDATE @Result
	SET IsPassed=1
	WHERE ik_zach IN (SELECT ik_zach FROM dbo.GetPassedStudList(@ik_ved))


RETURN
END

--select * from GetSmallVedForGrup(11382)



GO

-----------------------------------------------------------------------------------------------
ALTER   PROCEDURE [dbo].[AppendUspev]
@flag INT,
@Ik_ved INT,
@Ik_zach INT,
@Cosenca INT,
@ctema varchar(2000),
@i_balls INT = NULL
AS
IF @flag=1
  BEGIN
	INSERT INTO Uspev(Ik_ved, Ik_zach, Cosenca, i_balls)
	VALUES (@Ik_ved, @Ik_zach, @Cosenca, @i_balls)

  END

--Можем изменить только оценку и тему
IF @flag=0
  BEGIN
	UPDATE Uspev
		SET Cosenca = @Cosenca, i_balls = @i_balls
		WHERE Ik_ved = @Ik_ved AND Ik_zach = @Ik_zach

  END

IF @flag=-1
  BEGIN
	DELETE FROM Uspev
	WHERE Ik_ved = @Ik_ved AND Ik_zach = @Ik_zach
  END

GO

update Uch_pl set IsBRSPlan=0 where IsBRSPlan is null