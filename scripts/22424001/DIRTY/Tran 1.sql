DECLARE @NOTI INT -- 0:thành công, 1:không thành công
EXEC @NOTI = USP_CAPNHATTENDUONG 1, N'736 Nguyễn Trãi, Phường 11'
IF @NOTI = 1	PRINT N'THẤT BẠI'ELSE	PRINT N'THÀNH CÔNG'