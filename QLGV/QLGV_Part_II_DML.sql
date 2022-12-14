------ II ------
-- INPUT data
INSERT INTO Khoa VALUES ('KHMT', 'Khoa hoc may tinh', '07/06/2005', 'GV01')
INSERT INTO Khoa VALUES ('HTTT', 'He thong thong tin', '07/06/2005', 'GV02')
INSERT INTO Khoa VALUES ('CNPM', 'Cong nghe phan mem', '07/06/2005', 'GV04')
INSERT INTO Khoa VALUES ('MTT', 'Mang va truyen thong', '20/10/2005', 'GV03')
INSERT INTO Khoa VALUES ('KTMT', 'Ky thuat may tinh', '20/12/2005', NULL) 
GO

INSERT INTO Lop VALUES ('K11', 'Lop 1 khoa 1', 'K1108', '11', 'GV07')
INSERT INTO Lop VALUES ('K12', 'Lop 2 khoa 1', 'K1205', '12', 'GV09')
INSERT INTO Lop VALUES ('K13', 'Lop 3 khoa 1', 'K1305', '12', 'GV14')
GO

INSERT INTO MonHoc VALUES ('THDC', 'Tin hoc dai cuong', '4', '1', 'KHMT')
INSERT INTO MonHoc VALUES ('CTRR', 'Cau truc roi rac', '5', '0', 'KHMT')
INSERT INTO MonHoc VALUES ('CSDL', 'Co so du lieu', '3', '1', 'HTTT')
INSERT INTO MonHoc VALUES ('CTDLGT', 'Cau truc du lieu va giai thuat', '3', '1', 'KHMT')
INSERT INTO MonHoc VALUES ('PTTKTT', 'Phan tich thiet ke thuat toan', '3', '0', 'KHMT')
INSERT INTO MonHoc VALUES ('DHMT', 'Do hoa may tinh', '3', '1', 'KHMT')
INSERT INTO MonHoc VALUES ('KTMT', 'Kien truc may tinh', '3', '0', 'KTMT')
INSERT INTO MonHoc VALUES ('TKCSDL', 'Thiet ke co so du lieu', '3', '1', 'HTTT')
INSERT INTO MonHoc VALUES ('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', '4', '1', 'HTTT')
INSERT INTO MonHoc VALUES ('HDH', 'He dieu hanh', '4', '0', 'KHMT')
INSERT INTO MonHoc VALUES ('NMCNPM', 'Nhap mon cong nghe phan mem', '3', '0', 'CNPM')
iNSERT INTO MonHoc VALUES ('LTCFW', 'Lap trinh C for win', '3', '1', 'CNPM')
INSERT INTO MonHoc VALUES ('LTHDT', 'Lap trinh huong doi tuong', '3', '1', 'CNPM')
GO

INSERT INTO GiangDay VALUES ('K11', 'THDC', 'GV07', '1', '2006', '02/01/2006', '12/05/2006')
INSERT INTO GiangDay VALUES ('K12', 'THDC', 'GV06', '1', '2006', '02/01/2006', '12/05/2006')
INSERT INTO GiangDay VALUES ('K13', 'THDC', 'GV15', '1', '2006', '02/01/2006', '12/05/2006')
INSERT INTO GiangDay VALUES ('K11', 'CTRR', 'GV02', '1', '2006', '09/01/2006', '17/05/2006')
INSERT INTO GiangDay VALUES ('K12', 'CTRR', 'GV02', '1', '2006', '09/01/2006', '17/05/2006')
INSERT INTO GiangDay VALUES ('K13', 'CTRR', 'GV08', '1', '2006', '09/01/2006', '17/05/2006')
INSERT INTO GiangDay VALUES ('K11', 'CSDL', 'GV05', '2', '2006', '01/06/2006', '15/07/2006')
INSERT INTO GiangDay VALUES ('K12', 'CSDL', 'GV09', '2', '2006', '01/06/2006', '15/07/2006')
INSERT INTO GiangDay VALUES ('K13', 'CTDLGT', 'GV15', '2', '2006', '01/06/2006', '15/07/2006')
INSERT INTO GiangDay VALUES ('K13', 'CSDL', 'GV05', '3', '2006', '01/08/2006', '15/12/2006')
INSERT INTO GiangDay VALUES ('K13', 'DHMT', 'GV07', '3', '2006', '01/08/2006', '15/12/2006')
INSERT INTO GiangDay VALUES ('K11', 'CTDLGT', 'GV15', '3', '2006', '01/08/2006', '15/12/2006')
INSERT INTO GiangDay VALUES ('K12', 'CTDLGT', 'GV15', '3', '2006', '01/08/2007', '15/12/2006')
INSERT INTO GiangDay VALUES ('K11', 'HDH', 'GV04', '1', '2007', '02/01/2007', '18/02/2007')
INSERT INTO GiangDay VALUES ('K12', 'HDH', 'GV04', '1', '2007', '02/01/2007', '20/03/2007')
INSERT INTO GiangDay VALUES ('K11', 'DHMT', 'GV07', '1', '2007', '18/02/2007', '20/03/2007')
GO

