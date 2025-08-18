-- ========================================
-- Tabel: produk
-- ========================================
CREATE TABLE produk (
    id VARCHAR(10) NOT NULL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Alter table
ALTER TABLE produk ADD COLUMN description TEXT;
ALTER TABLE produk ADD PRIMARY KEY (id);

INSERT INTO produk (id, nama, price, quantity) VALUES
('P001', 'Mie ayam original', 15000, 100),
('P003', 'Mie ayam ceker', 20000, 30),
('P004', 'Mie ayam spesial', 25000, 25),
('P005', 'Mie ayam yamin', 15000, 80),
('P006', 'Bakmie ayam', 30000, 50),
('P007', 'Pangsit spesial', 12000, 120),
('P008', 'Teh botol sosro', 8000, 150),
('P009', 'Bakmie ayam komplit', 45000, 20);

INSERT INTO produk (id, nama, description, price, quantity) VALUES
('P002', 'Mie ayam bakso pangsit', 'Mie ayam original + bakso', 20000, 70);


-- Tambah kolom kategori
ALTER TABLE produk
ADD COLUMN kategori ENUM('Makanan','Minuman','Lain-Lain')
AFTER nama;

-- Update kategori & description
UPDATE produk SET kategori = 'Makanan' WHERE id IN ('P001','P004','P006','P005','P007','P002');
UPDATE produk SET kategori = 'Minuman' WHERE id = 'P008';
UPDATE produk SET kategori = 'Makanan', description = 'Mie ayam + ceker' WHERE id = 'P003';
UPDATE produk SET kategori = 'Makanan', description = 'Mie ayam + ceker + bakso + pangsit' WHERE id = 'P009';

-- Update harga
UPDATE produk SET price = price + 5000 WHERE id = 'P005';
UPDATE produk SET price = price - 5000 WHERE id = 'P006';

-- Insert tambahan produk
INSERT INTO produk (id,kategori, nama, price, quantity) VALUES
('P010', 'Makanan','Bakso rusuk', 25000, 30),
('P011', 'Minuman','Es jeruk', 10000, 120),
('P012', 'Minuman','Es milo', 15000, 100),
('P013', 'Minuman','Es campur', 17000, 150),
('P014', 'Lain-lain','Kerupuk kulit', 5000, 150),
('P015', 'Lain-lain','Kerupuk udang', 10000, 110),
('P016', 'Lain-lain','Es krim', 10000, 100),
('P017', 'Makanan','Bakso Beranak', 25000, 30),
('P018', 'Makanan','Bakso Telur', 25000, 50),
('P019', 'Makanan','Bakso urat', 25000, 50);

-- Contoh insert & update constraint
INSERT INTO produk(id,nama,kategori,price,quantity) VALUES('P020','Permen','Lain-lain', 500 , 1000);
UPDATE produk SET price = 1000 WHERE id = 'P020';

-- Constraint CHECK
ALTER TABLE produk ADD CONSTRAINT price_check CHECK (price >= 1000);
ALTER TABLE produk ADD CONSTRAINT price_check CHECK (price >= 1000 AND price >= 10000000);

-- Index & fulltext
ALTER TABLE produk ADD FULLTEXT produk_fulltext (nama,description);

SELECT * FROM produk;

INSERT INTO produk (id, nama, price, quantity) VALUES
('X001','X SATU', 25000, 30),
('X002','X DUA', 10000, 120),
('X003','X TIGA', 15000, 100);

SELECT * FROM produk
WHERE price > (SELECT AVG(price) FROM produk);

SELECT MAX(price) from produk;

 SELECT * FROM produk;
 
SELECT MAX(cp.price) FROM (
SELECT price FROM categories JOIN produk ON (produk.id_category = categories.id)) AS cp;

 
UPDATE produk
SET price = 10000000
WHERE id ='X003';

