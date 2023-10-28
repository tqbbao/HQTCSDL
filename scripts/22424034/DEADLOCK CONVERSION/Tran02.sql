DECLARE @RT INT
EXEC @RT = sp_DangKyXemNha_2 '1', '1', '2023-07-14', '1'
IF @RT = 1
	PRINT N'Đăng ký thất bại'
ELSE
	PRINT N'Đăng ký thành công'