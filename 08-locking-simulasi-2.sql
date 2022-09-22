SELECT *
FROM guestbooks;


-- @block ----------------------------- mulai transaction untuk user 2 
START TRANSACTION;


-- @block update data oleh user 2
UPDATE guestbooks
SET title = "di ubah oleh user 2"
WHERE id = 18;


-- @block query
COMMIT;