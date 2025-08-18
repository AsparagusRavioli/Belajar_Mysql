CREATE TABLE guestbooks(
id INT NOT NULL AUTO_INCREMENT,
email VARCHAR(100),
title VARCHAR(200),
content TEXT,
PRIMARY KEY (id)
)ENGINE = InnoDB;

SELECT * FROM customer;

INSERT INTO guestbooks(email,title,content) VALUES
('guest@gmail.com','hello','world'),
('guest2@gmail.com','hello','world'),
('guest3@gmail.com','hello','world'),
('guest3@gmail.com','hello','world'),
('ikanlele@gmail.com','hello','world'),
('ikanlele@gmail.com','hello','world'),
('ikanlele@gmail.com','hello','world');

SELECT * FROM guestbooks;


SELECT DISTINCT email FROM customer
UNION
SELECT DISTINCT email FROM guestbooks;


SELECT DISTINCT email FROM customer
UNION ALL
SELECT DISTINCT email FROM guestbooks;

SELECT  email FROM customer
UNION ALL
SELECT email FROM guestbooks;

SELECT emails.email, COUNT(emails.email) FROM
(SELECT  email FROM customer
UNION ALL
SELECT email FROM guestbooks) AS emails
GROUP BY emails.email;

SELECT DISTINCT email FROM customer 
WHERE email IN (SELECT DISTINCT email from guestbooks);

SELECT DISTINCT customer.email FROM customer
INNER JOIN guestbooks ON (guestbooks.email = customer.email);

SELECT DISTINCT customer.email, guestbooks.email FROM customer
LEFT JOIN guestbooks ON (customer.email = guestbooks.email)
WHERE guestbooks.email IS NULL;

START TRANSACTION;

INSERT INTO guestbooks(email,title,content) VALUES
('contoh1@gmail.com','hello','world'),
('contoh2@gmail.com','hello','world'),
('contoh3@gmail.com','hello','world');

SELECT * FROM guestbooks;

COMMIT;

START TRANSACTION;

DELETE FROM guestbooks;

SELECT * FROM guestbooks;

ROLLBACK;

