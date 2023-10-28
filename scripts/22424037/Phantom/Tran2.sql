DECLARE @RT INT
EXEC @RT = sp_XemChuNha '1', 'Nguyễn'
IF @RT = 1
PRINT N'Thất bại'
ELSE
PRINT N'Thành công'