CREATE DATABASE QLBH;
GO

USE QLBH;
SET DATEFORMAT DMY;
GO

------ I.1 ------
CREATE TABLE NhanVien
(
	MaNV	CHAR(4),
	HoTen	VARCHAR(40),
	SoDT	VARCHAR(40),
	NgVL	SMALLDATETIME,
	CONSTRAINT PK_NhanVien PRIMARY KEY (MaNV)
) 
GO 

CREATE TABLE KhachHang
(
	MaKH	CHAR(4),
	HoTen	VARCHAR(40),
	DChi	VARCHAR(50),
	SoDT	VARCHAR(20),
	NgSinh	SMALLDATETIME,
	DoanhSo	MONEY,
	NgDK	SMALLDATETIME,
	CONSTRAINT PK_KhachHang PRIMARY KEY (MaKH)
)
GO

CREATE TABLE SanPham
(
	MaSP	CHAR(4),
	TenSP	VARCHAR(40),
	DVT	VARCHAR(20), 
	NuocSX	VARCHAR(40),
	Gia	MONEY,
	CONSTRAINT PK_SanPham PRIMARY KEY (MaSP)
) 
GO

CREATE TABLE HoaDon
(
	SoHD	INT,
	NgHD	SMALLDATETIME,
	MaKH	CHAR(4),
	MaNV	CHAR(4),
	TriGia	MONEY
	CONSTRAINT PK_HoaDon PRIMARY KEY (SoHD)
)
GO 

CREATE TABLE CTHD
(
	SoHD	INT,
	MaSP	CHAR(4),
	SL		INT
	CONSTRAINT PK_CTHD PRIMARY KEY (SoHD, MaSP)
)
GO

------ I.1 ------
ALTER TABLE HoaDon ADD CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
ALTER TABLE HoaDon ADD CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)

ALTER TABLE CTHD ADD CONSTRAINT FK_CTHD_HoaDon FOREIGN KEY (SoHD) REFERENCES HoaDon(SoHD)
ALTER TABLE CTHD ADD CONSTRAINT FK_CTHD_SanPham FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)

------ I.2 ------
ALTER TABLE SanPham ADD GhiChu VARCHAR(20)
GO

------ I.3 ------
ALTER TABLE KhachHang ADD LoaiKH TINYINT
GO

------ I.4 ------
ALTER TABLE SanPham ALTER COLUMN GhiChu VARCHAR(100)
GO

------ I.5 ------
ALTER TABLE SanPham DROP COLUMN GhiChu
GO

------ I.6 ------
ALTER TABLE KhachHang ALTER COLUMN LoaiKH VARCHAR(20)
GO

------ I.7 ------
ALTER TABLE SanPham ADD CONSTRAINT CHK_DonViTinh CHECK (DVT IN ('cay', 'hop', 'cai', 'quyen', 'chuc'))
GO

------ I.8 ------
ALTER TABLE SanPham ADD CONSTRAINT CHK_Gia CHECK (Gia > 500)
GO

------ I.9 ------
ALTER TABLE CTHD ADD CONSTRAINT CHK_SoLuong CHECK (SL >= 1)
GO

------ I.10 ------
ALTER TABLE KhachHang ADD CONSTRAINT CHK_NgSinh_NgDK CHECK (NgDK > NgSinh)
GO

------ I.11 ------
-- Trigger 11.1: Insert or Update HoaDon
CREATE TRIGGER TRG_NgHD_NgDK_HoaDon ON HoaDon
FOR INSERT, UPDATE
AS 
	DECLARE @NgDangKi SMALLDATETIME, @NgHoaDon SMALLDATETIME

	SELECT @NgHoaDon = NgHD FROM INSERTED
	SELECT @NgDangKi = NgDK FROM INSERTED, KhachHang
							WHERE (KhachHang.MaKH = INSERTED.MaKH)
	IF (@NgHoaDon < @NgDangKi)
	BEGIN
		RAISERROR('Ngay hoa don phai >= ngay dang ki!', 16, 1)
		ROLLBACK TRAN
	END
GO

-- Trigger 11.2: Insert or Update KhachHang
CREATE TRIGGER TRG_NgHD_NgDK_KhachHang ON KhachHang
FOR INSERT, UPDATE
AS 
	DECLARE @NgDangKi SMALLDATETIME, @NgHoaDon SMALLDATETIME

	SELECT @NgDangKi = NgDK FROM INSERTED
	SELECT @NgHoaDon = NgHD FROM INSERTED, HoaDon
							WHERE (HoaDon.MaKH = INSERTED.MaKH)
	IF (@NgHoaDon < @NgDangKi)
	BEGIN
		RAISERROR ('Ngay hoa don phai >= ngay dang ki!', 16, 1)
		ROLLBACK TRAN
	END
GO

