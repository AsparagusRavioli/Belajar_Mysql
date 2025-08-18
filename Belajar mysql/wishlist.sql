-- ========================================
-- Tabel: wishlist
-- ========================================
CREATE TABLE wishlist (
    id INT NOT NULL AUTO_INCREMENT,
    id_produk VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_produk FOREIGN KEY (id_produk) REFERENCES produk (id)
) ENGINE=InnoDB;

-- Ubah foreign key
ALTER TABLE wishlist DROP CONSTRAINT fk_wishlist_produk;
ALTER TABLE wishlist
  ADD CONSTRAINT fk_wishlist_produk
  FOREIGN KEY (id_produk) REFERENCES produk (id)
  ON DELETE CASCADE ON UPDATE CASCADE;

-- Insert contoh
INSERT INTO wishlist (id_produk, description) VALUES
('P001','Makanan Kesukaan');

INSERT INTO wishlist(id_product, description)
VALUES ('SALAH', 'Makanan Kesukaan');

DELETE
FROM produk
WHERE id = 'Pxxx';

INSERT INTO wishlist(id_produk, description)
VALUES ('Pxxx', 'Makanan Kesukaan');

SELECT * 
FROM wishlist 
JOIN produk ON (wishlist.id_produk = produk.id);

SELECT wishlist.id, produk.id, produk.nama ,wishlist.description 
FROM wishlist 
JOIN produk ON (wishlist.id_produk = produk.id);

SELECT w.id AS id_wishlist, 
     p.id AS id_produk, 
     p.nama AS nama_produk,
     w.description AS description_produk
FROM wishlist AS w
    JOIN produk  AS p ON (w.id_produk = p.id);

DESCRIBE wishlist;

ALTER TABLE wishlist
ADD COLUMN id_customer INT;

SHOW CREATE TABLE wishlist;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_customer
FOREIGN KEY (id_customer) REFERENCES customer(id);

UPDATE wishlist
SET id_customer = 1
WHERE id = 1;

SELECT * FROM wishlist;


SELECT customer.email, produk.id, produk.nama , wishlist.description
FROM wishlist
JOIN produk ON (produk.id = wishlist.id_produk)
JOIN customer ON (customer.id = wishlist.id_customer);

