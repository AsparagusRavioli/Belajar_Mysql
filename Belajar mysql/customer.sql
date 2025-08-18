-- ========================================
-- Tabel: customer
-- ========================================
CREATE TABLE customer (
   id INT NOT NULL AUTO_INCREMENT,
   email VARCHAR(100) NOT NULL,
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100),
   PRIMARY KEY (id),
   UNIQUE KEY email_unique(email)
) ENGINE=InnoDB;

-- Ubah constraint email
ALTER TABLE customer DROP CONSTRAINT email_unique;
ALTER TABLE customer ADD CONSTRAINT email_unique UNIQUE (email);

-- Insert data
INSERT INTO customer(email,first_name,last_name) VALUES
('ikanlele@gmail.com','ikan','Lele'),
('ikanbawal@gmail.com','ikan','Bawal');
