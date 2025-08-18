-- ========================================
-- Tabel: admin
-- ========================================
CREATE TABLE admin(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Insert data
INSERT INTO admin(first_name,last_name) VALUES
('Muhammad','asfarel'),
('Komeng','tekomeng'),
('Oyen','suroyen');

-- Hapus salah satu
DELETE FROM admin WHERE id = 3;

SELECT * FROM admin;

-- Insert lagi
INSERT INTO admin(first_name,last_name) VALUES ('Oyen','suroyen');

SELECT LAST_INSERT_ID();
