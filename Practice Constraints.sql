SHOW DATABASES;
CREATE DATABASE practice;
USE practice;

-- CONSTRAINTS
-- QUESTION :Add a table-level PRIMARY KEY constraint to the TRG_EMP table on the ID column. The constraint should be named at creation. 
-- Name the constraint my_emp_id_pk

CREATE TABLE TRG_EMP(
emp_id INT,
last_name VARCHAR(25) NOT NULL,
email VARCHAR(25),
CONSTRAINT my_emp_email_uk UNIQUE(email),
CONSTRAINT my_emp_id_pk PRIMARY KEY (emp_id)
);
DESC TRG_EMP;

-- QUESTION: Create a PRIMARY KEY constraint to the TRG_DEPT table using the ID column. The constraint
-- should be named at creation. Name the constraint my_dept_id_pk.

CREATE TABLE TRG_DEPT (
dept_id INT,
dept_name VARCHAR(30) NOT NULL,
manager_id INT,
location_id INT,
CONSTRAINT my_dept_id_pk PRIMARY KEY(dept_id)
);
DESC TRG_DEPT;

-- QUESTION:Add a column DEPT_ID to the TRG_EMP table. Add a foreign key reference on the TRG_EMP table that
-- ensures that the employee is not assigned to a non existent department. Name the constraint my_emp_dept_id_fk.

ALTER TABLE TRG_EMP ADD COLUMN dept_id INT ;
ALTER TABLE TRG_EMP ADD CONSTRAINT my_dept_id_fk FOREIGN KEY(dept_id) REFERENCES TRG_DEPT(dept_id);

-- QUESTION: Confirm that the constraints were added by querying the USER_CONSTRAINTS view. Note the types and names of the constraints. 

SELECT column_name,constraint_name,referenced_column_name,referenced_table_name
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME IN('TRG_EMP','TRG_DEPT');

-- SELECT object_name,object_type FROM user_objects WHERE object_name LIKE 'TRG_EMP%' OR object-name LIKE  'TRG_DEPT%';


-- QUESTION: Modify the TRG_EMP table. Add a COMMISSION column of NUMBER data type, precision 2, scale 2.
-- Add a constraint to the commission column that ensures that a commission value is greater than zero.

ALTER TABLE TRG_EMP ADD COLUMN commission DOUBLE(2,2); 
ALTER TABLE TRG_EMP ADD CONSTRAINT my_commission_chk CHECK (commission>0);