------ I.12 ------
-- Trigger 12.1: Insert or Update HoaDon
CREATE TRIGGER TRG_NgHD_NgVL_HoaDon ON HoaDon
FOR INSERT, UPDATE
AS
	DECLARE @NgHoaDon SMALLDATETIME, @NgVaoLam SMALLDATETIME

	SELECT @NgHoaDon = NgHD FROM HoaDon
	SELECT @NgVaoLam = NgVL FROM INSERTED, NhanVien
							WHERE (NhanVien.MaNV = INSERTED.MaNV)
	IF (@NgHoaDon < @NgVaoLam)
	BEGIN
		RAISERROR ('Ngay hoa don phai >= ngay vao lam!', 16, 1)
		ROLLBACK TRAN
	END
GO

-- Trigger 12.2: Insert or Update NhanVien
CREATE TRIGGER TRG_NgHD_NgVL_NhanVien ON NhanVien 
FOR INSERT, UPDATE
AS
	DECLARE @NgHoaDon SMALLDATETIME, @NgVaoLam SMALLDATETIME

	SELECT @NgVaoLam = NgVL FROM NhanVien
	SELECT @NgHoaDon = NgHD FROM INSERTED, HoaDon
							WHERE (HoaDon.MaNV = INSERTED.MaNV)
	IF (@NgHoaDon < @NgVaoLam)
	BEGIN
		RAISERROR('Ngay hoa don phai >= ngay vao lam!', 16, 1)
		ROLLBACK TRAN
	END
GO

------ I.13 ------
-- Trigger 13.1: Insert new HoaDon 
CREATE TRIGGER TRG_SoHD_HoaDon ON HoaDon
FOR INSERT
AS
	IF NOT EXISTS (SELECT * FROM INSERTED JOIN CTHD ON INSERTED.SoHD = CTHD.SoHD)
	BEGIN
		RAISERROR('Khong ton tai CTHD co SoHD nay!', 16, 1)
		ROLLBACK TRAN
	END
GO

-- Trigger 13.2: Delete or Update CTHD (Kiểm tra còn tồn tại ít nhất 1 CTHD của 1 HoaDon)
CREATE TRIGGER TRG_SoHD_CTHD ON CTHD 
FOR DELETE, UPDATE
AS
    DECLARE @SL INT, @SoHD INT

    SELECT @SL = COUNT(A.SoHD), @SoHD = D.SoHD
	FROM DELETED D, CTHD A
    WHERE A.SoHD = D.SoHD
    GROUP BY D.SoHD 
    IF(@SL < 1) 
	BEGIN
        DELETE FROM HoaDon WHERE SoHD = @SoHD 
        PRINT 'Da xoa CTHD cuoi cung cua Hoa don tren'
    END 
GO

------ I.14 ------
-- Trigger 14.1: Update TriGia when INSERT values to CTHD 
CREATE TRIGGER TRG_TriGia_CTHD_Insert
ON CTHD 
FOR INSERT 
AS 
	DECLARE @SoHD INT, @TriGiaThem MONEY
	SET @TriGiaThem = 0
	SELECT @SoHD = SoHD, @TriGiaThem = SL * Gia FROM INSERTED JOIN SanPham ON INSERTED.MaSP = SanPham.MaSP
	BEGIN 
		UPDATE HoaDon 
		SET TriGia = TriGia + @TriGiaThem 
		WHERE SoHD = @SoHD	
		PRINT 'Them CTHD thanh cong va da cap nhat lai Tri gia.'
	END
GO

-- Trigger 14.2: Update TriGia when DELETE values from CTHD
CREATE TRIGGER TRG_TriGia_CTHD_Delete
ON CTHD
FOR DELETE
AS
	DECLARE @SoHD INT, @TriGiaBiMat MONEY
	SET @TriGiaBiMat = 0
	SELECT @SoHD = SoHD, @TriGiaBiMat = D.SL * Gia FROM DELETED D JOIN SanPham ON D.MaSP = SanPham.MaSP
BEGIN
	UPDATE HoaDon
	SET TriGia = TriGia - @TriGiaBiMat
	WHERE SoHD = @SoHD
	PRINT 'Cap nhat CTHD thanh cong va da cap nhat lai Tri gia.'
END
GO

-- Trigger 14.3: Update TriGia when UPDATE values CTHD 
CREATE TRIGGER TRG_TriGia_CTHD_Update
ON CTHD 
FOR UPDATE 
AS
	DECLARE @SoHD INT, @TriGiaBiMat MONEY, @TriGiaMoiThayDoi MONEY
	SET @TriGiaBiMat = 0
	SET @TriGiaMoiThayDoi = 0

	SELECT @SoHD = SoHD, @TriGiaBiMat = D.SL * Gia FROM DELETED D JOIN SanPham ON D.MaSP = SanPham.MaSP 
	SELECT @SoHD = SoHD, @TriGiaMoiThayDoi = I.SL * Gia FROM INSERTED I JOIN SanPham ON I.MaSP = SanPham.MaSP 
	BEGIN
		UPDATE HoaDon
		SET TriGia = TriGia - @TriGiaBiMat + @TriGiaMoiThayDoi
		WHERE SoHD = @SoHD
		PRINT 'Cap nhat CTHD thanh cong va da cap nhat lai Tri gia.'
	END
