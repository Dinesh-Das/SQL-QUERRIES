use coffee_store;
select * from customers;
desc customers;
SELECT first_name,phone_number 
FROM customers
WHERE last_name='Bluth' AND gender ='F';

desc products;
SELECT name FROM products
WHERE coffee_origin='Sri Lanka' OR price > 3.0;

SELECT * FROM customers WHERE phone_number IS NULL AND gender='M';

SELECT name,price FROM products WHERE coffee_origin = 'Colombia' OR coffee_origin= 'Indonesia' ORDER BY name ASC;
SELECT first_name as name,phone_number FROM customers WHERE last_name LIKE '%ar%';

SELECT * FROM orders WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28' 
AND customer_id IN (2,4,6,8) ;

SELECT DISTINCT last_name FROM CUSTOMERS ORDER BY last_name;
SELECT * FROM ORDERS WHERE customer_id =1 AND order_time BETWEEN '2017-02-01' AND '2017-02-28' ORDER BY order_time LIMIT 3;
SELECT name,price Retail_Price,coffee_origin FROM PRODUCTS;


