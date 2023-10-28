DECLARE @NOTI INT -- 0:thành công, 1:không thành công
EXEC @NOTI = USP_XEMNHA2 N'Quận 1', N'Tp HCM'
IF @NOTI = 1	PRINT N'THẤT BẠI'ELSE	PRINT N'THÀNH CÔNG'