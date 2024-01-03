CREATE DATABASE QuanLyBanHangSieuThi

USE QuanLyBanHangSieuThi

CREATE TABLE NhanVien (
    MaNhanVien CHAR(7) PRIMARY KEY,
    TenNhanVien VARCHAR(50),
    ChucVu VARCHAR(30),
    NgaySinh DATE,
    NgayDauLamViec DATE,
    DiaChi VARCHAR(30),
    ThanhPho VARCHAR(20),
    SoDienThoai VARCHAR(10),
);

CREATE TABLE NhaCungCap (
    MaNhaCungCap CHAR(7) PRIMARY KEY,
    TenCongTy VARCHAR(20),
    TenNguoiDaiDien VARCHAR(50),
    ChucVu VARCHAR(30),
    SoDienThoai VARCHAR(10),
    DiaChi VARCHAR(30),
    ThanhPho VARCHAR(20),
    QuocGia VARCHAR(20)
);

CREATE TABLE DanhMucSanPham (
    MaDanhMuc CHAR(7) PRIMARY KEY,
    TenDanhMuc VARCHAR(20),
    Mota VARCHAR(80)
);

CREATE TABLE SanPham (
    MaSanPham CHAR(7) PRIMARY KEY,
    TenSanPham VARCHAR(50),
    MaDanhMuc CHAR(7),
    DonGia DECIMAL(10, 0),
    SoLuongTonKho INT,
    SoLuongDaBan INT,
    MaNhaCungCap CHAR(7),
    FOREIGN KEY (MaDanhMuc) REFERENCES DanhMucSanPham(MaDanhMuc),
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
);

CREATE TABLE GiaoHang (
    MaNguoiGiaoHang CHAR(7) PRIMARY KEY,
    TenNguoiGiaoHang VARCHAR(50),
    SoDienThoai VARCHAR(10),
    NgaySinh DATE
);

CREATE TABLE KhachHang (
    MaKhachHang CHAR(7) PRIMARY KEY,
    TenKhachHang VARCHAR(50),
    NgaySinh DATE,
    SoDienThoai VARCHAR(10),
    DiaChi VARCHAR(30),
    ThanhPho VARCHAR(20),
);

CREATE TABLE HoaDon (
    MaHoaDon CHAR(7) PRIMARY KEY,
    MaKhachHang CHAR(7),
    MaNhanVien CHAR(7),
    NgayDat DATE,
    NgayYeuCauGiao DATE,
    NgayGiao DATE,
    MaNguoiGiaoHang CHAR(7),
    DiaChi VARCHAR(30),
    ThanhPho VARCHAR(20),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaNguoiGiaoHang) REFERENCES GiaoHang(MaNguoiGiaoHang)
);

CREATE TABLE ChiTietHD (
    MaHoaDon CHAR(7),
    MaSanPham CHAR(7),
    DonGia DECIMAL(10, 0),
    SoLuong INT,
    GiamGia DECIMAL(5, 2),
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

INSERT INTO NhanVien 
VALUES
('NV001', 'Phan Anh Duc', 'Quan ly', '19900527', '20150517', 'Ha Dong', 'Ha Noi', 'Viet Nam', '0457635894'),
('NV002', 'Thai Cao Thien Dat', 'Nhan vien', '19910617', '20160517', 'Dong Da', 'Ha Noi', 'Viet Nam', '0856347856'),
('NV003', 'Phan Huy Nguyen', 'Nhan vien', '19901028', '20151017', 'Dong Anh', 'Ha Noi', 'Viet Nam', '0946523744'),
('NV004', 'Nguyen Thu Huyen', 'Nhan vien', '19891212', '20160727', 'Le Hong Phong', 'Nam Dinh', 'Viet Nam', '0783423654'),
('NV005', 'Pham Hong Anh', 'Nhan vien', '19930210', '20170521', 'Me Linh', 'Ha Noi', 'Viet Nam', '0836574856'),
('NV006', 'Nguyen Hoang Anh', 'Nhan vien', '19900317', '20150830', 'Kien Xuong', 'Thai Binh', 'Viet Nam', '0864753483'),
('NV007', 'Do Dinh Thang', 'Ke toan', '19891223', '20150101', 'Kien Giang', 'Bac Giang', 'Viet Nam', '0984672388'),
('NV008', 'Nguyen Quang Huy', 'Nhan vien', '19880719', '20141215', 'Soc Son', 'Ha Noi', 'Viet Nam', '0974562311'),
('NV009', 'Nguyen Ngoc Quynh Chau', 'Quan ly', '19901021', '20141225', 'Ha Dong', 'Ha Noi', 'Viet Nam', '0178455688');

