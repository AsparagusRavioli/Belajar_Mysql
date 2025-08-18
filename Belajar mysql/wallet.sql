CREATE TABLE wallet
(
   id INT NOT NULL AUTO_INCREMENT,
   id_customer INT NOT NULL,
   balance INT NOT NULL DEFAULT 0,
   PRIMARY KEY (id),
   UNIQUE KEY id_customer_unique (id_customer),
   FOREIGN KEY fk_wallet_customer (id_customer) REFERENCES customer (id)
)ENGINE = innodb; 	

DESC wallet; 

SELECT * FROM customer;

INSERT INTO wallet(id_customer) VALUES (1), (2);

UPDATE wallet SET balance = 10000 WHERE id = '1' ;

SELECT * FROM wallet;

SELECT customer.email , wallet.balance
FROM wallet JOIN customer ON(wallet.id_customer = customer.id);
