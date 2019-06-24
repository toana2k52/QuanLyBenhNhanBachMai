/* Bảng sử dụng
	- Bảng quản lý
		+ Id
		+ Họ Tên
		+ Tài khoản
		+ Mật khẩu
		+ Ảnh
	
	- Bảng bác sĩ
		+ Id
		+ Họ tên
		+ Giới tính
		+ SDT
		+ Mã khoa
		+ Mã chức vụ
		+ Ảnh

	- Bảng khoa
		+ Id
		+ Tên khoa

	- Bảng chức vụ
		+ Id
		+ Tên chức vụ

	- Bảng dịch vụ
		+ Id
		+ Tên dịch vụ
		+ Giá
		+ Mã khoa

	- Bảng phòng
		+ id
		+ Loại phòng
		+ Giá

	- Bảng thuốc bán
		+ Id
		+ Tên thuốc
		+ Số lượng tồn
		+ Mã nhà phân phối
		+ Giá
	
	- Bảng thuốc BHYT
		+ Id
		+ Tên thuốc
		+ Số lượng tồn
		+ Mã nhà phân phối

	- Bảng nhà phân phối
		+ Id
		+ Tên công ty
		+ Tên thuốc

	- Bảng thuốc theo bệnh nhân
		+ Id
		+ Mã bệnh án
		+ Mã thuốc mua
		+ Số lượng
		+ Giá
		+ Mã thuốc BHYT
		+ Số lượng thuốc BHYT
		+ Trạng thái

	- Bảng dịch vụ theo bệnh nhân
		+ Id
		+ Mã bệnh án
		+ Mã dịch vụ
		+ Ngày thực hiện
		+ Giá
		+ Trạng thái

	- Bảng bệnh án
		+ Id
		+ Mã bệnh nhân
		+ Khoa
		+ Phòng
		+ Bác sĩ điều trị
		+ Bệnh chuẩn đoán

	- Bảng bệnh nhân
		+ Id
		+ Ngày nhập viện
		+ Tên bệnh nhân
		+ Giới tính
		+ Ngày sinh
		+ Địa chỉ
		+ SDT
		+ Quốc tịch
		+ Dân tộc
		+ Số CMND
		+ Số thẻ bhyt
		+ Chính sách
		+ Mã người nhà bệnh nhân

	- Bảng thông tin người nhà
		+ ID
		+ Tên
		+ Giới tính
		+ SDT
		+ Địa chỉ
		+ Quan hệ
	- Bảng xuất khoa
		+ ID
		+ Ngày xuất
		+ Tên bệnh nhân
		+ Tên người nhà
		+ Loại bệnh nhân
		+ Tình trạng
*/
-------------------------------------------------------
/* SQL */

create table quanly(
	id int primary key auto_increment,
	hoten varchar(100) not null,
	taikhoan varchar(100) not null,
	matkhau varchar(100) not null,
	anh varchar(200)
	);

create table bacsi(
	id int primary key auto_increment,
	hoten varchar(100) not null,
	gioitinh varchar(100) not null,
	sdt varchar(100) not null,
	khoa int not null,
	chucvu int not null,
	anh varchar(200)
	);

create table khoa(
	id int primary key auto_increment,
	tenkhoa varchar(100) not null
	);

create table chucvu(
	id int primary key auto_increment,
	tenchucvu varchar(100) not null
	);

create table dichvu(
	id int primary key auto_increment,
	tendichvu varchar(100) not null,
	gia float(15.3) not null,
	khoa int not null
	);

create table phong(
	id int primary key auto_increment,
	loaiphong varchar(100) not null,
	gia float(15.3) not null
	);

create table thuocban(
	id int primary key auto_increment,
	tenthuoc varchar(100) not null,
	soluongton int not null,
	nhaphanphoi int not null,
	gia float(15.3) not null
	);

create table thuocbhyt(
	id int primary key auto_increment,
	tenthuoc varchar(100) not null,
	soluongton int not null,
	nhaphanphoi int not null
	);

create table nhaphanphoi(
	id int primary key auto_increment,
	tencongty varchar(100) not null,
	tenthuoc varchar(100) not null
	);

