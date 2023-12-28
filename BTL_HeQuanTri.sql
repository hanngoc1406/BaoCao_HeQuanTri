CREATE DATABASE HeThongQuanLyBanVeTauHoa;

USE HeThongQuanLyBanVeTauHoa;

DROP DATABASE  HeThongQuanLyBanVeTauHoa;

CREATE TABLE tblNhanVien(
    MaNhanVien NCHAR(6) NOT NULL PRIMARY KEY,
    TenNhanVien NVARCHAR(255),
    SoDienThoai NVARCHAR(255),
    GioiTinh BIT,
    TaiKhoan NCHAR(50),
    MatKhau NCHAR(50),
    NgaySinh DATE
);

CREATE TABLE tblKhachHang(
    MaKhachHang NCHAR(6) NOT NULL PRIMARY KEY,
    TenKhachHang NVARCHAR(255),
    SoDienThoai NVARCHAR(255),
    Email NVARCHAR(255),
    GioiTinh BIT,
    MaDinhDanh NCHAR(12),
    NgaySinh DATE
);

CREATE TABLE tblChuyenTau(
    MaChuyenTau NCHAR(6) NOT NULL PRIMARY KEY,
    SoLuongToa INT,
    SoCho INT,
    GaDi NVARCHAR(255),
    GaDen NVARCHAR(255),
    NgayDi DATE,
    GioDi NVARCHAR(255),
    NgayDen DATE,
    GioDen NVARCHAR(255),
);

CREATE TABLE tblToaTau(
    MaToa NCHAR(6) NOT NULL PRIMARY KEY,
    MaChuyenTau NCHAR(6),
    SoLuongCho INT,
    LoaiToa NVARCHAR(255),
    GaKhaiThac NVARCHAR(255),
    FOREIGN KEY (MaChuyenTau) REFERENCES tblChuyenTau(MaChuyenTau),
);

CREATE TABLE tblHoaDon(
    MaHoaDon NCHAR(6) NOT NULL PRIMARY KEY,
    MaNhanVien NCHAR(6),
    TrangThai INT,
    SoLuong INT,
    ThanhTien MONEY,
    NgayBan DATE,
    FOREIGN KEY (MaNhanVien) REFERENCES tblNhanVien(MaNhanVien),
);

CREATE TABLE tblThongTinVe(
    MaVe NCHAR(6) NOT NULL PRIMARY KEY,
    MaChuyenTau NCHAR(6),
    MaHoaDon NCHAR(6),
    MaKhachHang NCHAR(6),
    LoaiVe NVARCHAR(255),
    LoaiCho NVARCHAR(255),
    Toa INT,
    ViTri INT,
    GiaVe MONEY,
    FOREIGN KEY (MaChuyenTau) REFERENCES tblChuyenTau(MaChuyenTau),
    FOREIGN KEY (MaKhachHang) REFERENCES tblKhachHang(MaKhachHang),
    FOREIGN KEY (MaHoaDon) REFERENCES tblHoaDon(MaHoaDon)
);

-- Hiển thị quan hệ
SELECT
    fk.name 'FK Name',
    tp.name 'Parent table',
    cp.name, cp.column_id,
    tr.name 'Refrenced table',
    cr.name, cr.column_id
FROM 
    sys.foreign_keys fk
INNER JOIN 
    sys.tables tp ON fk.parent_object_id = tp.object_id
INNER JOIN 
    sys.tables tr ON fk.referenced_object_id = tr.object_id
INNER JOIN 
    sys.foreign_key_columns fkc ON fkc.constraint_object_id = fk.object_id
INNER JOIN 
    sys.columns cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
INNER JOIN 
    sys.columns cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id
ORDER BY
    tp.name, cp.column_id


-- Thêm dữ liệu cho tblNhanVien
INSERT INTO tblNhanVien (MaNhanVien, TenNhanVien, SoDienThoai, GioiTinh, TaiKhoan, MatKhau, NgaySinh)
VALUES 
    ('NV001', N'Nguyễn Văn An', '0987654321', 1, 'hh_annv', 'password@123', '1990-05-20'),
    ('NV002', N'Trần Thị Bình', '0123456789', 0, 'hh_binhtt', 'password@123', '1995-10-15'),
    ('NV003', N'Lê Minh Cường', '0932111222', 1, 'hh_cuonglm', 'password@123', '1988-02-08'),
    ('NV004', N'Phạm Thị Dung', '0765432109', 0, 'hh_dungpm', 'password@123', '1992-12-03'),
    ('NV005', N'Võ Văn Duy', '0845678901', 1, 'hh_duyvv', 'password@123', '1985-09-25');

