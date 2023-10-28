CREATE
--ALTER
PROC USP_TANGTIENTHUE1
	@MaNha INT,
	@PhanTramGia DECIMAL(18,2)
AS
BEGIN TRAN
	BEGIN TRY
		IF @PhanTramGia <= 0 
		BEGIN
			PRINT N'Phần trăm giá phải lớn hơn 0'
			ROLLBACK TRAN
			RETURN 1
		END
		DECLARE @GiaThue DECIMAL(18,2)
		SET @GiaThue = (SELECT TienThue 
					FROM NHA 
					WHERE MaNha = @MaNha)

		--SET @GiaThue = @GiaThue * ((100-@PhanTramGia)/100)
		SET @GiaThue = @GiaThue + @PhanTramGia
		--ĐỂ TEST
		WAITFOR DELAY '0:0:05'
		-------------
		UPDATE NHA
		SET TienThue = @GiaThue
		WHERE MaNha = @MaNha

		SELECT MaNha, Duong,TienThue FROM NHA WHERE MaNha = @MaNha

	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'		ROLLBACK TRAN		RETURN 1	
	END CATCH
COMMIT TRAN
RETURN 0
GO
CREATE
--ALTER
PROC USP_TANGTIENTHUE2
	@MaNha INT,
	@PhanTramGia DECIMAL(18,2)
AS
BEGIN TRAN
	BEGIN TRY
		IF @PhanTramGia <= 0 
		BEGIN
			PRINT N'Phần trăm giá phải lớn hơn 0'
			ROLLBACK TRAN
			RETURN 1
		END
		DECLARE @GiaThue DECIMAL(18,2)
		SET @GiaThue = (SELECT TienThue 
					FROM NHA 
					WHERE MaNha = @MaNha)

		--SET @GiaThue = @GiaThue * ((100+@PhanTramGia)/100)
		SET @GiaThue = @GiaThue + @PhanTramGia

		--ĐỂ TEST
		WAITFOR DELAY '0:0:05'
		-------------
		UPDATE NHA
		SET TienThue = @GiaThue
		WHERE MaNha = @MaNha
		SELECT MaNha, Duong,TienThue FROM NHA WHERE MaNha = @MaNha
		
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'		ROLLBACK TRAN		RETURN 1	
	END CATCH
COMMIT TRAN
RETURN 0