create table thuoctheobenhnhan(
	id int primary key auto_increment,
	mabenhan int not null,
	thuocmua int not null,
	soluong int not null,
	gia float(15.3) not null,
	thuocbhyt int not null,
	soluongthuocbhyt int not null,
	trangtahi varchar(100) not null
	);

create table thuocbhyttheobenhnhan(
	id int primary key auto_increment,
	mabenhan int not null,
	thuocbhyt int not null,
	soluongthuocbhyt int not null,
	);
create table dichvutheobenhnhan(
	id int primary key auto_increment,
	mabenhan int not null,
	dichvu int not null,
	ngaythuchien datetime not null,
	gia float(15.3) not null,
	trangtahi varchar(100) not null
	);

create table benhan(
	id int primary key auto_increment,
	mabenhnhan int not null,
	khoa int not null,
	phong int not null,
	bacsi int not null,
	benhchuandoan varchar(400) not null
	);

create table benhnhan(
	id int primary key auto_increment,
	ngaynhapvien datetime not null,
	hoten varchar(100) not null,
	gioitinh varchar(100) not null,
	ngaysinh date not null,
	diachi varchar(200) not null,
	sdt varchar(100) not null,
	quoctich varchar(100) not null,
	dantoc varchar(100) not null,
	socmnd varchar(100) not null,
	sothebhyt varchar(100),
	chinhsach varchar(100) not null,
	nguoinha int not null
	);

create table nguoinha(
	id int primary key auto_increment,
	hoten varchar(100) not null,
	gioitinh varchar(100) not null,
	sdt varchar(100) not null,
	diachi varchar(200) not null,
	quanhe varchar(100) not null
	);

create table xuatkhoa(
	id int primary key auto_increment,
	ngayxuatvien date not null,
	benhnhan int not null,
	nguoinha int not null,
	diachi varchar(200) not null,
	sothebhyt varchar(100),
	chinhsach varchar(100) not null,
	trangthai varchar(100) not null
	);

/* Liên kết */

alter table thuocbhyt add foreign key FK_thuocbhyt_nhaphanphoi(nhaphanphoi) references nhaphanphoi(id);
alter table thuocban add foreign key FK_thuocban_nhaphanphoi(nhaphanphoi) references nhaphanphoi(id);

alter table benhan add foreign key FK_benhan_benhnhan(mabenhnhan) references benhnhan(id);
alter table benhan add foreign key FK_benhan_khoa(khoa) references khoa(id);
alter table benhan add foreign key FK_benhan_phong(phong) references phong(id);
alter table benhan add foreign key FK_benhan_bacsi(bacsi) references bacsi(id);

alter table bacsi add foreign key FK_bacsi_khoa(khoa) references khoa(id);
alter table bacsi add foreign key FK_bacsi_chucvu(chucvu) references chucvu(id);

alter table benhnhan add foreign key FK_benhnhan_nguoinha(nguoinha) references nguoinha(id);

alter table thuoctheobenhnhan add foreign key FK_thuoctheobenhnhan_benhan(mabenhan) references benhan(id);
alter table thuoctheobenhnhan add foreign key FK_thuoctheobenhnhan_thuocban(thuocmua) references thuocban(id);
alter table thuocbhyttheobenhnhan add foreign key FK_thuocbhyttheobenhnhan_thuocbhyt(thuocbhyt) references thuocbhyt(id);
alter table thuocbhyttheobenhnhan add foreign key FK_thuocbhyttheobenhnhan_benhan(mabenhan) references benhan(id);

alter table dichvutheobenhnhan add foreign key FK_dichvutheobenhnhan_benhan(mabenhan) references benhan(id);
alter table dichvutheobenhnhan add foreign key FK_dichvutheobenhnhan_dichvu(dichvu) references dichvu(id);
alter table dichvutheobenhnhan add foreign key FK_dichvutheobenhnhan_bacsi(bacsithuchien) references bacsi(id);

alter table dichvu add foreign key FK_dichvu_khoa(khoa) references khoa(id);

alter table xuatkhoa add foreign key FK_xuatkhoa_benhnhan(benhnhan) references benhnhan(id);

