------ III.1 ------
SELECT MaSP, TenSP
FROM SanPham
WHERE NuocSX LIKE 'Trung Quoc'
GO

------ III.2 ------
SELECT MaSP, TenSP
FROM SanPham 
WHERE DVT IN ('cay', 'quyen')
GO

------ III.3 ------
SELECT MaSP, TenSP
FROM SanPham
WHERE MaSP LIKE 'B%01'
GO

------ III.4 ------
SELECT MaSP, TenSP
FROM SanPham
WHERE NuocSX LIKE 'Trung Quoc' AND (Gia BETWEEN 30000 AND 40000)
GO

------ III.5 ------
SELECT MaSP, TenSP
FROM SanPham
WHERE NuocSX IN ('Trung Quoc', 'Thai Lan') AND (Gia BETWEEN 30000 AND 40000)
GO

SET DATEFORMAT DMY
GO
------ III.6 ------
SELECT SoHD, TriGia
FROM HoaDon
WHERE NgHD IN ('1/1/2007', '2/1/2007')
GO

------ III.7 ------
SELECT SoHD, TriGia
FROM HoaDon
WHERE MONTH(NgHD) = 1 AND YEAR(NgHD) = 2007
ORDER BY NgHD ASC, TriGia DESC
GO

------ III.8 ------
SELECT KH.MaKH, HoTen
FROM KhachHang KH JOIN HoaDon HD ON KH.MaKH = HD.MaKH
WHERE HD.NgHD = '1/1/2007'
GO

------ III.8 ------
SELECT KH.MaKH, HoTen
FROM KhachHang KH JOIN HoaDon HD ON KH.MaKH = HD.MaKH
WHERE HD.NgHD = '1/1/2007'
GO

------ III.9 ------
SELECT SoHD, TriGia
FROM NhanVien NV JOIN HoaDon HD ON NV.MaNV = HD.MaNV
WHERE NV.HoTen LIKE 'Nguyen Van B' AND NgHD = '28/10/2006'
GO

------ III.10 ------
SELECT SP.MaSP, SP.TenSP
FROM CTHD CT JOIN SanPham SP ON CT.MaSP = SP.MaSP
			 JOIN HoaDon HD ON CT.SoHD = HD.SoHD
			 JOIN KhachHang KH ON HD.MaKH = KH.MaKH
WHERE KH.HoTen = 'Nguyen Van A'	
	AND MONTH(NgHD) = 10 AND YEAR(NgHD) = 2006
GO

------ III.11 ------
SELECT CTHD.SoHD
FROM CTHD
WHERE CTHD.MaSP IN ('BB01', 'BB02')
GO

------ III.12 ------
SELECT CTHD.SoHD
FROM CTHD 
WHERE CTHD.MaSP IN ('BB01', 'BB02') AND (CTHD.SL BETWEEN 10 AND 20) 
GO

------ III.13 ------
(SELECT SoHD 
FROM CTHD 
WHERE MaSP = 'BB01' AND SL BETWEEN 10 AND 20)
INTERSECT
(SELECT SoHD 
FROM CTHD 
WHERE MaSP = 'BB02' AND SL BETWEEN 10 AND 20)
GO

------ III.14 ------
SELECT SP.MaSP, TenSP 
FROM SANPHAM SP JOIN CTHD ON SP.MaSP = CTHD.MaSP
				JOIN HoaDon HD ON CTHD.SoHD = HD.SoHD
WHERE NuocSX LIKE 'Trung Quoc' OR HD.NgHD = '1/1/2007'
GO

------ III.15 ------
SELECT MaSP, TenSP
FROM SanPham
WHERE MaSP NOT IN(
			SELECT MaSP 
			FROM CTHD)
GO

------ III.16 ------
SELECT MaSP, TenSP
FROM SanPham
WHERE MaSP NOT IN(
		SELECT MaSP
		FROM CTHD CT JOIN HoaDon HD ON CT.SoHD = HD.SoHD
		WHERE YEAR(NgHD) = 2006
		)
GO 

