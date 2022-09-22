SELECT *
FROM guestbooks;


-- @block ----------------------------- mulai transaction untuk user 1 
START TRANSACTION;


-- @block update data oleh user 1
UPDATE guestbooks
SET title = "di ubah oleh user 1"
WHERE id = 18;


-- @block query
COMMIT;


-- @block query
ROLLBACK;


-- @block 
-- * LOCKING RECORD SECARA MANUAL
-- jika kita ingin melakukan locking sebuah data secara manual, kita bisa
-- tambah perintah FOR UPDATE dibelakang query SELECT
;


-- @block query
START TRANSACTION;


-- @block query
SELECT *
FROM products
WHERE id = 'POOO1' FOR
UPDATE;


-- @block query
UPDATE peroducts
SET quantity - = 10
WHERE id = "POOO1";


-- @block query
COMMIT;