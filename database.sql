-- Create database
CREATE DATABASE IF NOT EXISTS DuLieu;
USE DuLieu;

-- Create tables
CREATE TABLE IF NOT EXISTS tblBoMon (
    MaBM VARCHAR(10) PRIMARY KEY,
    TenBM VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS tblGV (
    MaGV VARCHAR(10) PRIMARY KEY,
    TenGV VARCHAR(50) NOT NULL,
    BoMon VARCHAR(10),
    GioiTinh VARCHAR(10),
    DiaChi VARCHAR(100),
    SoDT VARCHAR(15),
    FOREIGN KEY (BoMon) REFERENCES tblBoMon(MaBM)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert sample data
INSERT INTO tblBoMon (MaBM, TenBM) VALUES
('BM01', 'Công nghệ phần mềm'),
('BM02', 'Hệ thống thông tin'),
('BM03', 'Khoa học máy tính');

INSERT INTO tblGV (MaGV, TenGV, BoMon, GioiTinh, DiaChi, SoDT) VALUES
('GV01', 'Nguyễn Văn A', 'BM01', 'Nam', 'Hà Nội', '0123456789'),
('GV02', 'Trần Thị B', 'BM02', 'Nữ', 'Hồ Chí Minh', '0987654321'),
('GV03', 'Lê Văn C', 'BM03', 'Nam', 'Đà Nẵng', '0369852147');