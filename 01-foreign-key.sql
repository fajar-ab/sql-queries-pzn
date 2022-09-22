-- @block membuat table dengan foreign key
CREATE TABLE wishlist (
  id INT NOT NULL AUTO_INCREMENT,
  id_product VARCHAR(10) NOT NULL,
  description TEXT,
  PRIMARY KEY (id),
  CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)
) ENGINE = InnoDB;


-- @block query
DESC wishlist;


-- @block menghapus foreign key
ALTER TABLE wishlist DROP CONSTRAINT fk_wishlist_product;


-- @block menambah foreign key ketable
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id);


-- @block memasukkan data ke table wishlist
INSERT INTO wishlist(id_product, description)
VALUES ('P0001', 'makanan kesukaan');


-- @block memasukkan data ke table wishlist
INSERT INTO wishlist(id_product, description)
VALUES ('SALAH', 'makanan kesukaan');


-- @block query
SELECT *
FROM wishlist;


-- @block query
-- ! ERROR menghapus data dari products yang memiliki reference ke table lain
DELETE FROM products
WHERE id = 'P0001';


-- @block mengubah behavior ON DELETE | ON UPDATE
-- ? RESTRICT               ditolak   | ditolak
-- ? CASCADE             data dihapus | data ikut diubah
-- ? NO ACTION         data dibiarkan | data dibiarkan
-- ? SET NULL     diubah menjadi NULL | diubah menjadi NULL
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE;


-- @block menabah data dummy
INSERT INTO products (id, name, category, price, quantity)
VALUES ("Pxxxx", "contoh", "Lain-Lain", 100, 100);


-- @block query
INSERT INTO wishlist(id_product, description)
VALUES ('Pxxxx', 'makanan kesukaan');


-- @block menhapus data di product yang reference ke wishlist
DELETE FROM products
WHERE id = "Pxxxx";


-- @block query
SELECT *
FROM products;