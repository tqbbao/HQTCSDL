﻿DECLARE @NOTI INT -- 0:thành công, 1:không thành công
EXEC @NOTI = USP_TANGTIENTHUE2 1, 200
IF @NOTI = 1