------ III.17 ------
SELECT MaSP, TenSP
FROM SanPham
WHERE NuocSX LIKE 'Trung Quoc' AND 
	  MaSP NOT IN(
		SELECT MaSP
		FROM CTHD CT JOIN HoaDon HD ON CT.SoHD = HD.SoHD
		WHERE YEAR(NgHD) = 2006
		)
GO

------ III.18 ------
SELECT SoHD 
FROM HoaDon HD 
WHERE NOT EXISTS(
		SELECT *
		FROM SanPham SP 
		WHERE NuocSX LIKE 'Singapore' AND
		NOT EXISTS(
			SELECT * 
			FROM CTHD CT 
			WHERE CT.MaSP = SP.MaSP AND HD.SoHD = CT.SoHD
		)
	)
GO

------ III.19 ------
SELECT SoHD 
FROM HoaDon
WHERE YEAR(NgHD) = 2006 AND 
	SoHD IN(
	SELECT SoHD 
	FROM HoaDon HD 
	WHERE NOT EXISTS(
			SELECT *
			FROM SanPham SP 
			WHERE NuocSX LIKE 'Singapore' AND
			NOT EXISTS(
				SELECT * 
				FROM CTHD CT 
				WHERE CT.MaSP = SP.MaSP AND HD.SoHD = CT.SoHD
			)
		)
	)
GO

------ III.20 ------
SELECT COUNT(SoHD) AS SoLuongHoaDon 
FROM HoaDon 
WHERE MaKH IS NULL

------ III.21 ------
SELECT COUNT(DISTINCT CT.MaSP) AS SoLuongSanPham
FROM CTHD CT JOIN HoaDon HD ON CT.SoHD = HD.SoHD
WHERE YEAR(NgHD) = 2006
GO

------ III.22 ------
SELECT MAX(TriGia) AS TriGiaCaoNhat,
		MIN(TriGia) AS TriGiaThapNhat
FROM HoaDon
GO

------ III.23 ------
SELECT AVG(TriGia) AS TriGiaTrungBinh
FROM HoaDon
WHERE YEAR(NgHD) = 2006
GO

------ III.24 ------
SELECT SUM(TriGia) AS DoanhThuBanHang
FROM HoaDon 
WHERE YEAR(NgHD) = 2006
GO

------ III.25 ------
SELECT SoHD
FROM HoaDon 
WHERE YEAR(NgHD) = 2006 AND TriGia >= ALL(
										SELECT MAX(TriGia)
										FROM HoaDon 
										WHERE YEAR(NgHD) = 2006
										)
GO

------ III.26 ------
SELECT HoTen
FROM KhachHang KH JOIN HoaDon HD ON KH.MaKH = HD.MaKH
WHERE YEAR(NgHD) = 2006 AND TriGia >= ALL(
										SELECT MAX(TriGia)
										FROM HoaDon 
										WHERE YEAR(NgHD) = 2006
										)
GO

------ III.27 ------
SELECT TOP(3) MaKH, HoTen 
FROM KhachHang
ORDER BY DoanhSo DESC
GO

------ III.28 ------
SELECT MaSP, TenSP 
FROM SanPham
WHERE Gia IN (
		SELECT TOP(3) Gia
		FROM SanPham
		ORDER BY Gia DESC
		)
GO

------ III.29 ------
SELECT MaSP, TenSP 
FROM SanPham
WHERE NuocSX LIKE 'Thai Lan'
	  AND Gia IN (
		SELECT TOP(3) Gia
		FROM SanPham
		ORDER BY Gia DESC
		)
GO

------ III.30 ------
SELECT MaSP, TenSP 
FROM SanPham
WHERE NuocSX LIKE 'Trung Quoc'
	  AND Gia IN (
		SELECT TOP(3) Gia
		FROM SanPham
		WHERE NuocSX LIKE 'Trung Quoc'
		ORDER BY Gia DESC
		)
GO

------ III.31 ------
SELECT TOP(3) * 
FROM KhachHang
WHERE DoanhSo IN (
			SELECT TOP(3) DoanhSo
			FROM KhachHang
			ORDER BY DoanhSo DESC
			)