/* thêm dữ liệu*/
insert into khoa(tenkhoa) values('Khoa huyết học'),
	('Khoa hóa sinh'),
	('Khoa vi sinh'),
	('Khoa thần kinh'),
	('Khoa xét nghiệm'),
	('Khoa điều trị phục hồi');

insert into phong(tenphong,gia) values('A1',900000),
	('A2',800000),
	('A3',700000),
	('B1',600000),
	('B2',500000),
	('B3',400000),
	('C1',300000),
	('C2',200000),
	('C3',100000);

insert into chucvu(tenchucvu) values('Bác sĩ trưởng khoa'),
	('Bác sĩ'),
	('Điều dưỡng'),
	('Y tá');

insert into dichvu(tendichvu,gia,khoa) 
	values('Siêu âm lồng ngực', 450000, 2),
	('Chuph cắt lớp não', 750000, 5);

insert into bacsi(hoten,gioitinh,sdt,khoa,chucvu,anh) values('Dương Huy Toàn','Nam','0987654987',1,1,'C:\xampp\htdocs\QLBV_PHP_TTNM\img\bs\67DCHT20145.jpg'),
	('Đỗ Thành Trung','Nam','0645214752',2,2,'C:\xampp\htdocs\QLBV_PHP_TTNM\img\bs\67DCHT20145.jpg'),
	('Nguyễn Công Tuyến','Nam','0123654215',3,3,'C:\xampp\htdocs\QLBV_PHP_TTNM\img\bs\67DCHT20145.jpg'),
	('Vũ Công Ngọc','Nữ','0654125745',4,4,'C:\xampp\htdocs\QLBV_PHP_TTNM\img\bs\67DCHT20145.jpg'),
	('Trần Văn Lâm','Nữ','0312541287',5,2,'C:\xampp\htdocs\QLBV_PHP_TTNM\img\bs\67DCHT20145.jpg'),
	('Lê Đức Thành','Nam','0321564784',6,4,'C:\xampp\htdocs\QLBV_PHP_TTNM\img\bs\67DCHT20145.jpg'),
	('Hoàng Văn Lãm','Nữ','0954123697',7,3,'C:\xampp\htdocs\QLBV_PHP_TTNM\img\bs\67DCHT20145.jpg'),
	('Nguyễn Công Tuyến','Nam','0784512365',8,2,'C:\xampp\htdocs\QLBV_PHP_TTNM\img\bs\67DCHT20145.jpg');

insert into nhaphanphoi(tencongty,tenthuoc) values('Công ty TNHH Hoa Linh','Klamentin 1g'),
	('Công ty TNHH Hoa Linh','Amoxicillin 500'),
	('Công ty TNHH Hoa Linh','Penicilin'),
	('Công ty TNHH Hoa Linh','Methicilin'),
	('Công ty TNHH Hoa Linh','Ampicilline'),
	('Công ty TNHH Hoa Linh','Amoxicilline'),
	('Công ty TNHH Hoa Linh','Cloxacilline'),
	('Công ty TNHH Hoa Linh','Sultamicillin'),
	('Công ty TNHH Hoa Linh','Piperacilline'),
	('Công ty TNHH Hoa Linh','Imipenem');

insert into nhaphanphoi(tencongty,tenthuoc) values('Công ty TNHH Tuyến Tung Tăng','Cefadroxil'),
	('Công ty TNHH Tuyến Tung Tăng','Cephalexin'),
	('Công ty TNHH Tuyến Tung Tăng','Cefalothin'),
	('Công ty TNHH Tuyến Tung Tăng','Cephazolin'),
	('Công ty TNHH Tuyến Tung Tăng','Cefaclor'),
	('Công ty TNHH Tuyến Tung Tăng','Ceftazidime'),
	('Công ty TNHH Tuyến Tung Tăng','Cefotaxime'),
	('Công ty TNHH Tuyến Tung Tăng','Cefpodoxime'),
	('Công ty TNHH Tuyến Tung Tăng','Ceftriaxone');

