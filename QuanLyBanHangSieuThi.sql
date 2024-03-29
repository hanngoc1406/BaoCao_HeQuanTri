CREATE DATABASE QuanLyBanHangSieuThi

USE QuanLyBanHangSieuThi

CREATE TABLE NhanVien (
    MaNhanVien CHAR(7) NOT NULL PRIMARY KEY,
    TenNhanVien NVARCHAR(50),
    ChucVu NVARCHAR(30),
    NgaySinh DATE,
    NgayDauLamViec DATE,
    DiaChi NVARCHAR(30),
    ThanhPho NVARCHAR(20),
    QuocGia NVARCHAR(20),
    SoDienThoai NVARCHAR(10),
    TaiKhoan NVARCHAR(30),
    MatKhau NVARCHAR(30)
);

CREATE TABLE NhaCungCap (
    MaNhaCungCap CHAR(7) NOT NULL PRIMARY KEY,
    TenCongTy NVARCHAR(20),
    TenNguoiDaiDien NVARCHAR(50),
    ChucVu NVARCHAR(30),
    SoDienThoai VARCHAR(10),
    DiaChi NVARCHAR(30),
    ThanhPho NVARCHAR(20),
    QuocGia NVARCHAR(20),
);

CREATE TABLE DanhMucSanPham (
    MaDanhMuc CHAR(7) NOT NULL PRIMARY KEY,
    TenDanhMuc NVARCHAR(50),
    Mota NVARCHAR(225)
);

CREATE TABLE SanPham (
    MaSanPham CHAR(7) NOT NULL PRIMARY KEY,
    TenSanPham VARCHAR(50),
    MaDanhMuc CHAR(7),
    DonGia MONEY,
    SoLuongTonKho INT,
    SoLuongDaBan INT,
    MaNhaCungCap CHAR(7),
    FOREIGN KEY (MaDanhMuc) REFERENCES DanhMucSanPham(MaDanhMuc),
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
);

CREATE TABLE GiaoHang (
    MaNguoiGiaoHang CHAR(7) NOT NULL PRIMARY KEY,
    TenNguoiGiaoHang NVARCHAR(50),
    SoDienThoai NVARCHAR(10),
    NgaySinh DATE
);

CREATE TABLE KhachHang (
    MaKhachHang CHAR(7) NOT NULL PRIMARY KEY,
    TenKhachHang VARCHAR(50),
    NgaySinh DATE,
    SoDienThoai NVARCHAR(10),
    DiaChi NVARCHAR(30),
    ThanhPho NVARCHAR(20),
    QuocGia NVARCHAR(20),
);

CREATE TABLE HoaDon (
    MaHoaDon CHAR(7) NOT NULL PRIMARY KEY,
    MaKhachHang CHAR(7),
    MaNhanVien CHAR(7),
    NgayDat DATE,
    NgayYeuCauGiao DATE,
    NgayGiao DATE,
    MaNguoiGiaoHang CHAR(7),
    DiaChi NVARCHAR(30),
    ThanhPho NVARCHAR(20),
    QuocGia NVARCHAR(20),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaNguoiGiaoHang) REFERENCES GiaoHang(MaNguoiGiaoHang)
);

-- Là bảng trung gian đế nối giữa bảng hóa đơn và sản phẩm
CREATE TABLE ChiTietHoaDon (
    MaChiTietHoaDon CHAR(7) NOT NULL PRIMARY KEY,
    MaHoaDon CHAR(7),
    MaSanPham CHAR(7),
    DonGia MONEY,
    SoLuong INT,
    GiamGia DECIMAL(5, 2),
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

INSERT INTO NhanVien 
VALUES
('NV001', 'Phan Anh Duc', 'Quan ly', '19900527', '20150517', 'Ha Dong', 'Ha Noi', 'Vietnam','0457635894', 'ducpa', 'password@123'),
('NV002', 'Thai Cao Thien Dat', 'Nhan vien', '19910617', '20160517', 'Dong Da', 'Ha Noi', 'Vietnam', '0856347856', 'dattct', 'password@123'),
('NV003', 'Phan Huy Nguyen', 'Nhan vien', '19901028', '20151017', 'Dong Anh', 'Ha Noi', 'Vietnam', '0946523744', 'nguyenph', 'password@123'),
('NV004', 'Nguyen Thu Huyen', 'Nhan vien', '19891212', '20160727', 'Le Hong Phong', 'Nam Dinh', 'Vietnam', '0783423654', 'huyennt', 'password@123'),
('NV005', 'Pham Hong Anh', 'Nhan vien', '19930210', '20170521', 'Me Linh', 'Ha Noi', 'Vietnam', '0836574856', 'anhph', 'password@123'),
('NV006', 'Nguyen Hoang Anh', 'Nhan vien', '19900317', '20150830', 'Kien Xuong', 'Thai Binh', 'Vietnam', '0864753483', 'anhnh', 'password@123'),
('NV007', 'Do Dinh Thang', 'Ke toan', '19891223', '20150101', 'Kien Giang', 'Bac Giang', 'Vietnam', '0984672388', 'thangdd', 'password@123'),
('NV008', 'Nguyen Quang Huy', 'Nhan vien', '19880719', '20141215', 'Soc Son', 'Ha Noi', 'Vietnam', '0974562311', 'huynq', 'password@123'),
('NV009', 'Nguyen Ngoc Quynh Chau', 'Quan ly', '19901021', '20141225', 'Ha Dong', 'Ha Noi', 'Vietnam', '0178455688', 'chaunnq', 'password@123');

INSERT INTO NhaCungCap 
VALUES
('NCC001', 'VinaMilk', 'Mai Kieu Lien', 'Tong Giam Doc', '0973456784', '62 Le Duan', 'Ho Chi Minh', 'Vietnam'),
('NCC002', 'Vissan', 'Jimmy Tran', 'Quan Ly Ban Hang', '0984563452', '78 Le Duc Tho', 'Hai Phong', 'Vietnam'),
('NCC003', 'Habeco', 'Nguyen Hao Quang', 'Truong Phong Sales', '0784563487', '34 Lang Ha', 'Ha Noi', 'Vietnam'),
('NCC004', 'Masan', 'Nguyen Dang Quang', 'Pho Giam Doc', '0783456732', 'Lo 22 Dai An', 'Hai Duong', 'Vietnam'),
('NCC005', 'Vinataba', 'Dinh Thanh Duong', 'Tong Giam Doc', '0976456234', '83A Phu Dien', 'Ha Noi', 'Vietnam'),
('NCC006', 'TaBaShi', 'Monogoto Ajuhashi', 'Pho Phong Xuat Khau', '0134657488', '35 Shibuya', 'Kyoto', 'Japan'),
('NCC007', 'TalyHouse', 'Nguyen Thu Huyen', 'Chu Tich HDQT', '0967453899', '12 Chua Boc', 'Ha Noi', 'Vietnam'),
('NCC008', 'RubyNoo', 'Ngo Hong Ngoc', 'Ke Toan Truong', '0983658877', '97 Dong Anh', 'Binh Dinh', 'Vietnam'),
('NCC009', 'Amore Pacific', 'Tommy Bui', 'Dai Dien Sales', '0765345782', '257 ShinCheon', 'Seoul', 'Korea'),
('NCC010', 'HongHa', 'Nguyen Thanh', 'Truong Phong Marketing', '0983499881', '11 Van Quan', 'Hue', 'Vietnam');

INSERT INTO DanhMucSanPham 
VALUES
('1', 'Hang mat', 'sua chua, vang sua, bo, pho mai, do trang mieng, xuc xich'),
('2', 'Hang dong lanh', 'kem, thuy san, hai san, thit dong'),
('3', 'Thuc pham kho', 'dau, gia vi, rong bien, gao, sua bot, ngu coc, mi tom'),
('4', 'Do uong', 'bia, ruou, nuoc ngot, do uong nong'),
('5', 'Banh keo', 'banh quy, socola, keo deo, thach'),
('6', 'Thuoc la', 'thuoc la noi, thuoc la ngoai'),
('7', 'Gia dung', 'gom xu, thuy tinh, dung cu nha bep, dung cu lau chui, dung cu nau nuong'),
('8', 'Van phong pham', 'sach, truyen, dung cu hoc tap, dung cu van phong, do choi, phu kien'),
('9', 'Thoi trang', 'khan, khau trang, giay dep, quan ao'),
('10', 'My pham', 'trang diem, cham soc toc, cham soc da, nuoc hoa, cham soc rang mieng'),
('11', 'Hoa pham', 'bot giat, nuoc tay rua, khu mui, diet con trung'),
('12', 'Giay va bong', 'giay an, bang ve sinh, khan uot, giay ve sinh');

INSERT INTO SanPham 
VALUES
('SP01', 'sua chua', '1', 24000, 37, 66, 'NCC001'),
('SP02', 'vang sua', '1', 50000, 23, 16, 'NCC001'),
('SP03', 'bo', '1', 215000, 13, 3, 'NCC001'),
('SP04', 'pho mai', '1', 76000, 24, 12, 'NCC001'),
('SP05', 'do trang mieng', '1', 64000, 34, 17, 'NCC001'),
('SP06', 'xuc xich', '1', 55000, 21, 6, 'NCC001'),
('SP07', 'kem', '2', 65000, 56, 15, 'NCC002'),
('SP08', 'thuy san', '2', 230000, 12, 6, 'NCC002'),
('SP09', 'hai san', '2', 240000, 11, 5, 'NCC002'),
('SP10', 'thit dong', '2', 100000, 14, 8, 'NCC002'),
('SP11', 'dau', '3', 15000, 25, 74, 'NCC002'),
('SP12', 'gia vi', '3', 123000, 35, 14, 'NCC002'),
('SP13', 'rong bien', '3', 32000, 45, 32, 'NCC002'),
('SP14', 'gao', '3', 120000, 32, 4, 'NCC002'),
('SP15', 'sua bot', '3', 201000, 13, 9, 'NCC002'),
('SP16', 'ngu coc', '3', 84000, 66, 6, 'NCC002'),
('SP17', 'mi tom', '3', 132000 , 59, 5, 'NCC002'),
('SP18', 'bia', '4', 216500, 23, 4, 'NCC003'),
('SP19', 'ruou', '4', 422000, 14, 3, 'NCC003'),
('SP20', 'nuoc ngot', '4', 90000, 34, 11, 'NCC003'),
('SP21', 'do uong nong', '4', 55000, 34, 29, 'NCC003'),
('SP22', 'banh quy', '5', 64000, 32, 21, 'NCC004'),
('SP23', 'socola', '5', 85400, 13, 5, 'NCC004'),
('SP24', 'keo deo', '5', 13000, 45, 35, 'NCC004'),
('SP25', 'thach', '5', 35400, 56, 16, 'NCC004'),
('SP26', 'thuoc la noi', '6', 71265, 23, 1, 'NCC005'),
('SP27', 'thuoc la ngoai', '6', 215500, 9, 4, 'NCC005'),
('SP28', 'gom xu', '7', 225600, 15, 1, 'NCC006'),
('SP29', 'dung cu nha bep', '7', 480100, 31, 6, 'NCC006'),
('SP30', 'dung cu lau chui', '7', 74300, 15, 14, 'NCC006'),
('SP31', 'dung cu nau nuong', '7', 625000, 12, 8, 'NCC006'),
('SP32', 'sach', '8', 188350, 98, 2, 'NCC007'),
('SP33', 'dung cu hoc tap', '8', 60500, 45, 26, 'NCC007'),
('SP34', 'dung cu van phong', '8', 1350000, 23, 4, 'NCC007'),
('SP35', 'do choi', '8', 158000, 54, 6, 'NCC007'),
('SP36', 'phu kien', '8', 199000, 54, 4, 'NCC007'),
('SP37', 'khan', '9', 63000, 23, 17, 'NCC008'),
('SP38', 'khau trang', '9', 123500, 34, 11, 'NCC008'),
('SP39', 'giay dep', '9', 2365000, 12, 1, 'NCC008'),
('SP40', 'quan ao', '9', 425300, 45, 5, 'NCC008'),
('SP41', 'trang diem', '10', 412500, 35, 2, 'NCC009'),
('SP42', 'cham soc toc', '10', 320000, 23, 7, 'NCC009'),
('SP43', 'cham soc da', '10', 823000, 15, 2, 'NCC009'),
('SP44', 'nuoc hoa', '10', 1425000, 15, 1, 'NCC009'),
('SP45', 'cham soc rang mieng', '10', 369000, 12, 1, 'NCC009'),
('SP46', 'bot giat', '11', 168200, 20, 4, 'NCC010'),
('SP47', 'nuoc tay rua', '11', 65000, 12, 13, 'NCC010'),
('SP48', 'khu mui', '11', 92800, 15, 5, 'NCC010'),
('SP49', 'diet con trung', '11', 165000, 21, 5, 'NCC010'),
('SP50', 'giay an', '12', 65000, 24, 8, 'NCC010'),
('SP51', 'bang ve sinh', '12', 65000, 23, 8, 'NCC010'),
('SP52', 'khan uot', '12', 99900, 25, 33, 'NCC010'),
('SP53', 'giay ve sinh', '12', 130000, 25, 6, 'NCC010');

INSERT INTO GiaoHang 
VALUES
('GH001', 'Nguyen Thi A', '123456789', '2002-11-04'),
('GH002', 'Tran Thi A', '133456789', '2000-11-04'),
('GH003', 'Nguyen Van A', '143456789', '1992-10-04'),
('GH004', 'Nguyen Thi B', '153456789', '2001-05-24'),
('GH005', 'Nguyen Mai A', '163456789', '1992-12-23'),
('GH006', 'Tran Lai Lu', '173456789', '1987-11-04'),
('GH007', 'Mai Van He', '183456789', '2003-04-03'),
('GH008', 'Huynh Bien Cuong', '193456789', '1999-05-09'),
('GH009', 'Vi To Quoc', '223456789', '2002-02-02'),
('GH010', 'Nong Xa Hoi', '323456789', '1988-03-04'),
('GH011', 'Lai Tai Lanh', '423456789', '1984-11-19'),
('GH012', 'Huyen Minh Ho', '523456789', '1991-10-09'),
('GH013', 'Giang A Chu', '623456789', '1983-08-05'),
('GH014', 'Do Thi Cam Van', '723456789', '2001-11-20'),
('GH015', 'Bing Chi Linh', '123456989', '1979-12-01'),
('GH016', 'Chong A Phu', '123436789', '2000-11-12'),
('GH017', 'Bao Van Dat', '123456689', '1985-01-04'),
('GH018', 'Vat Van Khoa', '123456782', '1977-11-30'),
('GH019', 'Toan Thi Cu', '123456784', '1993-03-21'),
('GH020', 'Muon Hanh Phuc', '183450789', '2003-12-25'),
('GH021', 'Nguyen Ngoc Giau', '123456780', '1997-08-19'),
('GH022', 'Nuong Thi Ninh', '121456789', '1994-04-04'),
('GH023', 'Lai Thi Ka', '123456709', '1975-05-16'),
('GH024', 'Khuat Thien Phu', '823456789', '2001-10-01');

INSERT INTO KhachHang 
VALUES
('KH001', 'Nguyen Phu Si', '1981-10-09', '0983145578', '18 Hang Cau', 'Ha Noi', 'Vietnam'),
('KH002', 'Tran Phu Khoa', '1993-03-08', '0834447656', '77A Cam Dien', 'Hoa Binh', 'Vietnam'),
('KH003', 'Tran Mai Lan', '1988-05-17', '0964573845', '53 Tam Trinh', 'Ha Noi', 'Vietnam'),
('KH004', 'Veronica Maxova', '1990-10-08', '0349623471', '881C Einstein', 'Praha', 'Czech'),
('KH005', 'Ly Dai Nghia', '1989-07-11', '0154786699', '22 Truong Chinh', 'Ho Chi Minh', 'Vietnam'),
('KH006', 'Le Hoang Hai', '1993-12-12', '0934778549', '78 Nguyen Du', 'Nam Dinh', 'Vietnam'),
('KH007', 'Bui Van Duc', '1982-05-14', '0927884569', '26 Hang Dong', 'Thai Binh', 'Vietnam'),
('KH008', 'Dani Romsaithong', '1987-01-28', '0875623471', '445A/B Khaosam', 'Bangkok', 'Thailand'),
('KH009', 'Micheal Longbottom', '1989-06-16', '0342834471', '22B St.Boulevard', 'California', 'USA'),
('KH010', 'Do Gia Lam', '1987-01-28', '0875623471', '77 Tran Nhan Tong', 'Hai Phong', 'Vietnam'),
('KH011', 'Tran Chi Binh', '1985-02-28', '0875632471', '12 Thanh Chau', 'Bac Kinh', 'Trung Quoc'),
('KH012', 'Le Dai Nam', '1982-04-21', '0345623674', '52 Pham Ngu Lao', 'Hue', 'Vietnam'),
('KH013', 'Hoang Ngoc Ha', '1994-06-15', '0784567342', '23 Binh Thanh', 'Ho Chi Minh', 'Vietnam'),
('KH014', 'Nguyen Tien Dung', '1978-08-23', '0367589455', '211 Le Thai To', 'Ninh Binh', 'Vietnam'),
('KH015', 'Le Ngoc Han', '1990-09-30', '0973426745', '23 Nguyen Trai', 'Hai Duong', 'Vietnam'),
('KH016', 'Tokuda Madaza', '1978-08-10', '0874523471', '325 Kasuga', 'Kyoto', 'Japan');

INSERT INTO HoaDon 
VALUES
('HD001', 'KH001', 'NV001', '2021-10-02', '2021-10-20', '2021-10-21', 'GH001', '36 pho Hue', 'Ha Noi', 'Vietnam'),
('HD002', 'KH002', 'NV002', '2022-10-16', '2022-10-20', '2022-10-20', 'GH002', '19 chua Boc', 'Ha Noi', 'Vietnam'),
('HD003', 'KH003', 'NV003', '2022-03-22', '2022-03-22', '2022-03-23', 'GH003', '35A Tu Xuyen', 'Tu Xuyen', 'Trung Quoc'),
('HD004', 'KH004', 'NV004', '2023-06-17', '2023-10-25', '2023-10-24', 'GH004', '97/5 Prada', 'Praha', 'Czech'),
('HD005', 'KH001', 'NV005', '2022-02-06', '2022-12-23', '2022-12-23', 'GH005', '21 pho Vong', 'Ha Noi', 'Vietnam'),
('HD006', 'KH003', 'NV002', '2023-03-02', '2023-03-03', '2023-03-03', 'GH006', '79 Dong Anh', 'Ha Noi', 'Vietnam'),
('HD007', 'KH005', 'NV006', '2021-12-12', '2021-12-26', '2021-12-26', 'GH015', '89 Mai Phuong', 'Hue', 'Vietnam'),
('HD008', 'KH006', 'NV005', '2023-05-11', '2023-05-13', '2023-05-13', 'GH019', '36 Tat Vu', 'Ho Chi Minh', 'Vietnam'),
('HD009', 'KH007', 'NV003', '2023-07-29', '2023-07-29', '2023-07-29', 'GH021', '65 Dai Co Viet', 'Ha Noi', 'Vietnam'),
('HD010', 'KH008', 'NV006', '2023-11-23', '2023-12-25', '2023-12-25', 'GH022', 'A12 Kystar', 'Bangkok', 'Thailand'),
('HD011', 'KH009', 'NV001', '2022-08-16', '2023-08-16', '2023-08-15', 'GH024', '18/A Lenda', 'California', 'USA'),
('HD012', 'KH010', 'NV001', '2021-08-05', '2021-08-06', '2021-08-06', 'GH007', '18 pho Hen', 'Da Nang', 'Vietnam'),
('HD013', 'KH011', 'NV004', '2023-07-16', '2023-08-18', '2023-08-18', 'GH008', '99/A', 'Ha Noi', 'Vietnam'),
('HD014', 'KH012', 'NV001', '2022-02-02', '2022-02-06', '2023-02-06', 'GH009', 'MM B', 'Ho Chi Minh', 'Vietnam'),
('HD015', 'KH013', 'NV002', '2023-03-11', '2023-03-11', '2023-03-11', 'GH010', '11/8 Kim Lien', 'Nghe An', 'Vietnam'),
('HD016', 'KH014', 'NV003', '2021-08-20', '2021-08-21', '2021-08-21', 'GH011', '18/A Bai Linh', 'Ninh Binh', 'Vietnam'),
('HD017', 'KH015', 'NV004', '2022-08-19', '2022-08-20', '2022-08-20', 'GH012', '66B Hoc Mon', 'Binh Duong', 'Vietnam'),
('HD018', 'KH015', 'NV005', '2023-01-22', '2023-01-25', '2023-01-25', 'GH013', '91H Ngan Ha', 'Quang Nam', 'Vietnam'),
('HD019', 'KH015', 'NV001', '2023-10-27', '2023-10-28', '2023-10-28', 'GH014', '18/A My Tho', 'Quang Ninh', 'Vietnam'),
('HD020', 'KH016', 'NV005', '2023-12-27', '2023-12-30', '2023-12-30', 'GH016', '18/A My Tho', 'Quang Ninh', 'Vietnam');

INSERT INTO ChiTietHoaDon 
VALUES
('CT001', 'HD001', 'SP01', 24000, 5, 0.30),
('CT002', 'HD001', 'SP02', 50000, 4, 0.35),
('CT003', 'HD001', 'SP05', 64000, 6, 0.28),
('CT004', 'HD001', 'SP08', 230000, 1, 0.00),
('CT005', 'HD002', 'SP09', 240000, 2, 0.30),
('CT006', 'HD002', 'SP15', 201000, 7, 0.25),
('CT007', 'HD002', 'SP09', 240000, 3, 0.30),
('CT008', 'HD002', 'SP04', 76000, 12, 0.00),
('CT009', 'HD002', 'SP06', 55000, 6, 0.00),
('CT010', 'HD003', 'SP36', 199000, 4, 0.12),
('CT011', 'HD003', 'SP41', 412500, 2, 0.12),
('CT012', 'HD003', 'SP42', 320000, 6, 0.00),
('CT013', 'HD003', 'SP46', 168200, 4, 0.00),
('CT014', 'HD003', 'SP47', 65000, 13, 0.00),
('CT015', 'HD004', 'SP22', 64300, 21, 0.00),
('CT016', 'HD004', 'SP24', 13000, 35, 0.00),
('CT017', 'HD004', 'SP48', 92800, 5, 0.02),
('CT018', 'HD004', 'SP49', 165000, 1, 0.00),
('CT019', 'HD004', 'SP50', 65000, 6, 0.00),
('CT020', 'HD005', 'SP32', 188350, 2, 0.60),
('CT021', 'HD005', 'SP07', 65000, 15, 0.00),
('CT022', 'HD005', 'SP10', 100000, 4, 0.00),
('CT023', 'HD005', 'SP14', 120000, 3, 0.00),
('CT024', 'HD005', 'SP16', 84000, 6, 0.00),
('CT025', 'HD006', 'SP13', 32000, 9, 0.00),
('CT026', 'HD006', 'SP17', 132000, 5, 0.00),
('CT027', 'HD006', 'SP18', 216500, 4, 0.00),
('CT028', 'HD006', 'SP19', 422000, 3, 0.00),
('CT029', 'HD006', 'SP20', 99999, 11, 0.00),
('CT030', 'HD006', 'SP21', 55200, 21, 0.00),
('CT031', 'HD007', 'SP05', 64000, 8, 0.00),
('CT032', 'HD007', 'SP23', 85400, 3, 0.28),
('CT033', 'HD007', 'SP27', 215500, 4, 0.00),
('CT034', 'HD007', 'SP28', 225600, 1, 0.30),
('CT035', 'HD008', 'SP43', 823000, 2, 0.90),
('CT036', 'HD008', 'SP52', 99900, 31, 0.10),
('CT037', 'HD008', 'SP37', 63000, 16, 0.00),
('CT038', 'HD009', 'SP44', 1425000, 1, 0.30),
('CT039', 'HD008', 'SP29', 480100, 6, 0.20),
('CT040', 'HD008', 'SP30', 74300, 12, 0.00),
('CT041', 'HD008', 'SP31', 625000, 7, 0.50),
('CT042', 'HD009', 'SP11', 15000, 42, 0.00),
('CT043', 'HD009', 'SP25', 32000, 15, 0.06),
('CT044', 'HD009', 'SP33', 60500, 26, 0.00),
('CT045', 'HD009', 'SP34', 1350000, 4, 0.00),
('CT046', 'HD009', 'SP35', 158000, 6, 0.00),
('CT047', 'HD009', 'SP38', 123500, 11, 0.00),
('CT048', 'HD010', 'SP01', 24000, 64, 0.03),
('CT049', 'HD010', 'SP02', 50000, 12, 0.35),
('CT050', 'HD010', 'SP03', 215000, 3, 0.60),
('CT051', 'HD010', 'SP11', 15000, 31, 0.00),
('CT052', 'HD010', 'SP12', 123000, 14, 0.40),
('CT053', 'HD010', 'SP13', 32000, 23, 0.00),
('CT054', 'HD010', 'SP51', 65000, 8, 0.20),
('CT055', 'HD011', 'SP52', 99900, 2, 0.20),
('CT056', 'HD011', 'SP53', 130000, 3, 0.20),
('CT057', 'HD011', 'SP39', 2365000, 1, 0.48),
('CT058', 'HD011', 'SP40', 425300, 3, 0.50),
('CT059', 'HD011', 'SP45', 369000, 1, 0.09),
('CT060', 'HD012', 'SP21', 55000, 2, 0.00),
('CT061', 'HD012', 'SP25', 37000, 1, 0.00),
('CT062', 'HD012', 'SP15', 200000, 2, 0.00),
('CT063', 'HD013', 'SP21', 55000, 3, 0.00),
('CT064', 'HD013', 'SP01', 24000, 2, 0.00),
('CT065', 'HD013', 'SP10', 100000, 3, 0.00),
('CT066', 'HD013', 'SP26', 70000, 1, 0.00),
('CT067', 'HD013', 'SP11', 15000, 1, 0.00),
('CT068', 'HD014', 'SP23', 84000, 1, 0.00),
('CT069', 'HD014', 'SP10', 110000, 1, 0.00),
('CT070', 'HD014', 'SP05', 64000, 3, 0.00),
('CT071', 'HD015', 'SP21', 55000, 1, 0.00),
('CT072', 'HD015', 'SP14', 120000, 1, 0.00),
('CT073', 'HD015', 'SP40', 426000, 1, 0.00),
('CT074', 'HD016', 'SP21', 55000, 2, 0.00),
('CT075', 'HD016', 'SP53', 130000, 2, 0.00),
('CT076', 'HD017', 'SP50', 65000, 2, 0.00),
('CT077', 'HD017', 'SP53', 130000, 1, 0.00),
('CT078', 'HD018', 'SP31', 625000, 1, 0.10),
('CT079', 'HD019', 'SP49', 165000, 2, 0.00),
('CT080', 'HD019', 'SP49', 165000, 2, 0.00),
('CT081', 'HD019', 'SP40', 42500, 1, 0.00),
('CT082', 'HD020', 'SP30', 75000, 2, 0.20),
('CT083', 'HD020', 'SP23', 85000, 1, 0.20),
('CT084', 'HD020', 'SP37', 60000, 1, 0.20),
('CT085', 'HD020', 'SP42', 320000, 1, 0.20);

GO;

SELECT * FROM SanPham
SELECT * FROM HoaDon
SELECT * FROM ChiTietHoaDon

/* Truy vấn bình thường */

SELECT * FROM ChiTietHoaDon
INNER JOIN HoaDon ON ChiTietHoaDon.MaHoaDon = HoaDon.MaHoaDon
INNER JOIN SanPham ON ChiTietHoaDon.MaSanPham = SanPham.MaSanPham;

GO

/* Hàm (5Ham)*/
-- 1. Hàm kiểm tra các sản phẩm và số lượng tồn kho của một danh mục - Nguyễn Hoàng Lâm
CREATE FUNCTION func_SoLuongTonKhoMoiDanhMuc(@MaDanhMuc CHAR(7))
    RETURNS TABLE
AS
RETURN
(
    SELECT SanPham.TenSanPham, SUM(SanPham.SoLuongTonKho) AS SoLuong
    FROM DanhMucSanPham
    INNER JOIN SanPham ON DanhMucSanPham.MaDanhMuc = SanPham.MaDanhMuc
    WHERE DanhMucSanPham.MaDanhMuc = @MaDanhMuc
    GROUP BY SanPham.TenSanPham
);

GO;

SELECT * FROM func_SoLuongTonKhoMoiDanhMuc('10')

GO;

DROP FUNCTION func_SoLuongTonKhoMoiDanhMuc

GO;

-- 2. Hàm tính tổng số lượng đơn hàng của mỗi khách hàng - Thái Cao Thiên Đạt
CREATE FUNCTION func_SoLuongHoaDonMotKhachHang()
    RETURNS @SoLuongHoaDon TABLE (MaKhachHang CHAR(7), TenKhachHang NVARCHAR(50), TongSoLuongDonHang INT)
AS
BEGIN
    INSERT INTO @SoLuongHoaDon
        SELECT KhachHang.MaKhachHang, KhachHang.TenKhachHang, COUNT(HoaDon.MaHoaDon) AS TongSoLuongDonHang
        FROM KhachHang
        INNER JOIN HoaDon ON HoaDon.MaKhachHang = KhachHang.MaKhachHang
        GROUP BY KhachHang.TenKhachHang, KhachHang.MaKhachHang
	RETURN
END;

GO

SELECT * FROM func_SoLuongHoaDonMotKhachHang()

GO

DROP FUNCTION func_SoLuongHoaDonMotKhachHang

GO

-- 3. Hàm tính giá trị trung bình các đơn hàng của mỗi khách hàng - Nguyễn Quang Huy
-- Công thức tính đơn giá: (SoLuong * DonGia) - (SoLuong * DonGia * GiamGia) = tongtien
-- Rút gọn công thức (1 - GiamGia) * DonGia * SoLuong
CREATE FUNCTION func_GiaTriTrungBinhCacHoaDonMoiKhachHang()
    RETURNS TABLE
AS
RETURN
(
    SELECT KhachHang.MaKhachHang, KhachHang.TenKhachHang, AVG((1 - ChiTietHoaDon.GiamGia) * ChiTietHoaDon.SoLuong * ChiTietHoaDon.DonGia) AS GiaTriTrungBinhDonHang
    FROM KhachHang
    INNER JOIN HoaDon ON HoaDon.MaKhachHang = KhachHang.MaKhachHang
    INNER JOIN ChiTietHoaDon ON ChiTietHoaDon.MaHoaDon = HoaDon.MaHoaDon
    GROUP BY KhachHang.MaKhachHang, KhachHang.TenKhachHang
);

GO

SELECT * FROM func_GiaTriTrungBinhCacHoaDonMoiKhachHang()

GO

DROP FUNCTION func_GiaTriTrungBinhCacHoaDonMoiKhachHang

GO

-- 4. Hàm kiểm tra xem đơn hàng có được giao đúng hạn hay không - Phan Anh Đức
CREATE FUNCTION func_GiaoHangDungHan(@MaHoaDon CHAR(7))
    RETURNS INT
AS
BEGIN
    DECLARE @NgayGiao DATE;
    DECLARE @NgayYeuCauGiao DATE;

    SELECT @NgayGiao = NgayGiao, @NgayYeuCauGiao = NgayYeuCauGiao
    FROM Hoadon
    WHERE MaHoaDon = @MaHoaDon;
    
    -- 0: Giao hang dung han, 1: Giao khong dung han, 3: Khong co ma hoa don
    IF @NgayGiao <= @NgayYeuCauGiao 
        RETURN 0
    ELSE IF @NgayGiao > @NgayYeuCauGiao 
        RETURN 1
        
    RETURN 3
END;

GO

DECLARE @MaHoaDon NVARCHAR(10) = 'HD003';
BEGIN
    IF dbo.func_GiaoHangDungHan(@MaHoaDon) = 0
        PRINT 'Hoa don ' + @MaHoaDon + ' giao hang dung han.'
    ELSE IF dbo.func_GiaoHangDungHan(@MaHoaDon) = 1
        PRINT 'Hoa don ' + @MaHoaDon + ' giao hang khong dung han.'
    ELSE 
        PRINT 'Hoa don ' + @MaHoaDon + ' khong ton tai.'
END;

GO

DROP FUNCTION func_GiaoHangDungHan;

GO

-- 5. Hàm xếp loại khách hàng dựa trên tổng chi tiêu - Phan Huy Nguyên
CREATE FUNCTION func_XepLoaiKhachHang(@MaKhachHang VARCHAR(7))
    RETURNS INT
AS
BEGIN
    DECLARE @TongChiTieu MONEY
    SELECT @TongChiTieu = SUM((1 - ChiTietHoaDon.GiamGia) * ChiTietHoaDon.DonGia * ChiTietHoaDon.SoLuong)
    FROM HoaDon
    INNER JOIN ChiTietHoaDon ON HoaDon.MaHoaDon = ChiTietHoaDon.MaHoaDon
    WHERE HoaDon.MaKhachHang = @MaKhachHang

    -- 0: Khách hàng vip, 1: Khách hàng thân thiết, 2: Khách hàng thường, 4: Khong ton tai
    IF @TongChiTieu >= 1000000
        RETURN 0
    ELSE IF @TongChiTieu >= 500000
        RETURN 1
    ELSE
        RETURN 2

    RETURN 4
END;

GO

DECLARE @MaKhachHang CHAR(7) = 'KH001'
BEGIN
    IF dbo.func_XepLoaiKhachHang(@MaKhachHang) = 0
        PRINT 'Khach hang VIP'
    ELSE IF dbo.func_XepLoaiKhachHang(@MaKhachHang) = 1
        PRINT 'Khach hang than thiet'
    ELSE IF dbo.func_XepLoaiKhachHang(@MaKhachHang) = 2
        PRINT 'Khach hang thuong'
    ELSE 
        PRINT 'Khach hang khong ton tai'
END;

GO

DROP FUNCTION func_XepLoaiKhachHang

GO

/* Thủ tục (5thutuc) */
-- 1. Thủ tục xem chi tiết các đơn hàng của một khách hàng - Thái Cao Thiên Đạt
CREATE PROCEDURE proc_XemChiTietDonHang
    @MaKhachHang CHAR(7)
AS BEGIN
    SELECT
        HoaDon.MaHoaDon,
        HoaDon.NgayDat,
        HoaDon.NgayYeuCauGiao,
        HoaDon.NgayGiao,
        ChiTietHoaDon.SoLuong,
        ChiTietHoaDon.DonGia,
        ChiTietHoaDon.GiamGia,
        SanPham.TenSanPham
    FROM ChiTietHoaDon
    INNER JOIN HoaDon ON HoaDon.MaHoaDon = ChiTietHoaDon.MaHoaDon
    INNER JOIN SanPham ON SanPham.MaSanPham = ChiTietHoaDon.MaSanPham
    WHERE HoaDon.MaKhachHang = @MaKhachHang;
END;

GO

EXEC proc_XemChiTietDonHang 'KH001'

GO

DROP PROC proc_XemChiTietDonHang

GO

-- 2. Thủ tục xác nhận ngày giao hàng - Nguyễn Quang Huy
CREATE PROCEDURE proc_XacNhanNgayGiaoHang
    @MaHoaDon VARCHAR(7),
    @NgayGiao DATE
AS
BEGIN
    IF NOT EXISTS (SELECT MaHoaDon FROM HoaDon WHERE MaHoaDon = @MaHoaDon)
        PRINT N'Không có dữ liệu!'
    ELSE
        UPDATE HoaDon
        SET NgayGiao = @NgayGiao
        WHERE MaHoaDon = @MaHoaDon;

        PRINT 'Da cap nhat du lieu!'
END;

GO

EXEC proc_XacNhanNgayGiaoHang 'HD002', '2023-01-10';

GO

DROP PROC proc_XacNhanNgayGiaoHang

GO

-- 3. Thủ tục tính tổng doanh thu theo ngày - Phan Huy Nguyên
CREATE PROC proc_TinhTongDoanhThuTheoNgay
    @Ngay DATE
AS BEGIN
    IF NOT EXISTS (SELECT MaHoaDon FROM HoaDon WHERE NgayGiao = @Ngay)
        PRINT N'Không có dữ liệu!'
    ELSE
        DECLARE @TongDoanhThu MONEY

        SELECT @TongDoanhThu = SUM((1 - ChiTietHoaDon.GiamGia) * ChiTietHoaDon.DonGia * ChiTietHoaDon.SoLuong) 
        FROM ChiTietHoaDon
        WHERE MaHoaDon IN (SELECT MaHoaDon FROM HoaDon WHERE NgayGiao = @Ngay)

        PRINT N'Tổng doanh thu của ngày ' + CAST(@Ngay AS VARCHAR(30)) + N' là: ' + CAST(@TongDoanhThu AS VARCHAR)
END;

EXEC proc_TinhTongDoanhThuTheoNgay @Ngay = '2021-10-21'

GO;

DROP PROC proc_TinhTongDoanhThuTheoNgay

GO;

-- 4. Thủ tục tình tổng doanh thu theo từng nhân viên - Phan Anh Đức
CREATE PROCEDURE proc_DoanhThuTheoTungNhanVien
    @MaNhanVien VARCHAR(7)
AS
BEGIN
    IF NOT EXISTS (SELECT MaNhanVien FROM NhanVien WHERE MaNhanVien = @MaNhanVien)
        PRINT 'Khong co du lieu!'
    ELSE
        DECLARE @TongDoanhThu MONEY;

        SELECT @TongDoanhThu = SUM((1 - ChiTietHoaDon.GiamGia) * ChiTietHoaDon.DonGia * ChiTietHoaDon.SoLuong)
        FROM ChiTietHoaDon
        INNER JOIN SanPham ON SanPham.MaSanPham = ChiTietHoaDon.MaSanPham
        INNER JOIN HoaDon ON HoaDon.MaHoaDon = ChiTietHoaDon.MaHoaDon
        WHERE HoaDon.MaNhanVien = @MaNhanVien;

        PRINT 'Tong doanh thu cua nhan Vien ' + @MaNhanVien + ' la: ' + CAST(@TongDoanhThu AS VARCHAR(50));
END;

GO

EXEC proc_DoanhThuTheoTungNhanVien 'NV003'; 

GO

DROP PROC proc_DoanhThuTheoTungNhanVien;

GO

SELECT ChiTietHoaDon.DonGia, ChiTietHoaDon.SoLuong, ChiTietHoaDon.GiamGia
FROM ChiTietHoaDon
INNER JOIN SanPham ON SanPham.MaSanPham = ChiTietHoaDon.MaSanPham
INNER JOIN HoaDon ON HoaDon.MaHoaDon = ChiTietHoaDon.MaHoaDon
WHERE HoaDon.MaNhanVien = 'NV003';

GO

-- 5. Thủ tục lấy thông tin người giao hàng theo thành phố - Nguyễn Hoàng Lâm
CREATE PROCEDURE proc_ThongTinGiaoHang
    @ThanhPho NVARCHAR(20)
AS
BEGIN
    SELECT
        HoaDon.MaHoaDon,
        KhachHang.TenKhachHang,
        KhachHang.SoDienThoai AS SoDienThoaiKhachHang,
        GiaoHang.TenNguoiGiaoHang,
        GiaoHang.SoDienThoai AS SoDienThoaiNguoiGiaoHang
    FROM HoaDon
    INNER JOIN KhachHang ON KhachHang.MaKhachHang = HoaDon.MaKhachHang
    INNER JOIN GiaoHang ON GiaoHang.MaNguoiGiaoHang = HoaDon.MaNguoiGiaoHang
    WHERE HoaDon.ThanhPho = @ThanhPho;
END;

GO

EXEC proc_ThongTinGiaoHang 'Ha Noi'

GO

DROP PROC proc_ThongTinGiaoHang

/* Con trỏ (5contro) */
-- 1. Con trỏ in ra tên sản phẩm và số lượng tồn kho - Nguyễn Hoàng Lâm
DECLARE cur_SoLuongTonKho CURSOR 
FOR
    SELECT MaSanPham, TenSanPham, SoLuongTonKho FROM SanPham;

OPEN cur_SoLuongTonKho;

DECLARE @MaSanPham CHAR(7);
DECLARE @TenSanPham VARCHAR(50);
DECLARE @SoLuongTonKho INT;

FETCH NEXT FROM cur_SoLuongTonKho INTO @MaSanPham, @TenSanPham, @SoLuongTonKho;

WHILE(@@FETCH_STATUS = 0)
BEGIN
    PRINT N'----------------------------------';
    PRINT N'Mã sản phẩm: ' + @MaSanPham;
    PRINT N'Tên sản phẩm: ' + @TenSanPham;
    PRINT N'Số lượng tồn kho: ' + CAST(@SoLuongTonKho AS NVARCHAR(20));
    PRINT N'----------------------------------';

    FETCH NEXT FROM cur_SoLuongTonKho INTO @MaSanPham, @TenSanPham, @SoLuongTonKho;
END

CLOSE cur_SoLuongTonKho;
DEALLOCATE cur_SoLuongTonKho;

GO

-- 2. Duyệt qua danh sách khách hàng và tính tổng số hóa đơn của mỗi khách hàng - Thái Cao Thiên Đạt
DECLARE cur_TongSoHoaDon CURSOR 
FOR
    SELECT KhachHang.MaKhachHang, KhachHang.TenKhachHang, COUNT(HoaDon.MaHoaDon) AS TongSoLuongDonHang
    FROM KhachHang
    INNER JOIN HoaDon ON HoaDon.MaKhachHang = KhachHang.MaKhachHang
    GROUP BY KhachHang.TenKhachHang, KhachHang.MaKhachHang

OPEN cur_TongSoHoaDon;

DECLARE @MaKhachHang CHAR(7);
DECLARE @TenKhachHang VARCHAR(50);
DECLARE @SoLuongHoaDon INT;

FETCH NEXT FROM cur_TongSoHoaDon INTO @MaKhachHang, @TenKhachHang, @SoLuongHoaDon; 

WHILE(@@FETCH_STATUS = 0)
BEGIN
    PRINT N'----------------------------------';
    PRINT N'Mã khách hàng: ' + @MaKhachHang;
    PRINT N'Tên khách hàng: ' + @TenKhachHang;
    PRINT N'Số lượng hóa đơn: ' + CAST(@SoLuongHoaDon AS NVARCHAR(20));
    PRINT N'----------------------------------';

    FETCH NEXT FROM cur_TongSoHoaDon INTO @MaKhachHang, @TenKhachHang, @SoLuongHoaDon;
END;

CLOSE cur_TongSoHoaDon;
DEALLOCATE cur_TongSoHoaDon;

GO

-- 3. Con trỏ in ra danh sách nhà cung cấp - Phan Huy Nguyên
DECLARE cur_DanhSachNhaCungCap CURSOR 
FOR
    SELECT MaNhaCungCap, TenCongTy, TenNguoiDaiDien, SoDienThoai
    FROM NhaCungCap;

OPEN cur_DanhSachNhaCungCap;

DECLARE @MaNhaCungCap CHAR(7);
DECLARE @TenCongTy VARCHAR(20);
DECLARE @TenNguoiDaiDien VARCHAR(50);
DECLARE @SoDienThoai VARCHAR(10);

FETCH NEXT FROM cur_DanhSachNhaCungCap INTO @MaNhaCungCap, @TenCongTy, @TenNguoiDaiDien, @SoDienThoai;

WHILE(@@FETCH_STATUS = 0)
BEGIN
    PRINT N'----------------------------------';
    PRINT N'Mã nhà cung cấp: ' + @MaNhaCungCap;
    PRINT N'Tên công ty: ' + @TenCongTy;
    PRINT N'Tên người đại diện: ' + @TenNguoiDaiDien;
    PRINT N'Số điện thoại: ' + @SoDienThoai;
    PRINT N'----------------------------------';
    
    FETCH NEXT FROM cur_DanhSachNhaCungCap INTO @MaNhaCungCap, @TenCongTy, @TenNguoiDaiDien, @SoDienThoai;
END;

CLOSE cur_DanhSachNhaCungCap;
DEALLOCATE cur_DanhSachNhaCungCap;

GO

-- 4. Con trỏ in ra danh sách khách hàng - Nguyễn Quang Huy
DECLARE cur_DanhSachKhachHang CURSOR 
FOR
    SELECT MaKhachHang, TenKhachHang, NgaySinh, SoDienThoai, DiaChi, ThanhPho
    FROM KhachHang;

OPEN cur_DanhSachKhachHang;

DECLARE @MaKhachHang CHAR(7);
DECLARE @TenKhachHang VARCHAR(50);
DECLARE @NgaySinh DATE;
DECLARE @SoDienThoai VARCHAR(10);
DECLARE @DiaChi VARCHAR(30);
DECLARE @ThanhPho VARCHAR(20);

FETCH NEXT FROM cur_DanhSachKhachHang INTO @MaKhachHang, @TenKhachHang, @NgaySinh, @SoDienThoai, @DiaChi, @ThanhPho;

WHILE(@@FETCH_STATUS = 0)
BEGIN
    PRINT N'----------------------------------';
    PRINT N'Mã khách hàng: ' + @MaKhachHang;
    PRINT N'Tên khách hàng: ' + @TenKhachHang;
    PRINT N'Ngày sinh: ' + CONVERT(nvarchar(20), @NgaySinh);
    PRINT N'Số điện thoại: ' + @SoDienThoai;
    PRINT N'Địa chỉ: ' + @DiaChi;
    PRINT N'Thành phố: ' + @ThanhPho;
    PRINT N'----------------------------------';

    FETCH NEXT FROM cur_DanhSachKhachHang INTO @MaKhachHang, @TenKhachHang, @NgaySinh, @SoDienThoai, @DiaChi, @ThanhPho;
END;

CLOSE cur_DanhSachKhachHang;
DEALLOCATE cur_DanhSachKhachHang;

GO

-- 5. Con trỏ in ra danh sách sản phẩm có số lượng tồn kho dưới 15 - Phan Anh Đức
DECLARE cur_TonKhoDuoiMuc CURSOR 
FOR
    SELECT MaSanPham, TenSanPham, SoLuongTonKho 
    FROM SanPham
    WHERE SoLuongTonKho < 15;

OPEN cur_TonKhoDuoiMuc;

DECLARE @MaSanPham CHAR(7);
DECLARE @TenSanPham VARCHAR(50);
DECLARE @SoLuongTonKho INT;

FETCH NEXT FROM cur_TonKhoDuoiMuc INTO @MaSanPham, @TenSanPham, @SoLuongTonKho;

WHILE(@@FETCH_STATUS = 0)
BEGIN
    PRINT N'----------------------------------';
    PRINT N'Mã sản phẩm: ' + @MaSanPham;
    PRINT N'Tên sản phẩm: ' + @TenSanPham;
    PRINT N'Số lượng tồn kho: ' + CAST(@SoLuongTonKho AS NVARCHAR(20));
    PRINT N'----------------------------------';

    FETCH NEXT FROM cur_TonKhoDuoiMuc INTO @MaSanPham, @TenSanPham, @SoLuongTonKho;
END

CLOSE cur_TonKhoDuoiMuc;
DEALLOCATE cur_TonKhoDuoiMuc;

GO;

/* View (5view) */
-- 1. Hiển thị thông tin sản phẩm, số lượng, danh mục và nhà cung cấp tương ứng - Nguyễn Hoàng Lâm
CREATE VIEW view_ThongTinSanPham
AS
	SELECT MaSanPham, TenSanPham, DanhMucSanPham.TenDanhMuc, SoLuongTonKho, SoluongDaBan, NhaCungCap.TenCongTy
	FROM SanPham
	INNER JOIN DanhMucSanPham ON DanhMucSanPham.MaDanhMuc = SanPham.MaDanhMuc
	INNER JOIN NhaCungCap ON NhaCungCap.MaNhaCungCap = SanPham.MaNhaCungCap;

GO

SELECT * FROM view_ThongTinSanPham

GO

DROP VIEW view_ThongTinSanPham

GO

-- 2. View thống kê tổng tiền của mỗi hóa đơn - Thái Cao Thiên Đạt
-- (1 - GiamGia) * DonGia * SoLuong
CREATE VIEW view_TongTienHoaDon 
AS
    SELECT HoaDon.MaHoaDon, SUM((1 - ChiTietHoaDon.GiamGia) * ChiTietHoaDon.SoLuong * ChiTietHoaDon.DonGia) AS TongTien
    FROM HoaDon
    INNER JOIN ChiTietHoaDon ON ChiTietHoaDon.MaHoaDon = HoaDon.MaHoaDon
    GROUP BY HoaDon.MaHoaDon;

GO

SELECT * FROM view_TongTienHoaDon

GO;

DROP VIEW view_TongTienHoaDon

GO

-- 3. View chứa danh sách số lượng đơn hàng của từng khách hàng - Nguyễn Quang Huy
CREATE VIEW view_SoLuongDonHangTheoTenKhachHang 
AS
	SELECT KhachHang.TenKhachHang AS N'Tên Khách hàng', COUNT(HoaDon.MaHoaDon) AS N'Số lượng đơn hàng'
	FROM KhachHang
	INNER JOIN HoaDon ON HoaDon.MaKhachHang = KhachHang.MaKhachHang
	GROUP BY KhachHang.TenKhachHang;

GO

SELECT * FROM view_SoLuongDonHangTheoTenKhachHang

GO

DROP VIEW view_SoLuongDonHangTheoTenKhachHang

GO

-- 4. View chứa các sản phẩm thuộc danh mục 1 được giảm giá hơn 20% - Phan Anh Đức
CREATE VIEW view_SanPhamDuocGiamGia
AS
    SELECT SanPham.MaSanPham, SanPham.TenSanPham, ChiTietHoaDon.GiamGia
    FROM SanPham
    INNER JOIN ChiTietHoaDon ON SanPham.MaSanPham = ChiTietHoaDon.MaSanPham
    WHERE SanPham.MaDanhMuc = '1' AND ChiTietHoaDon.GiamGia > 0.2

GO;

SELECT * FROM view_SanPhamDuocGiamGia

GO;

DROP VIEW view_SanPhamDuocGiamGia

GO;

-- 5. View chứa doanh thu theo năm - Phan Huy Nguyên
CREATE VIEW view_DoanhThuTheoNam 
AS
	SELECT YEAR(HoaDon.NgayGiao) AS N'Năm', SUM((1 - ChiTietHoaDon.GiamGia) * ChiTietHoaDon.DonGia * ChiTietHoaDon.SoLuong) AS 'Doanh Thu'
	FROM HoaDon
	INNER JOIN ChiTietHoaDon ON ChiTietHoaDon.MaHoaDon = HoaDon.MaHoaDon
	GROUP BY YEAR(HoaDon.NgayGiao);

GO;

SELECT * FROM view_DoanhThuTheoNam

GO;

DROP VIEW view_DoanhThuTheoNam

GO;

/* Trigger (5trigger) */
-- 1. Trigger tự động cập nhật số lượng tồn kho của sản phẩm - Phan Huy Nguyên
CREATE TRIGGER trg_CapNhatTonKho ON ChiTietHoaDon AFTER INSERT
AS BEGIN
    UPDATE SanPham
    SET SoLuongTonKho = SoLuongTonKho - (SELECT SoLuong FROM INSERTED)
    FROM SanPham
    WHERE SanPham.MaSanPham = (SELECT MaSanPham FROM INSERTED);
END;

GO;

INSERT INTO ChiTietHoaDon (MaChiTietHoaDon, MaHoaDon, MaSanPham, DonGia, SoLuong, GiamGia)
VALUES ('CT088', 'HD001', 'SP01', 10000, 3, 0.1);

GO

SELECT * FROM SanPham WHERE MaSanPham = 'SP01';

SELECT * FROM ChiTietHoaDon

GO;

DROP TRIGGER trg_CapNhatTonKho

GO;

-- 2. Trigger để cập nhật số lượng đã bán của sản phẩm sau khi thêm chi tiết hóa đơn - Nguyễn Hoàng Lâm
CREATE TRIGGER trig_CapNhatSoLuongDaBan ON ChiTietHoaDon AFTER INSERT
AS
BEGIN
    UPDATE SanPham
    SET SoLuongDaBan = SanPham.SoLuongDaBan + INSERTED.SoLuong
    FROM SanPham
    INNER JOIN INSERTED ON SanPham.MaSanPham = INSERTED.MaSanPham
END;

GO;

DROP TRIGGER trig_CapNhatSoLuongDaBan

GO

SELECT * FROM SanPham WHERE MaSanPham = 'SP01';

GO;

INSERT INTO ChiTietHoaDon (MaChiTietHoaDon, MaHoaDon, MaSanPham, DonGia, SoLuong, GiamGia)
VALUES ('CT090', 'HD003', 'SP01', 100000, 4, 0.1);

GO;

-- 3. Trigger để kiểm tra ngày sinh và ngày bắt đầu làm việc của nhân viên - Phan Anh Đức
CREATE TRIGGER trig_KiemTraCapNhatNhanVien ON NhanVien AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @NgaySinh DATE, @NgayĐauLamViec DATE;
    SELECT @NgaySinh = NgaySinh, @NgayĐauLamViec = NgayDauLamViec FROM INSERTED;

    IF (@NgaySinh > GETDATE())
    BEGIN
        PRINT(N'Ngày sinh không hợp lệ');
        ROLLBACK TRAN;
    END;

    IF (@NgayĐauLamViec > GETDATE())
    BEGIN
        PRINT(N'Ngày sinh không hợp lệ');
        ROLLBACK TRAN;
    END;
END;

INSERT INTO ChiTietHoaDon 
VALUES ('CT091', 'HD020', 'SP42', 320000, 24, 0.20)

GO

DROP TRIGGER trig_KiemTraCapNhatNhanVien

GO;

-- 4. Trigger để kiểm tra giá trị nhập vào trước khi thêm sản phẩm mới - Nguyễn Quang Huy
CREATE TRIGGER trig_CheckGiaTriSanPham ON SanPham AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM INSERTED WHERE DonGia <= 0 OR SoLuongTonKho <= 0)
        BEGIN
            PRINT(N'Giá trị không hợp lệ')
            ROLLBACK TRAN
        END;
END;

-- Kiểm tra với số lượng tồn kho -20
INSERT INTO SanPham 
VALUES ('SP56', 'Den pin thu nho', '12', 1300000, -20, 6, 'NCC010');

SELECT * FROM SanPham

GO

DROP TRIGGER trig_CheckGiaTriSanPham

GO;

-- 5. Trigger kiểm tra ngày giao hàng - Thái Cao Thiên Đạt
CREATE TRIGGER trig_KiemTraNgayDatHoaDon ON HoaDon AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @NgayYeuCauGiao DATE;
    DECLARE @NgayGiao DATE;
    SELECT @NgayYeuCauGiao = NgayYeuCauGiao, @NgayGiao = NgayGiao FROM INSERTED;

    IF @NgayYeuCauGiao > @NgayGiao
    BEGIN
        PRINT(N'Ngày giao hàng không hợp lệ');
        ROLLBACK TRAN;
    END;
END;

-- Kiểm tra ngay giao hàng
INSERT INTO HoaDon
VALUES ('HD021', 'KH016', 'NV005', '2023-12-27', '2023-12-30', '2023-12-29', 'GH016', '18/A My Tho', 'Quang Ninh', 'Vietnam');

GO;

DROP TRIGGER trig_KiemTraNgayDatHoaDon

GO;

/* Phân quyền (phanquyen) - Phan Anh Đức */
CREATE ROLE QUANLY -- Thêm nhóm quyền role tên QUANLY 
CREATE ROLE NHANVIEN -- Thêm nhóm quyền role tên NHANVIEN 
CREATE ROLE KETOAN -- Thêm nhóm quyền role tên KETOAN 

-- Thêm các quyền cho quản lý
GRANT SELECT, INSERT, UPDATE, DELETE ON ChiTietHoaDon TO QUANLY
GRANT SELECT, INSERT, UPDATE, DELETE ON DanhMucSanPham TO QUANLY
GRANT SELECT, INSERT, UPDATE, DELETE ON GiaoHang TO QUANLY
GRANT SELECT, INSERT, UPDATE, DELETE ON HoaDon TO QUANLY
GRANT SELECT, INSERT, UPDATE, DELETE ON KhachHang TO QUANLY
GRANT SELECT, INSERT, UPDATE, DELETE ON NhaCungCap TO QUANLY
GRANT SELECT, INSERT, UPDATE, DELETE ON NhanVien TO QUANLY
GRANT SELECT, INSERT, UPDATE, DELETE ON SanPham TO QUANLY
GRANT EXECUTE ON dbo.proc_PhanQuyen  TO QUANLY

