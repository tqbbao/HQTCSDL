﻿DECLARE @NOTI INT -- 0:thành công, 1:không thành công
EXEC @NOTI = USP_XEMNHA1 1
IF @NOTI = 1