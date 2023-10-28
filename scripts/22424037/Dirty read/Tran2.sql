DECLARE @RT INT
EXEC @RT = sp_XemDanhSachNha '1', 'Sach dep'
IF @RT = 1
PRINT N'Thất bại'
ELSE
PRINT N'Thành công'