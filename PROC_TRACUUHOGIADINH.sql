use quanlychungcu

create proc psHienThiDanhSachTraCuuTheoMaHoGD @MAHOGD NVARCHAR(10), @MAKHU NVARCHAR(10)
AS
BEGIN TRANSACTION
	SELECT HOGIADINH.MAHOGD, TENCHUHO, CANHO.MAKHU 
	FROM HOGIADINH, CANHO
	WHERE HOGIADINH.MAHOGD=CANHO.MAHOGD AND CANHO.MAKHU = @MAKHU AND HOGIADINH.MAHOGD=@MAHOGD
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

create PROC psHienThiDanhSachTraCuuTheoTenChuHo @TENCHUHO NVARCHAR(10), @MAKHU NVARCHAR(10)
AS
BEGIN TRANSACTION
	SELECT HOGIADINH.MAHOGD, TENCHUHO, CANHO.MAKHU 
	FROM HOGIADINH, CANHO
	WHERE HOGIADINH.MAHOGD=CANHO.MAHOGD AND CANHO.MAKHU = @MAKHU AND HOGIADINH.TENCHUHO=@TENCHUHO
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION



create PROC psHienThiDanhSachTraCuuTheoMaKhu @MAKHU NVARCHAR(10)
AS
BEGIN TRANSACTION
	SELECT HOGIADINH.MAHOGD, TENCHUHO, CANHO.MAKHU 
	FROM HOGIADINH, CANHO
	WHERE HOGIADINH.MAHOGD=CANHO.MAHOGD AND CANHO.MAKHU = @MAKHU
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

create PROCEDURE psHienThiDanhSachTraCuuHoGiaDinh @MAHOGD NVARCHAR(10), @TENCHUHO NVARCHAR(30), @MAKHU NVARCHAR(10)
AS
BEGIN TRANSACTION
	SELECT HOGIADINH.MAHOGD, TENCHUHO, KHU.MAKHU FROM HOGIADINH, CANHO, KHU WHERE HOGIADINH.MAHOGD=CANHO.MAHOGD AND CANHO.MAKHU=KHU.MAKHU AND HOGIADINH.MAHOGD=@MAHOGD AND TENCHUHO=@TENCHUHO AND KHU.MAKHU=@MAKHU
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION




create proc psHienThiHoGD
AS
BEGIN TRANSACTION
	select * from HOGIADINH 
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION




create proc psHienThiKhu
AS
BEGIN TRANSACTION
	select * from KHU 
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION
