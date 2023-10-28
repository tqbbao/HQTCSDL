
BEGIN TRAN
	INSERT INTO NHA (LoaiHD, NgaBatDau, NgayKetThuc, MaNha, MaKhachHang, MaNhanVien )
	VALUES (@LoaiHD, @NgayBatDau, @NgayKetThuc, @MaNha, @MaKH, @MaNV)
	IF @ERROR !=0 
	  ROLLBACK
	  RETURN “KHÔNG THỂ TẠO HỢP ĐỒNG”
	END
	IF @ERROR == 0
		RETURN "Tạo hợp đồng thành công"
	   COMMIT
	END
END

