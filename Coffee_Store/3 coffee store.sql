show databases;
use coffee_store;
show tables;
insert into products (name,price,coffee_origin)
values ("Espresso",2.50,'Brazil');
insert into products (name,price,coffee_origin)
values ("Macchiato",3.00,'Brazil'),("Cappuccino",3.50,"Costo Rica");
insert into products (name,price,coffee_origin)
values ("Latte",3.50,'Indonesia'),("Americano",3.00,'Brazil'),
('Flat White',3.50,'Indonesia'),('Filter',3.00,'India');

update products
set coffee_origin ='Sri Lanka'
where id=7;

update products
set price=3.25,name='Ethiopia'
where name='Americano';
SET SQL_SAFE_UPDATES=0;

update products
set coffee_origin='Colombia'
where coffee_origin='Brazil';

select * from products;