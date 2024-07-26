CREATE DATABASE Data02
GO

USE Data02
GO

CREATE TABLE LoaiSanPham (
    MaLoaiSP VARCHAR(20) PRIMARY KEY,
    TenLoaiSP VARCHAR(50)
)

INSERT INTO LoaiSanPham VALUES ('Z37E', 'May tinh xach tay Z37')

CREATE TABLE NguoiChiuTrachNhiem (
    MaNV VARCHAR(20) PRIMARY KEY,
    HoTen VARCHAR(50)
)

INSERT INTO NguoiChiuTrachNhiem VALUES ('987688','Nguyen Van An')
									   
							   

CREATE TABLE SanPham (
    MaSP VARCHAR(20) PRIMARY KEY,
    NgaySX DATE,
    TenLoaiSP VARCHAR(50),
    MaLoaiSP VARCHAR(20),
	MaNV VARCHAR(20),
	FOREIGN KEY (MaNV) REFERENCES NguoiChiuTrachNhiem(MaNV),
    FOREIGN KEY (MaLoaiSP) REFERENCES LoaiSanPham(MaLoaiSP)
)

INSERT INTO SanPham VALUES ('Z37 111111','2019-12-12','May tinh xach tay Z37', 'Z37E','987688')
						 

--4--
SELECT*FROM LoaiSanPham
SELECT*FROM SanPham
SELECT*FROM NguoiChiuTrachNhiem

--5--
SELECT TenLoaiSP FROM LoaiSanPham
	ORDER BY TenLoaiSP ASC

SELECT HoTen FROM NguoiChiuTrachNhiem
	ORDER BY HoTen ASC

SELECT * FROM SanPham 
	WHERE MaLoaiSP ='Z37E'

SELECT sp.*
FROM SanPham sp
INNER JOIN NguoiChiuTrachNhiem nct ON sp.MaNV = nct.MaNV
WHERE nct.HoTen = 'Nguyen Van An'
ORDER BY sp.MaSP DESC

--6--
SELECT MaLoaiSP, COUNT(*)  AS Slungsnphm 
	FROM SanPham 
	GROUP BY MaLoaiSP

SELECT sp.MaLoaiSP,sp.MaNV, sp.NgaySX, sp.TenLoaiSP
FROM SanPham sp
INNER JOIN LoaiSanPham lsp ON sp.MaLoaiSP = lsp.MaLoaiSP;

SELECT nct.*, lsp.*, sp.*
FROM NguoiChiuTrachNhiem nct
INNER JOIN SanPham sp ON nct.MaNV = sp.MaNV
INNER JOIN LoaiSanPham lsp ON sp.MaLoaiSP = lsp.MaLoaiSP;


--7--
UPDATE SanPham 
	 SET NgaySX = '2024-07-26'

SELECT *FROM SanPham
--Xoá Khoá ngoại trước--
ALTER TABLE SanPham DROP CONSTRAINT FK__SanPham__MaLoaiS__29572725 
--Xoa Khoa Chinh--
ALTER TABLE LoaiSanPham DROP CONSTRAINT [PK__LoaiSanP__1224CA7C858DA32E]

ALTER TABLE LoaiSanPham 
	ADD FAX VARCHAR(20) 