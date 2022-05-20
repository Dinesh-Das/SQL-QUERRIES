CREATE DATABASE test;
USE test;
CREATE TABLE addresses (
id INT,
house_no INT,
city VARCHAR(20),
postcode VARCHAR(7)
);
CREATE TABLE people (
id INT,
first_name VARCHAR (20),
last_name VARCHAR (20),
addresses_id INT
);
CREATE TABLE pets (
id INT,
name VARCHAR (20),
species VARCHAR (20),
owner_id INT
);
SHOW TABLES;
DESCRIBE addresses;
ALTER TABLE addresses
ADD PRIMARY KEY (id);

ALTER TABLE addresses 
DROP PRIMARY KEY;

ALTER TABLE people 
ADD PRIMARY KEY (id);
DESCRIBE people;

ALTER TABLE pets
ADD PRIMARY KEY (id);

ALTER TABLE people
ADD CONSTRAINT FK_PeopleAddress
FOREIGN KEY (addresses_id) REFERENCES addresses(id);
DESCRIBE people;

ALTER TABLE people 
DROP FOREIGN KEY FK_PeopleAddress;

ALTER TABLE pets
ADD CONSTRAINT U_species UNIQUE (species);
desc pets;
ALTER TABLE pets
DROP INDEX U_species;

ALTER TABLE pets CHANGE `species` `animal_type` VARCHAR(20);
select * from pets;
ALTER TABLE pets CHANGE `animal_type` `species` VARCHAR(20);

DESC pets;
Alter table pets 
drop primary key;
Alter table pets
add primary key (id);
alter table pets
add foreign key(owner_id) references people(id);

desc people;
alter table people add column email varchar(50);
alter table people add constraint uc_email unique (email);

desc pets;
alter table pets change `name` `first_name` varchar(50);
show tables;
desc addresses;
alter table addresses modify postcode char(7);