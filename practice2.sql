show databases;
use practice_ddl;
show tables;
desc trg_dept;
select * from trg_dept;
alter table trg_dept add column location varchar(50) default 'CHENNAI';
insert into trg_dept values(102,'Training'),(103,'HR'),(104,'Projects'),(105,'Payroll');

select distinct id from trg_dept;
select name,location from trg_dept;
select id,name from trg_dept;

-- ALIAS
select id as 'DEPT NO', name as 'DEPT Name', location as 'Location' from trg_dept;

select id 'DEPT NO',name 'DEPT NAME', location 'LOCATION' from trg_dept;

select id dept_id,name dept_name, location dept_location from trg_dept;

-- ARITHEMATIC OPERATIONS
select * from trg_emp;
desc trg_emp;
insert into trg_emp values(1,'Dinesh',3000,101,null),(2,'Pushkar',3000,102,null),(3,'Nihal',3000,103,null),(4,'Amar',3000,104,null);
Update trg_emp set salary=5700 where id=1 or id=3;
select last_name ename,salary,salary*12 from trg_emp;

select * from trg_emp where salary > 3000 AND dept_id=101;
select * from trg_emp where dept_id =101 or dept_id =102;
select * from trg_emp where dept_id =103;

-- between 

desc trg_emp;
select id eid,last_name ename,salary esalary,dept_id edept from trg_emp where salary between 3000 AND 6000;
select id eid,last_name ename,salary esalary,dept_id edept from trg_emp where salary not between 3000 AND 5000;

-- In 
select * from trg_emp;
