DECLARE @NOTI INT -- 0:thành công, 1:không thành công
EXEC @NOTI = USP_THEMNHA N'185 -187 Hoàng Văn Thụ, Phường 8', N'Quận 1', N'Tp HCM', N'KV1', 3, 8000000, N'2023-06-06T00:00:00.000',N'2023-11-06T00:00:00.000', N'đang cho thuê', 0, 8000000, N'None', 1, 1, 1, 1
IF @NOTI = 1	PRINT N'THẤT BẠI'ELSE	PRINT N'THÀNH CÔNG'