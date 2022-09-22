SELECT AVG(price)
FROM products;


-- @block query
SELECT *
FROM products
WHERE price > 12725;


-- @block melakukan subquery di where clause 
SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
  );


-- @block melakukan subquery di from
SELECT max(price)
FROM(
    SELECT products.price
    FROM categories
      INNER JOIN products ON (products.id_category = categories.id)
  ) AS cp;