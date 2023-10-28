-- Stored procedure
CREATE PROCEDURE CAP_NHAT_TINH_TRANG
    @Action VARCHAR(10)
AS
BEGIN
    IF @Action = 'UPDATE'
    BEGIN
        UPDATE NHA
        SET TinhTrang = 'Đã bán'
        WHERE MaNha = 1;
    END
    ELSE IF @Action = 'VIEW_ALL'
    BEGIN
        SELECT *
        FROM NHA;
    END
END;


EXEC CAP_NHAT_TINH_TRANG  @Action = 'UPDATE';


EXEC CAP_NHAT_TINH_TRANG @Action = 'VIEW_ALL';