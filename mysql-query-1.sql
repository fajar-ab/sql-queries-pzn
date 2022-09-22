-- * MEMBUAT TABLE
-- @block query
CREATE TABLE barang (
    kode INT,
    nama VARCHAR(100),
    harga INT,
    jumlah INT
) ENGINE = InnoDB;


-- * MELIHAT DAFTAR TABLE
-- @block query
SHOW TABLES;


-- * MELIHAT STRUKTUR TABLE
-- @block melihat struktur table barang
DESC barang;


-- @block melihat struktur pembuatan table barang
SHOW CREATE TABLES barang;


-- * MENGUBAH STRUKTUR TABLE
-- ALTER TABLE nama_table
--     ADD COLUMN nama_colomn TEXT,           : menambah kolom baru
--     DROP COLUMN nama_colomn,               : menghapus kolom
--     RENAME COLUMN nama TO nama_baru,       : mengganti nama kolom
--     MODIFY nama VARCHAR(100) ALTER jumlah, : merubah tipe data kolom, geser setelah jumlah 
--     MODIFY nama VARCHAR(100) FIRST;        : geser kedepan
-- @block menambah kolom di table barang
ALTER TABLE barang
ADD COLUMN deskripsi TEXT;


-- @block query
ALTER TABLE barang
ADD COLUMN salah TEXT;


-- @block menghapus kolom salah
ALTER TABLE barang DROP COLUMN salah;


-- @block modifikasi kolom & letakkan kebelakang
ALTER TABLE barang
MODIFY nama VARCHAR(200)
AFTER deskripsi;


-- @block  menggeser kolom ke depan
ALTER TABLE barang
MODIFY nama VARCHAR(200) FIRST;


-- * NOT NULL VALUE
-- @block query
ALTER TABLE barang
MODIFY kode INT NOT NULL;


-- @block query
ALTER TABLE barang
MODIFY nama VARCHAR(200) NOT NULL;


-- * DEFAULT VALUE
-- @block query
ALTER TABLE barang
MODIFY harga INT NOT NULL DEFAULT 0;


-- @block query
ALTER TABLE barang
MODIFY jumlah INT NOT NULL DEFAULT 0;


-- @block DEFAULT value untuk DATETIME
ALTER TABLE barang
ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;


-- * MEMBUAT ULANG ATAU MENGHAPUS TABLE
-- @block TRUNCATE nama_table *akan menghapus semua data pada table dan tablenya akan dibuat ulang
TRUNCATE barang;


-- @block DROP TABLE nama_table *akan menghapus table
DROP TABLE barang;


-- * MEMASUKKAN DATA KEDALAM TABLE / INSERT DATA
-- @block buat table products
CREATE TABLE products (
    id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;


-- @block memasukkan data ke table products
INSERT INTO products(id, name, price, quantity)
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);


-- @block query
INSERT INTO products(id, name, description, price, quantity)
VALUES (
        'P0002',
        'Mie Ayam Bakso',
        'Mie Ayam Original + Bakso',
        20000,
        100
    );


-- * MENGAMBIL DATA DARI TABLE / SELECT DATA
-- @block SELECT * FROM nama_table; *akan mengambil semua kolom dari table
SELECT *
FROM products;


-- @block SELECT nama_kolom1, nama_kolom2, nama_kolom3 FROM nama_table; *akan mengambil semua data di beberapa kolom tertentu dari table
SELECT id,
    name,
    price
FROM products;


-- * PRIMARY KEY
-- @block menambahkan primary key ke kolom id
ALTER TABLE products
ADD PRIMARY KEY (id);


-- * WHERE CLAUSE
-- @block menampilkan data yang pricenya 15000
SELECT *
FROM products
WHERE price = 15000;


-- @block menampilkan data yang id POO1
SELECT *
FROM products
WHERE id = 'P0001';


-- @block menampilkan data yang id Mie Ayam Bakso
SELECT *
FROM products
WHERE name = 'mie ayam bakso';


-- * UPDATE DATA
-- @block menambah kolom category
ALTER TABLE products
ADD COLUMN category enum('Makanan', 'Minuman', 'Lain-Lain')
AFTER name;


-- @block  mengubah satu kolom
UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001';


-- @block  mengubah lebih dari satu kolom
UPDATE products
SET category = 'Makanan',
    description = 'Mie Ayam + Ceker'
WHERE id = 'P0003';


-- @block  mengubah dengan value di kolom sambil penambahan nilai
UPDATE products
SET price = price + 5000
WHERE id = 'P0005';


-- * DELETE DATA
-- @block query
INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0009', 'Mie Ayam Kampung', 'Makanan', 23000, 200);


-- @block menghapus data
DELETE FROM products
WHERE id = 'P0009';


