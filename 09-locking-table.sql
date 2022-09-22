-- * jika kita me lock table, artinya satu seluruh data ditable tersebut akan dilock
-- cara melakukan looking table dengan perintah
-- - LOCK TABLES nama_table READ
-- - LOCK TABLES nama_table WRITE
-- setelah melakukan lock table, bisa melakukan onlock dengan perintah UNLOK TABLES
;


-- @block ? artinya table tersebut hanya bisa read tidak bisa write, namun orang lain hanya bisa read saja
LOCK TABLE products READ;


-- @block ? artinya table tersebut bisa read/write, dan orang lain tidak bisa melakukan read/write;
LOCK TABLE products READ;


-- @block unclock table
UNLOCK TABLE;