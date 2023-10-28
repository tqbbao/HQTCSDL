DECLARE @RT INT
EXEC @RT = sp_DangNhap 'admin', 'abc'
IF @RT = 1
	PRINT N'Đăng nhập thất bại'
ELSE
	PRINT N'Đăng nhập thành công'
