CREATE TABLE [dbo].[SheduleBookmarks](
	[ik_bookmark]	int	PRIMARY KEY,
	[i_bookmark_type] tinyint NOT NULL,
	[ik_shedule] int NOT NULL,
	[ik_object] int NOT NULL
) ON [PRIMARY]
GO

CREATE PROCEDURE UpdateSheduleBookmarks
	@i_type	tinyint,
	@ik_bookmark	int,
	@i_bookmark_type	tinyint,
	@ik_shedule	int = NULL,
	@ik_object	int	= NULL
AS
	DECLARE @ik_inserted_bookmark	int

	IF (@i_type = 1)
	BEGIN
		INSERT INTO dbo.SheduleBookmarks(i_bookmark_type, ik_shedule, ik_object)
		VALUES (@i_bookmark_type, @ik_shedule, @ik_object)
		SELECT @ik_inserted_bookmark = IDENT_CURRENT('SheduleBookmarks') 
	END

	IF (@i_type = 2)
	BEGIN
		UPDATE dbo.SheduleBookmarks
		SET
			i_bookmark_type = @i_bookmark_type, 
			ik_shedule = @ik_shedule, 
			ik_object = @ik_object
		WHERE ik_bookmark = @ik_bookmark

		SELECT @ik_inserted_bookmark = @ik_bookmark
	END

	IF (@i_type = 3)
	BEGIN
		DELETE FROM dbo.SheduleBookmarks
		WHERE ik_bookmark = @ik_bookmark

		SELECT @ik_inserted_bookmark = -1
	END

	SELECT @ik_inserted_bookmark as ReturnValue
GO
