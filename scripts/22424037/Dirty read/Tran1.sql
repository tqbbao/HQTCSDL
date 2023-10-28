DECLARE @RT INT
EXEC @RT = sp_CapNhatDieuKienCN '1'
IF @RT = 1
PRINT N'Thất bại'
ELSE
PRINT N'Thành công'