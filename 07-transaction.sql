-- @block memulai transaction
START TRANSACTION;


-- @block query
INSERT INTO guestbooks (email, title, content)
VALUES ("contoh@gmail.com", "contoh 1", "contoh"),
  ("contoh2@gmail.com", "contoh 2", "contoh"),
  ("contoh3@gmail.com", "contoh 3", "contoh");


-- @block query
SELECT *
FROM guestbooks;


-- @block menkomit transaction
COMMIT;


-- @block memulai transaction
START TRANSACTION;


-- @block query
DELETE FROM guestbooks;


-- @block query
SELECT *
FROM guestbooks;


-- @block membatalkan semua transaction
ROLLBACK;