﻿DECLARE @NOTI INT -- 0:thành công, 1:không thành công
EXEC @NOTI = USP_XOACHUNHA1 15IF @NOTI = 1	PRINT N'THẤT BẠI'ELSE	PRINT N'THÀNH CÔNG'