-- Thêm dữ liệu cho tblKhachHang
INSERT INTO tblKhachHang (MaKhachHang, TenKhachHang, SoDienThoai, Email, GioiTinh, MaDinhDanh, NgaySinh)
VALUES 
    ('KH001', N'Phan Anh Đức', '0934567890', 'ducpa@gmail.com', 1, '456789012345', '2001-07-12'),
    ('KH002', N'Thái Cao Thiên Đạt', '0978123456', 'dattct@gmail.com', 1, '567890123456', '2001-04-18'),
    ('KH003', N'Nguyễn Hoàng Lâm', '0812345678', 'lamnh@gmail.com', 1, '678901234567', '2001-11-30'),
    ('KH004', N'Phạm Thị Thu', '0667890123', 'thupm@gmail.com', 0, '789012345678', '1997-03-05'),
    ('KH005', N'Nguyễn Quang Huy', '0890123456', 'huynq@gmail.com', 1, '890123456789', '2001-06-22'),
    ('KH006', N'Đới Thị Ngọc Hà', '0890123456', 'hadtn@gmail.com', 0, '890123456789', '2001-08-22'),
    ('KH007', N'Nguyễn Thị Yến', '0890123456', 'yennt@gmail.com', 0, '890123456789', '2001-08-31'),
    ('KH008', N'Phan Huy Nguyên', '0890123456', 'nguyenph@gmail.com', 1, '890123456789', '2001-06-22');

-- Dữ liệu mẫu cho tblChuyenTau
INSERT INTO tblChuyenTau (MaChuyenTau, SoLuongToa, SoCho, GaDi, GaDen, NgayDi, GioDi, NgayDen, GioDen)
VALUES
    ('SE1', null, null, N'Ga Hà Nội', N'Ga Sài Gòn', '2023-01-01', '21:00', '2023-01-02', '16:00'),
    ('SE2', null, null, N'Ga Sài Gòn', N'Ga Hà Nội', '2023-02-01', '09:00', '2023-02-02', '20:00'),
    ('SE19', null, null, N'Ga Hà Nội', N'Ga Đà Nẵng', '2023-03-01', '12:00', '2023-03-02', '20:00'),
    ('SE20', null, null, N'Ga Đà Nẵng', N'Ga Hà Nội', '2023-03-01', '12:00', '2023-03-02', '20:00'),
    ('NA1', null, null, N'Ga Hà Nội', N'Ga Vinh', '2023-03-01', '21:50', '2023-03-02', '05:30'),
    ('NA2', null, null, N'Ga Vinh', N'Ga Hà Nội', '2023-03-01', '22:10', '2023-03-02', '05:15'),
    ('HP1', null, null, N'Ga Hà Nội', N'Ga Hải Phòng', '2023-03-01', '12:00', '2023-03-02', '20:00'),
    ('HP2', null, null, N'Ga Hà Nội', N'Ga Hải Phòng', '2023-03-01', '12:00', '2023-03-02', '20:00'),
    ('SP3', null, null, N'Ga Hà Nội', N'Ga Lào Cai', '2023-03-01', '12:00', '2023-03-02', '20:00'),
    ('SP4', null, null, N'Ga Lào Cai', N'Ga Hà Nội', '2023-03-01', '12:00', '2023-03-02', '20:00');

