
BEGIN TRAN
	IF EXISTS (SELECT * FROM Nha WHERE NHA.MaNha=@ma)
		@ma = 1
		UPDATE NHA SET TinhTrang = ‘Đã bán’ WHERE 
		MaNha = @ma
		IF @ERROR != 0
		   ROLLBACK
		   RETURN "Có lỗi xảy ra khi cập trạng thái nhà!"
		END
	END
	WAITFOR DELAY '00:00:20'
	COMMIT
END

