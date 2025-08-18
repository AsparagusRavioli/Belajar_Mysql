CREATE TABLE orders(
   id INT NOT NULL AUTO_INCREMENT,
   total INT NOT NULL,
   order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (id)
)ENGINE = InnoDB;

DESC orders;

CREATE TABLE orders_detail(
id_produk VARCHAR(10) NOT NULL,
id_order INT NOT NULL,
price INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (id_produk,id_order)
)ENGINE = InnoDB;

DESC orders_detail;

ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_produk 
FOREIGN KEY (id_produk) REFERENCES produk(id);

ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_orders 
FOREIGN KEY (id_order) REFERENCES orders(id);

SHOW CREATE TABLE orders_detail;

SELECT *
FROM orders;

INSERT INTO orders(total)
VALUES (50000);

INSERT INTO orders_detail(id_produk , id_order, price ,quantity)
VALUES ('P001',1,25000,1),
	   ('P002',1,25000,1);
       
INSERT INTO orders_detail(id_produk , id_order, price ,quantity)
VALUES ('P003',2,15000,1),
	   ('P004',2,17000,1);
       
INSERT INTO orders_detail(id_produk , id_order, price ,quantity)
VALUES ('P003',3,23000,1),
	   ('P010',3,29000,1);

SELECT * FROM orders_detail;

SELECT * FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN produk ON (produk.id = orders_detail.id_produk);

SELECT orders.id, produk.id , produk.nama, orders_detail.quantity , orders_detail.price FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN produk ON (produk.id = orders_detail.id_produk);

