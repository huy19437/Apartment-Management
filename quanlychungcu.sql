﻿alter authorization on database::quanlychungcu to [DESKTOP-Y530\Administrator];
drop database quanlychungcu
create database quanlychungcu
USE quanlychungcu
GO
DROP DATABASE quanlychungcu
CREATE TABLE QUYEN(IDQUYEN NVARCHAR(10) PRIMARY KEY, TENQUYEN NVARCHAR(30))

CREATE TABLE PHONGBAN(MAPHONGBAN NVARCHAR(10) PRIMARY KEY, TENPHONGBAN NVARCHAR(30))

CREATE TABLE NHANVIEN(MANHANVIEN NVARCHAR(10) PRIMARY KEY, HOTEN NVARCHAR(30), GIOITINH NVARCHAR(10), DIACHI NVARCHAR(50),
 SDT NVARCHAR(10) UNIQUE, NGAYSINH DATE, EMAIL NVARCHAR(30) UNIQUE, SOCMND NVARCHAR(18) UNIQUE, 
 HINHANH IMAGE, MAPHONGBAN NVARCHAR(10) REFERENCES PHONGBAN)

 
CREATE TABLE DANGNHAP(MANHANVIEN NVARCHAR(10) PRIMARY KEY REFERENCES NHANVIEN, TENDANGNHAP NVARCHAR(30) UNIQUE, MATKHAU NVARCHAR(20),
 IDQUYEN NVARCHAR(10) references QUYEN)

CREATE TABLE KHU(MAKHU NVARCHAR(10) PRIMARY KEY, TENKHU NVARCHAR(10))


CREATE TABLE HOGIADINH(MAHOGD NVARCHAR(10) PRIMARY KEY, TENCHUHO NVARCHAR(30), SOCMND NVARCHAR(18) UNIQUE, SOLUONGTV INT)



CREATE TABLE CANHO(MACANHO NVARCHAR(10) PRIMARY KEY, TENCANHO NVARCHAR(20), LOAICANHO NVARCHAR(10), HINHANH IMAGE, GIACANHO FLOAT,
 TRANGTHAI NVARCHAR(30), GHICHU NVARCHAR(50), MAKHU NVARCHAR(10) REFERENCES KHU, MAHOGD NVARCHAR(10) REFERENCES HOGIADINH)

CREATE TABLE HOPDONGGD(MAHOPDONG NVARCHAR(10) PRIMARY KEY, TENHOPDONG NVARCHAR(30), LOAIHOPDONG NVARCHAR(10),
 MACANHO NVARCHAR(10) REFERENCES CANHO, MANHANVIEN NVARCHAR(10) REFERENCES NHANVIEN, MAHOGD NVARCHAR(10) REFERENCES HOGIADINH, TONGTIEN FLOAT)


CREATE TABLE CTHOPDONGGD(MACTHOPDONG INT IDENTITY(1,1) PRIMARY KEY, MAHOPDONG NVARCHAR(10) REFERENCES HOPDONGGD UNIQUE,
 NGAYKYHOPDONG DATE, THOIHAN NVARCHAR(10), GIATRI FLOAT, NOIDUNG NVARCHAR(50))

CREATE TABLE THANHVIENHOGD(MATHANHVIEN NVARCHAR(10) PRIMARY KEY, HOTENTHANHVIEN NVARCHAR(30), GIOITINHTV NVARCHAR(10), 
SOCMND NVARCHAR(18) UNIQUE, NGAYSINH DATE, SDT NVARCHAR(10) UNIQUE, EMAIL NVARCHAR(30) UNIQUE,
 HINHANH IMAGE, MAHOGD NVARCHAR(10) REFERENCES HOGIADINH)

CREATE TABLE DICHVU(MADICHVU NVARCHAR(10) PRIMARY KEY,  TENDICHVU NVARCHAR(30), GIADICHVU FLOAT)

CREATE TABLE HOADONDICHVU(MAHOADONDV NVARCHAR(10) PRIMARY KEY, TENHOADON NVARCHAR(30), MANHANVIEN NVARCHAR(10) REFERENCES NHANVIEN,
 MAHOGD NVARCHAR(10) REFERENCES HOGIADINH, MACANHO NVARCHAR(10) REFERENCES CANHO, NGAYIN DATETIME, TONGTIEN FLOAT,
  GHICHU NVARCHAR(30))

