USE quanlychungcu

create procedure psThongKeDichVu @THANG int, @NAM int
as
begin transaction
	select b.MACTHDDICHVU, TENDICHVU, MANHANVIEN, MAHOGD, MACANHO, NGAYIN, SOLUONG, DONGIA, TONGTIEN
	from DICHVU a, CTHDDICHVU b ,HOADONDICHVU c
	where a.MADICHVU = b.MADICHVU and b.MAHOADONDV = c.MAHOADONDV and MONTH(NGAYIN) = @THANG and YEAR(NGAYIN) = @NAM
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

create procedure psThongKeDichVuTheoNam @NAM int
as
begin transaction
	select b.MACTHDDICHVU, TENDICHVU, MANHANVIEN, MAHOGD, MACANHO, NGAYIN, SOLUONG, DONGIA, TONGTIEN
	from DICHVU a, CTHDDICHVU b ,HOADONDICHVU c
	where a.MADICHVU = b.MADICHVU and b.MAHOADONDV = c.MAHOADONDV and YEAR(NGAYIN) = @NAM
if (@@ERROR <> 0)
ROLLBACK TRANSACTION
else
COMMIT TRANSACTION

insert into DICHVU values('1', 'rac', 50000)
insert into DICHVU values('2', 'Wifi', 165000)
 
select * from HOADONNUOC
delete from HOADONNUOC where    MAHOADONNUOC='test4'

insert into CANHO values('4', 'vip', 'vippro','', 50000, 'da ban', 'bcd', 'K1', 'ho1')

insert into HOADONDICHVU values('1', 'abc', '1', 'ho1', '1', '1/1/2010', 55000, 'abc')
insert into HOADONDICHVU values('2', 'abc', '1', 'ho1', '1', '1/1/2010', 181500, 'abc')

insert into CTHDDICHVU values('1', 1, 50000, 'bcd', '1')
insert into CTHDDICHVU values('2', 1, 165000, 'abc', '2')