-- Dữ liệu mẫu cho tblToaTau
INSERT INTO tblToaTau (MaToa, MaChuyenTau, SoLuongCho, LoaiToa, GaKhaiThac)
VALUES
    -- SE1
    ('TOA001', 'SE1', 25, N'Ngồi mềm điều hòa', N'Ga Sài Gòn'),
    ('TOA002', 'SE1', 45, N'Ngồi mềm điều hòa', N'Ga Sài Gòn'),
    ('TOA003', 'SE1', 50, N'Giường nằm khoang 6 điều hòa', N'Ga Sài Gòn'),
    ('TOA004', 'SE1', 55, N'Giường nằm khoang 6 điều hòa', N'Ga Sài Gòn'),
    ('TOA006', 'SE1', 55, N'Giường nằm khoang 4 điều hòa', N'Ga Sài Gòn'),
    ('TOA007', 'SE1', 55, N'Giường nằm khoang 4 điều hòa', N'Ga Sài Gòn'),
    ('TOAHN1', 'SE1', 55, N'Hàng ăn', N'Ga Sài Gòn'),

    -- SE2
    ('TOA010', 'SE2', 25, N'Ngồi mềm điều hòa', N'Ga Hà Nội'),
    ('TOA011', 'SE2', 45, N'Ngồi mềm điều hòa', N'Ga Hà Nội'),
    ('TOA012', 'SE2', 50, N'Giường nằm khoang 6 điều hòa', N'Ga Hà Nội'),
    ('TOA013', 'SE2', 55, N'Giường nằm khoang 6 điều hòa', N'Ga Hà Nội'),
    ('TOA015', 'SE2', 55, N'Giường nằm khoang 4 điều hòa', N'Ga Hà Nội'),
    ('TOA016', 'SE2', 55, N'Giường nằm khoang 4 điều hòa', N'Ga Hà Nội'),
    ('TOAHN2', 'SE2', 55, N'Hàng ăn', N'Ga Hà Nội'),

    -- SE19
    ('TOA033', 'SE19', 25, N'Ngồi mềm điều hòa', N'Ga Đà Nẵng'),
    ('TOA034', 'SE19', 50, N'Giường nằm khoang 6 điều hòa', N'Ga Đà Nẵng'),
    ('TOA035', 'SE19', 55, N'Giường nằm khoang 4 điều hòa', N'Ga Đà Nẵng'),
    ('TOAHN3', 'SE19', 55, N'Hàng ăn', N'Ga Hà Nội'),

    -- SE20
    ('TOA036', 'SE20', 25, N'Ngồi mềm điều hòa', N'Ga Hà Nội'),
    ('TOA037', 'SE20', 50, N'Giường nằm khoang 6 điều hòa', N'Ga Hà Nội'),
    ('TOA038', 'SE20', 55, N'Giường nằm khoang 4 điều hòa', N'Ga Hà Nội'),
    ('TOAHN4', 'SE20', 55, N'Hàng ăn', N'Ga Hà Nội'),

    -- SP3
    ('TOA039', 'SP3', 25, N'Ngồi mềm điều hòa', N'Ga Lào Cai'),
    ('TOA040', 'SP3', 50, N'Giường nằm khoang 6 điều hòa', N'Ga Lào Cai'),
    ('TOA041', 'SP3', 55, N'Giường nằm khoang 4 điều hòa', N'Ga Lào Cai'),

    -- SP4
    ('TOA042', 'SP4', 25, N'Ngồi mềm điều hòa', N'Ga Hà Nội'),
    ('TOA043', 'SP4', 50, N'Giường nằm khoang 6 điều hòa', N'Ga Hà Nội'),
    ('TOA044', 'SP4', 55, N'Giường nằm khoang 4 điều hòa', N'Ga Hà Nội'),

    -- HP1
    ('TOA018', 'HP1', 53, N'Ngồi mềm điều hòa', N'Ga Hải Phòng'),
    ('TOA019', 'HP1', 53, N'Ngồi mềm điều hòa', N'Ga Hải Phòng'),
    ('TOA020', 'HP1', 53, N'Ngồi mềm điều hòa', N'Ga Hải Phòng'),

    -- HP2
    ('TOA022', 'HP2', 53, N'Ngồi mềm điều hòa', N'Ga Hà Nội'),
    ('TOA023', 'HP2', 53, N'Ngồi mềm điều hòa', N'Ga Hà Nội'),
    ('TOA024', 'HP2', 53, N'Ngồi mềm điều hòa', N'Ga Hà Nội'),

    -- NA1
    ('TOA025', 'NA1', 53, N'Giường nằm khoang 6 điều hòa', N'Ga Vinh'),
    ('TOA026', 'NA1', 53, N'Giường nằm khoang 6 điều hòa', N'Ga Vinh'),
    ('TOA027', 'NA1', 53, N'Giường nằm khoang 4 điều hòa', N'Ga Vinh'),
    ('TOA028', 'NA1', 53, N'Giường nằm khoang 4 điều hòa', N'Ga Vinh'),

    -- NA2
    ('TOA029', 'NA2', 53, N'Giường nằm khoang 6 điều hòa', N'Ga Hà Nội'),
    ('TOA030', 'NA2', 53, N'Giường nằm khoang 6 điều hòa', N'Ga Hà Nội'),
    ('TOA031', 'NA2', 53, N'Giường nằm khoang 4 điều hòa', N'Ga Hà Nội'),
    ('TOA032', 'NA2', 53, N'Giường nằm khoang 4 điều hòa', N'Ga Hà Nội');

