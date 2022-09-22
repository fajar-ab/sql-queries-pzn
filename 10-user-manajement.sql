-- * Membuat/Menghapus User
;


-- @block ? cuma hanya bisa diakses oleh mesin terinstal nya database itu sendiri
CREATE USER "fajar" @"localhost";


-- @block ? cuma hanya bisa diakses oleh ip itu saja
CREATE USER "fajar" @"192.31.xx.xx";


-- @block ? cuma hanya bisa diakses dari manapun
CREATE USER "fajar" @"%";


-- @block menghapus user
DROP USER "fajar" @"localhost";


-- @block menghapus user
DROP USER "fajar" @"%";


-- * Menambah/Menghapus hak Akses ke User
;


-- @block menambah hak akses
GRANT SELECT ON tutorial_mysql_pzn.* TO "fajar" @"localhost";


-- @block menambah hak akses
GRANT SELECT,
  INSERT,
  UPDATE,
  DELETE ON tutorial_mysql_pzn.* TO "fajar" @"%";


-- @block melihat hak akses apa saja yang diberikan
SHOW
GRANT FOR "fajar" @"localhost";


-- @block melihat hak akses apa saja yang diberikan
SHOW
GRANT FOR "fajar" @"localhost";


-- @block menghapus hak akses
REVOKE
SELECT ON tutorial_mysql_pzn.*
FROM "fajar" @"localhost";


-- @block menghapus hak akses
REVOKE
SELECT,
  INSERT,
  UPDATE,
  DELETE ON tutorial_mysql_pzn.* TO "fajar" @"%";


-- * Mengubah Password untuk USER
;


-- @block menubah password
SET PASSWORD FOR "fajar" @"localhost" = "rahasia";


-- @block menubah password
SET PASSWORD FOR "fajar" @"%" = "rahasia";