show databases;
create database joints;
use joints;
create table customers (
customer_id int,
customer_name varchar(30),
contact_name varchar(30),
address varchar(100),
city varchar(50),
postalcode int,
country varchar(50)
);
create table orders (
order_id int,
customer_id int,
employee_id int,
orderdate date,
shipper_id int
 );
 
insert into customers values(1,'Dinesh Das','Dinesh','Cidco,Aurangabad','Aurangabad',431001,'India'),
(2,'Nihal Jha','Nihal','Ramnagar,Aurangabad','Aurangabad',431021,'India'),
(3,'Pushkar Joshi','Pushkar','Jalna road ,Aurangabad','Aurangabad',435001,'India'),
(4,'Vignesh C','Vignesh','Near birla mandir','Banglore',42105,'India');

select * from customers;

insert into orders values(1,3,71628,'2022-02-20',212),
(2,4,71521,'2022-02-12',217),
(3,2,71127,'2022-02-21',120),
(4,1,71328,'2022-03-30',112);

select o.order_id,c.customer_id,o.employee_id,o.orderdate, o.shipper_id 
from customers c,orders o
where o.customer_id = c.customer_id;

--  INNER JOIN
select o.order_id,c.customer_id,o.employee_id,o.orderdate, o.shipper_id 
from customers c
inner join orders o on o.customer_id= c.customer_id;


-- ON clause
create table shippers (
shipper_id int,
company_name varchar(30),
phone varchar(10)
);

insert into shippers values(212,'alibaba','1234567890'),(217,'amazonn','1234567890'),(120,'flipkart','1222267890'),
(112,'snapdeal','1234567890');
insert into shippers values (312,'JioMart','1234567890');

select o.order_id,c.customer_id,o.employee_id,o.orderdate, o.shipper_id ,s.company_name
from customers c
join orders o
on o.customer_id = c.customer_id
join shippers s
on o.shipper_id=s.shipper_id;