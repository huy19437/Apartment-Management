USE quanlychungcu

create procedure psHienThiDanhSachDichVu
as
begin transaction
	select * from DICHVU
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION


create procedure psThemDichVu @MADICHVU NVARCHAR(10),  @TENDICHVU NVARCHAR(30), @GIADICHVU FLOAT
as
begin transaction
	if exists (select * from DICHVU where MADICHVU = @MADICHVU )
		return
	else
		insert into DICHVU values (@MADICHVU, @TENDICHVU, @GIADICHVU)
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION


create procedure psXoaDichVu @MADICHVU NVARCHAR(10)
as
begin transaction
		delete from DICHVU where MADICHVU = @MADICHVU		
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION


create procedure psSuaDichVu @MADICHVU NVARCHAR(10),  @TENDICHVU NVARCHAR(30), @GIADICHVU FLOAT
as
begin transaction
	if not exists (select * from DICHVU where MADICHVU = @MADICHVU)
		return
	else
		update DICHVU set TENDICHVU=@TENDICHVU, GIADICHVU=@GIADICHVU where MADICHVU=@MADICHVU
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION


create procedure psTimKiemDichVuTheoTenDichVu @MADICHVU nvarchar(10)
as
begin transaction
	select * from DICHVU where MADICHVU = @MADICHVU
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION
