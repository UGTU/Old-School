UPDATE   ugtu.RUP.WorkingProgramm 
SET DisciplineName =  dekanatMMIS.dbo.Планы.Учебныйгод +' ' +  iif (dekanatMMIS.dbo.Планы.КодФормыОбучения=1, 'Очная форма.', iif (dekanatMMIS.dbo.Планы.КодФормыОбучения=2, 'Заочная форма.', 'Очно-заочная форма.')) +  ' ' +  cast (dekanatMMIS.dbo.планыСтроки.Дисциплина as varchar) +  '. '+ substring (dekanatMMIS.dbo.[Планы].[Титул], CHARINDEX (',', dekanatMMIS.dbo.[Планы].[Титул]), LEN(dekanatMMIS.dbo.[Планы].[Титул]))
from 
ugtu.RUP.WorkingProgramm  
inner join dekanatMMIS.dbo.планыСтроки
on ugtu.RUP.WorkingProgramm.idPlanStroka = dekanatMMIS.dbo.планыСтроки.Код
inner join dekanatMMIS.dbo.Планы
on dekanatMMIS.dbo.планыСтроки.КодПлана = dekanatMMIS.dbo.Планы.Код
where ugtu.RUP.WorkingProgramm.idPlanStroka=dekanatMMIS.dbo.планыСтроки.Код


--SELECT charINDEX(',', '55555555,yyyyyyyy')
--SELECT  substring ('Направление подготовки  09.03.01 Информатика и вычислительная техника, профиль подготовки "Автоматизированные системы обработки информации и управленияМатематические модели информац' ,CHARINDEX (',','Направление подготовки  09.03.01 Информатика и вычислительная техника профиль подготовки "Автоматизированные системы обработки информации и управленияМатематические модели информац'))

--SELECT  substring (dekanatMMIS.dbo.[Планы].[Титул], CHARINDEX (',', dekanatMMIS.dbo.[Планы].[Титул]), LEN(dekanatMMIS.dbo.[Планы].[Титул]))
--FROM dekanatMMIS.dbo.[Планы]