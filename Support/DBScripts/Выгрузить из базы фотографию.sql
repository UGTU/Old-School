	--select * from Person where Photo is not null

	--EXEC sp_configure 'show advanced options', 1;  
	--GO  
	--RECONFIGURE;  
	--GO
	--EXEC sp_configure 'Ole Automation Procedures', 1;
	--GO  
	--RECONFIGURE;  
	--GO

declare @nCode int
set @nCode = 67977  --то, что нужно менять

DECLARE @ImageData varbinary(max);
SELECT @ImageData = (SELECT convert(varbinary(max), [dbo].[ResizeImage](Photo, 292, 240, 320, 320) , 1) FROM Person WHERE nCode = @nCode);

DECLARE @Path nvarchar(1024);
SELECT @Path = 'E:\Photo';

DECLARE @Filename NVARCHAR(1024);
SELECT @Filename = (SELECT Clastname FROM Person WHERE nCode = @nCode);

DECLARE @FullPathToOutputFile NVARCHAR(2048);
SELECT @FullPathToOutputFile = @Path + '\' + @Filename + '.jpg';

DECLARE @ObjectToken INT
EXEC sp_OACreate 'ADODB.Stream', @ObjectToken OUTPUT;
EXEC sp_OASetProperty @ObjectToken, 'Type', 1;
EXEC sp_OAMethod @ObjectToken, 'Open';
EXEC sp_OAMethod @ObjectToken, 'Write', NULL, @ImageData;
EXEC sp_OAMethod @ObjectToken, 'SaveToFile', NULL, @FullPathToOutputFile, 2;
EXEC sp_OAMethod @ObjectToken, 'Close';
EXEC sp_OADestroy @ObjectToken;