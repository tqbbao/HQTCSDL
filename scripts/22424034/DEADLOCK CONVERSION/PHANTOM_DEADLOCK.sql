CREATE PROC sp_DangKyXemNha_1
	@MaNha NVARCHAR(50),
	@MaKhachHang NVARCHAR(50),
	@NgayXem DATE,
	@MaNhanVien NVARCHAR(50)
AS
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT * FROM XEMNHA WHERE MaNha=@MaNha AND MaKhachHang=@MaKhachHang AND NgayXem=@NgayXem AND MaNhanVien=@MaNhanVien) 
		BEGIN 
			PRINT N'Đã tồn tại một lịch xem nhà!'
			ROLLBACK TRAN
			RETURN 
		END

		WAITFOR DELAY '00:00:20'

		INSERT INTO XEMNHA (MaNha, MaKhachHang, NgayXem, MaNhanVien) VALUES (@MaNha, @MaKhachHang, @NgayXem, @MaNhanVien)
		IF @@ERROR != 0
		BEGIN 
			PRINT N'Có lỗi xảy ra khi thêm lịch xem nhà!'
			ROLLBACK TRAN
			RETURN 
		END

		PRINT N'Đăng ký lịch xem nhà thành công!'
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
	END CATCH
COMMIT TRAN

GO

CREATE PROC sp_DangKyXemNha_2
	@MaNha NVARCHAR(50),
	@MaKhachHang NVARCHAR(50),
	@NgayXem DATE,
	@MaNhanVien NVARCHAR(50)
AS
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT * FROM XEMNHA WHERE MaNha=@MaNha AND MaKhachHang=@MaKhachHang AND NgayXem=@NgayXem) 
		BEGIN 
			PRINT N'Đã tồn tại một lịch xem nhà!'
			ROLLBACK TRAN
			RETURN 
		END

		INSERT INTO XEMNHA (MaNha, MaKhachHang, NgayXem, MaNhanVien) VALUES (@MaNha, @MaKhachHang, @NgayXem, @MaNhanVien)
		IF @@ERROR != 0
		BEGIN 
			PRINT N'Có lỗi xảy ra khi thêm lịch xem nhà!'
			ROLLBACK TRAN
			RETURN 
		END

		PRINT N'Đăng ký lịch xem nhà thành công!'
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
	END CATCH
COMMIT TRAN
GO
