select count(OperationTypeID),UserName,tdate from
(Select OperationTypeID, UserName, cast(AuditDateTime as date) as tdate
from Audit_Event
where AuditDateTime>'2013-12-03') audit
group by UserName,tdate
order by UserName,tdate
