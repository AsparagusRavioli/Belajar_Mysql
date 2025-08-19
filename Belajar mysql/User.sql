CREATE USER 'farel'@'localhost';
CREATE USER 'oyen'@'%';

DROP USER 'farel'@'localhost';
DROP USER 'oyen'@'%';

GRANT SELECT ON belajar_mysql.* TO 'farel'@'localhost';

GRANT SELECT ON belajar_mysql.* TO 'oyen'@'%';
GRANT INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'oyen'@'%';

SHOW GRANTS FOR 'farel'@'localhost';
SHOW GRANTS FOR 'oyen'@'%';


REVOKE SELECT ON belajar_mysql.* FROM 'farel'@'localhost';
REVOKE SELECT ON belajar_mysql.* FROM 'oyen'@'%';


ALTER USER 'farel'@'localhost' IDENTIFIED BY 'farel';
ALTER USER 'oyen'@'%' IDENTIFIED BY 'farel';

INSERT INTO guestbooks(email,title,content) VALUES ('contoh@gmail.com','hello','hai');


CREATE TABLE contoh(
id INT Not NULL,
PRIMARY KEY (id)
)ENGINE = InnoDB;
