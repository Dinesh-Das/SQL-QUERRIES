create database carsdb;
use carsdb;
create table cars (
id int,
carname varchar(255),
price double,
salesmanid int,
brand varchar(255) 
);

insert into cars values(1,"Porsche 911 GT3",99999,201,"Porsche");
insert into cars values(2,"Aston Martin",988889,205,"Basic");
insert into cars values(3,"Lamborghini Huracan Evo",199999,251,"Lamborghini");
insert into cars values(4,"Mercedies",98879,101,"Mercedies");
insert into cars values(5,"Ferrari 296 GTB",99879,141,"Ferrari");
insert into cars values(6,"McLaren 765LT",93879,111,"McLaren");
insert into cars values(7,"Audi R8",98179,311,"Audi");