-- @block melakukan join table
SELECT *
FROM wishlist
  JOIN products ON (wishlist.id_product = products.id);


-- @block melakukan join table
SELECT w.id AS 'id wishlist',
  p.id AS 'id products',
  p.name AS 'product name',
  w.description AS 'product descriptio'
FROM wishlist AS w
  JOIN products AS p ON (w.id_product = p.id);


-- @block tambah colom id costumer di wishlist
ALTER TABLE wishlist
ADD COLUMN id_customer INT;


-- @block tabahkan foreign key-nya
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_constumer FOREIGN KEY (id_customer) REFERENCES customers (id);


-- @block query
SELECT *
FROM customers;


-- @block query
SELECT *
FROM wishlist;


-- @block join lebih dari 2 table
SELECT c.email,
  p.id,
  p.name,
  w.description
FROM wishlist AS w
  JOIN products AS p ON (w.id_product = p.id)
  JOIN customers AS c ON (w.id_customer = c.id);