insert into nhaphanphoi(tencongty,tenthuoc) values('Công ty TNHH Trung Cò','Tetracycline'),
	('Công ty TNHH Trung Cò','Doxycyline'),
	('Công ty TNHH Trung Cò','Clotetracyclin'),
	('Công ty TNHH Trung Cò','Oxytetracyclin'),
	('Công ty TNHH Trung Cò','Minocyclin'),
	('Công ty TNHH Trung Cò','hexacyclin');

insert into nhaphanphoi(tencongty,tenthuoc) values('Công ty TNHH Ngọc Phê Pha','Acid nalidixic'),
	('Công ty TNHH Trung Cò','lomefloxacin'),
	('Công ty TNHH Trung Cò','ciprofloxacin'),
	('Công ty TNHH Trung Cò','norfloxacin'),
	('Công ty TNHH Trung Cò','ofloxacin'),
	('Công ty TNHH Trung Cò','levofloxacin'),
	('Công ty TNHH Trung Cò','Gatifloxacin'),
	('Công ty TNHH Trung Cò','Moxifloxacin');

insert into nhaphanphoi(tencongty,tenthuoc) values('Công ty TNHH Lâm Thông Lãm','Sulfaguanidin'),
	('Công ty TNHH Lâm Thông Lãm','Sulfamethoxazol'),
	('Công ty TNHH Lâm Thông Lãm','Sulfadiazin'),
	('Công ty TNHH Lâm Thông Lãm','Sulfasalazin');

insert into thuocban(tenthuoc,soluongton,nhaphanphoi,gia) values('Klamentin 1g',241,1,23500),
	('Amoxicillin 500',351,2,24000),
	('Penicilin',270,3,73500),
	('Methicilin',81,4,3000),
	('Ampicilline',630,5,9500),
	('Amoxicilline',223,6,17000),
	('Cloxacilline',114,7,21000),
	('Sultamicillin',90,8,44500),
	('Piperacilline',26,9,1000),
	('Imipenem',13,10,23.6500);

insert into thuocban(tenthuoc,soluongton,nhaphanphoi,gia) values('Cefadroxil',27,11,65500),
	('Cephalexin',334,12,13500),
	('Cefalothin',77,13,73000),
	('Cephazolin',135,14,9500),
	('Cefaclor',240,15,15000),
	('Ceftazidime',21,16,35500),
	('Cefotaxime',361,17,8500),
	('Cefpodoxime',32,18,19000),
	('Ceftriaxone',69,19,21500);

insert into thuocban(tenthuoc,soluongton,nhaphanphoi,gia) values('Tetracycline',123,20,45000),
	('Doxycyline',75,21,7500),
	('Clotetracyclin',324,22,3500),
	('Oxytetracyclin',174,23,15000),
	('Minocyclin',49,24,37500),
	('hexacyclin',13,25,90500);

insert into thuocban(tenthuoc,soluongton,nhaphanphoi,gia) values('Acid nalidixic',68,26,1500),
	('lomefloxacin',354,27,36000),
	('ciprofloxacin',42,28,7000),
	('norfloxacin',15,29,6500),
	('ofloxacin',32,30,11500),
	('levofloxacin',48,31,13000),
	('Gatifloxacin',123,32,22000),
	('Moxifloxacin',483,33,27000);

insert into thuocban(tenthuoc,soluongton,nhaphanphoi,gia) values('Sulfaguanidin',154,34,32000),
	('Sulfamethoxazol',242,35,15000),
	('Sulfadiazin',12,36,3500),
	('Sulfasalazin',334,37,7000);


insert into thuocbhyt(tenthuoc,soluongton,nhaphanphoi) values('Klamentin 1g',241,1),
	('Amoxicillin 500',351,2),
	('Penicilin',270,3),
	('Methicilin',81,4),
	('Ampicilline',630,5),
	('Amoxicilline',223,6),
	('Cloxacilline',114,7),
	('Sultamicillin',90,8),
	('Piperacilline',26,9),
	('Imipenem',13,10);

