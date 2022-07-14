-- * CONSTRAINT



-- * UNIQUE CONSTRAINT


-- constraint bagus digunakan unuk menjaga terjadi validasi yang salah di perogram kita,
-- sehingga data yang masuk di database tetap akan terjaga
-- Unique Constraint adalah counstaint yang memastikan bahwa data kita tetap unik dan tidak menerima data duplikat

-- @block membuat table costumer dengan CONSTRAINT
CREATE TABLE customers (
       id INT NOT NULL AUTO_INCREMENT,
       email VARCHAR(100) NOT NULL,
       first_name VARCHAR(100) NOT NULL,
       last_name VARCHAR(100),
       PRIMARY KEY (id),
       UNIQUE KEY email_unique (email)
) ENGINE = InnoDB;

-- @block query
DESC customers;


-- * Menambah Atau Menghapus UNIQUE KEY

-- ALTER TABLE table_name
--     ADD CONSTRAINT constraint_name UNIQUE (column_name); : menambah unique key
--     DROP CONSTRAINT constraint_name;                     : menghapus unique key

-- @block menghapus unique key
ALTER TABLE customers DROP CONSTRAINT email_unique;

-- @block menambahkan unique key
ALTER TABLE customers
ADD CONSTRAINT email_unique UNIQUE (email);

-- @block query
INSERT INTO customers(email, first_name, last_name)
VALUES ('fajarfadilah@gmail.com', 'fajar', 'fadilah'),
       ('lismanfauzi@gmail.com', 'lisman', 'fauzi');

-- @block query
SELECT *
FROM customers;

-- @block query
-- ! ERROR karna email harus unique tidak boleh duplicat
-- INSERT INTO customers(email, first_name, last_name)
-- VALUES ('fajarfadilah@gmail.com', 'fajar', 'fadilah');


-- * CHECK CONSTRAINT


--  @block pembuatan table dengan CHECK CONSTRAINT
-- CREATE TABLE products (
--     id  VARCHAR(10) NOT NULL,
--     name VARCHAR(100) NOT NULL,
--     description TEXT,
--     price INT UNSIGNED NOT NULL,
--     quantity INT UNSIGNED NOT NULL DEFAULT 0,
--     create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP PRIMARY KEY (id),
--     CONSTRAINT price_check CHECK (price >= 1000)
-- ) ENGINE = InnoDB;

-- * Menambahkan Atau Menghapus CHECK CONSTRAINT

-- @block menambah check constraint
ALTER TABLE products
ADD CONSTRAINT price_check CHECK (price >= 1000);

-- @block menghapus check constraint
ALTER TABLE products DROP CONSTRAINT price_check;

-- @block query
SELECT *
FROM products;


-- ! ERROR karnam price harus lebih aatau sama dengan 1000 karna price itu constrint check
--- @block query
-- INSERT INTO products(id, name, category, price, quantity) 
-- VALUES ('P0017', 'Permen', 'Lain-Lain', 500, 1000);

-- ! saat update data saat price dibawah 1000 juga akan di tolak
-- @block query
-- UPDATE products
-- SET price = 500
-- WHERE id = 'P0013';

-- @block berhasil
INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0017', 'Permen', 'Lain-Lain', 1000, 1000);



-- * INDEX


-- saat kita membuat index, MySQL akan menyimpan data dalam structur B-Tree
-- tidak hanya akan mempermudah kita dalam perncarian, index juga akan mempermudah ketika melakukan
-- pemgurutam menggunakan ORDER BY

-- @block cara membuat index
CREATE TABLE sellers (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    -- untuk primary key mysql akan otomatis menambahkan index di perimary ky
    UNIQUE KEY email_unique (email),
    -- untuk unique juga sama akan menambahkan index
    INDEX name_index (name) -- ini akan menambahkan index pada kolom name
) ENGINE = InnoDB


-- * Menambahkan Atau Menghapus INDEX

-- @block menghapus index
ALTER TABLE sellers DROP INDEX name_index;

-- @block menambahkan index
ALTER TABLE sellers ADD INDEX name_index (name);



-- * FULL-TEXT SEARCH


-- operasi yang dilakukan oleh LIKE operator adalah dengan cara mencari seluruh data di table dari baris
-- sampai terakhir, hal ini membuat operasi LIKE sangat lambat
-- Full_Text search memungkinkan kita bisa mencari sebagian kata di kolom dengan tipe data string

-- @block menambahkan FULL_TEXT SEARCH saat pembuatan colomn
-- CREATE TABLE products (
--     id VARCHAR(10) NOT NULL,
--     name VARCHAR(100) NOT NULL,
--     description TEXT,
--     price INT UNSIGNED NOT NULL,
--     quantity INT UNSIGNED NOT NULL DEFAULT 0,
--     create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP PRIMARY KEY (id),
--     FULLTEXT product_fulltext (name, description)
-- ) ENGINE = InnoDB;


-- * Menambahkan Atau Menghapus FULL_TEXT SEARCH

-- @block menambahkan full-text search
ALTER TABLE products
ADD FULLTEXT product_fulltext (name, description);

-- @block menghapus full-text search
ALTER TABLE products DROP FULLTEXT product_fulltext;

-- @block pencarian like operator
SELECT *
FROM products
WHERE name LIKE '%bakso%'
    OR description LIKE '%bakso%';

-- @block mencari dengan Natural Language Mode
SELECT *
FROM products
WHERE MATCH(name, description) AGAINST('Ayam' IN NATURAL LANGUAGE MODE);

-- @block pencarian dengan like operator
SELECT *
FROM products
WHERE name LIKE '%ayam%'
    AND (
        description NOT LIKE '%bakso%'
        OR description IS NULL
    );

-- @block pencarian dengan Boolean Mode
SELECT *
FROM products
WHERE MATCH(name, description) AGAINST('+ayam -bakso' IN BOOLEAN MODE);

-- @block mencari dengan query expansion mode / kemiripan
SELECT *
FROM products
WHERE MATCH(name, description) AGAINST('bakso' WITH QUERY EXPANSION);

-- @block query
select name, category, price FROM products;