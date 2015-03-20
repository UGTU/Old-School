DECLARE @SPID VARCHAR(4), @cmdSQL VARCHAR(10)
DECLARE cCursor CURSOR
FOR SELECT session_id
FROM sys.dm_exec_sessions 
where login_name='ugtu\isandul'
OPEN cCursor

FETCH NEXT FROM cCursor INTO @SPID
-- For each user connected in the database
WHILE @@FETCH_STATUS = 0
BEGIN
 SET @cmdSQL = 'KILL ' + @SPID

 -- Kill the user
 EXEC (@cmdSQL)
 FETCH NEXT FROM cCursor INTO @SPID 
 END

CLOSE cCURSOR
DEALLOCATE cCURSOR