-- * ALIAS 
-- @block alias untuk kolom
SELECT id AS 'Kode',
    name AS 'Nama',
    category AS 'Kategori',
    price AS 'Harga',
    quantity AS 'Stok'
FROM products;


-- @block alias untuk table
SELECT p.id AS 'Kode',
    p.name AS 'Nama',
    p.category AS 'Kategori',
    p.price AS 'Harga',
    p.quantity AS 'Jumlah'
FROM products AS p;


-- * WHERE OPERATOR
-- @block menambah beberapa data
INSERT INTO products(id, category, name, price, quantity)
VALUES ('P0006', 'Makanan', 'Bakso Rusuk', 25000, 200),
    ('P0007', 'Minuman', 'Es Jeruk', 10000, 300),
    ('P0008', 'Minuman', 'Es Campur', 15000, 500),
    ('P0009', 'Minuman', 'Es Teh Manis', 5000, 400),
    ('P0010', 'Lain-Lain', 'Krupuk', 2500, 1000),
    ('P0011', 'Lain-Lain', 'Kripik Udang', 10000, 300),
    ('P0012', 'Lain-Lain', 'Es Krim', 5000, 200),
    ('P0013', 'Makanan', 'Mie Ayam Jamur', 20000, 50),
    ('P0014', 'Makanan', 'Bakso Telor', 20000, 150),
    ('P0015', 'Makanan', 'Bakso Jando', 25000, 300);


-- @block query
SELECT *
FROM products
WHERE id = 'P0007' -- * OPERATOE PERBANDINGAN
    -- mencari data dengan operator perbandingan
    -- @block query
SELECT *
FROM products
WHERE quantity > 100;


-- @block query
SELECT *
FROM products
WHERE quantity >= 100;


-- @block query
SELECT *
FROM products
WHERE category != 'Makanan';


-- @block query
SELECT *
FROM products
WHERE category <> 'Minuman';


-- * AND OPERATOR 
-- @block query
SELECT *
FROM products
WHERE quantity > 100
    AND price > 20000;


-- @block query
SELECT *
FROM products
WHERE category = 'Makanan'
    AND price < 20000;


-- * OR OPERATOR
-- @block query
SELECT *
FROM products
WHERE quantity > 100
    OR quantity > 20000;


-- * Prioritas Dengan Kurung ()
-- @block query
SELECT id,
    name,
    category,
    price,
    quantity
FROM products
WHERE category = 'Makanan'
    OR quantity > 500
    AND price > 20000;


-- @block query
SELECT id,
    name,
    category,
    price,
    quantity
FROM products
WHERE category = 'Makanan'
    OR (
        quantity > 500
        AND price > 20000
    );


-- @block query
SELECT id,
    name,
    category,
    price,
    quantity
FROM products
WHERE (
        category = 'Makanan'
        OR quantity > 500
    )
    AND price > 20000;


-- * LIKE OPERATOR
-- @block cari data awalan `b`
SELECT id,
    name,
    category,
    price,
    quantity
FROM products
WHERE name LIKE "b%";


-- @block cari data akhiran `k`
SELECT id,
    name,
    category,
    price,
    quantity
FROM products
WHERE name LIKE "%k";


-- @block cari data yang mengandung `bakso`
SELECT id,
    name,
    category,
    price,
    quantity
FROM products
WHERE name LIKE "%bakso%";


-- @block dengan bebas
SELECT id,
    name,
    category,
    price,
    quantity
FROM products
WHERE name LIKE "%usu%";


-- @block cari data yang tidak mengandung `bakso`
SELECT id,
    name,
    category,
    price,
    quantity
FROM products
WHERE name NOT LIKE "%bakso%";


-- * NULL OPERATOR
-- @block mencari menggunakan null operator jika null
SELECT *
FROM products
WHERE description IS NULL;


-- @block mencari menggunakan null operator jika tidak null
SELECT *
FROM products
WHERE description IS NOT NULL;


-- * BETWEEN ORATOR
-- @block mencari data products dengan prire antara 10.000 dan 20.000
SELECT *
FROM products
WHERE price BETWEEN 10000 AND 20000;


-- @block mencari data products, yang prire tidak di antara 10.000 dan 20.000
SELECT *
FROM products
WHERE price NOT BETWEEN 10000 AND 20000;


-- * IN OPERATOR
-- @block mencari data products, yang categorinya makanan dan minuman
SELECT *
FROM products
WHERE category IN ('Makanan', 'Minuman');


-- @block mencari data products, yang categorinya bukan makanan dan minuman
SELECT *
FROM products
WHERE category NOT IN ('Makanan', 'Minuman');


-- * ORDER BY CLAUSE
-- @block mengurutkan colom category secara ascending
SELECT id,
    category,
    name
FROM products
ORDER BY category ASC;


-- @block mengurutkan berdasarkan colom category ascending dan price secara descending
SELECT id,
    category,
    price,
    name
