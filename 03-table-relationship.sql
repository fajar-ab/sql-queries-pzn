-- @block 
-- * IMPLEMENTASI ONE TO ONE RELATIONSHIP
;


-- @block membuat table wallet
CREATE TABLE wallet (
  id INT NOT NULL AUTO_INCREMENT,
  id_customer INT NOT NULL,
  balance INT NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  UNIQUE KEY fk_id_customer_unique (id_customer),
  CONSTRAINT fk_wallet_customer FOREIGN KEY (id_customer) REFERENCES customers (id)
) ENGINE = InnoDB;


-- @block query
SHOW CREATE TABLE wallet;


-- @block query
SELECT *
FROM wallet;


-- @block query
INSERT INTO wallet (id_customer)
VALUES (2);


-- @block query
SELECT customers.email,
  wallet.balance
FROM wallet
  JOIN customers ON (wallet.id_customer = customers.id);


-- @block
-- * IMPLEMENTASI ONE TO MANY RELATIONSHIP
;


-- @block membuat table category
CREATE TABLE categories (
  id VARCHAR(10) NOT NULL,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;


-- @block query
DESCRIBE categories;


-- @block hapus colom category di table product
ALTER TABLE products DROP COLUMN category;


-- @block query
DESCRIBE products;


-- @block hapus table category tambah dengan id_category
ALTER TABLE products
ADD COLUMN id_category VARCHAR(10);


-- @block membuat foreign ke id_category
ALTER TABLE products
ADD CONSTRAINT fk_products_catregoris FOREIGN KEY (id_category) REFERENCES categories (id);


-- @block insert
INSERT INTO categories (id, name)
VALUES ("C001", "Makanan"),
  ("C002", "Minuman"),
  ("C000", "Lain-Lain");


-- @block query
SELECT *
FROM products;


-- @block update data id_category di table products
UPDATE products
SET id_category = "C001"
WHERE id IN (
    "P0001",
    "P0002",
    "P0003",
    "P0004",
    "P0005",
    "P0006",
    "P0013",
    "P0014",
    "P0015",
    "P0016"
  );


-- @block query
UPDATE products
SET id_category = "C002"
WHERE id IN ("P0007", "P0008", "P0009", "P0012");


-- @block query
UPDATE products
SET id_category = "C000"
WHERE id IN ("P0010", "P0011", "P0017");


-- @block query
SELECT products.id,
  products.name,
  categories.name
FROM categories
  JOIN products ON (categories.id = products.id_category);


-- @block
-- * IMPLEMENTASI ONE TO MANY RELATIONSHIP
;


-- @block membuat table order
CREATE TABLE orders (
  id INT NOT NULL AUTO_INCREMENT,
  total INT NOT NULL,
  order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE = InnoDB;


-- @block membuat table order_detail 
CREATE TABLE orders_detail (
  id_product VARCHAR(10) NOT NULL,
  id_order INT NOT NULL,
  price INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (id_product, id_order)
) ENGINE = InnoDB;


-- @block menambahkan foreign key table orders_detail ke table products
ALTER TABLE orders_detail
ADD CONSTRAINT fk_order_detail_products FOREIGN KEY (id_product) REFERENCES products(id);


-- @block menambahkan foregn key table orders_detail ke table orders
ALTER TABLE orders_detail
ADD CONSTRAINT fk_order_detail_order FOREIGN KEY (id_order) REFERENCES orders(id);


-- @block query
SELECT *
FROM orders;


-- @block query
SELECT *
FROM products;


-- @block query
SELECT *
FROM orders_detail
ORDER BY id_order;


-- @block query
INSERT INTO orders (total)
VALUES (5000);


-- @block order 1
INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES ("P0001", 1, 15000, 2),
  ("P0002", 1, 20000, 1),
  ("P0003", 1, 20000, 3);


-- @block order 2
INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES ("P0004", 2, 25000, 1),
  ("P0003", 2, 20000, 2),
  ("P0002", 2, 20000, 1);


-- @block order 3
INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES ("P0001", 3, 15000, 2),
  ("P0002", 3, 20000, 1),
  ("P0003", 3, 20000, 3);


-- @block melihat order, detail, dan product-nya
SELECT *
FROM orders
  JOIN orders_detail ON (orders_detail.id_order = orders.id)
  JOIN products ON (products.id = orders_detail.id_product);


-- @block melihat order, detail, dan product-nya
SELECT orders.id,
  products.id,
  products.name,
  orders_detail.quantity,
  orders_detail.price,
  (orders_detail.quantity * orders_detail.price) AS total
FROM orders
  JOIN orders_detail ON (orders_detail.id_order = orders.id)
  JOIN products ON (products.id = orders_detail.id_product)
ORDER BY orders.id;