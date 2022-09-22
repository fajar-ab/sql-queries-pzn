-- @block 
-- * INNER JOIN mekanisme join dimana terdapat relasi antara tanbel pertama dan table kedua
;


-- @block contoh innne join
SELECT *
FROM categories
  INNER JOIN products ON (categories.id = products.id_category);


-- @block contoh innne join
SELECT categories.name,
  products.name
FROM categories
  INNER JOIN products ON (categories.id = products.id_category);


-- @block query
SELECT *
FROM categories;


-- @block insert data catengori yang tidak berelasi dengan products
INSERT INTO categories
VALUES ("C004", "Oleh-leh"),
  ("C005", "Kue Kering");


-- @block insert data products yang tidak berelasi dengan categories
INSERT INTO products (id, name, price, quantity)
VALUES ("X0001", "Xxxxa", 1000, 10),
  ("X0002", "Xxxxb", 2000, 10),
  ("X0003", "Xxxxc", 3000, 10);


-- @block contoh innne join akan menampilkan data yang berelasi saja
SELECT *
FROM categories
  INNER JOIN products ON (categories.id = products.id_category);


-- @block 
-- * LEFT JOIN mekanisme join sama dengan inner join namun semua data data di table pertama akan diambil juga
;


-- @block contoh left join 
SELECT *
FROM categories
  LEFT JOIN products ON (categories.id = products.id_category);


-- @block 
-- * LEFT JOIN mekanisme join sama dengan inner join namun semua data data di table kedua akan diambil juga
;


-- @block contoh left join 
SELECT *
FROM categories
  RIGHT JOIN products ON (categories.id = products.id_category);


-- @block 
-- * CROS JOIN melakukan join dengan cara mengalikan di table pertama dengan data di table kedua
;


-- @block contoh cros join 
SELECT *
FROM categories CROS
  JOIN products;


-- @block query
CREATE TABLE numbers (id INT NOT NULL, PRIMARY KEY (id));


-- @block query
INSERT INTO numbers
VALUES (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10);


-- @block query
SELECT CROS.id,
  numbers.id,
  (CROS.id * numbers.id) AS result
FROM numbers CROS
  JOIN numbers;