insert into thuocbhyt(tenthuoc,soluongton,nhaphanphoi) values('Cefadroxil',27,11),
	('Cephalexin',334,12),
	('Cefalothin',77,13),
	('Cephazolin',135,14),
	('Cefaclor',240,15),
	('Ceftazidime',21,16),
	('Cefotaxime',361,17),
	('Cefpodoxime',32,18),
	('Ceftriaxone',69,19);

insert into thuocbhyt(tenthuoc,soluongton,nhaphanphoi) values('Tetracycline',123,20),
	('Doxycyline',75,21),
	('Clotetracyclin',324,22),
	('Oxytetracyclin',174,23),
	('Minocyclin',49,24),
	('hexacyclin',13,25);

insert into thuocbhyt(tenthuoc,soluongton,nhaphanphoi) values('Acid nalidixic',68,26),
	('lomefloxacin',354,27),
	('ciprofloxacin',42,28),
	('norfloxacin',15,29),
	('ofloxacin',32,30),
	('levofloxacin',48,31),
	('Gatifloxacin',123,32),
	('Moxifloxacin',483,33);

insert into thuocbhyt(tenthuoc,soluongton,nhaphanphoi) values('Sulfaguanidin',154,34),
	('Sulfamethoxazol',242,35),
	('Sulfadiazin',12,36),	
	('Sulfasalazin',334,37);

insert into nguoinha(hoten,gioitinh,sdt,diachi,quanhe) 
	values('Dương Huy Toàn', 'Nam', '0999988888','Hà Nội','Bạn của bố bệnh nhân');
insert into benhnhan(ngaynhapvien,hoten,gioitinh,ngaysinh,diachi,sdt,quoctich,dantoc,socmnd,sothebhyt,chinhsach,nguoinha) 
	values('2018/11/02','Đỗ Thành Trung','Nam','1998/11/13','Hà Nội','0111111123','Việt Nam','Kinh','0123456789','9876543210','Không',1);
insert into benhan(mabenhnhan,khoa,phong,bacsi,benhchuandoan) 
	values('1','5','A3','1','Tâm thần phân liệt');


insert into nguoinha(hoten,gioitinh,sdt,diachi,quanhe) 
	values('Dương Huy Toàn', 'Nam', '0999988888','Phú Thọ','Tù trưởng của bệnh nhân');
insert into benhnhan(ngaynhapvien,hoten,gioitinh,ngaysinh,diachi,sdt,quoctich,dantoc,socmnd,sothebhyt,chinhsach,nguoinha) 
	values('2018/11/03','Vũ Công Ngọc','Nữ','1998/06/09','Phú Thọ','0321321321','Việt Nam','Mèo','0123698741','','Dân Tộc',2);
insert into benhan(mabenhnhan,khoa,phong,bacsi,benhchuandoan) 
	values('2','3','B2','2','Ngã thềm lục địa: Gãy xương chậu, nứt 2 xương sườn');

insert into xuatkhoa(ngayxuatvien,benhnhan,nguoinha,diachi,sothebhyt,chinhsach,benhchuandoan,bacsidieutri,trangthai) 
	values('2018/11/12','1','1','Hà Nội','12396','Hộ nghèo','Gẫn xương đòn','1','Khỏi');

insert into dichvutheobenhnhan(mabenhan,dichvu,ngaythuchien) 
	values('3','2','2018/11/14');
insert into quanly(hoten,taikhoan,matkhau,anh) values ('Dương Huy Toàn','huytoan','toan','img/bs/67DCHT20145.jpg');
	);
/* Select */

Select bs.id,bs.hoten,bs.gioitinh,bs.sdt,k.tenkhoa as 'khoa' ,cv.tenchucvu as 'chucvu' from khoa k join (bacsi bs join chucvu cv on bs.chucvu = cv.id ) on bs.khoa = k.id;

Select tb.id, npp.tenthuoc as 'tenthuoc', tb.soluongton, npp.tencongty as 'tencongty', tb.gia from thuocban tb right join nhaphanphoi npp on tb.nhaphanphoi = npp.id;
Select tbhyt.id, npp.tenthuoc as 'tenthuoc', tbhyt.soluongton, npp.tencongty as 'tencongty' from thuocbhyt tbhyt right join nhaphanphoi npp on tbhyt.nhaphanphoi = npp.id;