-- Dữ liệu mẫu cho tblHoaDon
INSERT INTO tblHoaDon (MaHoaDon, MaNhanVien, TrangThai, SoLuong, ThanhTien, NgayBan)
VALUES
    -- Khách hàng 1
    ('HD001', 'NV001', 1, null, null, '2023-01-01'),
    ('HD002', 'NV002', 1, null, null, '2023-01-01'),
    ('HD003', 'NV003', 1, null, null, '2023-02-01'),
    ('HD004', 'NV004', 1, null, null, '2023-02-02'),
    ('HD005', 'NV005', 1, null, null, '2023-03-01');

-- Dữ liệu mẫu cho tblThongTinVe
INSERT INTO tblThongTinVe (MaVe, MaChuyenTau, MaHoaDon, MaKhachHang, LoaiVe, LoaiCho, Toa, ViTri, GiaVe)
VALUES

    -- SE1 về SE2
    ('VE001', 'SE1', 'HD001', 'KH001', 'Toàn vé', 'Giường nằm', 2, 5, 1500000),
    ('VE002', 'SE1', 'HD001', 'KH002', 'Toàn vé', 'Giường nằm', 2, 10, 1800000),

    -- SE19 về SE20
    ('VE003', 'SE19', 'HD002', 'KH003', 'Toàn vé', 'Giường nằm', 2, 5, 1500000),
    ('VE004', 'SE20', 'HD002', 'KH003', 'Toàn vé', 'Giường nằm', 2, 5, 1500000);


    ('VE004', 'SE2', 'HD002', 'KH002', 'Toàn vé', 'Giường nằm', 2, 10, 1800000);

SELECT * FROM tblThongTinVe

-- Test Data
SELECT tblChuyenTau.MaChuyenTau, COUNT(MaToa) AS SoLuongToa
FROM tblToaTau 
INNER JOIN tblChuyenTau ON tblChuyenTau.MaChuyenTau = tblToaTau.MaChuyenTau 
GROUP BY tblChuyenTau.MaChuyenTau;

SELECT MaVe, COUNT(tblHoaDon.MaHoaDon) AS SoHoaDon
FROM tblHoaDon
INNER JOIN tblThongTinVe ON tblThongTinVe.MaHoaDon = tblHoaDon.MaHoaDon
GROUP BY tblHoaDon.MaHoaDon

/* 
 * Yêu cầu bài tập lớn
    -- Hàm
    1. 
	2. 
    3. Hàm lấy danh sách hóa đơn theo ngày
    4. Hàm Kiểm Tra Trạng Thái Hóa Đơn
    5. Hàm cập nhật giá vé vào bảng hóa đơn

    -- Thủ tục
    1. Thủ tục thêm số lượng chỗ của một chuyến tàu theo số lượng toa tàu của một mã tàu - Xong
    2. Thủ tục thêm số lượng toa của một chuyến tàu theo số lượng toa tàu của một mã tàu - Xong
    3. Thủ tục cập nhật số lượng và thành tiền cho bảng hóa đơn
    4. Thủ tục cập nhật trạng thái hóa đơn
    5.

    -- Trigger
    1. Trigger mã hóa mật khẩu tài khoản nhân viên
    2. 
    3. 
    4.
    5. 

    -- View
    1. View Danh Sách Chuyến Tàu Đang Diễn Ra
    2. View Tổng Số Vé Bán Được Theo Loại Chỗ
    3. View Danh Sách Nhân Viên và Số Lượng Hóa Đơn Đã Bán
    4. Danh sách hóa đơn chưa thanh toán
    5. Tạo view hiển thị số lượng toa theo mã tàu
*/


