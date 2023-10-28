DECLARE @RT INT
EXEC @RT = sp_DoiMatKhau 'admin', 'xyz'
IF @RT = 1
	PRINT N'Đổi mật khẩu thất bại'
ELSE
	PRINT N'Đổi mật khẩu thành công'