GO

-- Trigger 14.4: Update values HoaDon but not changing TriGia
CREATE TRIGGER TRG_TriGia_HoaDon_Update
ON HoaDon
FOR UPDATE
AS
	IF UPDATE (TriGia)
	BEGIN
		DECLARE @TongTriGiaCu MONEY, @TriGiaMoi MONEY
		SET @TongTriGiaCu = 0
		SELECT @TriGiaMoi = TriGia FROM INSERTED 
		SELECT @TongTriGiaCu = SUM(SL * Gia) 
							   FROM CTHD, SanPham, INSERTED 
							   WHERE INSERTED.SoHD = CTHD.SoHD AND SanPham.MaSP = CTHD.MaSP
		IF (@TriGiaMoi <> @TongTriGiaCu)
		BEGIN
			RAISERROR('Tri gia moi cap nhat khong dong bo voi Tri gia cu! Vui long kiem tra lai.', 16, 1)
			ROLLBACK TRAN
		END
	END 
GO

------ I.15 ------
-- Trigger 15.1: Update DoanhSo when INSERT values to HoaDon
CREATE TRIGGER TRG_DoanhSo_HoaDon_Insert
ON HoaDon
FOR INSERT
AS
	DECLARE @GiaTriThem MONEY, @MaKH CHAR(4)
	SET @GiaTriThem = 0
	SELECT @MaKH = MaKH FROM INSERTED
	SELECT @GiaTriThem = SUM(TriGia) FROM INSERTED JOIN KhachHang ON INSERTED.MaKH = KhachHang.MaKH

	UPDATE KhachHang 
	SET DoanhSo = DoanhSo + @GiaTriThem 
	WHERE MaKH = @MaKH
	BEGIN
		PRINT 'Them du lieu Hoa don va chinh sua Doanh so thanh cong.'
	END
GO

-- Trigger 15.2: Update DoanhSo when DELETE values from HoaDon
CREATE TRIGGER TRG_DoanhSo_HoaDon_Delete
ON HoaDon
FOR DELETE
AS
	DECLARE @GiaTriMat MONEY, @MaKH CHAR(4)
	SET @GiaTriMat = 0
	SELECT @MaKH = MaKH FROM DELETED
	SELECT @GiaTriMat = SUM(D.TriGia) FROM DELETED D JOIN KhachHang ON D.MaKH = KhachHang.MaKH

	UPDATE KhachHang 
	SET DoanhSo = DoanhSo - @GiaTriMat
	WHERE MaKH = @MaKH
	BEGIN
		PRINT 'Them du lieu Hoa don va chinh sua Doanh so thanh cong.'
	END
GO

-- Trigger 15.3: Update DoanhSo when Update values HoaDon
CREATE TRIGGER TRG_DoanhSo_HoaDon_Update
ON HoaDon
FOR UPDATE
AS 
	DECLARE @DoanhSoGiam MONEY, @DoanhSoMoiThem MONEY, @MaKH CHAR(4)
	SET @DoanhSoGiam = 0
	SELECT @MaKH = I.MaKH, @DoanhSoMoiThem = TriGia FROM INSERTED I JOIN KhachHang ON I.MaKH = KhachHang.MaKH 
	SELECT @MaKH = D.MaKH, @DoanhSoGiam = TriGia FROM DELETED D JOIN KhachHang ON D.MaKH = KhachHang.MaKH 
	BEGIN
		UPDATE KhachHang
		SET DoanhSo = DoanhSo - @DoanhSoGiam + @DoanhSoMoiThem
		WHERE MaKH = @MaKH
		PRINT 'Cap nhat HoaDon va Doanh so cua Khach hang thanh cong.'
	END
GO

-- Trigger 15.4: Update values KhachHang but changing DoanhSo
CREATE TRIGGER TRG_DoanhSo_KhachHang_Update
ON KhachHang
FOR UPDATE
AS
BEGIN
	DECLARE @TongDoanhSoCu MONEY, @TongDoanhSoMoi MONEY
	SET @TongDoanhSoCu = 0
	SELECT @TongDoanhSoMoi = DoanhSo FROM INSERTED
	SELECT @TongDoanhSoCu = SUM(TriGia) FROM HoaDon, INSERTED	
										WHERE INSERTED.MaKH = HoaDon.MaKH
	IF(@TongDoanhSoCu <> @TongDoanhSoMoi)
	BEGIN
		RAISERROR('Doanh so moi cap nhat khong dong bo voi Doanh so cu! Vui long kiem tra lai.', 16, 1)
		ROLLBACK TRAN
	END
END
GO