-- Thêm các quyền cho nhân viên
GRANT SELECT, INSERT, UPDATE ON ChiTietHoaDon TO NHANVIEN
GRANT SELECT, INSERT, UPDATE ON DanhMucSanPham TO NHANVIEN
GRANT SELECT, INSERT, UPDATE ON GiaoHang TO NHANVIEN
GRANT SELECT, INSERT, UPDATE ON HoaDon TO NHANVIEN
GRANT SELECT, INSERT, UPDATE ON KhachHang TO NHANVIEN
GRANT SELECT, INSERT, UPDATE ON NhaCungCap TO NHANVIEN
GRANT SELECT, INSERT, UPDATE ON NhanVien TO NHANVIEN
GRANT SELECT, INSERT, UPDATE ON SanPham TO NHANVIEN

-- Thêm các quyền cho kế toán
GRANT SELECT ON ChiTietHoaDon TO KETOAN
GRANT SELECT ON DanhMucSanPham TO KETOAN
GRANT SELECT ON GiaoHang TO KETOAN
GRANT SELECT ON HoaDon TO KETOAN
GRANT SELECT ON KhachHang TO KETOAN
GRANT SELECT ON NhaCungCap TO KETOAN
GRANT SELECT ON NhanVien TO KETOAN
GRANT SELECT ON SanPham TO KETOAN

