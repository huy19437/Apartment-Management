USE quanlychungcu

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

create procedure psLoadComboBoxNhanVien
as
begin transaction
	select MANHANVIEN, MANHANVIEN + ' - ' + HOTEN as MANVHOTEN from NHANVIEN
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