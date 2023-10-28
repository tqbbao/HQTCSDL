CREATE 
--ALTER
PROC USP_XEMNHA2
	@Quan NVARCHAR(50),
	@ThanhPho NVARCHAR(50)
AS 
BEGIN
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM NHA WHERE Quan = @Quan AND ThanhPho = @ThanhPho)
				BEGIN
					PRINT N'NHÀ KHÔNG TỒN TẠI'
					ROLLBACK TRAN
					RETURN 1
				END
			IF (@Quan IS NULL OR @Quan = '')
			BEGIN
				PRINT @Quan + N' KHÔNG ĐƯỢC ĐỂ TRỐNG(NULL)'
				ROLLBACK TRAN
				RETURN 1
			END
			IF (@ThanhPho IS NULL OR @ThanhPho = '')
			BEGIN
				PRINT @ThanhPho + N' KHÔNG ĐƯỢC ĐỂ TRỐNG(NULL)'
				ROLLBACK TRAN
				RETURN 1
			END

			DECLARE @TONG INT
			SET @TONG = (SELECT COUNT(*) FROM NHA
			WHERE Quan = @Quan AND
			ThanhPho = @ThanhPho)
			BEGIN
				PRINT @Quan + N' CÓ ' + CAST(@TONG AS NVARCHAR(20)) + N' CĂN NHÀ'
			END
			--ĐỂ TEST
			WAITFOR DELAY '0:0:05'			SELECT * FROM NHA 
			WHERE Quan = @Quan AND ThanhPho = @ThanhPho

		END TRY
		BEGIN CATCH
			PRINT N' LỖI HỆ THỐNG'
			ROLLBACK TRAN
			RETURN 1
		END CATCH
	IF @@TRANCOUNT > 0
	COMMIT TRAN
	RETURN 0
END
GO