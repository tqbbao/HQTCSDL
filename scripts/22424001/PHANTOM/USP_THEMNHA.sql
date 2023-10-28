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