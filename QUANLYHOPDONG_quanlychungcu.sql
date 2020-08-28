﻿Use quanlychungcu

CREATE PROCEDURE psThemMoiHopDong2 @MAHOPDONG NVARCHAR (10), @TENHOPDONG NVARCHAR (30), @LOAIHOPDONG NVARCHAR (10), @MACANHO NVARCHAR (10), @MANHANVIEN NVARCHAR (10), @MAHOGD NVARCHAR (10), @TONGTIEN float
AS 
BEGIN TRANSACTION
	IF EXISTS (Select * from HOPDONGGD where @MAHOPDONG = MAHOPDONG)
		return
	if exists (Select * from CANHO where @MACANHO = MACANHO and (TRANGTHAI = 'Đã bán' or TRANGTHAI = 'Đã thuê' ))
		begin
			print 'can ho co ng thuê'
			return 
		end
	else
		INSERT INTO HOPDONGGD VALUES (@MAHOPDONG,@TENHOPDONG,@LOAIHOPDONG,@MACANHO,@MANHANVIEN,@MAHOGD,@TONGTIEN)	
		begin
			if (@LOAIHOPDONG = 'Thuê')
			update CANHO set TRANGTHAI = 'Đã thuê' where @MaCanHo = MACANHO
			if (@LOAIHOPDONG = 'Mua')
				update CANHO set TRANGTHAI = 'Đã bán' where @MaCanHo = MACANHO
		END
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION

	
/*
begin
			if (@LOAIHOPDONG = 'Thuê')
			update CANHO set TRANGTHAI = 'Đã thuê' where @MaCanHo = MACANHO
			if (@LOAIHOPDONG = 'Mua')
				update CANHO set TRANGTHAI = 'Đã bán' where @MaCanHo = MACANHO
		END
*/

CREATE PROCEDURE psSuaHopDong @MAHOPDONG NVARCHAR (10), @TENHOPDONG NVARCHAR (30), @LOAIHOPDONG NVARCHAR (10), @MACANHO NVARCHAR (10), @MANHANVIEN NVARCHAR (10), @MAHOGD NVARCHAR (10),@TONGTIEN float
AS 
BEGIN TRANSACTION
	IF not EXISTS (Select * from HOPDONGGD where @MAHOPDONG = MAHOPDONG)
		return
	else
		UPDATE HOPDONGGD SET TENHOPDONG= @TENHOPDONG, 
							LOAIHOPDONG = @LOAIHOPDONG,MACANHO = @MACANHO,
							MANHANVIEN= @MANHANVIEN,
							MAHOGD = @MAHOGD,
							TONGTIEN = @TONGTIEN
						WHERE MAHOPDONG = @MAHOPDONG
		begin
			if (@LOAIHOPDONG = 'Thuê')
			update CANHO set TRANGTHAI = 'Đã thuê' where @MaCanHo = MACANHO
			if (@LOAIHOPDONG = 'Mua')
				update CANHO set TRANGTHAI = 'Đã bán' where @MaCanHo = MACANHO
		END
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION

CREATE PROCEDURE psXoaHopDong @MAHOPDONG NVARCHAR (10)
AS 
Declare @MaCanHo nvarchar (10)
BEGIN TRANSACTION
	IF not EXISTS (Select * from HOPDONGGD where @MAHOPDONG = MAHOPDONG)
		return
	else
		Begin
			update CANHO set TRANGTHAI = 'Trống' where @MaCanHo = MACANHO
		End
		DELETE FROM HOPDONGGD where MAHOPDONG = @MAHOPDONG
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION

CREATE PROCEDURE psTimHopDong @MAHOPDONG NVARCHAR (10)
AS 
BEGIN TRANSACTION
	Select HOPDONGGD.MAHOPDONG,NGAYKYHOPDONG,THOIHAN, GIATRI,LOAIHOPDONG,TENHOPDONG,MACANHO,NHANVIEN.MANHANVIEN,HOTEN,HOGIADINH.MAHOGD,TENCHUHO,NOIDUNG, HOPDONGGD.TONGTIEN
	From HOPDONGGD,CTHOPDONGGD,NHANVIEN,HOGIADINH
	Where HOPDONGGD.MAHOPDONG = CTHOPDONGGD.MAHOPDONG and (NHANVIEN.MANHANVIEN = HOPDONGGD.MANHANVIEN) and (HOGIADINH.MAHOGD = HOPDONGGD.MAHOGD) and (HOPDONGGD.MAHOPDONG = @MAHOPDONG)
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION

