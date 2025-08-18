-- ========================================
-- Tabel: sellers
-- ========================================
CREATE TABLE sellers (
   id INT NOT NULL AUTO_INCREMENT,
   nama VARCHAR(100) NOT NULL,
   nama2 VARCHAR(100),
   nama3 VARCHAR(100),
   email VARCHAR(100) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE KEY email_unique (email),
   INDEX name_index (nama),
   INDEX name2_index (nama2),
   INDEX name3_index (nama3),
   INDEX nama1_nama2_nama3_index (nama, nama2, nama3)
) ENGINE=InnoDB;

-- Ubah index
ALTER TABLE sellers DROP INDEX name_index;
ALTER TABLE sellers ADD INDEX nama_index (nama);
