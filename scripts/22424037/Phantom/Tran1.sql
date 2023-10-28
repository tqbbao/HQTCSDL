DECLARE @RT INT
EXEC @RT = sp_ThemChuNha 'Nguyễn Văn A', 'Sóc Trăng', '039001231'
IF @RT = 1
PRINT N'Thất bại'
ELSE
PRINT N'Thành công'