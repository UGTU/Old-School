UPDATE   ugtu.RUP.WorkingProgramm 
SET DisciplineName =  dekanatMMIS.dbo.�����.���������� +' ' +  iif (dekanatMMIS.dbo.�����.����������������=1, '����� �����.', iif (dekanatMMIS.dbo.�����.����������������=2, '������� �����.', '����-������� �����.')) +  ' ' +  cast (dekanatMMIS.dbo.�����������.���������� as varchar) +  '. '+ substring (dekanatMMIS.dbo.[�����].[�����], CHARINDEX (',', dekanatMMIS.dbo.[�����].[�����]), LEN(dekanatMMIS.dbo.[�����].[�����]))
from 
ugtu.RUP.WorkingProgramm  
inner join dekanatMMIS.dbo.�����������
on ugtu.RUP.WorkingProgramm.idPlanStroka = dekanatMMIS.dbo.�����������.���
inner join dekanatMMIS.dbo.�����
on dekanatMMIS.dbo.�����������.�������� = dekanatMMIS.dbo.�����.���
where ugtu.RUP.WorkingProgramm.idPlanStroka=dekanatMMIS.dbo.�����������.���


--SELECT charINDEX(',', '55555555,yyyyyyyy')
--SELECT  substring ('����������� ����������  09.03.01 ����������� � �������������� �������, ������� ���������� "������������������ ������� ��������� ���������� � ������������������������ ������ ��������' ,CHARINDEX (',','����������� ����������  09.03.01 ����������� � �������������� ������� ������� ���������� "������������������ ������� ��������� ���������� � ������������������������ ������ ��������'))

--SELECT  substring (dekanatMMIS.dbo.[�����].[�����], CHARINDEX (',', dekanatMMIS.dbo.[�����].[�����]), LEN(dekanatMMIS.dbo.[�����].[�����]))
--FROM dekanatMMIS.dbo.[�����]