exec psTimHopDong 'HD1'

CREATE PROCEDURE psHienThiHopDong 
AS 
BEGIN TRANSACTION
	Select * from HOPDONGGD
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION


CREATE PROCEDURE psThemChiTietHopDong @MAHOPDONG NVARCHAR (10), @NGAYKYHOPDONG DATETIME , @THOIHAN NVARCHAR (10), @GIATRI FLOAT, @NOIDUNG NVARCHAR (50)
AS 
BEGIN TRANSACTION
		INSERT INTO CTHOPDONGGD VALUES (@MAHOPDONG,@NGAYKYHOPDONG,@THOIHAN, @GIATRI,@NOIDUNG)
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION




CREATE PROCEDURE psSuaChiTietHopDong @MAHOPDONG NVARCHAR (10), @NGAYKYHOPDONG DATETIME , @THOIHAN NVARCHAR (10), @GIATRI FLOAT, @NOIDUNG NVARCHAR (50)
AS 
BEGIN TRANSACTION
		if not exists (Select * from CTHOPDONGGD where MAHOPDONG = @MAHOPDONG)
			return
		else
			Update CTHOPDONGGD set MAHOPDONG = @MAHOPDONG, NGAYKYHOPDONG = @NGAYKYHOPDONG, THOIHAN= @THOIHAN, GIATRI = @GIATRI, NOIDUNG = @NOIDUNG where MAHOPDONG = @MAHOPDONG
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION


CREATE PROCEDURE psXoaCTHopDong @MAHOPDONG NVARCHAR (10)
AS 
BEGIN TRANSACTION
		if not exists (Select * from CTHOPDONGGD where MAHOPDONG = @MAHOPDONG)
			return
		else
			Delete from CTHOPDONGGD where MAHOPDONG = @MAHOPDONG
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION




CREATE PROCEDURE psTimCTHopDong @MAHOPDONG NVARCHAR (10)
AS 
BEGIN TRANSACTION
		Select * from CTHOPDONGGD where MAHOPDONG = @MAHOPDONG
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION





CREATE PROCEDURE psHienThiCTHopDong 
AS 
BEGIN TRANSACTION
		Select * from CTHOPDONGGD 
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION





CREATE PROCEDURE psHienThiHopDongVaChiTietHopDong
AS 
BEGIN TRANSACTION
		Select HOPDONGGD.MAHOPDONG,NGAYKYHOPDONG,THOIHAN, GIATRI,LOAIHOPDONG,TENHOPDONG,MACANHO,NHANVIEN.MANHANVIEN,HOTEN,HOGIADINH.MAHOGD,TENCHUHO,NOIDUNG, HOPDONGGD.TONGTIEN
		From HOPDONGGD,CTHOPDONGGD,NHANVIEN,HOGIADINH
		Where HOPDONGGD.MAHOPDONG = CTHOPDONGGD.MAHOPDONG and (NHANVIEN.MANHANVIEN = HOPDONGGD.MANHANVIEN) and (HOGIADINH.MAHOGD = HOPDONGGD.MAHOGD)
IF (@@ERROR <> 0)
ROLLBACK TRANSACTION
ELSE
COMMIT TRANSACTION





CREATE PROCEDURE psThemTongTienHopDong
    @MAHOPDONG NVARCHAR (10),
    @TONGTIEN       FLOAT
AS 
BEGIN TRANSACTION
		update HOPDONGGD set TONGTIEN=@TONGTIEN where MAHOPDONG = @MAHOPDONG
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

select * from NHANVIEN
select * from CANHO	
select * from HOPDONGGD
select * from CTHOPDONGGD