CREATE TABLE CTHDDICHVU(MACTHDDICHVU INT IDENTITY(1,1) PRIMARY KEY, MAHOADONDV NVARCHAR(10) REFERENCES HOADONDICHVU UNIQUE,
 SOLUONG INT, DONGIA FLOAT, GHICHU NVARCHAR(50), MADICHVU NVARCHAR(10) REFERENCES DICHVU)

CREATE TABLE HOADONDIEN(MAHOADONDIEN NVARCHAR(10) PRIMARY KEY, TENHOADON NVARCHAR(30), MANHANVIEN NVARCHAR(10) REFERENCES NHANVIEN, 
MAHOGD NVARCHAR(10) REFERENCES HOGIADINH, MACANHO NVARCHAR(10) REFERENCES CANHO,
 NGAYIN DATETIME, TONGTIEN FLOAT, GHICHU NVARCHAR(50))


CREATE TABLE CTHDDIEN(MACTHDDIEN INT IDENTITY(1,1) PRIMARY KEY, MAHOADONDIEN NVARCHAR(10) REFERENCES HOADONDIEN UNIQUE, 
SOLUONG INT, DONGIA FLOAT, GHICHU NVARCHAR(50))


CREATE TABLE HOADONNUOC(MAHOADONNUOC NVARCHAR(10) PRIMARY KEY, TENHOADON NVARCHAR(30), MANHANVIEN NVARCHAR(10) REFERENCES NHANVIEN,
 MAHOGD NVARCHAR(10) REFERENCES HOGIADINH, MACANHO NVARCHAR(10) REFERENCES CANHO,
  NGAYIN DATETIME, TONGTIEN FLOAT, GHICHU NVARCHAR(50))



CREATE TABLE CTHDNUOC(MACTHDNUOC INT IDENTITY(1,1) PRIMARY KEY, MAHOADONNUOC NVARCHAR(10) REFERENCES HOADONNUOC UNIQUE, 
SOLUONG INT, DONGIA FLOAT, GHICHU NVARCHAR(50))



CREATE TABLE BAIGIUXE(MABAIGIUXE NVARCHAR(10) PRIMARY KEY, LOAIXE NVARCHAR(10))
 
CREATE TABLE XE(MAXE NVARCHAR(10) PRIMARY KEY, BIENSO NVARCHAR(10) UNIQUE, HANGXE NVARCHAR(30), LOAIXE NVARCHAR(10),
 MAUXE NVARCHAR(10), MATHANHVIEN NVARCHAR(10) REFERENCES THANHVIENHOGD, MANHANVIEN NVARCHAR(10) REFERENCES NHANVIEN, 
 MABAIGIUXE NVARCHAR(10) REFERENCES BAIGIUXE, MATHEXE NVARCHAR(10) UNIQUE)

CREATE TABLE NGUOILA(MANGUOILA NVARCHAR(10) PRIMARY KEY, SOCMND NVARCHAR(18) UNIQUE)

CREATE TABLE QUANLYBAIGIUXE(MAXE NVARCHAR(10) REFERENCES XE, MABAIGIUXE NVARCHAR(10) REFERENCES BAIGIUXE,
 MANHANVIEN NVARCHAR(10) REFERENCES NHANVIEN, THOIGIANVAO DATETIME, THOIGIANRA DATETIME, 
 MANGUOILA NVARCHAR(10) REFERENCES NGUOILA, CONSTRAINT KIEMTRA_NGAY CHECK (THOIGIANRA > THOIGIANVAO))

Drop table QUYEN, PHONGBAN, NHANVIEN, DANGNHAP, KHU, HOGIADINH, CANHO, HOPDONGGD, CTHOPDONGGD, THANHVIENHOGD, DICHVU,
 HOADONDICHVU, CTHDDICHVU, HOADONDIEN, CTHDDIEN, HOADONNUOC, CTHDNUOC, BAIGIUXE, XE, NGUOILA, QUANLYBAIGIUXE

insert into QUYEN values('ADMIN', 'Quyen Admin')
insert into QUYEN values('QUANLY', 'Quyen Quan Ly')
insert into QUYEN values('NHANVIEN', 'Quyen Nhan Vien')

insert into PHONGBAN values('1','Giam doc')
insert into PHONGBAN values('2','Quan ly nhan luc')
insert into PHONGBAN values('3','Nhan luc')

insert into NHANVIEN values('1', 'Phan Tuan Anh', 'Nam', 'Tam Ky', '0396355253', '06/12/1999', 'phantuananhltt@gmail.com',
 '206321161', '', '1')
