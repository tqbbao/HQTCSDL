DECLARE @NOTI INT -- 0:thành công, 1:không thành công
EXEC @NOTI = USP_XEMCHUNHA1 N'Phường'
IF @NOTI = 1	PRINT N'THẤT BẠI'ELSE	PRINT N'THÀNH CÔNG'