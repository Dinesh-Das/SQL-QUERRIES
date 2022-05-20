Show databases;
CREATE DATABASE coffee_store;
USE coffee_store;
CREATE TABLE products (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
price DECIMAL(3,2)
);
CREATE TABLE customers (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
gender ENUM('M','F'),
phone_number VARCHAR(10)
);
CREATE TABLE orders (
id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,
customer_id INT,
order_time DATETIME,
FOREIGN KEY (product_id) REFERENCES products (id),
FOREIGN KEY (customer_id) REFERENCES customers (id)
);
SHOW TABLES;
SELECT * FROM products;
ALTER TABLE products ADD COLUMN coffee_origin VARCHAR(30);
DESC products;
ALTER TABLE products DROP COLUMN coffee_origin;
ALTER TABLE products MODIFY  coffee_origin INT;  

Create table test (
id INT not null,
name varchar(50) not null,
age int ,
city varchar(255) default 'aurangabad'
);
desc test;
alter table test
alter city set default 'boom';
alter table test
alter city drop default;