GO	

------ III.32 ------
SELECT COUNT(DISTINCT MaSP) AS TongSanPham
FROM SanPham
WHERE NuocSX LIKE 'Trung Quoc'
GO 

------ III.33 ------
SELECT NuocSX, COUNT(DISTINCT MaSP) AS TongSanPham
FROM SanPham
GROUP BY NuocSX
GO 

------ III.34 ------
SELECT NuocSX, MAX(Gia) AS GiaBanCaoNhat,
	   MIN(Gia) AS GiaBanThapNhat, AVG(Gia) AS GiaBanTrungBinh
FROM SanPham
GROUP BY NuocSX
GO 

------ III.35 ------
SELECT NgHD, SUM(TriGia) as DoanhThu
FROM HoaDon
GROUP BY NgHD
GO

------ III.36 ------
SELECT CT.MaSP, TenSP, COUNT(SL) AS TongSoLuong
FROM CTHD CT JOIN SanPham SP ON CT.MaSP = SP.MaSP
			 JOIN HoaDon HD ON CT.SoHD = HD.SoHD
WHERE MONTH(NgHD) = 10 AND YEAR(NgHD) = 2006
GROUP BY CT.MaSP, TenSP
GO

------ III.37 ------
SELECT MONTH(NgHD) AS Thang, SUM(TriGia) as DoanhThu
FROM HoaDon
WHERE YEAR(NgHD) = 2006
GROUP BY MONTH(NgHD)
GO

------ III.38 ------
SELECT SoHD 
FROM CTHD 
GROUP BY SoHD
HAVING COUNT(DISTINCT MaSP) >= 4
GO

------ III.39 ------
SELECT CT.SoHD 
FROM CTHD CT JOIN SanPham SP ON CT.MaSP = SP.MaSP
WHERE NuocSX LIKE 'Viet Nam'
GROUP BY CT.SoHD
HAVING COUNT(DISTINCT CT.MaSP) = 3
GO

------ III.40 ------
SELECT TOP(1) WITH TIES HD.MaKH, HoTen
FROM KhachHang KH JOIN HoaDon HD ON KH.MaKH = HD.MaKH
GROUP BY HD.MaKH, HoTen
ORDER BY COUNT(SoHD) DESC 
GO

------ III.41 ------
SELECT TOP(1) WITH TIES MONTH(NgHD) AS Thang, SUM(TriGia) AS DoanhThu
FROM HoaDon
WHERE YEAR(NgHD) = 2006
GROUP BY MONTH(NgHD)
ORDER BY SUM(TriGia) DESC
GO

------ III.42 ------
SELECT TOP(1) WITH TIES CT.MaSP, TenSP
FROM CTHD CT JOIN SanPham SP ON CT.MaSP = SP.MaSP 
             JOIN HoaDon HD ON CT.SoHD = HD.SoHD
WHERE YEAR(NgHD) = 2006
GROUP BY CT.MaSP, SP.TenSP
ORDER BY SUM(SL) ASC
GO

------ III.43 ------
SELECT NuocSX, MaSP, TenSP
FROM SanPham A
WHERE Gia = (
		SELECT MAX(Gia)
		FROM SanPham B
		WHERE A.NuocSX = B.NuocSX
		GROUP BY NuocSX
		)
GO

------ III.44 ------
SELECT NuocSX
FROM SanPham
GROUP BY NuocSX
HAVING COUNT(DISTINCT Gia) >= 3
GO

------ III.45 ------
SELECT KH.MaKH, HoTen
FROM KhachHang KH JOIN HoaDon HD ON KH.MaKH = HD.MaKH
GROUP BY KH.MaKH, HoTen
HAVING COUNT(DISTINCT SoHD) >= ALL(
							SELECT COUNT(DISTINCT SoHD)
							FROM HoaDon
							WHERE MaKH IN(
									SELECT TOP(10) WITH TIES MaKH
									FROM KhachHang
									ORDER BY DoanhSo DESC
									)
							GROUP BY HoaDon.MaKH
							)	
GO