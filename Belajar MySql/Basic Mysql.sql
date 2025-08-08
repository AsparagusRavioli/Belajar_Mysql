-- Belajar insert data

CREATE TABLE produk (
    id VARCHAR(10) NOT NULL,
    nama VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

ALTER TABLE produk ADD COLUMN description TEXT;

-- Insert tanpa description (boleh karena kolom itu nullable)
INSERT INTO produk (id, nama, price, quantity)
VALUES ('P001', 'Mie ayam original', 15000, 100);

-- Lihat isi tabel
SELECT * FROM produk;

-- Insert dengan description
INSERT INTO produk (id, nama, description, price, quantity)
VALUES ('P002', 'Mie ayam bakso pangsit', 'Mie ayam original + bakso', 20000, 70);

INSERT INTO produk (id, nama, price, quantity)
VALUES ('P003', 'Mie ayam ceker', 20000, 30), 
       ('P004', 'Mie ayam spesial', 25000, 25),
       ('P005', 'Mie ayam yamin', 15000, 80),
       ('P006', 'Bakmie ayam', 30000, 50),
       ('P007', 'Pangsit spesial', 12000, 120),
       ('P008', 'Teh botol sosro', 8000, 150);

SELECT id,nama,price,quantity from produk;

-- Lihat daftar tabel
SHOW TABLES;

-- Lihat struktur tabel
DESC produk;
