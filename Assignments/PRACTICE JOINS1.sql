CREATE DATABASE practicejoins;
USE practicejoins;
SET FOREIGN_KEY_CHECKS=0;
CREATE TABLE employees(
emp_id INT,
first_name VARCHAR(20) ,
last_name VARCHAR(25) NOT NULL,
email VARCHAR(25) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
hire_date DATE NOT NULL,
job_id VARCHAR(10) NOT NULL,
salary DOUBLE(8,2),
commission_pct DOUBLE(2,2),
manager_id INT,
department_id INT,
CONSTRAINT emp_id_pk PRIMARY KEY (emp_id)
);

INSERT INTO EMPLOYEES(emp_id,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,DEPARTMENT_ID)
VALUES (100,'Steven','King','SKING','515.123.4567','1987-06-17','AD_PRES',24000,90);

INSERT INTO EMPLOYEES(emp_id,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,MANAGER_ID,DEPARTMENT_ID)
VALUES (101,'Neena','Kochhar','NKochhar','515.123.4568','1989-09-21','AD_VP',17000,100,90),
(102,'Lex','De Haaan','LDEHAAAN','515.123.4569','1993-01-13','AD_VP',17000,100,90),
(103,'Alexander','Hulond','AHULOND','515.123.4561','1990-01-03','IT_PROG',9000,102,60),
(104,'Bruce','Ernst','BERNST','515.123.4562','1991-05-21','IT_PROG',6000,103,60),
(107,'Diana','Lorentz','DLORENTZ','515.123.4563','1999-02-07','IT_PROG',4200,103,60),
(124,'Kevin','Mourgos','KMOURGOS','515.123.4564','1999-11-16','ST_MAN',5800,100,50),
(141,'Trenna','Rajs','TRAJS','515.123.4565','1995-10-17','ST_CLERK',3500,124,50),
(142,'Curtis','Davies','CDAVIES','515.123.4566','1997-01-29','ST_CLERK',3100,124,50),
(143,'Randall','Matos','RMATOS','515.123.4567','1998-03-15','ST_CLERK',2600,124,50),
(144,'Peter','Vargar','PVARGAR','515.123.4570','1998-07-09','ST_CLERK',2500,124,50),
(200,'Jennifer','Whalen','JWHALEN','515.123.4580','1987-09-17','AD_ASST',4400,101,10),
(201,'Michael','Harstein','MHARSTEIN','515.123.4581','1996-02-17','MK_MAN',13000,100,20),
(202,'Pat','Fay','PFAY','515.123.4582','1997-08-17','MK_REP',6000,201,20),
(205,'Shelly','Higgins','SHIGGINS','515.123.4583','1994-06-07','AC_MGR',12000,101,110),
(206,'William','Gietz','WGIETZ','515.123.4584','1994-06-07','AC_ACCOUNT',8300,205,110);


INSERT INTO EMPLOYEES(emp_id,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,
HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) VALUES
(149,'Eleni','ZlotkeY','EZLOTKET','011.515.123.4571','2000-01-29','SA_MAN',10500,0.2,100,80),
(174,'Ellen','Abel','EABEL','011.515.123.4572','1996-05-11','SA_REP',11000,0.3,149,80),
(176,'Jonathon','Taylor','JTAYLOR','011.515.123.4573','1998-03-24','SA_REP',8600,0.2,149,80);

INSERT INTO EMPLOYEES(emp_id,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,
HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID)VALUES
(178,'Kimberely','Grant','KGRANT','011.515.123.4574','1999-05-24','SA_REP',7000,0.15,149);

CREATE TABLE regions (
region_id INT,
region_name VARCHAR(25),
CONSTRAINT region_id_pk PRIMARY KEY(region_id)
);

insert into regions values (1,'Europe');
insert into regions values (2,'America');
insert into regions values (3,'Asia');
insert into regions values (4,'Middle East amd Africa');