INSERT INTO GiaoVien VALUES ('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '02/05/1950', '11/01/2004', '5.00', 2250000, 'KHMT')
INSERT INTO GiaoVien VALUES ('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '17/02/1965', '20/04/2004', '4.50', 2025000, 'HTTT')
INSERT INTO GiaoVien VALUES ('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '01/08/1950', '23/09/2004', '4.00', 1800000, 'CNPM')
INSERT INTO GiaoVien VALUES ('GV04', 'Tran Nam Som', 'TS', 'PGS', 'Nam', '22/02/1961', '12/01/2005', '4.50', 2025000, 'KTMT')
INSERT INTO GiaoVien VALUES ('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '12/03/1958', '12/01/2005', '3.00', 1350000, 'HTTT')
INSERT INTO GiaoVien VALUES ('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '11/03/1953', '12/01/2005', '4.50', 2025000, 'KHMT')
INSERT INTO GiaoVien VALUES ('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '23/11/1971', '01/03/2005', '4.00', 1800000, 'KHMT')
INSERT INTO GiaoVien VALUES ('GV08', 'Le Thi Tran', 'KS', 'NULL', 'Nu', '26/03/1974', '01/03/2005', '1.69', 760500, 'KHMT')
INSERT INTO GiaoVien VALUES ('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '31/12/1966', '01/03/2005', '4.00', 1800000, 'HTTT')
INSERT INTO GiaoVien VALUES ('GV10', 'Le Tran Anh Loan', 'KS', 'NULL', 'Nu', '17/07/1972', '01/03/2005', '1.86', 837000, 'CNPM')
INSERT INTO GiaoVien VALUES ('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '12/01/1980', '15/05/2005', '2.67', 1201500, 'MTT')
INSERT INTO GiaoVien VALUES ('GV12', 'Tran Van Anh', 'CN', 'NULL', 'Nu', '29/03/1981', '15/05/2005', '1.69', 760500, 'CNPM')
INSERT INTO GiaoVien VALUES ('GV13', 'Nguyen Linh Dan', 'CN', 'NULL', 'Nu', '23/05/1980', '15/05/2005', '1.69', 760500, 'KTMT')
INSERT INTO GiaoVien VALUES ('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '30/11/1976', '15/05/2005', '3.00', 1350000, 'MTT')
INSERT INTO GiaoVien VALUES ('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '04/05/1978', '15/05/2005', '3.00', 1350000, 'KHMT')
GO

INSERT INTO DieuKien VALUES ('CSDL', 'CTRR')
INSERT INTO DieuKien VALUES ('CSDL', 'CTDLGT')
INSERT INTO DieuKien VALUES ('CTDLGT', 'THDC')
INSERT INTO DieuKien VALUES ('PTTKTT', 'CTDLGT')
INSERT INTO DieuKien VALUES ('PTTKTT', 'THDC')
INSERT INTO DieuKien VALUES ('DHMT', 'THDC')
INSERT INTO DieuKien VALUES ('LTHDT', 'THDC')
INSERT INTO DieuKien VALUES ('PTTKHTTT', 'CSDL')
GO

INSERT INTO KetQuaThi VALUES ('K1305', 'CTRR', '1', '13/05/2006', '10.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1101', 'CSDL', '1', '20/07/2006', '10.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1101', 'CTDLGT', '1', '28/12/2006', '9.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1101', 'THDC', '1', '20/05/2006', '9.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1101', 'CTRR', '1', '13/05/2006', '9.50', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1102', 'CSDL', '1', '20/07/2006', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1102', 'CSDL', '2', '27/07/2006', '4.25', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1102', 'CSDL', '3', '10/08/2006', '4.50', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1102', 'CTDLGT', '1', '28/12/2006', '4.50', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1102', 'CTDLGT', '2', '05/01/2007', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1102', 'CTDLGT', '3', '15/01/2007', '6.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1102', 'THDC', '1', '20/05/2006', '5.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1102', 'CTRR', '1', '13/05/2006', '7.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1103', 'CSDL', '1', '20/07/2006', '3.50', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1103', 'CSDL', '2', '27/07/2006', '8.25', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1103', 'CTDLGT', '1', '28/12/2006', '7.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1103', 'THDC', '1', '20/05/2006', '8.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1103', 'CTRR', '1', '13/05/2006', '6.25', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1104', 'CSDL', '1', '20/07/2006', '3.75', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1104', 'CTDLGT', '1', '28/12/2006', '4.00', 'KHong Dat')
INSERT INTO KetQuaThi VALUES ('K1104', 'THDC', '1', '20/05/2006', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1104', 'CTRR', '1', '13/05/2006', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1104', 'CTRR', '2', '20/05/2006', '3.50', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1104', 'CTRR', '3', '30/06/2006', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1201', 'CSDL', '1', '20/07/2006', '6.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1201', 'CTDLGT', '1', '28/12/2006', '5.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1201', 'THDC', '1', '20/05/2006', '8.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1201', 'CTRR', '1', '13/05/2006', '9.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1202', 'CSDL', '1', '20/07/2006', '8.00', 'dat')
INSERT INTO KetQuaThi VALUES ('K1202', 'CTDLGT', '1', '28/12/2006', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1202', 'CTDLGT', '2', '05/01/2007', '5.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1202', 'THDC', '1', '20/05/2006', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1202', 'THDC', '2', '27/05/2006', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1202', 'CTRR', '1', '13/05/2006', '3.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1202', 'CTRR', '2', '20/05/2006', '4.00', 'Khong dat')
INSERT INTO KetQuaThi VALUES ('K1202', 'CTRR', '3', '30/06/2006', '6.25', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1203', 'CSDL', '1', '20/07/2006', '9.25', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1203', 'CTDLGT', '1', '28/12/2006', '9.50', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1203', 'THDC', '1', '20/05/2006', '10', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1203', 'CTRR', '1', '13/05/2006', '10', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1204', 'CSDL', '1', '20/07/2006', '8.50', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1204', 'CTDLGT', '1', '28/12/2006', '6.25', 'dat')
INSERT INTO KetQuaThi VALUES ('K1204', 'THDC', '1', '20/05/2006', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1204', 'CTRR', '1', '13/05/2006', '6.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1301', 'CSDL', '1', '20/12/2006', '4.25', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1301', 'CTDLGT', '1', '25/07/2006', '8.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1301', 'THDC', '1', '20/05/2006', '7.75', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1301', 'CTRR', '1', '13/05/2006', '8.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1302', 'CSDL', '1', '20/12/2006', '6.75', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1302', 'CTDLGT', '1', '13/05/2006', '5.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1302', 'THDC', '1', '20/05/2006', '8.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1302', 'CTRR', '1', '13/05/2006', '8.50', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1303', 'CSDL', '1', '20/12/2006', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1303', 'CTDLGT', '1', '25/07/2006', '4.50', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1303', 'CTDLGT', '2', '07/08/2006', '4.00', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1303', 'CTDLGT', '3', '15/08/2006', '4.25', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1303', 'THDC', '1', '20/05/2006', '4.50', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1303', 'CTRR', '1', '13/05/2006', '3.25', 'Khong Dat')
INSERT INTO KetQuaThi VALUES ('K1303', 'CTRR', '2', '20/05/2006', '5.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1304', 'CSDL', '1', '20/12/2006', '7.75', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1304', 'CTDLGT', '1', '25/07/2006', '9.75', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1304', 'THDC', '1', '20/05/2006', '5.50', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1304', 'CTRR', '1', '13/05/2006', '5.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1305', 'CSDL', '1', '20/12/2006', '9.25', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1305', 'CTDLGT', '1', '25/07/2006', '10.00', 'Dat')
INSERT INTO KetQuaThi VALUES ('K1305', 'THDC', '1', '20/05/2006', '8.00', 'Dat')
GO

INSERT INTO HocVien VALUES ('K1101', 'Nguyen Van', 'A', '27/01/1986', 'Nam', 'Tp HCM', 'K11')
INSERT INTO HocVien VALUES ('K1102', 'Tran Ngoc', 'Han', '14/03/1986', 'Nu', 'Kien Giang', 'K11')
INSERT INTO HocVien VALUES ('K1103', 'Ha Duy', 'Lap', '18/04/1986', 'Nam', 'Nghe An', 'K11')
INSERT INTO HocVien VALUES ('K1104', 'Tran NGoc ', 'Linh', '30/03/1986', 'Nu', 'Tay Ninh', 'K11')
INSERT INTO HocVien VALUES ('K1105', 'Tran Minh', 'Long', '27/02/1986', 'Nam', 'Tp HCM', 'K11')
INSERT INTO HocVien VALUES ('K1106', 'Le Nhat ', 'Minh', '24/01/1986', 'Nam', 'Tp HCM', 'K11')
INSERT INTO HocVien VALUES ('K1107', 'Nguyen Nhu', 'Nhut', '27/01/1986', 'Nam', 'Ha Noi', 'K11')
INSERT INTO HocVien VALUES ('K1108', 'Nguyen Manh', 'Tam', '27/02/1986', 'Nam', 'Kien Giang', 'K11')
INSERT INTO HocVien VALUES ('K1109', 'Phan Thi Thanh', 'Tam', '27/01/1986', 'Nu', 'Vinh Long', 'K11')
INSERT INTO HocVien VALUES ('K1110', 'Le Hoai', 'Thuong', '05/02/1986', 'Nu', 'Can Tho', 'K11')
INSERT INTO HocVien VALUES ('K1111', 'Le Ha', 'Vinh', '25/12/1986', 'Nam', 'Vinh Long', 'K11')
INSERT INTO HocVien VALUES ('K1201', 'NGuyen Van ', 'B', '11/02/1986', 'Nam', 'Tp HCM', 'K12')
INSERT INTO HocVien VALUES ('K1202', 'Nguyen Thi Kim', 'Duyen', '18/01/1986', 'Nu', 'Tp HCM', 'K12')
INSERT INTO HocVien VALUES ('K1203', 'Tran Thi Kim', 'Duyen', '17/09/1986', 'Nu', 'Tp HCM', 'K12')
INSERT INTO HocVien VALUES ('K1204', 'Truong My', 'Hanh', '19/05/1986', 'Nu', 'Dong Nai', 'K12')
INSERT INTO HocVien VALUES ('K1205', 'Nguyen Thanh', 'Nam', '17/04/1986', 'Nam', 'Tp HCM', 'K12')
INSERT INTO HocVien VALUES ('K1206', 'NGuyen Thi Truc ', 'Thanh', '04/03/1986', 'Nu', 'Kien Giang', 'K12')
INSERT INTO HocVien VALUES ('K1207', 'Tran Thi Bich ', 'Thuy', '08/02/1986', 'Nu', 'Nghe An', 'K12')
INSERT INTO HocVien VALUES ('K1208', 'Huynh Thi Kim', 'Trieu', '08/04/1986', 'Nu', 'Tay Ninh', 'K12')
INSERT INTO HocVien VALUES ('K1209', 'Pham Thanh', 'Trieu', '23/02/1986', 'Nam', 'Tp HCM', 'K12')
INSERT INTO HocVien VALUES ('K1210', 'Ngo Thanh', 'Tuan', '14/02/1986', 'Nam', 'Tp HCM', 'K12')
INSERT INTO HocVien VALUES ('K1211', 'Do Thi', 'Xuan', '09/03/1986', 'Nu', 'Ha Noi', 'K12')
INSERT INTO HocVien VALUES ('K1212', 'Le Thi Phi', 'Yen', '12/03/1986', 'Nu', 'Tp HCM', 'K12')
INSERT INTO HocVien VALUES ('K1301', 'NGuyen Thi Kim', 'Cuc', '09/06/1986', 'Nu', 'Kien Giang', 'K13')
INSERT INTO HocVien VALUES ('K1302', 'Truong Thi My', 'Hien', '18/03/1986', 'Nu', 'Nghe An', 'K13')
INSERT INTO HocVien VALUES ('K1303', 'Le Duc', 'Hien', '21/03/1986', 'Nam', 'Tay Ninh', 'K13')
INSERT INTO HocVien VALUES ('K1304', 'Le Quang', 'Hien', '18/04/1986', 'Nam', 'Tp HCM', 'K13')
INSERT INTO HocVien VALUES ('K1305', 'Le Thi ', 'Huong', '27/03/1986', 'Nu', 'Tp HCM', 'K13')
INSERT INTO HocVien VALUES ('K1306', 'Nguyen Thai', 'Huu', '30/03/1986', 'Nam', 'Ha Noi', 'K13')
INSERT INTO HocVien VALUES ('K1307', 'Tran Minh', 'Man', '28/05/1986', 'Nam', 'Tp HCM', 'K13')
INSERT INTO HocVien VALUES ('K1308', 'Huynh Hieu', 'Nghia', '08/04/1986', 'Nam', 'Kien Giang', 'K13')
INSERT INTO HocVien VALUES ('K1309', 'Nguyen Trung ', 'Nghia', '18/01/1987', 'Nam', 'Nghe An', 'K13')
INSERT INTO HocVien VALUES ('K1310', 'Tran Thi Hong', 'Tham', '22/04/1986', 'Nu', 'Tay Ninh', 'K13')
INSERT INTO HocVien VALUES ('K1311', 'Tran Minh', 'Thuc', '04/04/1986', 'Nam', 'Tp HCM', 'K13')
INSERT INTO HocVien VALUES ('K1312', 'Nguyen Thi Kim', 'Yen', '07/09/1986', 'Nu', 'Tp HCM', 'K13')
GO
<<<<<<< HEAD

------ II.1 ------
UPDATE GiaoVien
SET HeSo = HeSo + 0.2
WHERE MaGV IN (SELECT TrgKhoa
			   FROM Khoa
			  )
GO

------ II.2 ------
UPDATE HocVien
SET DiemTB = (SELECT AVG(Diem)
			  FROM KetQuaThi KQ1
			  WHERE HocVien.MaHV = KQ1.MaHV AND
					LanThi = (SELECT MAX(LanThi)
							  FROM KetQuaThi KQ2
							  WHERE KQ1.MaMH = KQ2.MaMH AND KQ1.MaHV = KQ2.MaHV
							  GROUP BY MaMH
							  )
			 GROUP BY MaHV
			 )
GO

------ II.3 ------
UPDATE HocVien
SET GhiChu = 'Cam thi'
WHERE MaHV IN (
	SELECT MaHV
	FROM KetQuaThi
	WHERE LanThi >= 3 AND Diem < 5
)

------ II.4 ------
SELECT * FROM HocVien
SELECT * FROM KetQuaThi
UPDATE HocVien
SET XepLoai =
(
	CASE 
		WHEN DiemTB >= 9 THEN 'XS'
		WHEN DiemTB >= 8 AND DiemTB < 9 THEN 'G'
		WHEN DiemTB >= 6.5 AND DiemTB < 8 THEN 'K'
		WHEN DiemTB >= 5 AND DiemTB < 6.5 THEN 'TB'
		WHEN DiemTB < 5 THEN 'Y'
	END
)
=======
>>>>>>> 9206ba1b5ab1ff68b53830777dad595219b6a1b8