/* Bài làm */

-- Hàm
    --1. 
	--2. 
    --3. Hàm lấy danh sách hóa đơn theo ngày
    GO;
    CREATE FUNCTION func_LayDanhSachHoaDonTheoNgay(@NgayBan DATE)
    RETURNS TABLE
    AS
    RETURN
    (
        SELECT * FROM tblHoaDon WHERE NgayBan = @NgayBan
    );
    
    GO;
    SELECT * FROM func_LayDanhSachHoaDonTheoNgay('2023-01-01');
    GO;
    --4. Hàm Kiểm Tra Trạng Thái Hóa Đơn (1: Chưa thanh toán, 2: Đã thanh toán)
    GO;
    CREATE FUNCTION func_KiemTraTrangThaiHoaDon(@MaHoaDon VARCHAR(6))
    RETURNS INT
    AS
    BEGIN
        DECLARE @TrangThai INT;
        SELECT @TrangThai = TrangThai FROM tblHoaDon WHERE MaHoaDon = @MaHoaDon;
        RETURN @TrangThai;
    END;
    GO;
    SELECT dbo.func_KiemTraTrangThaiHoaDon('HD001');
    GO;
    --5. Hàm cập nhật thành tiền vào bảng hóa đơn (giá vé * số lượng)

-- Thủ tục
    --1. Thủ tục thêm số lượng toa của một chuyến tàu theo số lượng toa tàu của một mã tàu
	CREATE PROC proc_ThemSoLuongToa(@MaChuyenTau VARCHAR(6))
    AS
    BEGIN
        DECLARE @SoLuongToa INT;
        SELECT @SoLuongToa = COUNT(MaToa) FROM tblToaTau WHERE MaChuyenTau = @MaChuyenTau;
        UPDATE tblChuyenTau SET SoLuongToa = @SoLuongToa WHERE MaChuyenTau = @MaChuyenTau;
        RETURN @SoLuongToa;
    END;

    EXEC proc_ThemSoLuongToa SE1
	
	--2. Thủ tục thêm số lượng chỗ của một chuyến tàu theo số lượng toa tàu của một mã tàu
	GO;
	ALTER PROC proc_ThemSoLuongCho(@MaChuyenTau VARCHAR(6))
    AS
    BEGIN

        DECLARE @SoLuongCho INT;
        SELECT @SoLuongCho = SUM(SoLuongCho) FROM tblToaTau WHERE MaChuyenTau = @MaChuyenTau;
        UPDATE tblChuyenTau SET SoCho = @SoLuongCho WHERE MaChuyenTau = @MaChuyenTau;
        RETURN @SoLuongCho;
    END;

	EXEC proc_ThemSoLuongCho SE1

    SELECT * FROM tblChuyenTau
	SELECT * FROM tblToaTau

    GO;
    --3. Thủ tục cập nhật số lượng và thành tiền cho bảng hóa đơn

    --4. Thủ tục cập nhật trạng thái hóa đơn
    CREATE PROC proc_CapNhatTrangThaiHoaDon
    AS
    BEGIN
        UPDATE tblHoaDon SET TrangThai = 1
        FROM tblHoaDon
        INNER JOIN tblThongTinVe ON tblThongTinVe.MaHoaDon = tblHoaDon.MaHoaDon;
    END;

    EXEC proc_CapNhatTrangThaiHoaDon

    GO;

     -- Trigger
    --1. Trigger mã hóa mật khẩu tài khoản nhân viên

    --2. 
    --3. 
    --4.
    --5. 



-- View
    -- 5. Tạo view hiển thị số lượng toa theo mã tàu
    CREATE VIEW vw_chuyetau
    AS
    SELECT tblChuyenTau.MaChuyenTau, COUNT(MaToa) AS SoLuongToa
    FROM tblChuyenTau 
    INNER JOIN tblToaTau ON tblToaTau.MaChuyenTau = tblChuyenTau.MaChuyenTau
    GROUP BY tblChuyenTau.MaChuyenTau;

    GO;

    SELECT * FROM vw_chuyetau
