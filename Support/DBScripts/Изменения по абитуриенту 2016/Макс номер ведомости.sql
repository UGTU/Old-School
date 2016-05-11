
--select SUBSTRING('M-2',CHARINDEX('-','M-2')+1,Len('M-2'))




--select * from [dbo].[ABIT_GetVedomNumber](715)
--функция возвращает макс номер ведомости для экзаменов по данной дисциплине
--в данном году поступления
alter FUNCTION [dbo].[ABIT_GetVedomNumber](@id_rasp int)
RETURNS  TABLE

AS

RETURN (
SELECT 
RTRIM(AllMaxNumber) as MaxNumber
FROM
	(SELECT [DiscVedomName], ISNULL(ISNULL(MaxNumber,
		[DiscVedomName]+'-'+RTRIM(CONVERT(VARCHAR(10),(CONVERT(INT,SUBSTRING(MaxAllExamNumber,CHARINDEX('-',MaxAllExamNumber)+1,Len(MaxAllExamNumber)))+1)))),'1') AllMaxNumber FROM
		(SELECT [ABIT_Disc].[DiscVedomName], MAX(allVusYearExams.nnvedom) MaxAllExamNumber FROM
		[dbo].[ABIT_Raspisanie]	thisRasp
		INNER JOIN 
		[dbo].[ABIT_Disc] ON thisRasp.[ik_disc]=[ABIT_Disc].ik_disc
		LEFT JOIN dbo.[ABIT_SpisokOfExam] allVusYearExams 
			ON thisRasp.[ik_disc]=allVusYearExams.ik_disc AND 
				YEAR(thisRasp.date_of)=allVusYearExams.NNyear
		WHERE thisRasp.[id_rasp]=@id_rasp
		GROUP BY [ABIT_Disc].[DiscVedomName]) AllExams

		CROSS JOIN
		(SELECT MAX([nnvedom]) MaxNumber
			FROM dbo.[ABIT_SpisokOfExam]
			WHERE [id_rasp]=@id_rasp)thisVedNumber)AllNumber)