GO;

CREATE PROC proc_PhanQuyen 
    @MaNhanVien CHAR(7)
AS 
BEGIN
    DECLARE @ChucVu NVARCHAR(30)
    DECLARE @TaiKhoan NVARCHAR(30)
    DECLARE @MatKhau NVARCHAR(30)

    SELECT @ChucVu = ChucVu, @TaiKhoan = TaiKhoan, @MatKhau = MatKhau FROM NhanVien WHERE MaNhanVien = @MaNhanVien

    EXEC sp_addlogin @TaiKhoan, @MatKhau 
    EXEC sp_grantdbaccess @TaiKhoan, @TaiKhoan

    IF @ChucVu = 'Quan ly'
        EXEC sp_addrolemember 'QUANLY', @TaiKhoan
    ELSE IF @ChucVu = 'Ke toan'
        EXEC sp_addrolemember 'KETOAN', @TaiKhoan
    ELSE
        EXEC sp_addrolemember 'NHANVIEN', @TaiKhoan
END;

EXEC proc_PhanQuyen 'NV009'

DROP PROC proc_PhanQuyen

GO;

CREATE PROC proc_ThuHoiQuyen
    @MaNhanVien CHAR(7)
AS BEGIN
    DECLARE @TaiKhoan NVARCHAR(30)
    SELECT @TaiKhoan = TaiKhoan FROM NhanVien WHERE MaNhanVien = @MaNhanVien

    EXECUTE sp_droplogin @TaiKhoan
    EXECUTE sp_dropuser @TaiKhoan
    PRINT(N'Đã xóa quyền!')
END;

EXEC proc_ThuHoiQuyen 'NV009'

DROP PROC proc_ThuHoiQuyen