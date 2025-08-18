START TRANSACTION ;

SELECT * FROM guestbooks;

UPDATE guestbooks
SET title = 'Diubah oleh user 2'
WHERE id = 10;

COMMIT;

START TRANSACTION;

SELECT * FROM produk;

SELECT * FROM produk WHERE id = 'P001' FOR UPDATE;

UPDATE produk
SET quantity = quantity - 10
WHERE id = 'P001';

COMMIT;

SELECT * FROM produk WHERE id = 'P001' ;