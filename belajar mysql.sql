-- Belajar insert data

CREATE TABLE produk (
    id VARCHAR(10) NOT NULL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


ALTER TABLE produk ADD COLUMN description TEXT;
ALTER TABLE produk
ADD PRIMARY KEY (id);

-- Insert tanpa description
INSERT INTO produk (id, nama, price, quantity)
VALUES ('P001', 'Mie ayam original', 15000, 100);

-- Insert dengan description
INSERT INTO produk (id, nama, description, price, quantity)
VALUES ('P002', 'Mie ayam bakso pangsit', 'Mie ayam original + bakso', 20000, 70);

-- Insert beberapa produk
INSERT INTO produk (id, nama, price, quantity)
VALUES ('P003', 'Mie ayam ceker', 20000, 30), 
       ('P004', 'Mie ayam spesial', 25000, 25),
       ('P005', 'Mie ayam yamin', 15000, 80),
       ('P006', 'Bakmie ayam', 30000, 50),
	   ('P007', 'Pangsit spesial', 12000, 120),
       ('P008', 'Teh botol sosro', 8000, 150);

INSERT INTO produk (id,nama,price,quantity)
Values ('P009', 'Bakmie ayam komplit', 45000, 20);

SELECT * FROM produk;
-- atau
SELECT id, nama, price, quantity FROM produk;

SHOW TABLES;
DESC produk;

SHOW CREATE TABLE produk;

SELECT * FROM produk WHERE quantity = 100;
SELECT * FROM produk WHERE price = 15000;
SELECT * FROM produk WHERE id = 'P001';
SELECT * FROM produk where nama = 'Mie ayam yamin';

USE belajar_mysql;
DESC produk;

ALTER TABLE produk
ADD COLUMN kategori enum ('Makanan','Minuman','Lain-Lain')
AFTER nama;

SELECT * FROM produk WHERE id = 'P001';
SELECT * FROM produk;

UPDATE produk
SET kategori = 'Makanan'
WHERE id = 'P001';

UPDATE produk
SET kategori = 'Makanan'
WHERE id = 'P004';

UPDATE produk
SET kategori = 'Makanan'
WHERE id = 'P006';

UPDATE produk
SET kategori = 'Makanan'
WHERE id = 'P005';

UPDATE produk
SET kategori = 'Makanan'
WHERE id = 'P007';

UPDATE produk
SET kategori = 'Makanan'
WHERE id = 'P002';

UPDATE produk
SET kategori = 'Minuman'
WHERE id = 'P008';

UPDATE produk
SET kategori = 'Makanan',
	description = 'Mie ayam + ceker'
WHERE id = 'P003';

UPDATE produk
SET kategori = 'Makanan',
	description = 'Mie ayam + ceker + bakso + pangsit'
WHERE id = 'P009';

UPDATE produk
SET price = price + 5000
WHERE id = 'P005';

UPDATE produk
SET price = price - 5000
WHERE id = 'P006';

INSERT INTO produk (id,nama,price,quantity)
Values ('P010', 'Bakmie ayam ayaman', 5000, 20);

DELETE FROM produk
WHERE id = 'P010';

SELECT id AS 'Kode',
       description AS 'Deskripsi',
       price AS 'Harga',
       quantity AS 'Jumlah'
FROM produk;

SELECT p.id AS 'Kode', 
       p.description AS 'Deskripsi',
       p.price AS 'Harga',
       p.quantity AS 'Jumlah'
FROM produk AS p;

INSERT INTO produk (id,kategori, nama, price, quantity)
VALUES ('P010', 'Makanan','Bakso rusuk', 25000, 30),
       ('P011', 'Minuman','Es jeruk', 10000, 120),
       ('P012', 'Minuman','Es milo', 15000, 100),
       ('P013', 'Minuman','Es campur', 17000, 150),
       ('P014', 'Lain-lain','Kerupuk kulit', 5000, 150),
       ('P015', 'Lain-lain','Kerupuk udang', 10000, 110),
       ('P016', 'Lain-lain','Es krim', 10000, 100),
       ('P017', 'Makanan','Bakso Beranak', 25000, 30),
       ('P018', 'Makanan','Bakso Telur', 25000, 50),
       ('P019', 'Makanan','Bakso urat', 25000, 50);
        
SELECT * FROM produk WHERE quantity > 50;
SELECT * FROM produk WHERE quantity >= 100;

SELECT * FROM produk WHERE kategori != 'Makanan';
SELECT * FROM produk WHERE kategori <> 'Minuman';

SELECT * FROM produk WHERE quantity < 100;
SELECT * FROM produk WHERE quantity <= 50;

SELECT * FROM produk WHERE quantity = 50;

SELECT * FROM produk WHERE quantity > 50 AND price > 15000;
SELECT * FROM produk WHERE kategori = 'Makanan' AND price < 20000;

SELECT * FROM produk WHERE quantity > 50 OR price > 15000;
SELECT * FROM produk WHERE quantity < 20 OR price > 10000;

SELECT * FROM produk WHERE kategori = 'Makanan' OR (quantity > 50 AND price > 20000);
SELECT * FROM produk WHERE (kategori = 'Makanan' OR quantity > 50) AND price > 20000;

SELECT * FROM produk WHERE nama LIKE '%Mie%';
SELECT * FROM produk WHERE nama LIKE '%Bakso%';
SELECT * FROM produk WHERE nama NOT LIKE '%Bakso%';
SELECT * FROM produk WHERE nama LIKE '%anak%';

SELECT * FROM produk WHERE description IS NULL;
SELECT * FROM produk WHERE description IS NOT NULL;

SELECT * FROM produk WHERE price BETWEEN 10000 AND 20000;
SELECT * FROM produk WHERE price NOT BETWEEN 10000 AND 20000;

SELECT * FROM produk WHERE kategori IN ('Makanan','Minuman');
SELECT * FROM produk WHERE kategori  NOT IN ('Makanan','Minuman');

SELECT * FROM produk ORDER BY kategori;
SELECT id,kategori,nama FROM produk ORDER BY kategori;
SELECT id,kategori,nama,price FROM produk ORDER BY kategori ASC,price DESC;
SELECT * FROM produk ORDER BY price;

SELECT * FROM produk ORDER BY id LIMIT 5;
SELECT * FROM produk ORDER BY id LIMIT 0,5;
SELECT * FROM produk ORDER BY id LIMIT 5,5;
SELECT * FROM produk ORDER BY id LIMIT 10,5;

USE belajar_mysql;
SHOW tables;

SELECT DISTINCT kategori FROM produk;

SELECT 10 + 10 AS hasil;
SELECT 10 * 10 AS hasil;
SELECT 10 - 5 AS hasil;
SELECT 10 % 3 AS hasil;
SELECT 10 / 2 AS hasil;

SELECT id,nama,price, 
price DIV 1000 AS 'Price in K' 
FROM produk;

SELECT id,nama,price 
FROM produk 
WHERE price div 1000 > 15;

SELECT id, COS(price) 
,SIN(price), 
TAN(price) FROM produk;