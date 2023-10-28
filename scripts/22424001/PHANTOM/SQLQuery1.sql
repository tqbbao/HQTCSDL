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

CREATE 
--ALTER
PROC USP_THEMNHA
	@Duong NVARCHAR(50), 
	@Quan NVARCHAR(50),
	@ThanhPho NVARCHAR(50),
	@KhuVuc NVARCHAR(50),
	@SLPhong INT, 
	@TienThue DECIMAL(18,2), 
	@NgayDang DATETIME,
	@NgayHetHan DATETIME,
	@TinhTrang NVARCHAR(50), 
	@LuotXem INT, 
	@GiaBan DECIMAL(18,2), 
	@DieuKienCN NVARCHAR(50), 
	@MaLoaiNha INT, 
	@MaChuNha INT, 
	@MaNhanVien INT,
	@MaChiNhanh INT
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
		
			INSERT NHA(Duong, Quan, ThanhPho, KhuVuc, SLPhong, TienThue, NgayDang, 
			NgayHetHan, TinhTrang, LuotXem, GiaBan, DieuKienCN, MaLoaiNha, MaChuNha, MaNhanVien, MaChiNhanh)
			VALUES(@Duong, @Quan, @ThanhPho, @KhuVuc, @SLPhong, @TienThue, @NgayDang, 
			@NgayHetHan, @TinhTrang,@LuotXem, @GiaBan,@DieuKienCN,@MaLoaiNha, @MaChuNha,@MaNhanVien,@MaChiNhanh)
			PRINT N' THÊM NHÀ THÀNH CÔNG'
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