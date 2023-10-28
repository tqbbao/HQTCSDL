
BEGIN TRAN
	IF EXISTS (SELECT * FROM NHA WHERE NHA.MaNha=@ma)
	    IF @ERROR == 0
	       RETURN “Thông tin nhà” + NHA
	     ELSE
	        RETURN “Sai thông tin nhà"
	    END
	END
END