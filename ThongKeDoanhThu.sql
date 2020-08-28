use quanlychungcu

create procedure psThongKeDoanhThu @THANG int, @NAM int
as
begin transaction
	declare @TongTienDichVu float
	declare @TongTienDien float
	declare @TongTienNuoc float
	set @TongTienDichVu = (select SUM(TONGTIEN)
	from HOADONDICHVU
	where MONTH(NGAYIN) = @THANG and YEAR(NGAYIN) = @NAM)
	set @TongTienDien = (select SUM(TONGTIEN)
	from HOADONDIEN
	where MONTH(NGAYIN) = @THANG and YEAR(NGAYIN) = @NAM)
	set @TongTienNuoc = (select SUM(TONGTIEN)
	from HOADONNUOC
	where MONTH(NGAYIN) = @THANG and YEAR(NGAYIN) = @NAM)
	select @TongTienDichVu, @TongTienDien, @TongTienNuoc
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

create procedure psThongKeDoanhThuTheoNam @NAM int
as
begin transaction
	declare @TongTienDichVu float
	declare @TongTienDien float
	declare @TongTienNuoc float
	set @TongTienDichVu = (select SUM(TONGTIEN)
	from HOADONDICHVU
	where YEAR(NGAYIN) = @NAM)
	set @TongTienDien = (select SUM(TONGTIEN)
	from HOADONDIEN
	where YEAR(NGAYIN) = @NAM)
	set @TongTienNuoc = (select SUM(TONGTIEN)
	from HOADONNUOC
	where YEAR(NGAYIN) = @NAM)
	select @TongTienDichVu, @TongTienDien, @TongTienNuoc
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION


psThongKeDoanhThu 1, 2010

psThongKeDoanhThuTheoNam 2010