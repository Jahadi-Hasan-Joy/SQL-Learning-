CREATE DATABASE my_database;
USE my_database;

SELECT * 
FROM orders 
WHERE country = "United states"
LIMIT 10;

SELECT first_name, country, order_total 
FROM orders 
WHERE country = 'United States'
ORDER BY CAST(order_total AS DECIMAL) DESC; -- age order_total text akare silo

SET SQL_SAFE_UPDATES = 0;

UPDATE orders 
SET order_total = REPLACE(order_total, 'order_total', '');

UPDATE orders 
SET order_total = 0 
WHERE order_total = '' OR order_total IS NULL OR order_total = ' ';


ALTER TABLE orders 
MODIFY order_total DECIMAL(10,3);

ALTER TABLE orders
ADD new_column VARCHAR(20); -- avabe edit korte hoi table e

SELECT first_name, country, order_total 
FROM orders 
WHERE country = 'United States'
ORDER BY order_total DESC;

SELECT first_name, last_name, order_date, order_total
FROM orders
WHERE order_total > 100
ORDER BY order_date DESC;


SELECT *
FROM orders;

RENAME TABLE orders to orders2;
DROP TABLE orders; -- ata dile full table e data soho delete hoye jabe
TRUNCATE TABLE orders; -- ata dile data delete hobe structure thakbe