CREATE TABLE countries(
country_id CHAR(2),
country_name VARCHAR(40),
region_id INT,
CONSTRAINT country_id_pk PRIMARY KEY (country_id),
CONSTRAINT c_region_id_fk FOREIGN KEY (region_id) REFERENCES regions(region_id)
);
INSERT INTO COUNTRIES VALUES('CA','Canada',2);
INSERT INTO COUNTRIES VALUES('DE','Germany',1);
INSERT INTO COUNTRIES VALUES('UK','United Kingdom',1);
INSERT INTO COUNTRIES VALUES('US','United States of America',2);


CREATE TABLE locations(
location_id INT,
street_address VARCHAR(40),
postal_code VARCHAR(12),
city VARCHAR(30) NOT NULL,
state_province VARCHAR(25),
country_id CHAR(2),
CONSTRAINT location_id_pk PRIMARY KEY(location_id),
CONSTRAINT l_country_id_fk FOREIGN KEY(country_id) REFERENCES countries(country_id)
);

insert into locations values(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
insert into locations values(1500,'2011 Interiors Blvd','99236','South San Francisco','Califorina','US');
insert into locations values(1700,'2004 Charade Rd','99236','Seattle','Washington','US');
insert into locations values(1800,'460 Bloor St. W.','on M5S 1XB','Toronto','Ontario','CA');
insert into locations values(2500,'Magdalen Center,The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');

CREATE TABLE departments(
department_id INT,
department_name VARCHAR(30) NOT NULL,
manager_id INT,
location_id INT,
CONSTRAINT department_id_pk PRIMARY KEY(department_id),
CONSTRAINT d_manager_id_fk FOREIGN KEY (manager_id) REFERENCES employees(emp_id),
CONSTRAINT d_location_id_fk FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

insert into departments values(10,'Adminstration',200,1700);
insert into departments values(20,'Marketing',201,1800);
insert into departments values(50,'Shipping',124,1500);
insert into departments values(60,'IT',103,1400);
insert into departments values(80,'Sales',149,2500);
insert into departments values(90,'Executive',100,1700);
insert into departments values(110,'Accouting',205,1700);
insert into departments values(190,'Contracting',NULL,1700);


CREATE TABLE jobs (
job_id VARCHAR(10),
job_title VARCHAR(35) NOT NULL,
min_salary INT,
max_salary INT,
CONSTRAINT job_id_pk PRIMARY KEY(job_id)
);
insert into jobs values('AD_PRES' , 'President',2000,40000);
insert into jobs values('AD_VP' , 'Adminstration Vice President',15000,30000);
insert into jobs values('AD_ASST' , 'Adminstration Assistant',3000,6000);
insert into jobs values('AC_MGR' , 'Accounting Manager',8200,16000);
insert into jobs values('AC_ACCOUNT', 'Public Accountant',4200,9000);
insert into jobs values('SA_MAN' , 'Sales Manager',10000,20000);
insert into jobs values('SA_REP' , 'Sales Representative',6000,12000);
insert into jobs values('ST_MAN' , 'Stock Manager',5500,8500);
insert into jobs values('ST_CLERK' , 'Stock Clerk',2000,5000);
insert into jobs values('IT_PROG' , 'Programmer',400,10000);
insert into jobs values('MK_MAN' , 'Marketing Manager',9000,15000);
insert into jobs values('MK_REP' , 'Marketing Representative',4000,9000);

CREATE TABLE job_grades (
grade_level VARCHAR(3),
lowest_sal INT,
highest_sal INT
);

insert into job_grades values('A',1000,2999);
insert into job_grades values('B',3000,5999);
insert into job_grades values('C',6000,9999);
insert into job_grades values('D',10000,14999);
insert into job_grades values('E',15000,24999);
insert into job_grades values('F',25000,40000);

CREATE TABLE job_history (
emp_id INT,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
job_id VARCHAR(10),
department_id INT,
CONSTRAINT emp_id_fk FOREIGN KEY(emp_id) REFERENCES employees(emp_id),
CONSTRAINT jh_job_id_fk FOREIGN KEY(job_id) REFERENCES jobs(job_id),
CONSTRAINT jh_department_id_fk FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

insert into job_history values (102,'1993-01-13','1998-06-24','IT_PROG',60);
insert into job_history values (101,'1989-09-21','1993-10-27','AC_ACCOUNT',110);
insert into job_history values (101,'1993-10-28','1997-03-15','AC_MGR',110);
insert into job_history values (201,'1996-02-17','1999-12-19','MK_REP',20);
insert into job_history values (141,'1998-03-24','1999-12-31','ST_CLERK',50);
insert into job_history values (124,'1999-01-01','1999-12-31','ST_CLERK',50);
insert into job_history values (200,'1987-09-17','1993-06-17','AD_ASST',90);
insert into job_history values (176,'1998-03-24','1998-12-31','SA_REP',80);
insert into job_history values (176,'1999-01-01','1998-12-31','SA_MAN',80);
insert into job_history values (200,'1994-07-01','1998-12-31','AC_ACCOUNT',90);

ALTER TABLE employees ADD CONSTRAINT emo_job_id_fk FOREIGN KEY(job_id) REFERENCES jobs(job_id);
ALTER TABLE employees ADD CONSTRAINT emp_department_id_fk FOREIGN KEY(department_id) REFERENCES departments(department_id);
ALTER TABLE employees ADD CONSTRAINT e_manager_id_fk FOREIGN KEY(manager_id) REFERENCES employees(emp_id);
SET FOREIGN_KEY_CHECKS=1;

desc employees;
desc regions;
desc countries;
desc locations;
desc departments;
desc jobs;
desc job_grades;
desc job_history;

SELECT * FROM Employees;
SELECT * FROM regions;
SELECT * FROM countries;
SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM jobs;
SELECT * FROM job_grades;
SELECT * FROM job_history;

-- 1. Write a query to display the last name, department number, and department name for all employees.
-- LAST_NAME	DEPARTMENT_ID	DEPARTMENT_NAME
-- Rajs	50	Shipping
-- Davies	50	Shipping
-- Matos	50	Shipping
-- Ernst	60	IT
-- Lorence	60	IT
-- Mourgos	60	IT
-- King	90	Executive
-- Kochhar	90	Executive
-- De Haan	90	Executive
-- 9 rows Selected.

SELECT e.last_name,d.department_id,d.department_name 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
ORDER BY e.department_id;

-- 2. Create a unique listing of all jobs that are in department 50. Include the location of the Department in the output.
-- JOB_ID       LOCATION_ID
-- ----------       -----------
-- ST_CLERK          1500
-- ST_MAN            1500


SELECT DISTINCT e.job_id,d.location_id FROM employees e
JOIN departments d on e.department_id=d.department_id
WHERE d.department_id=50 
ORDER BY e.job_id;

-- 3. Write a query to display the employee last name, department name, location ID, and city of all employees.
-- LAST_NAME	DEPARTMENT_NAME	LOCATION_ID	CITY
-- Ernst	IT	1400	South Lake
-- Lorence	IT	1400	South Lake
-- Mourgos	IT	1400	South Lake
-- King	Executive	1700	Seattle
-- Kochhar	Executive	1700	Seattle
-- De Haan	Executive	1700	Seattle
-- 6 rows Selected.

SELECT e.last_name,d.department_name,l.location_id,l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id 
JOIN locations l ON d.location_id = l.location_id;

-- 4. Display the employee last name and department name for all employees who have an ‘a’ (lowercase) in their last names.
-- LAST_NAME	DEPARTMENT_NAME
-- Rajs	Shipping
-- Davies	Shipping
-- Matos	Shipping
-- Kochhar	Executive
-- De Haan	Executive
	
SELECT e.last_name,d.department_name FROM employees e
JOIN departments d ON e.department_id = d.department_id 
WHERE e.last_name LIKE '%a%';

-- 5. Write a query to display the last name, job, department number, and department name for all employees who work in Toronto.
-- LAST_NAME	JOB_ID	DEPARTMENT_ID	DEPARTMENT_NAME
-- Hartstein	MK_MAN	20	Marketing
-- Fay	MK_REP	20	Marketing

SELECT e.last_name,e.job_id,e.department_id,d.department_name 
FROM employees e
JOIN departments d ON e.department_id = d.department_id 
JOIN locations l ON d.location_id = l.location_id
WHERE l.city="Toronto";

-- 6. Display the employee last name and employee number along with their manager’s last name and manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
-- Employee	EMP#	Manager	Mgr#
-- Kochhar	101	King	100
-- De Haan	102	King	100
-- Mourgos	124	King	100
-- Hartstein	201	King	100
-- Zlotkey	149	King	100
-- Whalen	200	Kochhar	101
-- Higgins	205	Kochhar	101
-- Hunold	103	Hunold	103
-- Lorence	107	Hunold	103
-- Ernst	104	Hunold	103
-- Rajs	141	Mourgos	124
-- Davies	142	Mourgos	124
-- Matos	143	Mourgos	124
-- Vargas	144	Mourgos	124
-- Abel	174	Zlotkey	149
-- Grant	178	Zlotkey	149
-- Taylor	176	Zlotkey	149
-- Fay	202	Hartstein	201
-- Gietz	206	Higgins	205
-- 19 rows Selected.

SELECT e.last_name as EMPLOYEE,e.emp_id as EMPNO,mr.last_name as MANAGER,m.manager_id FROM employees e
JOIN employees m ON m.emp_id = e.emp_id
JOIN employees mr ON mr.emp_id = m.manager_id;

-- 7. Modify lab4_6.sql to display all employees including King, who has no manager. Order the results by the employee number.
-- Employee	EMP#	Manager	Mgr#
-- Hartstein	201	King	100
-- Zlotkey	149	King	100
-- Mourgos	124	King	100
-- De Haan	102	King	100
-- Kochhar	101	King	100
-- Higgins	205	Kochhar	101
-- Whalen	200	Kochhar	101
-- Lorence	107	Hunold	103
-- Ernst	104	Hunold	103
-- Hunold	103	Hunold	103
-- Vargas	144	Mourgos	124
-- Matos	143	Mourgos	124
-- Davies	142	Mourgos	124
-- Rajs	141	Mourgos	124
-- Grant	178	Zlotkey	149
-- Taylor	176	Zlotkey	149
-- Abel	174	Zlotkey	149
-- Fay	202	Hartstein	201
-- Gietz	206	Higgins	205
-- King	100	 	 

SELECT e.last_name as EMPLOYEE,e.emp_id as EMPNO,mr.last_name as MANAGER,m.manager_id FROM employees e
JOIN employees m ON m.emp_id = e.emp_id
LEFT JOIN employees mr ON mr.emp_id = m.manager_id;

-- 7. Create a query that displays employee last names, department numbers, and all the employees who work in the same department as a given employee. Give each column an appropriate label.
-- DEPARTMENT	EMPLOYEE	COLLEAGUE
-- 20	Fay	Hartstein
-- 20	Hartstein	Fay
-- 50	Davies	Matos
-- 50	Davies	Mourgos
-- 50	Davies	Rajs
-- 50	Davies	Vargas
-- 50	Matos	Davies
-- 50	Matos	Mourgos
-- 50	Matos	Rajs
-- 50	Matos	Vargas
-- 50	Mourgos	Davies
-- 50	Mourgos	Matos
-- 50	Mourgos	Rajs
-- 50	Mourgos	Vargas
-- 50	Rajs	Davies
-- 50	Rajs	Matos
-- 50	Rajs	Mourgos
-- 50	Rajs	Vargas
-- 50	Vargas	Davies
-- 50	Vargas	Matos
-- 50	Vargas	Mourgos
-- 50	Vargas	Rajs
-- 60	Ernst	Hunold
-- 60	Ernst	Lorence
-- 60	Hunold	Ernst
-- 60	Hunold	Lorence
-- 60	Lorence	Ernst
-- 60	Lorence	Hunold
-- 80	Abel	Zlotkey
-- 80	Zlotkey	Abel
-- 90	De Haan	King
-- 90	De Haan	Kochhar
-- 90	King	De Haan
-- 90	King	Kochhar
-- 90	Kochhar	De Haan
-- 90	Kochhar	King
-- 110	Gietz	Higgins
-- 110	Higgins	Gietz
-- 38 rows Selected.


SELECT e.department_id,e.last_name,m.last_name FROM employees e
JOIN employees m ON e.department_id= m.department_id
WHERE e.last_name <> m.last_name
ORDER BY e.department_id;


-- 9. Show the structure of the JOB_GRADES table. Create a query that displays the name, job,department name, salary, and grade for all employees.
-- LAST_NAME	JOB_ID	DEPARTMENT_NAME	SALARY	GRA
-- -------------------------	----------	------------------------------	----------	---
-- Whalen	AD_ASST	Administration	4400	B
-- Fay	MK_REP	Marketing	6000	C
-- Hartstein	MK_MAN	Marketing	13000	D
-- Matos	ST_CLERK	Shipping	2600	A
-- Vargas	ST_CLERK	Shipping	2500	A
-- Mourgos	ST_MAN	Shipping	5800	B
-- Davies	ST_CLERK	Shipping	3100	B
-- Rajs	ST_CLERK	Shipping	3500	B
-- Lorence	IT_PROG	IT	4200	B
-- Hunold	IT_PROG	IT	9000	C
-- Ernst	IT_PROG	IT	6000	C
-- Zlotkey	SA_MAN	Sales	10500	D
-- Abel	SA_REP	Sales	11000	D
-- King	AD_PRES	Executive	24000	E
-- De Haan	AD_VP	Executive	17000	E 				
-- Kochhar	AD_VP	Executive	17000	E
-- Gietz	AC_ACCOUNT	Accounting	8300	C
-- Higgins	AC_MGR	Accounting	12000	D
-- 18 rows Selected.

SELECT e.last_name,j.job_id,d.department_name,salary,g.grade_level    FROM employees e
JOIN jobs j on e.job_id = j.job_id 
JOIN departments d ON e.department_id = d.department_id
JOIN job_grades g On e.salary between g.lowest_sal AND g.highest_sal;

-- 10. Create a query to display the name and hire date of any employee hired after employee Davies.
-- LAST_NAME	HIRE_DATE
-- Mourgos	16-Nov-99
-- Matos	15-Mar-98
-- Vargas	9-Jul-98
-- Zlotkey	29-Jan-00
-- Taylor	24-Mar-98
-- Grant	24-May-99
-- Fay	17-Aug-97
-- 7 rows Selected.

SELECT last_name,hire_date FROM employees
WHERE hire_date > (Select hire_date FROM employees WHERE last_name ='Davies');

-- 11. Display the names and hire dates for all employees who were hired before their managers,
-- along with their manager’s names and hire dates. Label the columns Employee, Emp
-- Hired, Manager, and Mgr Hired, respectively.
-- LAST_NAME	HIRE_DATE	LAST_NAME	HIRE_DATE
-- Whalen	17-Sep-87	Kochhar	12-Sep-89
-- Rajs	7-Feb-97	Mourgos	16-Nov-99
-- Davies	7-Feb-97	Mourgos	16-Nov-99
-- Matos	15-Mar-98	Mourgos	16-Nov-99
-- Vargas	9-Jul-98	Mourgos	16-Nov-99
-- Abel	11-May-96	Zlotkey	29-Jan-00
-- Grant	24-May-99	Zlotkey	29-Jan-00
-- Taylor	24-Mar-98	Zlotkey	29-Jan-00
-- 8 rows Selected.

SELECT e.last_name as Employee,e.hire_date,m.last_name,m.hire_date FROM employees e
JOIN employees m ON e.manager_id = m.emp_id
WHERE e.hire_date < m.hire_date;