FROM products
ORDER BY category ASC,
    price DESC;


-- * LIMIT CLAUSE
-- @block untuk membatasi hasil data yang di tampilkan
SELECT *
FROM products
ORDER BY id
LIMIT 2;


-- @block tampilkan sebayak tiga
SELECT *
FROM products
ORDER BY id
LIMIT 3;


-- @block tampilkan sebayak lima data setelah data ke lima
SELECT *
FROM products
ORDER BY id
LIMIT 5, 5;


-- @block tampilkan sebayak lima data setelah data ke sepuluh
SELECT *
FROM products
ORDER BY id
LIMIT 10, 5;


-- * SELECT DISTING DATA
-- @block menampilkan dengan menghilangkan data duplikat
SELECT category
FROM products;


-- @block menghapus tampilan data category yang duplikat 
SELECT DISTINCT category
FROM products;


-- * NUMERIC FUNCTION
-- * Arithmetic Operator
-- @block memanggil function tampa menggunaan table
SELECT 4 + 5 AS jumlah;


-- @block query
SELECT id,
    name,
    price DIV 1000 AS 'price in K'
FROM products;


-- @block query
SELECT id,
    name,
    price
FROM products
WHERE price DIV 1000 > 15;


-- * Matemathical Function
-- @block query
SELECT id,
    COS(price),
    SIN(price),
    TAN(price)
FROM products;


-- * AUTO INCREMENT
-- @block membuat table dengan auto increment
CREATE TABLE admin (
    id int NOT NULL AUTO_INCREMENT,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;


-- @block query
DESC admin;


-- @block insert data ke table admin tanpa memasukkan id akan secara otomatis dibuatkan
INSERT INTO admin(first_name, last_name)
VALUES ('Eko', 'Khannedy'),
    ('Budi', 'Nugraha'),
    ('Joko', 'Morro'),
    ('Otong', 'Surotong');


-- @block query
SELECT *
FROM admin;


-- @block haspus 1 record di table admin dengan id = 3
DELETE FROM admin
WHERE id = 3;


-- @block query
INSERT INTO admin(first_name, last_name)
VALUES ('Joko', 'Morro');


-- @block meihat id terakhir
SELECT LAST_INSERT_ID();


-- * STRING FUNCTION
-- @block tampilkan nama dengan huruf kecil
SELECT LOWER(name) AS 'nama lower'
FROM products;


-- @block tampilkan nama dengan huruf besar
SELECT UPPER(name) AS 'nama upper'
FROM products;


-- @block panjang string
SELECT id,
    LOWER(name) AS "nama lower",
    UPPER(name) AS "nama upper",
    LENGTH(name) AS "panjang nama"
FROM products;


-- * DATE AND TIME FUNCTION
-- @block query
SELECT id,
    EXTRACT(
        YEAR
        FROM create_at
    ) AS Year,
    EXTRACT(
        MONTH
        FROM create_at
    ) AS MONTH
FROM products;


-- @block query
SELECT id,
    YEAR(create_at) AS Year,
    MONTH(create_at) AS MONTH
FROM products;


-- * CONTROL FLOW FUNCTION
-- @block case fungtion
SELECT name,
    quantity AS tinggal,
    CASE
        category
        WHEN "Makanan" THEN "Porsi"
        WHEN "Minuman" THEN "Gelas"
        ELSE "tidak tau"
    END AS berapa
FROM products -- @block if function
SELECT id,
    price,
    IF(
        price <= 15000,
        'Murah',
        IF(price <= 20000, 'Mahal', 'Mahal Banget')
    ) AS 'Mahal?'
FROM products;


-- @block if null mencari null
SELECT id,
    name,
    IFNULL(description, 'Tidak ada deskripsi')
FROM products;


-- * AGGREGATE FUNCTION
-- @block melihat berapa jumlah products
SELECT COUNT(id) AS 'Total Products'
FROM products;


-- @block rata rata
SELECT AVG(price) AS 'Rata Rata'
FROM products;


-- @block nilai maksimal
SELECT MAX(price) AS 'Harga Termahal'
FROM products;


-- @block nilai minimal
SELECT MIN(price) AS 'Harga Termurah'
FROM products;


-- @block nila total
SELECT SUM(quantity) AS 'Total Stock'
FROM products;


--  * GROUP BY CLAUSE
-- @block query
SELECT category,
    COUNT(id) AS 'Jumlah Products'
FROM products
GROUP BY category;


-- @block query
SELECT category,
    MAX(price) AS 'Harga Termahal'
FROM products
GROUP BY category;


-- @block query
SELECT category,
    MIN(price) AS 'Harga Termurah'
FROM products
GROUP BY category;


-- * HAVING CLAUSE
-- @block memfilter hasil aggregate fuction
SELECT category,
    COUNT(id) AS total
FROM products
GROUP BY category
HAVING total > 5;