insert into NHANVIEN values('2', 'Le Thi Diem Quynh', 'Nữ', 'Dien Ban', '0123456789', '04/21/1999', 'diemquynh@gmail.com',
 '123456789', '', '2')
insert into NHANVIEN values('3', 'Nguyen Duc Huy', 'Nam', 'Da Nang', '0234567891', '06/17/1999', 'nguyenduchuy@gmail.com',
 '234567891', '', '2')
insert into NHANVIEN values('4', 'Vo Thi Quynh Nhung', 'Nữ', 'Da Nang', '0345678912', '03/17/1999', 'quynhnhung@gmail.com',
 '345678912', '', '3')
insert into NHANVIEN values('5', 'test', 'Nữ', 'Da Nang', '12345', '03/17/1999', 'test@gmail.com',
 '9999', '', '3')



 select * from CANHO
 DROP TABLE CANHO


 select * from NHANVIEN
 select * from QUYEN
 select * from DANGNHAP
 select * from KHU


insert into HOGIADINH values('ho1','tenchu1','1111','4')
insert into HOGIADINH values('ho2','tenchu2','2222','4')

insert into KHU values('makhu1','tenkhu1')

insert into DANGNHAP values('1', 'tuananh', '1206', 'ADMIN')
insert into DANGNHAP values('2', 'diemquynh', '2104', 'QUANLY')
insert into DANGNHAP values('3', 'duchuy', '1706', 'QUANLY')
insert into DANGNHAP values('4', 'quynhnhung', '1703', 'NHANVIEN')


create procedure psDangNhap @TENDANGNHAP nvarchar(30), @MATKHAU nvarchar(20), @IDQUYEN nvarchar(10)
as
begin transaction
	select count(*)
	from DANGNHAP
	where TENDANGNHAP = @TENDANGNHAP and MATKHAU = @MATKHAU and IDQUYEN = @IDQUYEN
if (@@ERROR <>0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

create procedure psDoiMatKhau @TENDANGNHAP nvarchar(30), @MATKHAUCU nvarchar(20), @MATKHAUMOI nvarchar(20),
@XACNHANMATKHAUMOI nvarchar(20)
as
begin transaction
	update DANGNHAP set MATKHAU = @MATKHAUMOI where MATKHAU = @MATKHAUCU and @MATKHAUMOI = @XACNHANMATKHAUMOI and TENDANGNHAP = @TENDANGNHAP
if (@@ERROR <>0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

create procedure psThemTaiKhoan @MANHANVIEN nvarchar(10), @TENDANGNHAP nvarchar(30), @MATKHAU nvarchar(20), @IDQUYEN nvarchar(10)
as
begin transaction
	if exists (select * from DANGNHAP where @MANHANVIEN = MANHANVIEN or @TENDANGNHAP = TENDANGNHAP)
		return
	else
		insert into DANGNHAP values (@MANHANVIEN, @TENDANGNHAP, @MATKHAU, @IDQUYEN)
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

create procedure psXoaTaiKhoan @TENDANGNHAP nvarchar(30)
as
begin transaction
	if ((select count(*) from DANGNHAP where IDQUYEN = 'ADMIN') = 1)
		delete from DANGNHAP where TENDANGNHAP = @TENDANGNHAP and IDQUYEN != 'ADMIN'
	else
		delete from DANGNHAP where TENDANGNHAP = @TENDANGNHAP		
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

create procedure psSuaTaiKhoan @MANHANVIEN nvarchar(10), @TENDANGNHAP nvarchar(30), @MATKHAU nvarchar(20), @IDQUYEN nvarchar(10)
as
begin transaction
		if (((select count(*) from DANGNHAP where IDQUYEN = 'ADMIN') = 1) and (@IDQUYEN = 'QUANLY' or @IDQUYEN = 'NHANVIEN'))
			return
		else
			update DANGNHAP set TENDANGNHAP = @TENDANGNHAP, MATKHAU = @MATKHAU, IDQUYEN = @IDQUYEN where MANHANVIEN = @MANHANVIEN
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

select * from dangnhap

create procedure psTimKiemTaiKhoan @TENDANGNHAP nvarchar(30)
as
begin transaction
	select * from DANGNHAP where TENDANGNHAP = @TENDANGNHAP
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

create procedure psHienThiDanhSachTaiKhoan
as
begin transaction
	select * from DANGNHAP
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION



create procedure psHienThiNhanVien 
as
begin transaction
	select * from NHANVIEN
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

psHienThiNhanVien
create procedure psHienThiQuyen
as
begin transaction
	select * from QUYEN
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION



