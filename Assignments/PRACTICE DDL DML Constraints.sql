SHOW DATABASES;
CREATE DATABASE practice_ddl;
use practice_ddl;

-- 1.Create the TRG_DEPT table based on the following table instance chart. Confirm that the table is
-- created.
-- Column Name	 ID 	NAME
-- Key Type	 	 
-- Nulls/Unique	 	 
-- FK Table	 	 
-- FK Column	 	 
-- Data type 	Number	VARCHAR2
-- Length	7	25

create table TRG_dept(
id INT(7),
name VARCHAR(25)
);

-- 2. Populate the DEPT101 table with data from the DEPARTMENTS table. Include only columns that
-- you need.

INSERT INTO TRG_dept VALUES(101,'MCA');

-- 3. Create the TRG_EMP table based on the following table instance chart. Confirm that the table is created.
-- Column Name 	ID	 LAST_NAME 	FIRST_NAME 	DEPT_ID
-- Key Type	 	 	 	 
-- Nulls/Unique	 	 	 	 
-- FK Table	 	 	 	 
-- FK Column	 	 	 	 
-- Data type 	Number 	VARCHAR2 	VARCHAR2 	Number
-- Length	7	25	25	7

create TABLE TRG_EMP (
id INT(7),
last_name VARCHAR(25),
first_name VARCHAR(25),
dept_id INT(7)
);
DESC TRG_EMP;

-- 4. Modify the TRG_EMP table to allow for longer employee last names. Confirm your modification.

ALTER TABLE TRG_EMP MODIFY last_name VARCHAR(50);

-- 5. Create the TRG_EMPLOYEES table based on the structure of the EMPLOYEES table. Include only
-- the EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, and DEPARTMENT_ID columns.
-- Name the columns in your new table ID, FIRST_NAME, LAST_NAME, SALARY , and
-- DEPT_ID, respectively.

CREATE TABLE TRG_EMPLOYEES (
id INT,
first_name VARCHAR(25),
last_name VARCHAR(25),
salary DOUBLE(8,2),
dept_id INT
);

-- 6. Drop the TRG_EMP table.

SHOW TABLES;
DROP TABLE TRG_EMP;

-- 7. Rename the TRG_EMPLOYEES table to TRG_EMP.

ALTER TABLE TRG_EMPLOYEES RENAME TRG_EMP;

-- 8. Drop the FIRST_NAME column from the TRG_EMP table. Confirm your modification by checking the
-- description of the table.

DESC TRG_EMP;
ALTER TABLE TRG_EMP DROP COLUMN first_name;
ALTER TABLE TRG_dept RENAME TRG_DEPT;

-- END OF DDL COMMANDS

-- CONSTRAINTS
-- QUESTION 1:Add a table-level PRIMARY KEY constraint to the TRG_EMP table on the ID column. The constraint should be named at creation. 
-- Name the constraint my_emp_id_pk

ALTER TABLE TRG_EMP ADD CONSTRAINT my_emp_id_pk PRIMARY KEY (id);
DESC TRG_EMP;

-- QUESTION: Create a PRIMARY KEY constraint to the TRG_DEPT table using the ID column. The constraint
-- should be named at creation. Name the constraint my_dept_id_pk.

ALTER TABLE TRG_DEPT ADD CONSTRAINT my_dept_id_pk PRIMARY KEY (id);
DESC TRG_DEPT;

-- QUESTION:Add a column DEPT_ID to the TRG_EMP table. Add a foreign key reference on the TRG_EMP table that
-- ensures that the employee is not assigned to a non existent department. Name the constraint my_emp_dept_id_fk.

ALTER TABLE TRG_EMP ADD CONSTRAINT my_emp_dept_id_fk FOREIGN KEY (dept_id) REFERENCES TRG_DEPT(id);
DESC TRG_EMP;

-- QUESTION: Confirm that the constraints were added by querying the USER_CONSTRAINTS view. Note the types and names of the constraints. 

SELECT column_name,constraint_name,referenced_column_name,referenced_table_name
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME IN('TRG_EMP','TRG_DEPT');

-- SELECT object_name,object_type FROM user_objects WHERE object_name LIKE 'TRG_EMP%' OR object-name LIKE  'TRG_DEPT%';


-- QUESTION: Modify the TRG_EMP table. Add a COMMISSION column of NUMBER data type, precision 2, scale 2.
-- Add a constraint to the commission column that ensures that a commission value is greater than zero.
DESC TRG_EMP;
ALTER TABLE TRG_EMP ADD COLUMN commission DOUBLE(2,2);
ALTER TABLE TRG_EMP ADD CONSTRAINT my_commission_chk CHECK (commission>0);
DESC TRG_EMP;

-- END OF CONSTRAINTS


-- 1.Describe the structure of the MY_EMPLOYEE table to identify the column names.
-- Name	Null?	Type
-- ID	NOT NULL	NUMBER(4)
-- LAST_NAME		VARCHAR2(25)
-- FIRST_NAME		VARCHAR2(25)
-- USERID		VARCHAR2(8)
-- SALARY		NUMBER(9,2)

CREATE TABLE my_employee (
id INT,
last_name VARCHAR(25),
first_name VARCHAR(25),
userID VARCHAR(8),
salary DECIMAL(9,2)
);

-- 2 Add the  data to the MY_EMPLOYEE table from the following sample data. Do not list the columns in the    
--   INSERT clause.
-- ID	LAST_NAME	FIRST_NAME	USERID	SALARY
-- 1	Patel	Ralph	rpatel	895

INSERT INTO my_employee VALUES (1,'Patel','Ralph','rpatel',895);

-- 3. Populate the MY_EMPLOYEE table with the following sample data .
--     This time, list the columns explicitly in the INSERT clause.
-- ID	LAST_NAME	FIRST_NAME	USERID	SALARY
-- 2	Dancs	Betty	bdancs	860

INSERT INTO my_employee (id,last_name,first_name,userID,salary)  VALUES (2,'Dancs','Betty','bdancs',860),(3,'Das','Dinesh','ddas',890);

-- 4. Confirm your addition to the table.

SELECT * FROM my_employee;

-- 5. Write an insert statement using placeholder & to insert values into MY_EMPLOYEE table. Concatenate the   
--     first letter of the first name and the first seven characters of the last name to produce the userid.
				--  NOT DONE

-- 6. Change the last name of employee 3 to Drexler.

SET SQL_SAFE_UPDATES=0;
UPDATE my_employee SET last_name = 'Drexler' WHERE id=3;
SELECT * FROM my_employee;

-- 7. Change the salary to 1000 for all employees with a salary less than 900.

UPDATE my_employee SET salary=1000 WHERE salary <900;
SELECT * FROM my_employee;


-- 8. Delete Betty Dancs from the MY_EMPLOYEE table.

DELETE FROM my_employee WHERE id=2;
SELECT * FROM my_employee;

-- 9. Empty the entire table.

TRUNCATE TABLE my_employee;
SELECT * FROM my_employee;

-- END OF DML COMMANDS