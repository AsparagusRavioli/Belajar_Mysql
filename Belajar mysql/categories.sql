CREATE TABLE categories(
id VARCHAR(10) NOT NULL,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
)ENGINE = InnoDB;

DESC categories;

ALTER TABLE produk
DROP COLUMN kategori;

DESC produk;

ALTER TABLE produk
ADD COLUMN id_categories VARCHAR(100);

ALTER TABLE produk
ADD CONSTRAINT fk_produk_categories
FOREIGN KEY (id_category) REFERENCES categories(id);

SHOW CREATE TABLE produk;

SELECT * FROM produk;

SELECT * FROM categories;

INSERT INTO categories(id, name) 
VALUES  ('C001', 'Makanan'),
        ('C002', 'Minuman'),
        ('C003', 'Lain-lain');
        
UPDATE produk 
SET id_category = 'C001'
WHERE id IN ('P001','P002','P003','P004','P005','P006','P007','P009','P010','P017','P018','P019');


UPDATE produk 
SET id_category = 'C002'
WHERE id IN ('P008','P011','P012','P013');

UPDATE produk 
SET id_category = 'C003'
WHERE id IN ('P014','P015','P016','P020');

SELECT produk.id, produk.nama, categories.name
FROM produk JOIN categories ON (categories.id = produk.id_category);

SELECT * FROM categories;


INSERT INTO categories(id, name) 
VALUES  ('C004', 'Oleh-oleh'),
        ('C005', 'Gadget');
        
SELECT * FROM categories
INNER JOIN produk ON (produk.id_category = categories.id);

SELECT * FROM categories
JOIN produk ON (produk.id_category = categories.id);

SELECT * FROM categories
LEFT JOIN produk ON (produk.id_category = categories.id);

SELECT * FROM categories
RIGHT JOIN produk ON (produk.id_category = categories.id);

SELECT * FROM categories
CROSS JOIN produk;

CREATE TABLE numbers(
id INT NOT NULL,
PRIMARY KEY (id) 
)ENGINE = InnoDB;

INSERT INTO numbers(id) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

SELECT * FROM numbers;

SELECT numbers1.id,numbers2.id,(numbers1.id * numbers2.id)
FROM numbers AS numbers1
     CROSS JOIN numbers AS numbers2
ORDER BY  numbers1.id , numbers2.id;

SELECT numbers1.id,numbers2.id,(numbers1.id + numbers2.id)
FROM numbers AS numbers1
     CROSS JOIN numbers AS numbers2
ORDER BY  numbers1.id , numbers2.id;

SELECT numbers1.id,numbers2.id,(numbers1.id / numbers2.id)
FROM numbers AS numbers1
     CROSS JOIN numbers AS numbers2
ORDER BY  numbers1.id , numbers2.id;