SELECT MAX(id) FROM nguoinha;

Select bn.id,bn.ngaynhapvien,bn.hoten,bn.gioitinh,bn.ngaysinh,bn.diachi,bn.sdt,bn.quoctich,bn.dantoc,bn.socmnd,bn.sothebhyt,bn.chinhsach,nh.id as 'id_nh',nh.hoten as 'nguoinha', nh.gioitinh as 'goitinh_nh', nh.sdt as 'sdt_nh', nh.diachi as 'diachi_nh', nh.quanhe as 'quanhe' from benhnhan bn join nguoinha nh on bn.nguoinha = nh.id WHERE bn.id = 3;

UPDATE benhnhanSET socmnd='1111444477', sothebhyt='55555' WHERE id=47;

SELECT ba.id, bn.id as 'mabenhnhan', k.tenkhoa as 'khoa', p.tenphong as 'phong', bs.hoten as 'bacsi',ba.benhchuandoan FROM benhnhan bn join ( khoa k join (phong p join (bacsi bs join benhan ba on bs.id = ba.bacsi) on p.id = ba.phong )on k.id = ba.khoa) on bn.id = ba.mabenhnhan WHERE mabenhnhan = 3;





<?php 
  
  $conn = mysqli_connect('localhost','root','','benhnhannoitru');
  mysqli_set_charset($conn,'utf8');  ?>
  <?php if (isset($_POST['thembenhnhan'])) : ?>
    <?php  //Người nhà
    $hoten_nguoinha = $_POST['hoten_nguoinha'];
    $goitinh_nguoinha = $_POST['goitinh_nguoinha'];
    $sdt_nguoinha = $_POST['sdt_nguoinha'];
    $diachi_nguoinha = $_POST['diachi_nguoinha'];
    $quanhe_nguoinha = $_POST['quanhe_nguoinha'];

    $query_themnguoinha = mysqli_query($conn,"insert into nguoinha(hoten,gioitinh,sdt,diachi,quanhe) values('$hoten_nguoinha', '$goitinh_nguoinha', '$sdt_nguoinha','$diachi_nguoinha','$quanhe_nguoinha')");
    ?>
    <?php if ($query_themnguoinha) : ?>
      <?php  $query_layidnguoinha = mysqli_query($conn,"SELECT MAX(id) FROM nguoinha"); ?>
      <?php  foreach ($query_layidnguoinha as $id) : ?>
        <?php $idnguoinha = $id['MAX(id)']; ?>
        <?php endforeach; ?>
         <?php   //Bệnh nhân
          $ngaynhapvien = $_POST['ngaynhapvien'];
          $hoten_benhnhan = $_POST['hoten_benhnhan'];
          $goitinh_benhnhan = $_POST['goitinh_benhnhan'];
          $ngaysinh_benhnhan = $_POST['ngaysinh_benhnhan'];
          $diachi_benhnhan = $_POST['diachi_benhnhan'];
          $sdt_benhnhan = $_POST['sdt_benhnhan'];
          $quoctich = $_POST['quoctich'];
          $dantoc = $_POST['dantoc'];
          $socmnd = $_POST['socmnd'];
          $sobhyt = $_POST['sobhyt'];
          $chinhsach = $_POST['chinhsach'];

          $query_themmoibenhnhan = mysqli_query($conn,"insert into benhnhan(ngaynhapvien,hoten,gioitinh,ngaysinh,diachi,sdt,quoctich,dantoc,socmnd,sothebhyt,chinhsach,nguoinha) 
        values('$ngaynhapvien','$hoten_benhnhan','$goitinh_benhnhan','$ngaysinh_benhnhan','$diachi_benhnhan','$sdt_benhnhan','$quoctich','$dantoc','$socmnd','$sobhyt','$chinhsach',$idnguoinha)"); ?>
      <?php  if ($query_themmoibenhnhan) : ?>
          <?php $query_layidbenhnhan = mysqli_query($conn,"SELECT MAX(id) FROM benhnhan"); ?>
          <?php foreach ($query_layidbenhnhan as $id_bn) : ?>
            <?php $idbenhnhan = $id_bn['MAX(id)']; ?>
            <?php endforeach; ?>
            <?php  //Bệnh án
            $khoa = $_POST['khoa'];
            $phong = $_POST['phong'];
            $bacsi = $_POST['bacsi'];
            $chuandoanbenh = $_POST['chuandoanbenh'];

            $query_themmoibenhan = mysqli_query($conn,"insert into benhan(mabenhnhan,khoa,phong,bacsi,benhchuandoan) 
              values('$idbenhnhan','$khoa','$phong','$bacsi','$chuandoanbenh')"); ?>
            <?php if ($query_themmoibenhan) : ?>
                <script>
                    location.reload();
                </script>
            <?php endif; ?>
        <?php endif; ?>
    <?php endif; ?> 
  <?php endif; ?> 



  <?php 
  
  $conn = mysqli_connect('localhost','root','','benhnhannoitru');
  mysqli_set_charset($conn,'utf8');
  if (isset($_POST['thembenhnhan'])) {
    //Người nhà
    $hoten_nguoinha = $_POST['hoten_nguoinha'];
    $goitinh_nguoinha = $_POST['goitinh_nguoinha'];
    $sdt_nguoinha = $_POST['sdt_nguoinha'];
    $diachi_nguoinha = $_POST['diachi_nguoinha'];
    $quanhe_nguoinha = $_POST['quanhe_nguoinha'];

    $query_themnguoinha = mysqli_query($conn,"insert into nguoinha(hoten,gioitinh,sdt,diachi,quanhe) values('$hoten_nguoinha', '$goitinh_nguoinha', '$sdt_nguoinha','$diachi_nguoinha','$quanhe_nguoinha')");
    if ($query_themnguoinha) {
      $query_layidnguoinha = mysqli_query($conn,"SELECT MAX(id) FROM nguoinha");
      foreach ($query_layidnguoinha as $id) {
        $idnguoinha = $id['MAX(id)'];
        }
          //Bệnh nhân
          $ngaynhapvien = $_POST['ngaynhapvien'];
          $hoten_benhnhan = $_POST['hoten_benhnhan'];
          $goitinh_benhnhan = $_POST['goitinh_benhnhan'];
          $ngaysinh_benhnhan = $_POST['ngaysinh_benhnhan'];
          $diachi_benhnhan = $_POST['diachi_benhnhan'];
          $sdt_benhnhan = $_POST['sdt_benhnhan'];
          $quoctich = $_POST['quoctich'];
          $dantoc = $_POST['dantoc'];
          $socmnd = $_POST['socmnd'];
          $sobhyt = $_POST['sobhyt'];
          $chinhsach = $_POST['chinhsach'];

          $query_themmoibenhnhan = mysqli_query($conn,"insert into benhnhan(ngaynhapvien,hoten,gioitinh,ngaysinh,diachi,sdt,quoctich,dantoc,socmnd,sothebhyt,chinhsach,nguoinha) 
        values('$ngaynhapvien','$hoten_benhnhan','$goitinh_benhnhan','$ngaysinh_benhnhan','$diachi_benhnhan','$sdt_benhnhan','$quoctich','$dantoc','$socmnd','$sobhyt','$chinhsach',$idnguoinha)");
      if ($query_themmoibenhnhan) {
          $query_layidbenhnhan = mysqli_query($conn,"SELECT MAX(id) FROM benhnhan");
          foreach ($query_layidbenhnhan as $id_bn) {
            $idbenhnhan = $id_bn['MAX(id)'];
            }
            //Bệnh án
            $khoa = $_POST['khoa'];
            $phong = $_POST['phong'];
            $bacsi = $_POST['bacsi'];
            $chuandoanbenh = $_POST['chuandoanbenh'];

            $query_themmoibenhan = mysqli_query($conn,"insert into benhan(mabenhnhan,khoa,phong,bacsi,benhchuandoan) 
              values('$idbenhnhan','$khoa','$phong','$bacsi','$chuandoanbenh')");
            if ($query_themmoibenhan) {
              header('location: nhapvien.php');              }
        }
    }
  }

 ?>