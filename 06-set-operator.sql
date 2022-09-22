-- * SET OPERATOR
-- adalah operasi antara hasil dari dua SELECT query. jenisnya yaitu:
-- UNION
-- UNION ALL
-- INTERSECT
-- MINUS
;


-- @block membuat table guest book untuk simulasi set operator
CREATE TABLE guestbooks (
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(100) NOT NULL,
  title VARCHAR(100) NOT NULL,
  content TEXT,
  PRIMARY KEY (id)
) ENGINE = InnoDB;


-- @block insert
INSERT INTO guestbooks (email, title, content)
VALUES ("fistguest@gmail.com", "Hello", "Hello"),
  ("secondguest@gmail.com", "Hello", "Hello"),
  ("thirdguest@gmail.com", "Hello", "Hello"),
  ("fajarfadilah@gmail.com", "Hello", "Hello"),
  ("fajarfadilah@gmail.com", "Hello", "Hello"),
  ("fajarfadilah@gmail.com", "Hello", "Hello");


-- @block query
SELECT *
FROM guestbooks;


-- @block
-- * UNION adalah operasi menggabungkan dua buah SELECT query,
-- * dimana jika terdapat data yang duplikat, data duplikat akan dihapus dari query
;


-- @block query
SELECT DISTINCT email
FROM customers
UNION
SELECT DISTINCT email
FROM guestbooks;


-- @block
-- * UNION ALL adalah operasi yang sama dengan UNION,
-- * namun data duplikat akan titampikan di hasil query nya
;


-- @block query
SELECT email
FROM customers
UNION ALL
SELECT email
FROM guestbooks;


-- @block query
SELECT emails.email,
  COUNT(emails.email)
FROM (
    SELECT email
    FROM customers
    UNION ALL
    SELECT email
    FROM guestbooks
  ) AS emails
GROUP BY email;


-- @block
-- * INTERSECT
;


-- @block query
SELECT DISTINCT email
FROM customers
WHERE email IN (
    SELECT DISTINCT email
    FROM guestbooks
  );


-- @block query
SELECT DISTINCT customers.email
FROM customers
  INNER JOIN guestbooks ON (guestbooks.email = customers.email);


-- @block
-- * MINUS adalah operasi dimana query pertama akan dihilankan oleh query kedua
;


-- @block query
SELECT DISTINCT customers.email,
  guestbooks.email
FROM customers
  LEFT JOIN guestbooks ON (guestbooks.email = customers.email)
WHERE guestbooks.email IS NULL;