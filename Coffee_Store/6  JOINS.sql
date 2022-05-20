use coffee_store;
show tables;
select * from customers;
select * from orders;
select * from products;

-- INNER JOIN EXample
--  JOIN AND INNER JOIN KEYWORDS ARE SAME
SELECT products.name,orders.order_time FROM orders 
INNER JOIN products ON orders.product_id = products.id;

SELECT p.name,p.price,o.order_time FROM orders o
JOIN products p ON o.product_id = p.id
WHERE o.product_id=5
ORDER BY o.order_time;

-- PRACTICE ON ORDERS TABLE AND CUSTOMERS TABLE 

SELECT c.first_name,c.gender,o.order_time FROM customers c
JOIN orders o ON c.id= o.customer_id
ORDER BY o.order_time;

-- LEFT JOIN EXAMPLE
UPDATE orders 
SET customer_id= null
WHERE id=1;

SELECT o.id,c.phone_number,c.last_name,o.order_time FROM orders o
LEFT JOIN customers c ON o.customer_id = c.id
order by o.order_time
limit 10;

SELECT o.id,c.phone_number,c.last_name,o.order_time FROM customers c
LEFT JOIN orders o ON  c.id=o.customer_id 
order by o.order_time
limit 10;

-- RIGHT JOIN EXAMPLE
SELECT o.id,c.phone_number,c.last_name,o.order_time FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.id
order by o.order_time
limit 10;

SELECT o.id,c.phone_number,c.last_name,o.order_time FROM customers c
RIGHT JOIN orders o ON  c.id=o.customer_id 
order by o.order_time
limit 10;

UPDATE orders 
SET customer_id= 1
WHERE id=1;

-- JOIN MORE THAN ONE TABLE 
SELECT p.name,p.price,p.coffee_origin,c.first_name,c.last_name,o.order_time FROM products p
JOIN orders o ON p.id= o.product_id 
JOIN customers c ON o.customer_id = c.id;

-- EXERCISE

SELECT o.id,c.phone_number FROM orders o
JOIN customers c ON o.customer_id = c.id
WHERE o.product_id = 4;

SELECT p.name,o.order_time FROM orders o 
JOIN products p ON o.product_id = p.id
WHERE p.name='Filter'
AND o.order_time BETWEEN '2017-01-15' AND '2017-02-14'; 

SELECT p.name,p.price,o.order_time FROM products p
JOIN orders o ON o.product_id = p.id 
JOIN customers c ON o.customer_id = c.id
WHERE c.gender = 'F'
AND o.order_time BETWEEN '2017-01-01' AND '2017-01-31';


SELECT * FROM customers c
CROSS JOIN orders o ;