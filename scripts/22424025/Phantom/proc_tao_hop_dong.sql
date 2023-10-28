-- Stored procedure
CREATE PROCEDURE TAO_MOI_HOP_DONG
    @Action VARCHAR(10)
AS
BEGIN
    IF @Action = 'CREATE'
    BEGIN
      INSERT INTO NHA (LoaiHD, NgayBatDau, NgayKetThuc, MaNha, MaKhachHang, MaNhanVien )
      VALUES(1,'2023-7-19', '2024-7-19', 1, 1,1)
    END
    ELSE IF @Action = 'VIEW_ALL'
    BEGIN
        SELECT *
        FROM HOPDONG;
    END
END;

EXEC TAO_MOI_HOP_DONG  @Action = 'CREATE';

EXEC TAO_MOI_HOP_DONG @Action = 'VIEW_ALL';

